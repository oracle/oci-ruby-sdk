# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API for managing secrets.
  class Vault::VaultsClient
    # Client used to make HTTP requests.
    # @return [OCI::ApiClient]
    attr_reader :api_client

    # Fully qualified endpoint URL
    # @return [String]
    attr_reader :endpoint

    # The default retry configuration to apply to all operations in this service client. This can be overridden
    # on a per-operation basis. The default retry configuration value is `nil`, which means that an operation
    # will not perform any retries
    # @return [OCI::Retry::RetryConfig]
    attr_reader :retry_config

    # The region, which will usually correspond to a value in {OCI::Regions::REGION_ENUM}.
    # @return [String]
    attr_reader :region

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity


    # Creates a new VaultsClient.
    # Notes:
    #   If a config is not specified, then the global OCI.config will be used.
    #
    #   This client is not thread-safe
    #
    #   Either a region or an endpoint must be specified.  If an endpoint is specified, it will be used instead of the
    #     region. A region may be specified in the config or via or the region parameter. If specified in both, then the
    #     region parameter will be used.
    # @param [Config] config A Config object.
    # @param [String] region A region used to determine the service endpoint. This will usually
    #   correspond to a value in {OCI::Regions::REGION_ENUM}, but may be an arbitrary string.
    # @param [String] endpoint The fully qualified endpoint URL
    # @param [OCI::BaseSigner] signer A signer implementation which can be used by this client. If this is not provided then
    #   a signer will be constructed via the provided config. One use case of this parameter is instance principals authentication,
    #   so that the instance principals signer can be provided to the client
    # @param [OCI::ApiClientProxySettings] proxy_settings If your environment requires you to use a proxy server for outgoing HTTP requests
    #   the details for the proxy can be provided in this parameter
    # @param [OCI::Retry::RetryConfig] retry_config The retry configuration for this service client. This represents the default retry configuration to
    #   apply across all operations. This can be overridden on a per-operation basis. The default retry configuration value is `nil`, which means that an operation
    #   will not perform any retries
    def initialize(config: nil, region: nil, endpoint: nil, signer: nil, proxy_settings: nil, retry_config: nil)
      # If the signer is an InstancePrincipalsSecurityTokenSigner or SecurityTokenSigner and no config was supplied (they are self-sufficient signers)
      # then create a dummy config to pass to the ApiClient constructor. If customers wish to create a client which uses instance principals
      # and has config (either populated programmatically or loaded from a file), they must construct that config themselves and then
      # pass it to this constructor.
      #
      # If there is no signer (or the signer is not an instance principals signer) and no config was supplied, this is not valid
      # so try and load the config from the default file.
      config = OCI::Config.validate_and_build_config_with_signer(config, signer)

      signer = OCI::Signer.config_file_auth_builder(config) if signer.nil?

      @api_client = OCI::ApiClient.new(config, signer, proxy_settings: proxy_settings)
      @retry_config = retry_config

      if endpoint
        @endpoint = endpoint + '/20180608'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "VaultsClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://vaults.{region}.oci.{secondLevelDomain}') + '/20180608'
      logger.info "VaultsClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Cancels the pending deletion of the specified secret. Canceling
    # a scheduled deletion restores the secret's lifecycle state to what
    # it was before you scheduled the secret for deletion.
    #
    # @param [String] secret_id The OCID of the secret.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @return [Response] A Response object with data of type nil
    def cancel_secret_deletion(secret_id, opts = {})
      logger.debug 'Calling operation VaultsClient#cancel_secret_deletion.' if logger

      raise "Missing the required parameter 'secret_id' when calling cancel_secret_deletion." if secret_id.nil?
      raise "Parameter value for 'secret_id' must not be blank" if OCI::Internal::Util.blank_string?(secret_id)

      path = '/secrets/{secretId}/actions/cancelDeletion'.sub('{secretId}', secret_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VaultsClient#cancel_secret_deletion') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Cancels the scheduled deletion of a secret version.
    # @param [String] secret_id The OCID of the secret.
    # @param [Integer] secret_version_number The version number of the secret.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @return [Response] A Response object with data of type nil
    def cancel_secret_version_deletion(secret_id, secret_version_number, opts = {})
      logger.debug 'Calling operation VaultsClient#cancel_secret_version_deletion.' if logger

      raise "Missing the required parameter 'secret_id' when calling cancel_secret_version_deletion." if secret_id.nil?
      raise "Missing the required parameter 'secret_version_number' when calling cancel_secret_version_deletion." if secret_version_number.nil?
      raise "Parameter value for 'secret_id' must not be blank" if OCI::Internal::Util.blank_string?(secret_id)
      raise "Parameter value for 'secret_version_number' must not be blank" if OCI::Internal::Util.blank_string?(secret_version_number)

      path = '/secrets/{secretId}/version/{secretVersionNumber}/actions/cancelDeletion'.sub('{secretId}', secret_id.to_s).sub('{secretVersionNumber}', secret_version_number.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VaultsClient#cancel_secret_version_deletion') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a secret into a different compartment within the same tenancy. For information about
    # moving resources between compartments, see [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # When provided, if-match is checked against the ETag values of the secret.
    #
    # @param [String] secret_id The OCID of the secret.
    # @param [OCI::Vault::Models::ChangeSecretCompartmentDetails] change_secret_compartment_details The updated compartment details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (e.g., if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def change_secret_compartment(secret_id, change_secret_compartment_details, opts = {})
      logger.debug 'Calling operation VaultsClient#change_secret_compartment.' if logger

      raise "Missing the required parameter 'secret_id' when calling change_secret_compartment." if secret_id.nil?
      raise "Missing the required parameter 'change_secret_compartment_details' when calling change_secret_compartment." if change_secret_compartment_details.nil?
      raise "Parameter value for 'secret_id' must not be blank" if OCI::Internal::Util.blank_string?(secret_id)

      path = '/secrets/{secretId}/actions/changeCompartment'.sub('{secretId}', secret_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_secret_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VaultsClient#change_secret_compartment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new secret according to the details of the request.
    #
    # This operation is not supported by the Oracle Cloud Infrastructure Terraform Provider.
    #
    # @param [OCI::Vault::Models::CreateSecretDetails] create_secret_details Request to create a new secret.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (e.g., if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Vault::Models::Secret Secret}
    def create_secret(create_secret_details, opts = {})
      logger.debug 'Calling operation VaultsClient#create_secret.' if logger

      raise "Missing the required parameter 'create_secret_details' when calling create_secret." if create_secret_details.nil?

      path = '/secrets'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_secret_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VaultsClient#create_secret') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Vault::Models::Secret'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified secret.
    # @param [String] secret_id The OCID of the secret.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::Vault::Models::Secret Secret}
    def get_secret(secret_id, opts = {})
      logger.debug 'Calling operation VaultsClient#get_secret.' if logger

      raise "Missing the required parameter 'secret_id' when calling get_secret." if secret_id.nil?
      raise "Parameter value for 'secret_id' must not be blank" if OCI::Internal::Util.blank_string?(secret_id)

      path = '/secrets/{secretId}'.sub('{secretId}', secret_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VaultsClient#get_secret') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Vault::Models::Secret'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified version of a secret.
    #
    # @param [String] secret_id The OCID of the secret.
    # @param [Integer] secret_version_number The version number of the secret.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::Vault::Models::SecretVersion SecretVersion}
    def get_secret_version(secret_id, secret_version_number, opts = {})
      logger.debug 'Calling operation VaultsClient#get_secret_version.' if logger

      raise "Missing the required parameter 'secret_id' when calling get_secret_version." if secret_id.nil?
      raise "Missing the required parameter 'secret_version_number' when calling get_secret_version." if secret_version_number.nil?
      raise "Parameter value for 'secret_id' must not be blank" if OCI::Internal::Util.blank_string?(secret_id)
      raise "Parameter value for 'secret_version_number' must not be blank" if OCI::Internal::Util.blank_string?(secret_version_number)

      path = '/secrets/{secretId}/version/{secretVersionNumber}'.sub('{secretId}', secret_id.to_s).sub('{secretVersionNumber}', secret_version_number.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VaultsClient#get_secret_version') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Vault::Models::SecretVersion'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists all secret versions for the specified secret.
    # @param [String] secret_id The OCID of the secret.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header
    #   from the previous \"List\" call.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Time created is default ordered as descending. Display name is default ordered as ascending.
    #    (default to VERSION_NUMBER)
    #   Allowed values are: VERSION_NUMBER
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Vault::Models::SecretVersionSummary SecretVersionSummary}>
    def list_secret_versions(secret_id, opts = {})
      logger.debug 'Calling operation VaultsClient#list_secret_versions.' if logger

      raise "Missing the required parameter 'secret_id' when calling list_secret_versions." if secret_id.nil?

      if opts[:sort_by] && !%w[VERSION_NUMBER].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of VERSION_NUMBER.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'secret_id' must not be blank" if OCI::Internal::Util.blank_string?(secret_id)

      path = '/secrets/{secretId}/versions'.sub('{secretId}', secret_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VaultsClient#list_secret_versions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Vault::Models::SecretVersionSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists all secrets in the specified vault and compartment.
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name The secret name.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header
    #   from the previous \"List\" call.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order. The default order for
    #   `TIMECREATED` is descending. The default order for `NAME` is ascending.
    #    (default to NAME)
    #   Allowed values are: TIMECREATED, NAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :vault_id The OCID of the vault.
    # @option opts [String] :lifecycle_state A filter that returns only resources that match the specified lifecycle state. The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Vault::Models::SecretSummary SecretSummary}>
    def list_secrets(compartment_id, opts = {})
      logger.debug 'Calling operation VaultsClient#list_secrets.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_secrets." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Vault::Models::SecretSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Vault::Models::SecretSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/secrets'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:vaultId] = opts[:vault_id] if opts[:vault_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VaultsClient#list_secrets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Vault::Models::SecretSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Schedules the deletion of the specified secret. This sets the lifecycle state of the secret
    # to `PENDING_DELETION` and then deletes it after the specified retention period ends.
    #
    # @param [String] secret_id The OCID of the secret.
    # @param [OCI::Vault::Models::ScheduleSecretDeletionDetails] schedule_secret_deletion_details Request to schedule the deletion of a secret.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @return [Response] A Response object with data of type nil
    def schedule_secret_deletion(secret_id, schedule_secret_deletion_details, opts = {})
      logger.debug 'Calling operation VaultsClient#schedule_secret_deletion.' if logger

      raise "Missing the required parameter 'secret_id' when calling schedule_secret_deletion." if secret_id.nil?
      raise "Missing the required parameter 'schedule_secret_deletion_details' when calling schedule_secret_deletion." if schedule_secret_deletion_details.nil?
      raise "Parameter value for 'secret_id' must not be blank" if OCI::Internal::Util.blank_string?(secret_id)

      path = '/secrets/{secretId}/actions/scheduleDeletion'.sub('{secretId}', secret_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(schedule_secret_deletion_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VaultsClient#schedule_secret_deletion') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Schedules the deletion of the specified secret version. This deletes it after the specified retention period ends. You can only
    # delete a secret version if the secret version rotation state is marked as `DEPRECATED`.
    #
    # @param [String] secret_id The OCID of the secret.
    # @param [Integer] secret_version_number The version number of the secret.
    # @param [OCI::Vault::Models::ScheduleSecretVersionDeletionDetails] schedule_secret_version_deletion_details Request to delete a secret version.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @return [Response] A Response object with data of type nil
    def schedule_secret_version_deletion(secret_id, secret_version_number, schedule_secret_version_deletion_details, opts = {})
      logger.debug 'Calling operation VaultsClient#schedule_secret_version_deletion.' if logger

      raise "Missing the required parameter 'secret_id' when calling schedule_secret_version_deletion." if secret_id.nil?
      raise "Missing the required parameter 'secret_version_number' when calling schedule_secret_version_deletion." if secret_version_number.nil?
      raise "Missing the required parameter 'schedule_secret_version_deletion_details' when calling schedule_secret_version_deletion." if schedule_secret_version_deletion_details.nil?
      raise "Parameter value for 'secret_id' must not be blank" if OCI::Internal::Util.blank_string?(secret_id)
      raise "Parameter value for 'secret_version_number' must not be blank" if OCI::Internal::Util.blank_string?(secret_version_number)

      path = '/secrets/{secretId}/version/{secretVersionNumber}/actions/scheduleDeletion'.sub('{secretId}', secret_id.to_s).sub('{secretVersionNumber}', secret_version_number.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(schedule_secret_version_deletion_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VaultsClient#schedule_secret_version_deletion') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the properties of a secret. Specifically, you can update the version number of the secret to make
    # that version number the current version. You can also update a secret's description, its free-form or defined tags, rules
    # and the secret contents. Updating the secret content automatically creates a new secret version. You cannot, however, update the current secret version number and the secret contents and the rules at the
    # same time. Furthermore, the secret must in an `ACTIVE` lifecycle state to be updated.
    #
    # This operation is not supported by the Oracle Cloud Infrastructure Terraform Provider.
    #
    # @param [String] secret_id The OCID of the secret.
    # @param [OCI::Vault::Models::UpdateSecretDetails] update_secret_details Request to update a secret.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID
    #   will include this value. Otherwise, a random request ID will be
    #   generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::Vault::Models::Secret Secret}
    def update_secret(secret_id, update_secret_details, opts = {})
      logger.debug 'Calling operation VaultsClient#update_secret.' if logger

      raise "Missing the required parameter 'secret_id' when calling update_secret." if secret_id.nil?
      raise "Missing the required parameter 'update_secret_details' when calling update_secret." if update_secret_details.nil?
      raise "Parameter value for 'secret_id' must not be blank" if OCI::Internal::Util.blank_string?(secret_id)

      path = '/secrets/{secretId}'.sub('{secretId}', secret_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_secret_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VaultsClient#update_secret') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Vault::Models::Secret'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)

      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
