# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the DCMS APIs to perform Metadata/Data operations.
  class DataConnectivity::DataConnectivityManagementClient
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


    # Creates a new DataConnectivityManagementClient.
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
        @endpoint = endpoint + '/20210217'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "DataConnectivityManagementClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://dataconnectivity.{region}.oci.{secondLevelDomain}') + '/20210217'
      logger.info "DataConnectivityManagementClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # The Endpoint will be moved to the desired compartment.
    #
    # @param [String] endpoint_id DCMS Endpoint id
    # @param [OCI::DataConnectivity::Models::ChangeEndpointCompartmentDetails] change_endpoint_compartment_details The details of change compartment action.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :registry_id DCMS registry id
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/change_endpoint_compartment.rb.html) to see an example of how to use change_endpoint_compartment API.
    def change_endpoint_compartment(endpoint_id, change_endpoint_compartment_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#change_endpoint_compartment.' if logger

      raise "Missing the required parameter 'endpoint_id' when calling change_endpoint_compartment." if endpoint_id.nil?
      raise "Missing the required parameter 'change_endpoint_compartment_details' when calling change_endpoint_compartment." if change_endpoint_compartment_details.nil?
      raise "Parameter value for 'endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(endpoint_id)

      path = '/endpoints/{endpointId}/actions/changeCompartment'.sub('{endpointId}', endpoint_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:registryId] = opts[:registry_id] if opts[:registry_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_endpoint_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#change_endpoint_compartment') do
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


    # The registry will be moved to the desired compartment.
    #
    # @param [String] registry_id The registry Ocid.
    # @param [OCI::DataConnectivity::Models::ChangeRegistryCompartmentDetails] change_registry_compartment_details The details of change compartment action.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/change_registry_compartment.rb.html) to see an example of how to use change_registry_compartment API.
    def change_registry_compartment(registry_id, change_registry_compartment_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#change_registry_compartment.' if logger

      raise "Missing the required parameter 'registry_id' when calling change_registry_compartment." if registry_id.nil?
      raise "Missing the required parameter 'change_registry_compartment_details' when calling change_registry_compartment." if change_registry_compartment_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/actions/changeCompartment'.sub('{registryId}', registry_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_registry_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#change_registry_compartment') do
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


    # Attaches list of DataAssets to the given endpoint
    # @param [String] registry_id The registry Ocid.
    # @param [String] endpoint_id DCMS Endpoint id
    # @param [OCI::DataConnectivity::Models::CreateAttachDataAssetDetails] create_attach_data_asset_details Request body parameters to attach data asset to an private endpoint
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::AttachDataAssetInfo AttachDataAssetInfo}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_attach_data_asset.rb.html) to see an example of how to use create_attach_data_asset API.
    def create_attach_data_asset(registry_id, endpoint_id, create_attach_data_asset_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_attach_data_asset.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_attach_data_asset." if registry_id.nil?
      raise "Missing the required parameter 'endpoint_id' when calling create_attach_data_asset." if endpoint_id.nil?
      raise "Missing the required parameter 'create_attach_data_asset_details' when calling create_attach_data_asset." if create_attach_data_asset_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(endpoint_id)

      path = '/registries/{registryId}/endpoints/{endpointId}/actions/attachDataAssets'.sub('{registryId}', registry_id.to_s).sub('{endpointId}', endpoint_id.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_attach_data_asset_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_attach_data_asset') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::AttachDataAssetInfo'
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


    # Creates a connection under an existing data asset.
    # @param [String] registry_id The registry Ocid.
    # @param [OCI::DataConnectivity::Models::CreateConnectionDetails] create_connection_details The information needed to create a connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::Connection Connection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_connection.rb.html) to see an example of how to use create_connection API.
    def create_connection(registry_id, create_connection_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_connection.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_connection." if registry_id.nil?
      raise "Missing the required parameter 'create_connection_details' when calling create_connection." if create_connection_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/connections'.sub('{registryId}', registry_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_connection') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::Connection'
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


    # Creates a connection validation.
    # @param [String] registry_id The registry Ocid.
    # @param [OCI::DataConnectivity::Models::CreateConnectionValidationDetails] create_connection_validation_details The information needed to validate a connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::ConnectionValidation ConnectionValidation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_connection_validation.rb.html) to see an example of how to use create_connection_validation API.
    def create_connection_validation(registry_id, create_connection_validation_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_connection_validation.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_connection_validation." if registry_id.nil?
      raise "Missing the required parameter 'create_connection_validation_details' when calling create_connection_validation." if create_connection_validation_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/connectionValidations'.sub('{registryId}', registry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_connection_validation_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_connection_validation') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::ConnectionValidation'
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


    # This endpoint is used to trigger validation of dataAsset, connection, schema, entity, dataOperationConfig
    # @param [String] registry_id The registry Ocid.
    # @param [OCI::DataConnectivity::Models::CreateConnectivityValidationDetails] create_connectivity_validation_details Request body parameters to trigger connectivity validations
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::ConnectivityValidation ConnectivityValidation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_connectivity_validation.rb.html) to see an example of how to use create_connectivity_validation API.
    def create_connectivity_validation(registry_id, create_connectivity_validation_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_connectivity_validation.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_connectivity_validation." if registry_id.nil?
      raise "Missing the required parameter 'create_connectivity_validation_details' when calling create_connectivity_validation." if create_connectivity_validation_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/actions/connectivityValidation'.sub('{registryId}', registry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_connectivity_validation_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_connectivity_validation') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::ConnectivityValidation'
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


    # Creates a data asset with default connection.
    # @param [String] registry_id The registry Ocid.
    # @param [OCI::DataConnectivity::Models::CreateDataAssetDetails] create_data_asset_details The information needed to create a data asset.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::DataAsset DataAsset}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_data_asset.rb.html) to see an example of how to use create_data_asset API.
    def create_data_asset(registry_id, create_data_asset_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_data_asset.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_data_asset." if registry_id.nil?
      raise "Missing the required parameter 'create_data_asset_details' when calling create_data_asset." if create_data_asset_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/dataAssets'.sub('{registryId}', registry_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_data_asset_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_data_asset') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::DataAsset'
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


    # Provide data preview on live schema
    # @param [String] registry_id The registry Ocid.
    # @param [OCI::DataConnectivity::Models::CreateDataPreviewDetails] create_data_preview_details Request body parameters to provide data preview
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::DataPreview DataPreview}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_data_preview.rb.html) to see an example of how to use create_data_preview API.
    def create_data_preview(registry_id, create_data_preview_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_data_preview.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_data_preview." if registry_id.nil?
      raise "Missing the required parameter 'create_data_preview_details' when calling create_data_preview." if create_data_preview_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/actions/dataPreview'.sub('{registryId}', registry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_data_preview_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_data_preview') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::DataPreview'
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


    # Execute data profiling on live schema
    # @param [String] registry_id The registry Ocid.
    # @param [OCI::DataConnectivity::Models::CreateDataProfileDetails] create_data_profile_details Request body parameters to execute data profiling
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::DataProfile DataProfile}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_data_profile.rb.html) to see an example of how to use create_data_profile API.
    def create_data_profile(registry_id, create_data_profile_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_data_profile.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_data_profile." if registry_id.nil?
      raise "Missing the required parameter 'create_data_profile_details' when calling create_data_profile." if create_data_profile_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/actions/dataProfile'.sub('{registryId}', registry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_data_profile_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_data_profile') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::DataProfile'
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


    # DeRereferenced a dcms artifact.
    # @param [String] registry_id The registry Ocid.
    # @param [String] dcms_artifact_id The ID of a dcms artifact (DataAsset or Endpoint).
    # @param [OCI::DataConnectivity::Models::CreateDeReferenceArtifactDetails] create_de_reference_artifact_details The information needed to delete a dcms artifact reference.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::DeReferenceInfo DeReferenceInfo}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_de_reference_artifact.rb.html) to see an example of how to use create_de_reference_artifact API.
    def create_de_reference_artifact(registry_id, dcms_artifact_id, create_de_reference_artifact_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_de_reference_artifact.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_de_reference_artifact." if registry_id.nil?
      raise "Missing the required parameter 'dcms_artifact_id' when calling create_de_reference_artifact." if dcms_artifact_id.nil?
      raise "Missing the required parameter 'create_de_reference_artifact_details' when calling create_de_reference_artifact." if create_de_reference_artifact_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'dcms_artifact_id' must not be blank" if OCI::Internal::Util.blank_string?(dcms_artifact_id)

      path = '/registries/{registryId}/dcmsArtifacts/{dcmsArtifactId}/actions/deReferenceArtifact'.sub('{registryId}', registry_id.to_s).sub('{dcmsArtifactId}', dcms_artifact_id.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_de_reference_artifact_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_de_reference_artifact') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::DeReferenceInfo'
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


    # Detaches list of DataAssets to the given endpoint
    # @param [String] registry_id The registry Ocid.
    # @param [String] endpoint_id DCMS Endpoint id
    # @param [OCI::DataConnectivity::Models::CreateDetachDataAssetDetails] create_detach_data_asset_details Request body parameters to detach data asset to an private endpoint
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::DetachDataAssetInfo DetachDataAssetInfo}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_detach_data_asset.rb.html) to see an example of how to use create_detach_data_asset API.
    def create_detach_data_asset(registry_id, endpoint_id, create_detach_data_asset_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_detach_data_asset.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_detach_data_asset." if registry_id.nil?
      raise "Missing the required parameter 'endpoint_id' when calling create_detach_data_asset." if endpoint_id.nil?
      raise "Missing the required parameter 'create_detach_data_asset_details' when calling create_detach_data_asset." if create_detach_data_asset_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(endpoint_id)

      path = '/registries/{registryId}/endpoints/{endpointId}/actions/detachDataAssets'.sub('{registryId}', registry_id.to_s).sub('{endpointId}', endpoint_id.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_detach_data_asset_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_detach_data_asset') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::DetachDataAssetInfo'
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


    # Creates a new Data Connectivity Management Endpoint ready for performing data Connectivity.
    #
    # @param [OCI::DataConnectivity::Models::CreateEndpointDetails] create_endpoint_details Details for the new Data Connectivity Management Endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :registry_id DCMS registry id
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_endpoint.rb.html) to see an example of how to use create_endpoint API.
    def create_endpoint(create_endpoint_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_endpoint.' if logger

      raise "Missing the required parameter 'create_endpoint_details' when calling create_endpoint." if create_endpoint_details.nil?

      path = '/endpoints'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:registryId] = opts[:registry_id] if opts[:registry_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_endpoint') do
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


    # Creates the data entity shape using the shape from the data asset.
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_key The connection key.
    # @param [String] schema_resource_name The schema resource name used for retrieving schemas.
    # @param [OCI::DataConnectivity::Models::CreateEntityShapeDetails] create_entity_shape_details The details needed to create the data entity shape.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :authorization_mode Authorization mode for communicating with another OCI service relevant for the API. (default to UNDEFINED)
    #   Allowed values are: OBO, USER_PRINCIPAL, RESOURCE_PRINCIPAL, INSTANCE_PRINCIPAL, UNDEFINED
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::EntityShape EntityShape}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_entity_shape.rb.html) to see an example of how to use create_entity_shape API.
    def create_entity_shape(registry_id, connection_key, schema_resource_name, create_entity_shape_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_entity_shape.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_entity_shape." if registry_id.nil?
      raise "Missing the required parameter 'connection_key' when calling create_entity_shape." if connection_key.nil?
      raise "Missing the required parameter 'schema_resource_name' when calling create_entity_shape." if schema_resource_name.nil?
      raise "Missing the required parameter 'create_entity_shape_details' when calling create_entity_shape." if create_entity_shape_details.nil?

      if opts[:authorization_mode] && !%w[OBO USER_PRINCIPAL RESOURCE_PRINCIPAL INSTANCE_PRINCIPAL UNDEFINED].include?(opts[:authorization_mode])
        raise 'Invalid value for "authorization_mode", must be one of OBO, USER_PRINCIPAL, RESOURCE_PRINCIPAL, INSTANCE_PRINCIPAL, UNDEFINED.'
      end
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)
      raise "Parameter value for 'schema_resource_name' must not be blank" if OCI::Internal::Util.blank_string?(schema_resource_name)

      path = '/registries/{registryId}/connections/{connectionKey}/schemas/{schemaResourceName}/actions/entityShapes'.sub('{registryId}', registry_id.to_s).sub('{connectionKey}', connection_key.to_s).sub('{schemaResourceName}', schema_resource_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:authorizationMode] = opts[:authorization_mode] if opts[:authorization_mode]
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_entity_shape_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_entity_shape') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::EntityShape'
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


    # Call the operation to execute
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_key The connection key.
    # @param [String] schema_resource_name The schema resource name used for retrieving schemas.
    # @param [OCI::DataConnectivity::Models::CreateExecuteOperationJobDetails] create_execute_operation_job_details Request body parameter for execute operation job input.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::ExecuteOperationJobDetails ExecuteOperationJobDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_execute_operation_job.rb.html) to see an example of how to use create_execute_operation_job API.
    def create_execute_operation_job(registry_id, connection_key, schema_resource_name, create_execute_operation_job_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_execute_operation_job.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_execute_operation_job." if registry_id.nil?
      raise "Missing the required parameter 'connection_key' when calling create_execute_operation_job." if connection_key.nil?
      raise "Missing the required parameter 'schema_resource_name' when calling create_execute_operation_job." if schema_resource_name.nil?
      raise "Missing the required parameter 'create_execute_operation_job_details' when calling create_execute_operation_job." if create_execute_operation_job_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)
      raise "Parameter value for 'schema_resource_name' must not be blank" if OCI::Internal::Util.blank_string?(schema_resource_name)

      path = '/registries/{registryId}/connections/{connectionKey}/schemas/{schemaResourceName}/actions/executeOperationJobs'.sub('{registryId}', registry_id.to_s).sub('{connectionKey}', connection_key.to_s).sub('{schemaResourceName}', schema_resource_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_execute_operation_job_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_execute_operation_job') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::ExecuteOperationJobDetails'
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


    # Creates a folder under a specefied registry.
    # @param [String] registry_id The registry Ocid.
    # @param [OCI::DataConnectivity::Models::CreateFolderDetails] create_folder_details The information needed to create a folder.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::Folder Folder}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_folder.rb.html) to see an example of how to use create_folder API.
    def create_folder(registry_id, create_folder_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_folder.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_folder." if registry_id.nil?
      raise "Missing the required parameter 'create_folder_details' when calling create_folder." if create_folder_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/folders'.sub('{registryId}', registry_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_folder_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_folder') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::Folder'
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


    # This endpoint is used to create a connectivity task (like PushdownTask).
    # @param [String] registry_id The registry Ocid.
    # @param [OCI::DataConnectivity::Models::CreateFullPushDownTaskDetails] create_full_push_down_task_details Request body parameter for full pushdown task
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::FullPushDownTaskResponse FullPushDownTaskResponse}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_full_push_down_task.rb.html) to see an example of how to use create_full_push_down_task API.
    def create_full_push_down_task(registry_id, create_full_push_down_task_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_full_push_down_task.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_full_push_down_task." if registry_id.nil?
      raise "Missing the required parameter 'create_full_push_down_task_details' when calling create_full_push_down_task." if create_full_push_down_task_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/actions/fullPushDownTask'.sub('{registryId}', registry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_full_push_down_task_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_full_push_down_task') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::FullPushDownTaskResponse'
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


    # Reference a data asset.
    # @param [String] registry_id The registry Ocid.
    # @param [String] dcms_artifact_id The ID of a dcms artifact (DataAsset or Endpoint).
    # @param [OCI::DataConnectivity::Models::CreateReferenceArtifactDetails] create_reference_artifact_details The information needed to reference a dcms artifact
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::ReferenceInfo ReferenceInfo}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_reference_artifact.rb.html) to see an example of how to use create_reference_artifact API.
    def create_reference_artifact(registry_id, dcms_artifact_id, create_reference_artifact_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_reference_artifact.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_reference_artifact." if registry_id.nil?
      raise "Missing the required parameter 'dcms_artifact_id' when calling create_reference_artifact." if dcms_artifact_id.nil?
      raise "Missing the required parameter 'create_reference_artifact_details' when calling create_reference_artifact." if create_reference_artifact_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'dcms_artifact_id' must not be blank" if OCI::Internal::Util.blank_string?(dcms_artifact_id)

      path = '/registries/{registryId}/dcmsArtifacts/{dcmsArtifactId}/actions/referenceArtifact'.sub('{registryId}', registry_id.to_s).sub('{dcmsArtifactId}', dcms_artifact_id.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_reference_artifact_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_reference_artifact') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::ReferenceInfo'
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


    # Creates a new Data Connectivity Management Registry ready for performing data Connectivity Management.
    #
    # @param [OCI::DataConnectivity::Models::CreateRegistryDetails] create_registry_details Details for the new Data Connectivity Management Registry.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_registry.rb.html) to see an example of how to use create_registry API.
    def create_registry(create_registry_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_registry.' if logger

      raise "Missing the required parameter 'create_registry_details' when calling create_registry." if create_registry_details.nil?

      path = '/registries'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_registry_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_registry') do
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


    # Execute network validation on selected data assets associated with the provided private endpoint
    # @param [String] registry_id The registry Ocid.
    # @param [OCI::DataConnectivity::Models::CreateTestNetworkConnectivityDetails] create_test_network_connectivity_details Request body parameters to execute network validation
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::TestNetworkConnectivity TestNetworkConnectivity}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/create_test_network_connectivity.rb.html) to see an example of how to use create_test_network_connectivity API.
    def create_test_network_connectivity(registry_id, create_test_network_connectivity_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#create_test_network_connectivity.' if logger

      raise "Missing the required parameter 'registry_id' when calling create_test_network_connectivity." if registry_id.nil?
      raise "Missing the required parameter 'create_test_network_connectivity_details' when calling create_test_network_connectivity." if create_test_network_connectivity_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/actions/testNetworkConnectivity'.sub('{registryId}', registry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_test_network_connectivity_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#create_test_network_connectivity') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::TestNetworkConnectivity'
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


    # Removes a connection using the specified identifier.
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_key The connection key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/delete_connection.rb.html) to see an example of how to use delete_connection API.
    def delete_connection(registry_id, connection_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#delete_connection.' if logger

      raise "Missing the required parameter 'registry_id' when calling delete_connection." if registry_id.nil?
      raise "Missing the required parameter 'connection_key' when calling delete_connection." if connection_key.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)

      path = '/registries/{registryId}/connections/{connectionKey}'.sub('{registryId}', registry_id.to_s).sub('{connectionKey}', connection_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#delete_connection') do
        @api_client.call_api(
          :DELETE,
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


    # Deletes a connection validation.
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_validation_key The key of the connection validation.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/delete_connection_validation.rb.html) to see an example of how to use delete_connection_validation API.
    def delete_connection_validation(registry_id, connection_validation_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#delete_connection_validation.' if logger

      raise "Missing the required parameter 'registry_id' when calling delete_connection_validation." if registry_id.nil?
      raise "Missing the required parameter 'connection_validation_key' when calling delete_connection_validation." if connection_validation_key.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_validation_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_validation_key)

      path = '/registries/{registryId}/connectionValidations/{connectionValidationKey}'.sub('{registryId}', registry_id.to_s).sub('{connectionValidationKey}', connection_validation_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#delete_connection_validation') do
        @api_client.call_api(
          :DELETE,
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


    # Removes a data asset using the specified identifier.
    # @param [String] registry_id The registry Ocid.
    # @param [String] data_asset_key The data asset key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/delete_data_asset.rb.html) to see an example of how to use delete_data_asset API.
    def delete_data_asset(registry_id, data_asset_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#delete_data_asset.' if logger

      raise "Missing the required parameter 'registry_id' when calling delete_data_asset." if registry_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling delete_data_asset." if data_asset_key.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/registries/{registryId}/dataAssets/{dataAssetKey}'.sub('{registryId}', registry_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#delete_data_asset') do
        @api_client.call_api(
          :DELETE,
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


    # Deletes a Data Connectivity Management Endpoint resource by identifier
    # @param [String] endpoint_id DCMS Endpoint id
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :registry_id DCMS registry id
    # @option opts [BOOLEAN] :is_force_operation Try to delete forcefully after drain timeout. (default to false)
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/delete_endpoint.rb.html) to see an example of how to use delete_endpoint API.
    def delete_endpoint(endpoint_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#delete_endpoint.' if logger

      raise "Missing the required parameter 'endpoint_id' when calling delete_endpoint." if endpoint_id.nil?
      raise "Parameter value for 'endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(endpoint_id)

      path = '/endpoints/{endpointId}'.sub('{endpointId}', endpoint_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:registryId] = opts[:registry_id] if opts[:registry_id]
      query_params[:isForceOperation] = opts[:is_force_operation] if !opts[:is_force_operation].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#delete_endpoint') do
        @api_client.call_api(
          :DELETE,
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


    # Removes a folder using the specified identifier.
    # @param [String] registry_id The registry Ocid.
    # @param [String] folder_key The folder ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/delete_folder.rb.html) to see an example of how to use delete_folder API.
    def delete_folder(registry_id, folder_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#delete_folder.' if logger

      raise "Missing the required parameter 'registry_id' when calling delete_folder." if registry_id.nil?
      raise "Missing the required parameter 'folder_key' when calling delete_folder." if folder_key.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'folder_key' must not be blank" if OCI::Internal::Util.blank_string?(folder_key)

      path = '/registries/{registryId}/folders/{folderKey}'.sub('{registryId}', registry_id.to_s).sub('{folderKey}', folder_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#delete_folder') do
        @api_client.call_api(
          :DELETE,
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


    # This api is used to delete a persisted NetworkValidationStatus by its key
    # @param [String] registry_id The registry Ocid.
    # @param [String] network_validation_status_key NetworkValidationStatus key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/delete_network_connectivity_status.rb.html) to see an example of how to use delete_network_connectivity_status API.
    def delete_network_connectivity_status(registry_id, network_validation_status_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#delete_network_connectivity_status.' if logger

      raise "Missing the required parameter 'registry_id' when calling delete_network_connectivity_status." if registry_id.nil?
      raise "Missing the required parameter 'network_validation_status_key' when calling delete_network_connectivity_status." if network_validation_status_key.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'network_validation_status_key' must not be blank" if OCI::Internal::Util.blank_string?(network_validation_status_key)

      path = '/registries/{registryId}/networkConnectivityStatus/{networkValidationStatusKey}'.sub('{registryId}', registry_id.to_s).sub('{networkValidationStatusKey}', network_validation_status_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#delete_network_connectivity_status') do
        @api_client.call_api(
          :DELETE,
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


    # Deletes a Data Connectivity Management Registry resource by identifier
    # @param [String] registry_id The registry Ocid.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_force_operation Try to delete forcefully after drain timeout. (default to false)
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/delete_registry.rb.html) to see an example of how to use delete_registry API.
    def delete_registry(registry_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#delete_registry.' if logger

      raise "Missing the required parameter 'registry_id' when calling delete_registry." if registry_id.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}'.sub('{registryId}', registry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isForceOperation] = opts[:is_force_operation] if !opts[:is_force_operation].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#delete_registry') do
        @api_client.call_api(
          :DELETE,
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


    # Retrieves the connection details using the specified identifier.
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_key The connection key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::Connection Connection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/get_connection.rb.html) to see an example of how to use get_connection API.
    def get_connection(registry_id, connection_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#get_connection.' if logger

      raise "Missing the required parameter 'registry_id' when calling get_connection." if registry_id.nil?
      raise "Missing the required parameter 'connection_key' when calling get_connection." if connection_key.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)

      path = '/registries/{registryId}/connections/{connectionKey}'.sub('{registryId}', registry_id.to_s).sub('{connectionKey}', connection_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#get_connection') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::Connection'
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


    # Retrieves a connection validation using the specified identifier.
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_validation_key The key of the connection validation.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::ConnectionValidation ConnectionValidation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/get_connection_validation.rb.html) to see an example of how to use get_connection_validation API.
    def get_connection_validation(registry_id, connection_validation_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#get_connection_validation.' if logger

      raise "Missing the required parameter 'registry_id' when calling get_connection_validation." if registry_id.nil?
      raise "Missing the required parameter 'connection_validation_key' when calling get_connection_validation." if connection_validation_key.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_validation_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_validation_key)

      path = '/registries/{registryId}/connectionValidations/{connectionValidationKey}'.sub('{registryId}', registry_id.to_s).sub('{connectionValidationKey}', connection_validation_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#get_connection_validation') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::ConnectionValidation'
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


    # Retrieves details of a data asset using the specified identifier.
    # @param [String] registry_id The registry Ocid.
    # @param [String] data_asset_key The data asset key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::DataAsset DataAsset}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/get_data_asset.rb.html) to see an example of how to use get_data_asset API.
    def get_data_asset(registry_id, data_asset_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#get_data_asset.' if logger

      raise "Missing the required parameter 'registry_id' when calling get_data_asset." if registry_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling get_data_asset." if data_asset_key.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/registries/{registryId}/dataAssets/{dataAssetKey}'.sub('{registryId}', registry_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#get_data_asset') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::DataAsset'
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


    # Retrieves the data entity details with the given name from live schema.
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_key The connection key.
    # @param [String] schema_resource_name The schema resource name used for retrieving schemas.
    # @param [String] data_entity_key The key of the data entity.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::DataEntity DataEntity}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/get_data_entity.rb.html) to see an example of how to use get_data_entity API.
    def get_data_entity(registry_id, connection_key, schema_resource_name, data_entity_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#get_data_entity.' if logger

      raise "Missing the required parameter 'registry_id' when calling get_data_entity." if registry_id.nil?
      raise "Missing the required parameter 'connection_key' when calling get_data_entity." if connection_key.nil?
      raise "Missing the required parameter 'schema_resource_name' when calling get_data_entity." if schema_resource_name.nil?
      raise "Missing the required parameter 'data_entity_key' when calling get_data_entity." if data_entity_key.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)
      raise "Parameter value for 'schema_resource_name' must not be blank" if OCI::Internal::Util.blank_string?(schema_resource_name)
      raise "Parameter value for 'data_entity_key' must not be blank" if OCI::Internal::Util.blank_string?(data_entity_key)

      path = '/registries/{registryId}/connections/{connectionKey}/schemas/{schemaResourceName}/dataEntities/{dataEntityKey}'.sub('{registryId}', registry_id.to_s).sub('{connectionKey}', connection_key.to_s).sub('{schemaResourceName}', schema_resource_name.to_s).sub('{dataEntityKey}', data_entity_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#get_data_entity') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::DataEntity'
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


    # Gets a Data Connectivity Management Endpoint by identifier
    # @param [String] endpoint_id DCMS Endpoint id
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :registry_id DCMS registry id
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::Endpoint Endpoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/get_endpoint.rb.html) to see an example of how to use get_endpoint API.
    def get_endpoint(endpoint_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#get_endpoint.' if logger

      raise "Missing the required parameter 'endpoint_id' when calling get_endpoint." if endpoint_id.nil?
      raise "Parameter value for 'endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(endpoint_id)

      path = '/endpoints/{endpointId}'.sub('{endpointId}', endpoint_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:registryId] = opts[:registry_id] if opts[:registry_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#get_endpoint') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::Endpoint'
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


    # Get the operation status or operation execution result
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_key The connection key.
    # @param [String] schema_resource_name The schema resource name used for retrieving schemas.
    # @param [String] execute_operation_job_key Job id returned by execute operation job api
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::ExecuteOperationJob ExecuteOperationJob}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/get_execute_operation_job.rb.html) to see an example of how to use get_execute_operation_job API.
    def get_execute_operation_job(registry_id, connection_key, schema_resource_name, execute_operation_job_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#get_execute_operation_job.' if logger

      raise "Missing the required parameter 'registry_id' when calling get_execute_operation_job." if registry_id.nil?
      raise "Missing the required parameter 'connection_key' when calling get_execute_operation_job." if connection_key.nil?
      raise "Missing the required parameter 'schema_resource_name' when calling get_execute_operation_job." if schema_resource_name.nil?
      raise "Missing the required parameter 'execute_operation_job_key' when calling get_execute_operation_job." if execute_operation_job_key.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)
      raise "Parameter value for 'schema_resource_name' must not be blank" if OCI::Internal::Util.blank_string?(schema_resource_name)
      raise "Parameter value for 'execute_operation_job_key' must not be blank" if OCI::Internal::Util.blank_string?(execute_operation_job_key)

      path = '/registries/{registryId}/connections/{connectionKey}/schemas/{schemaResourceName}/executeOperationJobs/{executeOperationJobKey}'.sub('{registryId}', registry_id.to_s).sub('{connectionKey}', connection_key.to_s).sub('{schemaResourceName}', schema_resource_name.to_s).sub('{executeOperationJobKey}', execute_operation_job_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#get_execute_operation_job') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::ExecuteOperationJob'
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


    # Retrieves the folder details using the specified identifier.
    # @param [String] registry_id The registry Ocid.
    # @param [String] folder_key The folder ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::Folder Folder}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/get_folder.rb.html) to see an example of how to use get_folder API.
    def get_folder(registry_id, folder_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#get_folder.' if logger

      raise "Missing the required parameter 'registry_id' when calling get_folder." if registry_id.nil?
      raise "Missing the required parameter 'folder_key' when calling get_folder." if folder_key.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'folder_key' must not be blank" if OCI::Internal::Util.blank_string?(folder_key)

      path = '/registries/{registryId}/folders/{folderKey}'.sub('{registryId}', registry_id.to_s).sub('{folderKey}', folder_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#get_folder') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::Folder'
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


    # Get Status of network reachability check, with the timestamp when the status was last checked, for a given PrivateEndpoint-DataAsset pair
    # @param [String] registry_id The registry Ocid.
    # @param [String] data_asset_key The data asset key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::NetworkConnectivityStatus NetworkConnectivityStatus}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/get_network_connectivity_status.rb.html) to see an example of how to use get_network_connectivity_status API.
    def get_network_connectivity_status(registry_id, data_asset_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#get_network_connectivity_status.' if logger

      raise "Missing the required parameter 'registry_id' when calling get_network_connectivity_status." if registry_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling get_network_connectivity_status." if data_asset_key.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/registries/{registryId}/dataAssets/{dataAssetKey}/networkConnectivityStatus'.sub('{registryId}', registry_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#get_network_connectivity_status') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::NetworkConnectivityStatus'
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


    # Retrieves the details of operation with given resource name.
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_key The connection key.
    # @param [String] schema_resource_name The schema resource name used for retrieving schemas.
    # @param [String] operation_resource_name The opeartion resource name used for retrieving the details of operation.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::Operation Operation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/get_operation.rb.html) to see an example of how to use get_operation API.
    def get_operation(registry_id, connection_key, schema_resource_name, operation_resource_name, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#get_operation.' if logger

      raise "Missing the required parameter 'registry_id' when calling get_operation." if registry_id.nil?
      raise "Missing the required parameter 'connection_key' when calling get_operation." if connection_key.nil?
      raise "Missing the required parameter 'schema_resource_name' when calling get_operation." if schema_resource_name.nil?
      raise "Missing the required parameter 'operation_resource_name' when calling get_operation." if operation_resource_name.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)
      raise "Parameter value for 'schema_resource_name' must not be blank" if OCI::Internal::Util.blank_string?(schema_resource_name)
      raise "Parameter value for 'operation_resource_name' must not be blank" if OCI::Internal::Util.blank_string?(operation_resource_name)

      path = '/registries/{registryId}/connections/{connectionKey}/schemas/{schemaResourceName}/operations/{operationResourceName}'.sub('{registryId}', registry_id.to_s).sub('{connectionKey}', connection_key.to_s).sub('{schemaResourceName}', schema_resource_name.to_s).sub('{operationResourceName}', operation_resource_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#get_operation') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::Operation'
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


    # Gets a Data Connectivity Management Registry by identifier
    # @param [String] registry_id The registry Ocid.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::Registry Registry}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/get_registry.rb.html) to see an example of how to use get_registry API.
    def get_registry(registry_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#get_registry.' if logger

      raise "Missing the required parameter 'registry_id' when calling get_registry." if registry_id.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}'.sub('{registryId}', registry_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#get_registry') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::Registry'
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


    # Retrieves a schema that can be accessed using the specified connection.
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_key The connection key.
    # @param [String] schema_resource_name The schema resource name used for retrieving schemas.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::Schema Schema}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/get_schema.rb.html) to see an example of how to use get_schema API.
    def get_schema(registry_id, connection_key, schema_resource_name, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#get_schema.' if logger

      raise "Missing the required parameter 'registry_id' when calling get_schema." if registry_id.nil?
      raise "Missing the required parameter 'connection_key' when calling get_schema." if connection_key.nil?
      raise "Missing the required parameter 'schema_resource_name' when calling get_schema." if schema_resource_name.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)
      raise "Parameter value for 'schema_resource_name' must not be blank" if OCI::Internal::Util.blank_string?(schema_resource_name)

      path = '/registries/{registryId}/connections/{connectionKey}/schemas/{schemaResourceName}'.sub('{registryId}', registry_id.to_s).sub('{connectionKey}', connection_key.to_s).sub('{schemaResourceName}', schema_resource_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#get_schema') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::Schema'
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


    # This endpoint retrieves dataAsset and connection attributes from DataAssetRegistry
    #
    # @param [String] registry_id The registry Ocid.
    # @param [String] type_key key of the a specefic Type.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::Type Type}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/get_type.rb.html) to see an example of how to use get_type API.
    def get_type(registry_id, type_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#get_type.' if logger

      raise "Missing the required parameter 'registry_id' when calling get_type." if registry_id.nil?
      raise "Missing the required parameter 'type_key' when calling get_type." if type_key.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'type_key' must not be blank" if OCI::Internal::Util.blank_string?(type_key)

      path = '/registries/{registryId}/types/{typeKey}'.sub('{registryId}', registry_id.to_s).sub('{typeKey}', type_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#get_type') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::Type'
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


    # Gets the status of the work request with the given ID.
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#get_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling get_work_request." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}'.sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::WorkRequest'
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


    # Retrieves a list of connection validations within the specified registry.
    # @param [String] registry_id The registry Ocid.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :key Used to filter by the key of the object.
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :identifier Used to filter by the identifier of the object.
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to timeCreated)
    #   Allowed values are: id, timeCreated, displayName
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::ConnectionValidationSummaryCollection ConnectionValidationSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_connection_validations.rb.html) to see an example of how to use list_connection_validations API.
    def list_connection_validations(registry_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_connection_validations.' if logger

      raise "Missing the required parameter 'registry_id' when calling list_connection_validations." if registry_id.nil?

      if opts[:sort_by] && !%w[id timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/connectionValidations'.sub('{registryId}', registry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:key] = opts[:key] if opts[:key]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:identifier] = opts[:identifier] if opts[:identifier]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_connection_validations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::ConnectionValidationSummaryCollection'
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


    # Retrieves a list of all connections.
    # @param [String] registry_id The registry Ocid.
    # @param [String] data_asset_key Used to filter by the data asset key of the object.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :type Type of the object to filter the results with.
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to timeCreated)
    #   Allowed values are: id, timeCreated, displayName
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :favorites_query_param If value is FAVORITES_ONLY, then only objects marked as favorite by the requesting user will be included in result. If value is NON_FAVORITES_ONLY, then objects marked as favorites by the requesting user will be skipped. If value is ALL or if not specified, all objects, irrespective of favorites or not will be returned. Default is ALL. (default to ALL)
    #   Allowed values are: FAVORITES_ONLY, NON_FAVORITES_ONLY, ALL
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::ConnectionSummaryCollection ConnectionSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_connections.rb.html) to see an example of how to use list_connections API.
    def list_connections(registry_id, data_asset_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_connections.' if logger

      raise "Missing the required parameter 'registry_id' when calling list_connections." if registry_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling list_connections." if data_asset_key.nil?

      if opts[:sort_by] && !%w[id timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:favorites_query_param] && !%w[FAVORITES_ONLY NON_FAVORITES_ONLY ALL].include?(opts[:favorites_query_param])
        raise 'Invalid value for "favorites_query_param", must be one of FAVORITES_ONLY, NON_FAVORITES_ONLY, ALL.'
      end
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/connections'.sub('{registryId}', registry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:dataAssetKey] = data_asset_key
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:type] = opts[:type] if opts[:type]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:favoritesQueryParam] = opts[:favorites_query_param] if opts[:favorites_query_param]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_connections') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::ConnectionSummaryCollection'
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


    # Retrieves a list of all data asset summaries.
    #
    # @param [String] registry_id The registry Ocid.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [Array<String>] :include_types DataAsset type which needs to be listed while listing dataAssets
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to timeCreated)
    #   Allowed values are: id, timeCreated, displayName
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Array<String>] :exclude_types Types which wont be listed while listing dataAsset/Connection
    # @option opts [String] :favorites_query_param If value is FAVORITES_ONLY, then only objects marked as favorite by the requesting user will be included in result. If value is NON_FAVORITES_ONLY, then objects marked as favorites by the requesting user will be skipped. If value is ALL or if not specified, all objects, irrespective of favorites or not will be returned. Default is ALL. (default to ALL)
    #   Allowed values are: FAVORITES_ONLY, NON_FAVORITES_ONLY, ALL
    # @option opts [String] :folder_id Unique key of the folder.
    # @option opts [Array<String>] :endpoint_ids Endpoint Ids used for data-plane APIs to filter or prefer specific endpoint.
    # @option opts [Array<String>] :exclude_endpoint_ids Endpoints which will be excluded while listing dataAssets
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::DataAssetSummaryCollection DataAssetSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_data_assets.rb.html) to see an example of how to use list_data_assets API.
    def list_data_assets(registry_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_data_assets.' if logger

      raise "Missing the required parameter 'registry_id' when calling list_data_assets." if registry_id.nil?

      if opts[:sort_by] && !%w[id timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:favorites_query_param] && !%w[FAVORITES_ONLY NON_FAVORITES_ONLY ALL].include?(opts[:favorites_query_param])
        raise 'Invalid value for "favorites_query_param", must be one of FAVORITES_ONLY, NON_FAVORITES_ONLY, ALL.'
      end
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/dataAssets'.sub('{registryId}', registry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:includeTypes] = OCI::ApiClient.build_collection_params(opts[:include_types], :multi) if opts[:include_types] && !opts[:include_types].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:excludeTypes] = OCI::ApiClient.build_collection_params(opts[:exclude_types], :multi) if opts[:exclude_types] && !opts[:exclude_types].empty?
      query_params[:favoritesQueryParam] = opts[:favorites_query_param] if opts[:favorites_query_param]
      query_params[:folderId] = opts[:folder_id] if opts[:folder_id]
      query_params[:endpointIds] = OCI::ApiClient.build_collection_params(opts[:endpoint_ids], :multi) if opts[:endpoint_ids] && !opts[:endpoint_ids].empty?
      query_params[:excludeEndpointIds] = OCI::ApiClient.build_collection_params(opts[:exclude_endpoint_ids], :multi) if opts[:exclude_endpoint_ids] && !opts[:exclude_endpoint_ids].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_data_assets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::DataAssetSummaryCollection'
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


    # Lists a summary of data entities from the data asset using the specified connection.
    #
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_key The connection key.
    # @param [String] schema_resource_name The schema resource name used for retrieving schemas.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :type Type of the object to filter the results with.
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to timeCreated)
    #   Allowed values are: id, timeCreated, displayName
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :api_mode This parameter can be used to set the api response type to preview. (default to ALL)
    #   Allowed values are: PREVIEW, ALL
    # @option opts [Array<String>] :name_list Used to filter by the name of the object. (default to [])
    # @option opts [BOOLEAN] :is_pattern This parameter can be used to specify whether entity search type is pattern search or not. (default to false)
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::DataEntitySummaryCollection DataEntitySummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_data_entities.rb.html) to see an example of how to use list_data_entities API.
    def list_data_entities(registry_id, connection_key, schema_resource_name, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_data_entities.' if logger

      raise "Missing the required parameter 'registry_id' when calling list_data_entities." if registry_id.nil?
      raise "Missing the required parameter 'connection_key' when calling list_data_entities." if connection_key.nil?
      raise "Missing the required parameter 'schema_resource_name' when calling list_data_entities." if schema_resource_name.nil?

      if opts[:sort_by] && !%w[id timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:api_mode] && !%w[PREVIEW ALL].include?(opts[:api_mode])
        raise 'Invalid value for "api_mode", must be one of PREVIEW, ALL.'
      end
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)
      raise "Parameter value for 'schema_resource_name' must not be blank" if OCI::Internal::Util.blank_string?(schema_resource_name)

      path = '/registries/{registryId}/connections/{connectionKey}/schemas/{schemaResourceName}/dataEntities'.sub('{registryId}', registry_id.to_s).sub('{connectionKey}', connection_key.to_s).sub('{schemaResourceName}', schema_resource_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:type] = opts[:type] if opts[:type]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:apiMode] = opts[:api_mode] if opts[:api_mode]
      query_params[:nameList] = OCI::ApiClient.build_collection_params(opts[:name_list], :multi) if opts[:name_list] && !opts[:name_list].empty?
      query_params[:isPattern] = opts[:is_pattern] if !opts[:is_pattern].nil?
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_data_entities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::DataEntitySummaryCollection'
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


    # Returns a list of Data Connectivity Management Endpoints.
    #
    # @param [String] compartment_id The OCID of the compartment containing the resources you want to list.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :registry_id DCMS registry id
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :lifecycle_state Lifecycle state of the resource.
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by This parameter allows users to specify a sort field.  Default sort order is the descending order of `timeCreated` (most recently created objects at the top).  Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME, TIMEUPDATED
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::EndpointSummaryCollection EndpointSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_endpoints.rb.html) to see an example of how to use list_endpoints API.
    def list_endpoints(compartment_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_endpoints.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_endpoints." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DataConnectivity::Models::Registry::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataConnectivity::Models::Registry::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME TIMEUPDATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME, TIMEUPDATED.'
      end

      path = '/endpoints'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:registryId] = opts[:registry_id] if opts[:registry_id]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_endpoints') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::EndpointSummaryCollection'
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


    # Retrieves a list of all folders.
    # @param [String] registry_id The registry Ocid.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :type Type of the object to filter the results with.
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to timeCreated)
    #   Allowed values are: id, timeCreated, displayName
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :favorites_query_param If value is FAVORITES_ONLY, then only objects marked as favorite by the requesting user will be included in result. If value is NON_FAVORITES_ONLY, then objects marked as favorites by the requesting user will be skipped. If value is ALL or if not specified, all objects, irrespective of favorites or not will be returned. Default is ALL. (default to ALL)
    #   Allowed values are: FAVORITES_ONLY, NON_FAVORITES_ONLY, ALL
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::FolderSummaryCollection FolderSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_folders.rb.html) to see an example of how to use list_folders API.
    def list_folders(registry_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_folders.' if logger

      raise "Missing the required parameter 'registry_id' when calling list_folders." if registry_id.nil?

      if opts[:sort_by] && !%w[id timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:favorites_query_param] && !%w[FAVORITES_ONLY NON_FAVORITES_ONLY ALL].include?(opts[:favorites_query_param])
        raise 'Invalid value for "favorites_query_param", must be one of FAVORITES_ONLY, NON_FAVORITES_ONLY, ALL.'
      end
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/folders'.sub('{registryId}', registry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:type] = opts[:type] if opts[:type]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:favoritesQueryParam] = opts[:favorites_query_param] if opts[:favorites_query_param]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_folders') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::FolderSummaryCollection'
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


    # Lists the summary of operations present in the schema identified by schema name.
    #
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_key The connection key.
    # @param [String] schema_resource_name The schema resource name used for retrieving schemas.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to timeCreated)
    #   Allowed values are: id, timeCreated, displayName
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::OperationSummaryCollection OperationSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_operations.rb.html) to see an example of how to use list_operations API.
    def list_operations(registry_id, connection_key, schema_resource_name, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_operations.' if logger

      raise "Missing the required parameter 'registry_id' when calling list_operations." if registry_id.nil?
      raise "Missing the required parameter 'connection_key' when calling list_operations." if connection_key.nil?
      raise "Missing the required parameter 'schema_resource_name' when calling list_operations." if schema_resource_name.nil?

      if opts[:sort_by] && !%w[id timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)
      raise "Parameter value for 'schema_resource_name' must not be blank" if OCI::Internal::Util.blank_string?(schema_resource_name)

      path = '/registries/{registryId}/connections/{connectionKey}/schemas/{schemaResourceName}/operations'.sub('{registryId}', registry_id.to_s).sub('{connectionKey}', connection_key.to_s).sub('{schemaResourceName}', schema_resource_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_operations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::OperationSummaryCollection'
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


    # Retrieves a list of all reference info of a dcms artifact.
    #
    # @param [String] registry_id The registry Ocid.
    # @param [String] dcms_artifact_id The ID of a dcms artifact (DataAsset or Endpoint).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :type Type of the object to filter the results with.
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to timeCreated)
    #   Allowed values are: id, timeCreated, displayName
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Array<String>] :exclude_types Types which wont be listed while listing dataAsset/Connection
    # @option opts [String] :favorites_query_param If value is FAVORITES_ONLY, then only objects marked as favorite by the requesting user will be included in result. If value is NON_FAVORITES_ONLY, then objects marked as favorites by the requesting user will be skipped. If value is ALL or if not specified, all objects, irrespective of favorites or not will be returned. Default is ALL. (default to ALL)
    #   Allowed values are: FAVORITES_ONLY, NON_FAVORITES_ONLY, ALL
    # @option opts [String] :service_artifact_id Unique key of the service.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::ReferenceArtifactSummaryCollection ReferenceArtifactSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_reference_artifacts.rb.html) to see an example of how to use list_reference_artifacts API.
    def list_reference_artifacts(registry_id, dcms_artifact_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_reference_artifacts.' if logger

      raise "Missing the required parameter 'registry_id' when calling list_reference_artifacts." if registry_id.nil?
      raise "Missing the required parameter 'dcms_artifact_id' when calling list_reference_artifacts." if dcms_artifact_id.nil?

      if opts[:sort_by] && !%w[id timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:favorites_query_param] && !%w[FAVORITES_ONLY NON_FAVORITES_ONLY ALL].include?(opts[:favorites_query_param])
        raise 'Invalid value for "favorites_query_param", must be one of FAVORITES_ONLY, NON_FAVORITES_ONLY, ALL.'
      end
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'dcms_artifact_id' must not be blank" if OCI::Internal::Util.blank_string?(dcms_artifact_id)

      path = '/registries/{registryId}/dcmsArtifacts/{dcmsArtifactId}/referenceArtifacts'.sub('{registryId}', registry_id.to_s).sub('{dcmsArtifactId}', dcms_artifact_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:type] = opts[:type] if opts[:type]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:excludeTypes] = OCI::ApiClient.build_collection_params(opts[:exclude_types], :multi) if opts[:exclude_types] && !opts[:exclude_types].empty?
      query_params[:favoritesQueryParam] = opts[:favorites_query_param] if opts[:favorites_query_param]
      query_params[:serviceArtifactId] = opts[:service_artifact_id] if opts[:service_artifact_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_reference_artifacts') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::ReferenceArtifactSummaryCollection'
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


    # Returns a list of Data Connectivity Management Registries.
    #
    # @param [String] compartment_id The OCID of the compartment containing the resources you want to list.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [BOOLEAN] :is_deep_lookup This parameter allows list registries to deep look at whole tenancy. (default to true)
    # @option opts [String] :lifecycle_state Lifecycle state of the resource.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::RegistrySummaryCollection RegistrySummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_registries.rb.html) to see an example of how to use list_registries API.
    def list_registries(compartment_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_registries.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_registries." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DataConnectivity::Models::Registry::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataConnectivity::Models::Registry::LIFECYCLE_STATE_ENUM.'
      end

      path = '/registries'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:isDeepLookup] = opts[:is_deep_lookup] if !opts[:is_deep_lookup].nil?
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_registries') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::RegistrySummaryCollection'
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


    # Retrieves a list of all the schemas that can be accessed using the specified connection.
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_key The connection key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to timeCreated)
    #   Allowed values are: id, timeCreated, displayName
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :schema_resource_key Schema resource name used for retrieving schemas.
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Array<String>] :name_list Used to filter by the name of the object. (default to [])
    # @option opts [String] :endpoint_id Endpoint Id used for getDataAssetFullDetails.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::SchemaSummaryCollection SchemaSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_schemas.rb.html) to see an example of how to use list_schemas API.
    def list_schemas(registry_id, connection_key, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_schemas.' if logger

      raise "Missing the required parameter 'registry_id' when calling list_schemas." if registry_id.nil?
      raise "Missing the required parameter 'connection_key' when calling list_schemas." if connection_key.nil?

      if opts[:sort_by] && !%w[id timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)

      path = '/registries/{registryId}/connections/{connectionKey}/schemas'.sub('{registryId}', registry_id.to_s).sub('{connectionKey}', connection_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:schemaResourceKey] = opts[:schema_resource_key] if opts[:schema_resource_key]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:nameList] = OCI::ApiClient.build_collection_params(opts[:name_list], :multi) if opts[:name_list] && !opts[:name_list].empty?
      query_params[:endpointId] = opts[:endpoint_id] if opts[:endpoint_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_schemas') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::SchemaSummaryCollection'
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


    # This endpoint retrieves list of all the supported connector types
    #
    # @param [String] registry_id The registry Ocid.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :type Type of the object to filter the results with.
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to timeCreated)
    #   Allowed values are: id, timeCreated, displayName
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :name Used to filter by the name of the object.
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::TypesSummaryCollection TypesSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_types.rb.html) to see an example of how to use list_types API.
    def list_types(registry_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_types.' if logger

      raise "Missing the required parameter 'registry_id' when calling list_types." if registry_id.nil?

      if opts[:sort_by] && !%w[id timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}/types'.sub('{registryId}', registry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:type] = opts[:type] if opts[:type]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:name] = opts[:name] if opts[:name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::TypesSummaryCollection'
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


    # Return a (paginated) list of errors for a given work request.
    #
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::WorkRequestErrorCollection WorkRequestErrorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/workRequestErrors'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::WorkRequestErrorCollection'
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


    # Return a (paginated) list of logs for a given work request.
    #
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::WorkRequestLogCollection WorkRequestLogCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/logs'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::WorkRequestLogCollection'
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


    # Lists the work requests in a compartment.
    #
    # @param [String] compartment_id The OCID of the compartment containing the resources you want to list.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :resource_id DCMS registry or endpoint id
    # @option opts [String] :work_request_status Work Request status.
    #   Allowed values are: ACCEPTED, IN_PROGRESS, FAILED, SUCCEEDED, CANCELING, CANCELED
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::WorkRequestSummaryCollection WorkRequestSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      if opts[:work_request_status] && !%w[ACCEPTED IN_PROGRESS FAILED SUCCEEDED CANCELING CANCELED].include?(opts[:work_request_status])
        raise 'Invalid value for "work_request_status", must be one of ACCEPTED, IN_PROGRESS, FAILED, SUCCEEDED, CANCELING, CANCELED.'
      end

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceId] = opts[:resource_id] if opts[:resource_id]
      query_params[:workRequestStatus] = opts[:work_request_status] if opts[:work_request_status]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::WorkRequestSummaryCollection'
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


    # Updates a connection under a data asset.
    # @param [String] registry_id The registry Ocid.
    # @param [String] connection_key The connection key.
    # @param [OCI::DataConnectivity::Models::UpdateConnectionDetails] update_connection_details The information needed to update a connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::Connection Connection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/update_connection.rb.html) to see an example of how to use update_connection API.
    def update_connection(registry_id, connection_key, update_connection_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#update_connection.' if logger

      raise "Missing the required parameter 'registry_id' when calling update_connection." if registry_id.nil?
      raise "Missing the required parameter 'connection_key' when calling update_connection." if connection_key.nil?
      raise "Missing the required parameter 'update_connection_details' when calling update_connection." if update_connection_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)

      path = '/registries/{registryId}/connections/{connectionKey}'.sub('{registryId}', registry_id.to_s).sub('{connectionKey}', connection_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#update_connection') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::Connection'
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


    # Updates a specific data asset with default connection.
    # @param [String] registry_id The registry Ocid.
    # @param [String] data_asset_key The data asset key.
    # @param [OCI::DataConnectivity::Models::UpdateDataAssetDetails] update_data_asset_details The information needed to update a data asset.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::DataAsset DataAsset}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/update_data_asset.rb.html) to see an example of how to use update_data_asset API.
    def update_data_asset(registry_id, data_asset_key, update_data_asset_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#update_data_asset.' if logger

      raise "Missing the required parameter 'registry_id' when calling update_data_asset." if registry_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling update_data_asset." if data_asset_key.nil?
      raise "Missing the required parameter 'update_data_asset_details' when calling update_data_asset." if update_data_asset_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/registries/{registryId}/dataAssets/{dataAssetKey}'.sub('{registryId}', registry_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_data_asset_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#update_data_asset') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::DataAsset'
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


    # Updates the Data Connectivity Management Endpoint
    # @param [String] endpoint_id DCMS Endpoint id
    # @param [OCI::DataConnectivity::Models::UpdateEndpointDetails] update_endpoint_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :registry_id DCMS registry id
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::Endpoint Endpoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/update_endpoint.rb.html) to see an example of how to use update_endpoint API.
    def update_endpoint(endpoint_id, update_endpoint_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#update_endpoint.' if logger

      raise "Missing the required parameter 'endpoint_id' when calling update_endpoint." if endpoint_id.nil?
      raise "Missing the required parameter 'update_endpoint_details' when calling update_endpoint." if update_endpoint_details.nil?
      raise "Parameter value for 'endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(endpoint_id)

      path = '/endpoints/{endpointId}'.sub('{endpointId}', endpoint_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:registryId] = opts[:registry_id] if opts[:registry_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#update_endpoint') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::Endpoint'
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


    # Updates a folder under a specefied registry.
    # @param [String] registry_id The registry Ocid.
    # @param [String] folder_key The folder ID.
    # @param [OCI::DataConnectivity::Models::UpdateFolderDetails] update_folder_details The information needed to update a folder.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::Folder Folder}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/update_folder.rb.html) to see an example of how to use update_folder API.
    def update_folder(registry_id, folder_key, update_folder_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#update_folder.' if logger

      raise "Missing the required parameter 'registry_id' when calling update_folder." if registry_id.nil?
      raise "Missing the required parameter 'folder_key' when calling update_folder." if folder_key.nil?
      raise "Missing the required parameter 'update_folder_details' when calling update_folder." if update_folder_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)
      raise "Parameter value for 'folder_key' must not be blank" if OCI::Internal::Util.blank_string?(folder_key)

      path = '/registries/{registryId}/folders/{folderKey}'.sub('{registryId}', registry_id.to_s).sub('{folderKey}', folder_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_folder_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#update_folder') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::Folder'
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


    # Updates the Data Connectivity Management Registry
    # @param [String] registry_id The registry Ocid.
    # @param [OCI::DataConnectivity::Models::UpdateRegistryDetails] update_registry_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataConnectivity::Models::Registry Registry}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/update_registry.rb.html) to see an example of how to use update_registry API.
    def update_registry(registry_id, update_registry_details, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#update_registry.' if logger

      raise "Missing the required parameter 'registry_id' when calling update_registry." if registry_id.nil?
      raise "Missing the required parameter 'update_registry_details' when calling update_registry." if update_registry_details.nil?
      raise "Parameter value for 'registry_id' must not be blank" if OCI::Internal::Util.blank_string?(registry_id)

      path = '/registries/{registryId}'.sub('{registryId}', registry_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_registry_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#update_registry') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataConnectivity::Models::Registry'
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


    # Validates the dataAsset network Reachability.
    #
    # @param [String] endpoint_id DCMS Endpoint id
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :registry_id DCMS registry id
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/dataconnectivity/validate_data_asset_network_reachablity.rb.html) to see an example of how to use validate_data_asset_network_reachablity API.
    def validate_data_asset_network_reachablity(endpoint_id, opts = {})
      logger.debug 'Calling operation DataConnectivityManagementClient#validate_data_asset_network_reachablity.' if logger

      raise "Missing the required parameter 'endpoint_id' when calling validate_data_asset_network_reachablity." if endpoint_id.nil?
      raise "Parameter value for 'endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(endpoint_id)

      path = '/endpoints/{endpointId}/actions/validateDataAssetNetworkReachablity'.sub('{endpointId}', endpoint_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:registryId] = opts[:registry_id] if opts[:registry_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataConnectivityManagementClient#validate_data_asset_network_reachablity') do
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

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)

      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
