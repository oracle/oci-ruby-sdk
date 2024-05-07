# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'oci/base_signer'
require 'net/http'
require 'json'

module OCI
  module Auth
    # signer
    module Signers
      # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/ClassLength, Metrics/LineLength, Layout/EmptyLines

      # rp federation signer
      class ResourcePrincipalsFederationSigner < OCI::Auth::Signers::SecurityTokenSigner
        attr_reader :region

        # Creates a new ResourcePrincipalSigner
        def initialize(
            rp_token_endpoint: nil,
            rp_session_endpoint: nil,
            rp_token_path_provider: nil,
            retry_config: nil,
            log_requests: nil
          )
          @refresh_lock = Mutex.new
          raise 'Missing resource principals token endpoint when initializing resource principals signer' if rp_token_endpoint.nil?

          @rp_token_endpoint = rp_token_endpoint

          @instance_principal_signer = OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner.new
          @session_key_supplier = OCI::Auth::SessionKeySupplier.new
          @region = @instance_principal_signer.region
          metadata_url_base = OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner::METADATA_URL_BASE
          @rp_token_path_provider = rp_token_path_provider || OCI::Auth::Signers::RptPathProvider::DefaultRptPathProvider.new(metadata_url: metadata_url_base)

          @rp_session_endpoint = rp_session_endpoint || OCI::Regions.get_service_endpoint(@region, :Auth)

          # set up retry policy
          @retry_config = if !retry_config.nil?
                            retry_config
                          else
                            OCI::Retry::RetryConfig.new(
                              base_sleep_time_millis: 500,
                              exponential_growth_factor: 2,
                              should_retry_exception_proc:
                                OCI::Retry::Functions::ShouldRetryOnError.retry_on_network_error_throttle_and_internal_server_errors,
                              sleep_calc_millis_proc: OCI::Retry::Functions::Sleep.exponential_backoff_with_equal_jitter,
                              max_attempts: 5,
                              max_elapsed_time_millis: 300_000,
                              max_sleep_between_attempts_millis: 10_000
                            )
                          end
          @rpt = nil
          @spst = nil
          config = OCI::Config.new
          config.log_requests = log_requests if log_requests
          @api_client = OCI::ApiClient.new(config, @instance_principal_signer)
          # Get the Resource Principal Session Token and use it to set up the signer
          @rpst = security_token
          super(@rpst, @session_key_supplier.key_pair[:private_key])
        end
        # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

        def security_token
          if defined? @security_token
            return @security_token.security_token if @security_token.token_valid?
          end
          refresh_security_token
          @security_token.security_token
        end

        def refresh_security_token
          @refresh_lock.lock
          @session_key_supplier.refresh
          @instance_principal_signer.refresh_security_token
          # Get RPT blob, Service Principal Session Token from service, Steps A.1 and B.1
          @rpt, @spst = resource_principal_token_and_service_principal_session_token(@rp_token_path_provider)
          # Get RPST token from itentity, steps A.2 and B.2
          @security_token = OCI::Auth::SecurityTokenContainer.new(resource_principal_session_token)
        ensure
          @refresh_lock.unlock if @refresh_lock.locked? && @refresh_lock.owned?
        end

        def resource_principal_token_and_service_principal_session_token(rp_token_path_provider)
          method = :GET
          resource_path = rp_token_path_provider.token_path
          response = make_call(method, resource_path, @rp_token_endpoint)
          parsed_response = JSON.parse(response.data)
          if parsed_response['resourcePrincipalToken'].nil? || parsed_response['servicePrincipalSessionToken'].nil?
            raise 'Failed to get Resource Principal Token or Service Principal Session Token'
          end

          [parsed_response['resourcePrincipalToken'], parsed_response['servicePrincipalSessionToken']]
        end

        # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

        def resource_principal_session_token
          method = :POST
          resource_path = URI('/v1/resourcePrincipalSessionToken')
          public_key = @session_key_supplier.key_pair[:public_key]

          sanitized_public_key = OCI::Auth::Util.sanitize_certificate_string(public_key.to_pem)

          request_payload = {
            'resourcePrincipalToken': @rpt,
            'servicePrincipalSessionToken': @spst,
            'sessionPublicKey': sanitized_public_key
          }
          header_params = {}
          header_params[:accept] = 'application/json'
          header_params[:'content-type'] = 'application/json'
          response = make_call(method, resource_path, @rp_session_endpoint, header_params, request_payload)
          parsed_response = JSON.parse(response.data)
          raise 'Failed to get Resource Principal Session Token' if parsed_response['token'].nil?

          parsed_response['token']
        end
        # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/ClassLength, Metrics/LineLength, Layout/EmptyLines

        def make_call(method, resource_path, endpoint, header_params = nil, body = nil)
          OCI::Retry.make_retrying_call(@retry_config) do
            @api_client.call_api(
              method,
              resource_path,
              endpoint,
              operation_signing_strategy: :standard,
              return_type: 'Stream',
              header_params: header_params,
              body: @api_client.object_to_http_body(body)
            )
          end
        end
      end
    end
  end
end
