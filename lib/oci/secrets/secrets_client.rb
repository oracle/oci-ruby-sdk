# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Secret Retrieval API to retrieve secrets and secret versions from vaults. For more information, see [Managing Secrets](/Content/KeyManagement/Tasks/managingsecrets.htm).
  class Secrets::SecretsClient
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


    # Creates a new SecretsClient.
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
        @endpoint = endpoint + '/20190301'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "SecretsClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://secrets.vaults.{region}.oci.{secondLevelDomain}') + '/20190301'
      logger.info "SecretsClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a secret bundle that matches either the specified `stage`, `secretVersionName`, or `versionNumber` parameter.
    # If none of these parameters are provided, the bundle for the secret version marked as `CURRENT` will be returned.
    #
    # @param [String] secret_id The OCID of the secret.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [Integer] :version_number The version number of the secret. (default to 0)
    # @option opts [String] :secret_version_name The name of the secret. (This might be referred to as the name of the secret version. Names are unique across the different versions of a secret.)
    # @option opts [String] :stage The rotation state of the secret version.
    #   Allowed values are: CURRENT, PENDING, LATEST, PREVIOUS, DEPRECATED
    # @return [Response] A Response object with data of type {OCI::Secrets::Models::SecretBundle SecretBundle}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/secrets/get_secret_bundle.rb.html) to see an example of how to use get_secret_bundle API.
    def get_secret_bundle(secret_id, opts = {})
      logger.debug 'Calling operation SecretsClient#get_secret_bundle.' if logger

      raise "Missing the required parameter 'secret_id' when calling get_secret_bundle." if secret_id.nil?

      if opts[:stage] && !%w[CURRENT PENDING LATEST PREVIOUS DEPRECATED].include?(opts[:stage])
        raise 'Invalid value for "stage", must be one of CURRENT, PENDING, LATEST, PREVIOUS, DEPRECATED.'
      end
      raise "Parameter value for 'secret_id' must not be blank" if OCI::Internal::Util.blank_string?(secret_id)

      path = '/secretbundles/{secretId}'.sub('{secretId}', secret_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:versionNumber] = opts[:version_number] if opts[:version_number]
      query_params[:secretVersionName] = opts[:secret_version_name] if opts[:secret_version_name]
      query_params[:stage] = opts[:stage] if opts[:stage]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SecretsClient#get_secret_bundle') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Secrets::Models::SecretBundle'
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


    # Gets a secret bundle by secret name and vault ID, and secret version that matches either the specified `stage`, `secretVersionName`, or `versionNumber` parameter.
    # If none of these parameters are provided, the bundle for the secret version marked as `CURRENT` is returned.
    #
    # @param [String] secret_name A user-friendly name for the secret. Secret names are unique within a vault. Secret names are case-sensitive.
    # @param [String] vault_id The OCID of the vault that contains the secret.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [Integer] :version_number The version number of the secret. (default to 0)
    # @option opts [String] :secret_version_name The name of the secret. (This might be referred to as the name of the secret version. Names are unique across the different versions of a secret.)
    # @option opts [String] :stage The rotation state of the secret version.
    #   Allowed values are: CURRENT, PENDING, LATEST, PREVIOUS, DEPRECATED
    # @return [Response] A Response object with data of type {OCI::Secrets::Models::SecretBundle SecretBundle}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/secrets/get_secret_bundle_by_name.rb.html) to see an example of how to use get_secret_bundle_by_name API.
    def get_secret_bundle_by_name(secret_name, vault_id, opts = {})
      logger.debug 'Calling operation SecretsClient#get_secret_bundle_by_name.' if logger

      raise "Missing the required parameter 'secret_name' when calling get_secret_bundle_by_name." if secret_name.nil?
      raise "Missing the required parameter 'vault_id' when calling get_secret_bundle_by_name." if vault_id.nil?

      if opts[:stage] && !%w[CURRENT PENDING LATEST PREVIOUS DEPRECATED].include?(opts[:stage])
        raise 'Invalid value for "stage", must be one of CURRENT, PENDING, LATEST, PREVIOUS, DEPRECATED.'
      end

      path = '/secretbundles/actions/getByName'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:secretName] = secret_name
      query_params[:vaultId] = vault_id
      query_params[:versionNumber] = opts[:version_number] if opts[:version_number]
      query_params[:secretVersionName] = opts[:secret_version_name] if opts[:secret_version_name]
      query_params[:stage] = opts[:stage] if opts[:stage]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SecretsClient#get_secret_bundle_by_name') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Secrets::Models::SecretBundle'
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


    # Lists all secret bundle versions for the specified secret.
    # @param [String] secret_id The OCID of the secret.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call. For information about pagination, see
    #   [List Pagination](https://docs.cloud.oracle.com/#API/Concepts/usingapi.htm#List_Pagination).
    #    (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call. For information about
    #   pagination, see [List Pagination](https://docs.cloud.oracle.com/#API/Concepts/usingapi.htm#List_Pagination).
    #
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order. The default
    #   order for `VERSION_NUMBER` is descending.
    #    (default to VERSION_NUMBER)
    #   Allowed values are: VERSION_NUMBER
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #    (default to DESC)
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Secrets::Models::SecretBundleVersionSummary SecretBundleVersionSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/secrets/list_secret_bundle_versions.rb.html) to see an example of how to use list_secret_bundle_versions API.
    def list_secret_bundle_versions(secret_id, opts = {})
      logger.debug 'Calling operation SecretsClient#list_secret_bundle_versions.' if logger

      raise "Missing the required parameter 'secret_id' when calling list_secret_bundle_versions." if secret_id.nil?

      if opts[:sort_by] && !%w[VERSION_NUMBER].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of VERSION_NUMBER.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'secret_id' must not be blank" if OCI::Internal::Util.blank_string?(secret_id)

      path = '/secretbundles/{secretId}/versions'.sub('{secretId}', secret_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'SecretsClient#list_secret_bundle_versions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Secrets::Models::SecretBundleVersionSummary>'
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
