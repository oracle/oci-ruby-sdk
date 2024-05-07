# Copyright (c) 2016, 2024, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'json'
require 'net/http'
require 'uri'
require 'base64'

require 'oci/auth/session_key_supplier'
require 'oci/base_signer'

module OCI
  module Auth
    module Signers
      # This signer takes the following parameters:
      # - sa_token_provider
      # - sa_cert_path
      # - service_host
      # - service_port
      # - region
      class OkeWorkloadIdentityResourcePrincipalSigner < OCI::Auth::Signers::SecurityTokenSigner
        def initialize(sa_token_provider, sa_cert_path, service_host, service_port, region: nil)
          @sa_token_provider = sa_token_provider
          @sa_cert_path = sa_cert_path
          @service_host = service_host
          raise 'Kubernetes service host was not provided.' if @service_host.nil?

          @service_port = service_port
          @region = initialize_and_return_region(region)
          @refresh_lock = Mutex.new

          @proxymux_endpoint = "https://#{service_host}:#{service_port}/resourcePrincipalSessionTokens"
          uri = URI(@proxymux_endpoint)
          @federation_http_client = Net::HTTP.new(uri.hostname, uri.port)
          @federation_http_client.use_ssl = (uri.scheme == 'https')
          @federation_http_client.ca_file = @sa_cert_path

          @session_key_supplier = OCI::Auth::SessionKeySupplier.new
          @rpst = security_token

          super(@rpst, @session_key_supplier.key_pair[:private_key])
        end

        def initialize_and_return_region(region)
          if OCI::Regions::REGION_SHORT_NAMES_TO_LONG_NAMES.include?(region)
            OCI::Regions::REGION_SHORT_NAMES_TO_LONG_NAMES[region]
          else
            region
          end
        end

        def security_token
          if defined? @security_token
            return @security_token.security_token if @security_token.token_valid_with_half_expiration_time?
          end
          refresh_security_token
          @security_token.security_token
        end

        def refresh_security_token
          @refresh_lock.lock
          @session_key_supplier.refresh
          @security_token = OCI::Auth::SecurityTokenContainer.new(resource_principal_session_token)
          reset_signer
        ensure
          @refresh_lock.unlock if @refresh_lock.locked? && @refresh_lock.owned?
        end

        def reset_signer
          @key_id = "ST$#{@security_token.security_token}"
          @private_key_content = @session_key_supplier.key_pair[:private_key]
          @private_key = OpenSSL::PKey::RSA.new(
            @private_key_content,
            @pass_phrase || SecureRandom.uuid
          )
        end

        def resource_principal_session_token
          request_payload = {
            "podKey": OCI::Auth::Util.sanitize_certificate_string(@session_key_supplier.key_pair[:public_key].to_pem)
          }
          sa_token = @sa_token_provider.service_account_token

          request = OCI::Auth::Util.get_metadata_request(@proxymux_endpoint, 'post')
          request.body = request_payload.to_json

          header_params = {}
          header_params[:'content-type'] = 'application/json'
          header_params[:authorization] = 'Bearer ' + sa_token
          header_params.each { |key, value| request[key.to_s] = value }
          request[:'opc-request-id'] ||= OCI::ApiClient.build_request_id

          raw_body = nil
          status_code = nil
          message = nil
          @federation_http_client.start do
            @federation_http_client.request(request) do |response|
              raw_body = response.body
              status_code = response.code
              message = response.message
            end
          end

          if status_code != '200'
            raise "Failed to get a RPST token from proxymux. URL: #{@proxymux_endpoint}, Status: #{status_code}, Message: #{message}"
          end

          decoded_response = Base64.decode64(raw_body)
          if (decoded_response.include? 'token') == false
            raise "Could not find token in decoded response from proxymux. URL: #{@proxymux_endpoint}, Decoded Response: #{decoded_response}"
          end

          begin
            response_json = JSON.parse(decoded_response)
            response_json['token'][3..-1]
          rescue JSON::ParserError
            raise "Unable to convert decoded response into JSON. Decoded response: #{decoded_response}"
          end
        end
      end
    end
  end
end
