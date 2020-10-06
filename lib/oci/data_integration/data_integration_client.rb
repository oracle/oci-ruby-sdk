# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Data Integration Service APIs to perform common extract, load, and transform (ETL) tasks.
  class DataIntegration::DataIntegrationClient
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


    # Creates a new DataIntegrationClient.
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
        @endpoint = endpoint + '/20200430'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "DataIntegrationClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://dataintegration.{region}.oci.{secondLevelDomain}') + '/20200430'
      logger.info "DataIntegrationClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a workspace to a specified compartment.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [OCI::DataIntegration::Models::ChangeCompartmentDetails] change_compartment_details The information needed to move a workspace to a specified compartment.
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
    def change_compartment(workspace_id, change_compartment_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#change_compartment.' if logger

      raise "Missing the required parameter 'workspace_id' when calling change_compartment." if workspace_id.nil?
      raise "Missing the required parameter 'change_compartment_details' when calling change_compartment." if change_compartment_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/actions/changeCompartment'.sub('{workspaceId}', workspace_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#change_compartment') do
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


    # Creates an application.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [OCI::DataIntegration::Models::CreateApplicationDetails] create_application_details The details needed to create an application.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Application Application}
    def create_application(workspace_id, create_application_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_application.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_application." if workspace_id.nil?
      raise "Missing the required parameter 'create_application_details' when calling create_application." if create_application_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/applications'.sub('{workspaceId}', workspace_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_application_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_application') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Application'
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
    # @param [String] workspace_id The workspace ID.
    # @param [OCI::DataIntegration::Models::CreateConnectionDetails] create_connection_details The information needed to create a connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Connection Connection}
    def create_connection(workspace_id, create_connection_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_connection.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_connection." if workspace_id.nil?
      raise "Missing the required parameter 'create_connection_details' when calling create_connection." if create_connection_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/connections'.sub('{workspaceId}', workspace_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_connection') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Connection'
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
    # @param [String] workspace_id The workspace ID.
    # @param [OCI::DataIntegration::Models::CreateConnectionValidationDetails] create_connection_validation_details The information needed to validate a connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ConnectionValidation ConnectionValidation}
    def create_connection_validation(workspace_id, create_connection_validation_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_connection_validation.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_connection_validation." if workspace_id.nil?
      raise "Missing the required parameter 'create_connection_validation_details' when calling create_connection_validation." if create_connection_validation_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/connectionValidations'.sub('{workspaceId}', workspace_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_connection_validation_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_connection_validation') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ConnectionValidation'
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
    # @param [String] workspace_id The workspace ID.
    # @param [OCI::DataIntegration::Models::CreateDataAssetDetails] create_data_asset_details The information needed to create a data asset.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DataAsset DataAsset}
    def create_data_asset(workspace_id, create_data_asset_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_data_asset.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_data_asset." if workspace_id.nil?
      raise "Missing the required parameter 'create_data_asset_details' when calling create_data_asset." if create_data_asset_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/dataAssets'.sub('{workspaceId}', workspace_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_data_asset') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DataAsset'
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


    # Creates a new data flow in a project or folder ready for performing data integrations.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [OCI::DataIntegration::Models::CreateDataFlowDetails] create_data_flow_details The details needed to create a new data flow.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DataFlow DataFlow}
    def create_data_flow(workspace_id, create_data_flow_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_data_flow.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_data_flow." if workspace_id.nil?
      raise "Missing the required parameter 'create_data_flow_details' when calling create_data_flow." if create_data_flow_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/dataFlows'.sub('{workspaceId}', workspace_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_data_flow_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_data_flow') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DataFlow'
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


    # Accepts the data flow definition in the request payload and creates a data flow validation.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [OCI::DataIntegration::Models::CreateDataFlowValidationDetails] create_data_flow_validation_details The information needed to create the data flow validation for the data flow object.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DataFlowValidation DataFlowValidation}
    def create_data_flow_validation(workspace_id, create_data_flow_validation_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_data_flow_validation.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_data_flow_validation." if workspace_id.nil?
      raise "Missing the required parameter 'create_data_flow_validation_details' when calling create_data_flow_validation." if create_data_flow_validation_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/dataFlowValidations'.sub('{workspaceId}', workspace_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_data_flow_validation_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_data_flow_validation') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DataFlowValidation'
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
    # @param [String] workspace_id The workspace ID.
    # @param [String] connection_key The connection key.
    # @param [String] schema_resource_name The schema resource name used for retrieving schemas.
    # @param [OCI::DataIntegration::Models::CreateEntityShapeDetails] create_entity_shape_details The details needed to create the data entity shape.
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
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::EntityShape EntityShape}
    def create_entity_shape(workspace_id, connection_key, schema_resource_name, create_entity_shape_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_entity_shape.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_entity_shape." if workspace_id.nil?
      raise "Missing the required parameter 'connection_key' when calling create_entity_shape." if connection_key.nil?
      raise "Missing the required parameter 'schema_resource_name' when calling create_entity_shape." if schema_resource_name.nil?
      raise "Missing the required parameter 'create_entity_shape_details' when calling create_entity_shape." if create_entity_shape_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)
      raise "Parameter value for 'schema_resource_name' must not be blank" if OCI::Internal::Util.blank_string?(schema_resource_name)

      path = '/workspaces/{workspaceId}/connections/{connectionKey}/schemas/{schemaResourceName}/entityShapes'.sub('{workspaceId}', workspace_id.to_s).sub('{connectionKey}', connection_key.to_s).sub('{schemaResourceName}', schema_resource_name.to_s)
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

      post_body = @api_client.object_to_http_body(create_entity_shape_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_entity_shape') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::EntityShape'
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


    # Publish a DataFlow in a OCI DataFlow application.
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_key The task key.
    # @param [OCI::DataIntegration::Models::CreateExternalPublicationDetails] create_external_publication_details Details needed to publish a task to OCI DataFlow application.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ExternalPublication ExternalPublication}
    def create_external_publication(workspace_id, task_key, create_external_publication_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_external_publication.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_external_publication." if workspace_id.nil?
      raise "Missing the required parameter 'task_key' when calling create_external_publication." if task_key.nil?
      raise "Missing the required parameter 'create_external_publication_details' when calling create_external_publication." if create_external_publication_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_key' must not be blank" if OCI::Internal::Util.blank_string?(task_key)

      path = '/workspaces/{workspaceId}/tasks/{taskKey}/externalPublications'.sub('{workspaceId}', workspace_id.to_s).sub('{taskKey}', task_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_external_publication_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_external_publication') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ExternalPublication'
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


    # Validates a specific task.
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_key The task key.
    # @param [OCI::DataIntegration::Models::CreateExternalPublicationValidationDetails] create_external_publication_validation_details The information needed to create a task validation.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ExternalPublicationValidation ExternalPublicationValidation}
    def create_external_publication_validation(workspace_id, task_key, create_external_publication_validation_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_external_publication_validation.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_external_publication_validation." if workspace_id.nil?
      raise "Missing the required parameter 'task_key' when calling create_external_publication_validation." if task_key.nil?
      raise "Missing the required parameter 'create_external_publication_validation_details' when calling create_external_publication_validation." if create_external_publication_validation_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_key' must not be blank" if OCI::Internal::Util.blank_string?(task_key)

      path = '/workspaces/{workspaceId}/tasks/{taskKey}/externalPublicationValidations'.sub('{workspaceId}', workspace_id.to_s).sub('{taskKey}', task_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_external_publication_validation_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_external_publication_validation') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ExternalPublicationValidation'
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


    # Creates a folder in a project or in another folder, limited to two levels of folders. |
    # Folders are used to organize your design-time resources, such as tasks or data flows.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [OCI::DataIntegration::Models::CreateFolderDetails] create_folder_details The details needed to create a folder.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Folder Folder}
    def create_folder(workspace_id, create_folder_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_folder.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_folder." if workspace_id.nil?
      raise "Missing the required parameter 'create_folder_details' when calling create_folder." if create_folder_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/folders'.sub('{workspaceId}', workspace_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_folder_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_folder') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Folder'
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


    # Creates a patch in an application.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [OCI::DataIntegration::Models::CreatePatchDetails] create_patch_details Detailed needed to create a patch in an application.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Patch Patch}
    def create_patch(workspace_id, application_key, create_patch_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_patch.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_patch." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling create_patch." if application_key.nil?
      raise "Missing the required parameter 'create_patch_details' when calling create_patch." if create_patch_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/patches'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_patch_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_patch') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Patch'
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


    # Creates a project. Projects are organizational constructs within a workspace that you use to organize your design-time resources, such as tasks or data flows. Projects can be organized into folders.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [OCI::DataIntegration::Models::CreateProjectDetails] create_project_details The details needed to create a project in a workspace.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Project Project}
    def create_project(workspace_id, create_project_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_project.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_project." if workspace_id.nil?
      raise "Missing the required parameter 'create_project_details' when calling create_project." if create_project_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/projects'.sub('{workspaceId}', workspace_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_project_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_project') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Project'
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


    # Creates a new task ready for performing data integrations. There are specialized types of tasks that include data loader and integration tasks.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [OCI::DataIntegration::Models::CreateTaskDetails] create_task_details The details needed to create a new task.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Task Task}
    def create_task(workspace_id, create_task_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_task.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_task." if workspace_id.nil?
      raise "Missing the required parameter 'create_task_details' when calling create_task." if create_task_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/tasks'.sub('{workspaceId}', workspace_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_task_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_task') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Task'
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


    # Creates a data integration task run for the specified task.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [OCI::DataIntegration::Models::CreateTaskRunDetails] create_task_run_details The details needed to create a task run.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::TaskRun TaskRun}
    def create_task_run(workspace_id, application_key, create_task_run_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_task_run.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_task_run." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling create_task_run." if application_key.nil?
      raise "Missing the required parameter 'create_task_run_details' when calling create_task_run." if create_task_run_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/taskRuns'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s)
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

      post_body = @api_client.object_to_http_body(create_task_run_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_task_run') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::TaskRun'
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


    # Validates a specific task.
    # @param [String] workspace_id The workspace ID.
    # @param [OCI::DataIntegration::Models::CreateTaskValidationDetails] create_task_validation_details The information needed to create a task validation.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::TaskValidation TaskValidation}
    def create_task_validation(workspace_id, create_task_validation_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_task_validation.' if logger

      raise "Missing the required parameter 'workspace_id' when calling create_task_validation." if workspace_id.nil?
      raise "Missing the required parameter 'create_task_validation_details' when calling create_task_validation." if create_task_validation_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/taskValidations'.sub('{workspaceId}', workspace_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_task_validation_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_task_validation') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::TaskValidation'
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


    # Creates a new Data Integration workspace ready for performing data integration tasks.
    #
    # @param [OCI::DataIntegration::Models::CreateWorkspaceDetails] create_workspace_details The information needed to create a new Data Integration workspace.
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
    def create_workspace(create_workspace_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#create_workspace.' if logger

      raise "Missing the required parameter 'create_workspace_details' when calling create_workspace." if create_workspace_details.nil?

      path = '/workspaces'
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

      post_body = @api_client.object_to_http_body(create_workspace_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#create_workspace') do
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


    # Removes an application using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
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
    def delete_application(workspace_id, application_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_application.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_application." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling delete_application." if application_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_application') do
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


    # Removes a connection using the specified identifier.
    # @param [String] workspace_id The workspace ID.
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
    def delete_connection(workspace_id, connection_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_connection.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_connection." if workspace_id.nil?
      raise "Missing the required parameter 'connection_key' when calling delete_connection." if connection_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)

      path = '/workspaces/{workspaceId}/connections/{connectionKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{connectionKey}', connection_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_connection') do
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
    # @param [String] workspace_id The workspace ID.
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
    # @return [Response] A Response object with data of type nil
    def delete_connection_validation(workspace_id, connection_validation_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_connection_validation.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_connection_validation." if workspace_id.nil?
      raise "Missing the required parameter 'connection_validation_key' when calling delete_connection_validation." if connection_validation_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'connection_validation_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_validation_key)

      path = '/workspaces/{workspaceId}/connectionValidations/{connectionValidationKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{connectionValidationKey}', connection_validation_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_connection_validation') do
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
    # @param [String] workspace_id The workspace ID.
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
    def delete_data_asset(workspace_id, data_asset_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_data_asset.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_data_asset." if workspace_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling delete_data_asset." if data_asset_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/workspaces/{workspaceId}/dataAssets/{dataAssetKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_data_asset') do
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


    # Removes a data flow from a project or folder using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] data_flow_key The data flow key.
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
    def delete_data_flow(workspace_id, data_flow_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_data_flow.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_data_flow." if workspace_id.nil?
      raise "Missing the required parameter 'data_flow_key' when calling delete_data_flow." if data_flow_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'data_flow_key' must not be blank" if OCI::Internal::Util.blank_string?(data_flow_key)

      path = '/workspaces/{workspaceId}/dataFlows/{dataFlowKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{dataFlowKey}', data_flow_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_data_flow') do
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


    # Removes a data flow validation using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] data_flow_validation_key The key of the dataflow validation.
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
    def delete_data_flow_validation(workspace_id, data_flow_validation_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_data_flow_validation.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_data_flow_validation." if workspace_id.nil?
      raise "Missing the required parameter 'data_flow_validation_key' when calling delete_data_flow_validation." if data_flow_validation_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'data_flow_validation_key' must not be blank" if OCI::Internal::Util.blank_string?(data_flow_validation_key)

      path = '/workspaces/{workspaceId}/dataFlowValidations/{dataFlowValidationKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{dataFlowValidationKey}', data_flow_validation_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_data_flow_validation') do
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


    # Removes a published object using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_key The task key.
    # @param [String] external_publications_key The external published object key.
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
    def delete_external_publication(workspace_id, task_key, external_publications_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_external_publication.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_external_publication." if workspace_id.nil?
      raise "Missing the required parameter 'task_key' when calling delete_external_publication." if task_key.nil?
      raise "Missing the required parameter 'external_publications_key' when calling delete_external_publication." if external_publications_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_key' must not be blank" if OCI::Internal::Util.blank_string?(task_key)
      raise "Parameter value for 'external_publications_key' must not be blank" if OCI::Internal::Util.blank_string?(external_publications_key)

      path = '/workspaces/{workspaceId}/tasks/{taskKey}/externalPublications/{externalPublicationsKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{taskKey}', task_key.to_s).sub('{externalPublicationsKey}', external_publications_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_external_publication') do
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


    # Removes a task validation using the specified identifier.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_key The task key.
    # @param [String] external_publication_validation_key The external published object key.
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
    def delete_external_publication_validation(workspace_id, task_key, external_publication_validation_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_external_publication_validation.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_external_publication_validation." if workspace_id.nil?
      raise "Missing the required parameter 'task_key' when calling delete_external_publication_validation." if task_key.nil?
      raise "Missing the required parameter 'external_publication_validation_key' when calling delete_external_publication_validation." if external_publication_validation_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_key' must not be blank" if OCI::Internal::Util.blank_string?(task_key)
      raise "Parameter value for 'external_publication_validation_key' must not be blank" if OCI::Internal::Util.blank_string?(external_publication_validation_key)

      path = '/workspaces/{workspaceId}/tasks/{taskKey}/externalPublicationValidations/{externalPublicationValidationKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{taskKey}', task_key.to_s).sub('{externalPublicationValidationKey}', external_publication_validation_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_external_publication_validation') do
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


    # Removes a folder from a project using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] folder_key The folder key.
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
    def delete_folder(workspace_id, folder_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_folder.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_folder." if workspace_id.nil?
      raise "Missing the required parameter 'folder_key' when calling delete_folder." if folder_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'folder_key' must not be blank" if OCI::Internal::Util.blank_string?(folder_key)

      path = '/workspaces/{workspaceId}/folders/{folderKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{folderKey}', folder_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_folder') do
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


    # Removes a patch using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [String] patch_key The patch key.
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
    def delete_patch(workspace_id, application_key, patch_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_patch.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_patch." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling delete_patch." if application_key.nil?
      raise "Missing the required parameter 'patch_key' when calling delete_patch." if patch_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)
      raise "Parameter value for 'patch_key' must not be blank" if OCI::Internal::Util.blank_string?(patch_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/patches/{patchKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s).sub('{patchKey}', patch_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_patch') do
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


    # Removes a project from the workspace using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] project_key The project key.
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
    def delete_project(workspace_id, project_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_project.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_project." if workspace_id.nil?
      raise "Missing the required parameter 'project_key' when calling delete_project." if project_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'project_key' must not be blank" if OCI::Internal::Util.blank_string?(project_key)

      path = '/workspaces/{workspaceId}/projects/{projectKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{projectKey}', project_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_project') do
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


    # Removes a task using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_key The task key.
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
    def delete_task(workspace_id, task_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_task.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_task." if workspace_id.nil?
      raise "Missing the required parameter 'task_key' when calling delete_task." if task_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_key' must not be blank" if OCI::Internal::Util.blank_string?(task_key)

      path = '/workspaces/{workspaceId}/tasks/{taskKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{taskKey}', task_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_task') do
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


    # Deletes a task run using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [String] task_run_key The task run key.
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
    def delete_task_run(workspace_id, application_key, task_run_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_task_run.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_task_run." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling delete_task_run." if application_key.nil?
      raise "Missing the required parameter 'task_run_key' when calling delete_task_run." if task_run_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)
      raise "Parameter value for 'task_run_key' must not be blank" if OCI::Internal::Util.blank_string?(task_run_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/taskRuns/{taskRunKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s).sub('{taskRunKey}', task_run_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_task_run') do
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


    # Removes a task validation using the specified identifier.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_validation_key The task validation key.
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
    def delete_task_validation(workspace_id, task_validation_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_task_validation.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_task_validation." if workspace_id.nil?
      raise "Missing the required parameter 'task_validation_key' when calling delete_task_validation." if task_validation_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_validation_key' must not be blank" if OCI::Internal::Util.blank_string?(task_validation_key)

      path = '/workspaces/{workspaceId}/taskValidations/{taskValidationKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{taskValidationKey}', task_validation_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_task_validation') do
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


    # Deletes a Data Integration workspace resource using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :quiesce_timeout Used to set the timeout for Data Integration to gracefully close down any running jobs before stopping the workspace. (default to 0)
    # @option opts [BOOLEAN] :is_force_operation Used to force close down the workspace. (default to false)
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the `etag` from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the `etag` you provide matches the resource's current `etag` value.
    #   When 'if-match' is provided and its value does not exactly match the 'etag' of the resource on the server, the request fails with the 412 response code.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    def delete_workspace(workspace_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#delete_workspace.' if logger

      raise "Missing the required parameter 'workspace_id' when calling delete_workspace." if workspace_id.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}'.sub('{workspaceId}', workspace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:quiesceTimeout] = opts[:quiesce_timeout] if opts[:quiesce_timeout]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#delete_workspace') do
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


    # Retrieves an application using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Application Application}
    def get_application(workspace_id, application_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_application.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_application." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling get_application." if application_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_application') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Application'
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
    # @param [String] workspace_id The workspace ID.
    # @param [String] connection_key The connection key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Connection Connection}
    def get_connection(workspace_id, connection_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_connection.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_connection." if workspace_id.nil?
      raise "Missing the required parameter 'connection_key' when calling get_connection." if connection_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)

      path = '/workspaces/{workspaceId}/connections/{connectionKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{connectionKey}', connection_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_connection') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Connection'
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
    # @param [String] workspace_id The workspace ID.
    # @param [String] connection_validation_key The key of the connection validation.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ConnectionValidation ConnectionValidation}
    def get_connection_validation(workspace_id, connection_validation_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_connection_validation.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_connection_validation." if workspace_id.nil?
      raise "Missing the required parameter 'connection_validation_key' when calling get_connection_validation." if connection_validation_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'connection_validation_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_validation_key)

      path = '/workspaces/{workspaceId}/connectionValidations/{connectionValidationKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{connectionValidationKey}', connection_validation_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_connection_validation') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ConnectionValidation'
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


    # Retrieves statistics on a workspace. It returns an object with an array of property values, such as the number of projects, |
    #        applications, data assets, and so on.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [String] count_statistic_key A unique key of the container object, such as workspace, project, and so on, to count statistics for. The statistics is fetched for the given key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::CountStatistic CountStatistic}
    def get_count_statistic(workspace_id, count_statistic_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_count_statistic.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_count_statistic." if workspace_id.nil?
      raise "Missing the required parameter 'count_statistic_key' when calling get_count_statistic." if count_statistic_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'count_statistic_key' must not be blank" if OCI::Internal::Util.blank_string?(count_statistic_key)

      path = '/workspaces/{workspaceId}/countStatistics/{countStatisticKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{countStatisticKey}', count_statistic_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_count_statistic') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::CountStatistic'
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
    # @param [String] workspace_id The workspace ID.
    # @param [String] data_asset_key The data asset key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DataAsset DataAsset}
    def get_data_asset(workspace_id, data_asset_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_data_asset.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_data_asset." if workspace_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling get_data_asset." if data_asset_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/workspaces/{workspaceId}/dataAssets/{dataAssetKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_data_asset') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DataAsset'
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
    # @param [String] workspace_id The workspace ID.
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
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DataEntity DataEntity}
    def get_data_entity(workspace_id, connection_key, schema_resource_name, data_entity_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_data_entity.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_data_entity." if workspace_id.nil?
      raise "Missing the required parameter 'connection_key' when calling get_data_entity." if connection_key.nil?
      raise "Missing the required parameter 'schema_resource_name' when calling get_data_entity." if schema_resource_name.nil?
      raise "Missing the required parameter 'data_entity_key' when calling get_data_entity." if data_entity_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)
      raise "Parameter value for 'schema_resource_name' must not be blank" if OCI::Internal::Util.blank_string?(schema_resource_name)
      raise "Parameter value for 'data_entity_key' must not be blank" if OCI::Internal::Util.blank_string?(data_entity_key)

      path = '/workspaces/{workspaceId}/connections/{connectionKey}/schemas/{schemaResourceName}/dataEntities/{dataEntityKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{connectionKey}', connection_key.to_s).sub('{schemaResourceName}', schema_resource_name.to_s).sub('{dataEntityKey}', data_entity_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_data_entity') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DataEntity'
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


    # Retrieves a data flow using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] data_flow_key The data flow key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DataFlow DataFlow}
    def get_data_flow(workspace_id, data_flow_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_data_flow.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_data_flow." if workspace_id.nil?
      raise "Missing the required parameter 'data_flow_key' when calling get_data_flow." if data_flow_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'data_flow_key' must not be blank" if OCI::Internal::Util.blank_string?(data_flow_key)

      path = '/workspaces/{workspaceId}/dataFlows/{dataFlowKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{dataFlowKey}', data_flow_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_data_flow') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DataFlow'
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


    # Retrieves a data flow validation using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] data_flow_validation_key The key of the dataflow validation.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DataFlowValidation DataFlowValidation}
    def get_data_flow_validation(workspace_id, data_flow_validation_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_data_flow_validation.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_data_flow_validation." if workspace_id.nil?
      raise "Missing the required parameter 'data_flow_validation_key' when calling get_data_flow_validation." if data_flow_validation_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'data_flow_validation_key' must not be blank" if OCI::Internal::Util.blank_string?(data_flow_validation_key)

      path = '/workspaces/{workspaceId}/dataFlowValidations/{dataFlowValidationKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{dataFlowValidationKey}', data_flow_validation_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_data_flow_validation') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DataFlowValidation'
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


    # Retrieves the details of a dependent object from an application.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [String] dependent_object_key The dependent object key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DependentObject DependentObject}
    def get_dependent_object(workspace_id, application_key, dependent_object_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_dependent_object.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_dependent_object." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling get_dependent_object." if application_key.nil?
      raise "Missing the required parameter 'dependent_object_key' when calling get_dependent_object." if dependent_object_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)
      raise "Parameter value for 'dependent_object_key' must not be blank" if OCI::Internal::Util.blank_string?(dependent_object_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/dependentObjects/{dependentObjectKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s).sub('{dependentObjectKey}', dependent_object_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_dependent_object') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DependentObject'
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


    # Retrieves a publshed object in an task using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_key The task key.
    # @param [String] external_publications_key The external published object key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ExternalPublication ExternalPublication}
    def get_external_publication(workspace_id, task_key, external_publications_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_external_publication.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_external_publication." if workspace_id.nil?
      raise "Missing the required parameter 'task_key' when calling get_external_publication." if task_key.nil?
      raise "Missing the required parameter 'external_publications_key' when calling get_external_publication." if external_publications_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_key' must not be blank" if OCI::Internal::Util.blank_string?(task_key)
      raise "Parameter value for 'external_publications_key' must not be blank" if OCI::Internal::Util.blank_string?(external_publications_key)

      path = '/workspaces/{workspaceId}/tasks/{taskKey}/externalPublications/{externalPublicationsKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{taskKey}', task_key.to_s).sub('{externalPublicationsKey}', external_publications_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_external_publication') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ExternalPublication'
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


    # Retrieves an external publication validation using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_key The task key.
    # @param [String] external_publication_validation_key The external published object key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ExternalPublicationValidation ExternalPublicationValidation}
    def get_external_publication_validation(workspace_id, task_key, external_publication_validation_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_external_publication_validation.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_external_publication_validation." if workspace_id.nil?
      raise "Missing the required parameter 'task_key' when calling get_external_publication_validation." if task_key.nil?
      raise "Missing the required parameter 'external_publication_validation_key' when calling get_external_publication_validation." if external_publication_validation_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_key' must not be blank" if OCI::Internal::Util.blank_string?(task_key)
      raise "Parameter value for 'external_publication_validation_key' must not be blank" if OCI::Internal::Util.blank_string?(external_publication_validation_key)

      path = '/workspaces/{workspaceId}/tasks/{taskKey}/externalPublicationValidations/{externalPublicationValidationKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{taskKey}', task_key.to_s).sub('{externalPublicationValidationKey}', external_publication_validation_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_external_publication_validation') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ExternalPublicationValidation'
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


    # Retrieves a folder using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] folder_key The folder key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Folder Folder}
    def get_folder(workspace_id, folder_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_folder.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_folder." if workspace_id.nil?
      raise "Missing the required parameter 'folder_key' when calling get_folder." if folder_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'folder_key' must not be blank" if OCI::Internal::Util.blank_string?(folder_key)

      path = '/workspaces/{workspaceId}/folders/{folderKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{folderKey}', folder_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_folder') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Folder'
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


    # Retrieves a patch in an application using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [String] patch_key The patch key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Patch Patch}
    def get_patch(workspace_id, application_key, patch_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_patch.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_patch." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling get_patch." if application_key.nil?
      raise "Missing the required parameter 'patch_key' when calling get_patch." if patch_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)
      raise "Parameter value for 'patch_key' must not be blank" if OCI::Internal::Util.blank_string?(patch_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/patches/{patchKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s).sub('{patchKey}', patch_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_patch') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Patch'
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


    # Retrieves a project using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] project_key The project key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Project Project}
    def get_project(workspace_id, project_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_project.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_project." if workspace_id.nil?
      raise "Missing the required parameter 'project_key' when calling get_project." if project_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'project_key' must not be blank" if OCI::Internal::Util.blank_string?(project_key)

      path = '/workspaces/{workspaceId}/projects/{projectKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{projectKey}', project_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_project') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Project'
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


    # Retrieves the details of a published object from an application.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [String] published_object_key The published object key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :expand_references Used to expand references of the object. If value is true, then all referenced objects are expanded. If value is false, then shallow objects are returned in place of references. Default is false. <br><br><B>Example:</B><br> <ul> <li><B>?expandReferences=true</B> returns all objects of type data loader task</li> </ul> (default to false)
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::PublishedObject PublishedObject}
    def get_published_object(workspace_id, application_key, published_object_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_published_object.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_published_object." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling get_published_object." if application_key.nil?
      raise "Missing the required parameter 'published_object_key' when calling get_published_object." if published_object_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)
      raise "Parameter value for 'published_object_key' must not be blank" if OCI::Internal::Util.blank_string?(published_object_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/publishedObjects/{publishedObjectKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s).sub('{publishedObjectKey}', published_object_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:expandReferences] = opts[:expand_references] if opts[:expand_references]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_published_object') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::PublishedObject'
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


    # Retrieves a reference in an application.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [String] reference_key The reference key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Reference Reference}
    def get_reference(workspace_id, application_key, reference_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_reference.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_reference." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling get_reference." if application_key.nil?
      raise "Missing the required parameter 'reference_key' when calling get_reference." if reference_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)
      raise "Parameter value for 'reference_key' must not be blank" if OCI::Internal::Util.blank_string?(reference_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/references/{referenceKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s).sub('{referenceKey}', reference_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_reference') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Reference'
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
    # @param [String] workspace_id The workspace ID.
    # @param [String] connection_key The connection key.
    # @param [String] schema_resource_name The schema resource name used for retrieving schemas.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Schema Schema}
    def get_schema(workspace_id, connection_key, schema_resource_name, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_schema.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_schema." if workspace_id.nil?
      raise "Missing the required parameter 'connection_key' when calling get_schema." if connection_key.nil?
      raise "Missing the required parameter 'schema_resource_name' when calling get_schema." if schema_resource_name.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)
      raise "Parameter value for 'schema_resource_name' must not be blank" if OCI::Internal::Util.blank_string?(schema_resource_name)

      path = '/workspaces/{workspaceId}/connections/{connectionKey}/schemas/{schemaResourceName}'.sub('{workspaceId}', workspace_id.to_s).sub('{connectionKey}', connection_key.to_s).sub('{schemaResourceName}', schema_resource_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_schema') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Schema'
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


    # Retrieves a task using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_key The task key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Task Task}
    def get_task(workspace_id, task_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_task.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_task." if workspace_id.nil?
      raise "Missing the required parameter 'task_key' when calling get_task." if task_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_key' must not be blank" if OCI::Internal::Util.blank_string?(task_key)

      path = '/workspaces/{workspaceId}/tasks/{taskKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{taskKey}', task_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_task') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Task'
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


    # Retrieves a task run using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [String] task_run_key The task run key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::TaskRun TaskRun}
    def get_task_run(workspace_id, application_key, task_run_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_task_run.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_task_run." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling get_task_run." if application_key.nil?
      raise "Missing the required parameter 'task_run_key' when calling get_task_run." if task_run_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)
      raise "Parameter value for 'task_run_key' must not be blank" if OCI::Internal::Util.blank_string?(task_run_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/taskRuns/{taskRunKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s).sub('{taskRunKey}', task_run_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_task_run') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::TaskRun'
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


    # Retrieves a task validation using the specified identifier.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_validation_key The task validation key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::TaskValidation TaskValidation}
    def get_task_validation(workspace_id, task_validation_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_task_validation.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_task_validation." if workspace_id.nil?
      raise "Missing the required parameter 'task_validation_key' when calling get_task_validation." if task_validation_key.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_validation_key' must not be blank" if OCI::Internal::Util.blank_string?(task_validation_key)

      path = '/workspaces/{workspaceId}/taskValidations/{taskValidationKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{taskValidationKey}', task_validation_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_task_validation') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::TaskValidation'
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


    # Retrieves the status of the work request with the given ID.
    # @param [String] work_request_id The ID of the asynchronous work request to retrieve.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::WorkRequest WorkRequest}
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::WorkRequest'
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


    # Retrieves a Data Integration workspace using the specified identifier.
    # @param [String] workspace_id The workspace ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Workspace Workspace}
    def get_workspace(workspace_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#get_workspace.' if logger

      raise "Missing the required parameter 'workspace_id' when calling get_workspace." if workspace_id.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}'.sub('{workspaceId}', workspace_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#get_workspace') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Workspace'
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


    # Retrieves a list of applications and provides options to filter the list.
    # @param [String] workspace_id The workspace ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Array<String>] :identifier Used to filter by the identifier of the published object.
    #    (default to [])
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 20)
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 1)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ApplicationSummaryCollection ApplicationSummaryCollection}
    def list_applications(workspace_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_applications.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_applications." if workspace_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/applications'.sub('{workspaceId}', workspace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:identifier] = OCI::ApiClient.build_collection_params(opts[:identifier], :multi) if opts[:identifier] && !opts[:identifier].empty?
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_applications') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ApplicationSummaryCollection'
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


    # Retrieves a list of connection validations within the specified workspace.
    # @param [String] workspace_id The workspace ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :key Used to filter by the key of the object.
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :identifier Used to filter by the identifier of the object.
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ConnectionValidationSummaryCollection ConnectionValidationSummaryCollection}
    def list_connection_validations(workspace_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_connection_validations.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_connection_validations." if workspace_id.nil?

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/connectionValidations'.sub('{workspaceId}', workspace_id.to_s)
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

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_connection_validations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ConnectionValidationSummaryCollection'
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
    # @param [String] workspace_id The workspace ID.
    # @param [String] data_asset_key Used to filter by the data asset key of the object.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :type Type of the object to filter the results with.
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ConnectionSummaryCollection ConnectionSummaryCollection}
    def list_connections(workspace_id, data_asset_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_connections.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_connections." if workspace_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling list_connections." if data_asset_key.nil?

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/connections'.sub('{workspaceId}', workspace_id.to_s)
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

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_connections') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ConnectionSummaryCollection'
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
    # @param [String] workspace_id The workspace ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :type Type of the object to filter the results with.
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DataAssetSummaryCollection DataAssetSummaryCollection}
    def list_data_assets(workspace_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_data_assets.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_data_assets." if workspace_id.nil?

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/dataAssets'.sub('{workspaceId}', workspace_id.to_s)
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

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_data_assets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DataAssetSummaryCollection'
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
    # @param [String] workspace_id The workspace ID.
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
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DataEntitySummaryCollection DataEntitySummaryCollection}
    def list_data_entities(workspace_id, connection_key, schema_resource_name, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_data_entities.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_data_entities." if workspace_id.nil?
      raise "Missing the required parameter 'connection_key' when calling list_data_entities." if connection_key.nil?
      raise "Missing the required parameter 'schema_resource_name' when calling list_data_entities." if schema_resource_name.nil?

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)
      raise "Parameter value for 'schema_resource_name' must not be blank" if OCI::Internal::Util.blank_string?(schema_resource_name)

      path = '/workspaces/{workspaceId}/connections/{connectionKey}/schemas/{schemaResourceName}/dataEntities'.sub('{workspaceId}', workspace_id.to_s).sub('{connectionKey}', connection_key.to_s).sub('{schemaResourceName}', schema_resource_name.to_s)
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

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_data_entities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DataEntitySummaryCollection'
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


    # Retrieves a list of data flow validations within the specified workspace.
    # @param [String] workspace_id The workspace ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :key Used to filter by the key of the object.
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :identifier Used to filter by the identifier of the object.
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DataFlowValidationSummaryCollection DataFlowValidationSummaryCollection}
    def list_data_flow_validations(workspace_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_data_flow_validations.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_data_flow_validations." if workspace_id.nil?

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/dataFlowValidations'.sub('{workspaceId}', workspace_id.to_s)
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

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_data_flow_validations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DataFlowValidationSummaryCollection'
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


    # Retrieves a list of data flows in a project or folder.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :folder_id Unique key of the folder.
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Array<String>] :identifier Used to filter by the identifier of the object. (default to [])
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DataFlowSummaryCollection DataFlowSummaryCollection}
    def list_data_flows(workspace_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_data_flows.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_data_flows." if workspace_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/dataFlows'.sub('{workspaceId}', workspace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:folderId] = opts[:folder_id] if opts[:folder_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:identifier] = OCI::ApiClient.build_collection_params(opts[:identifier], :multi) if opts[:identifier] && !opts[:identifier].empty?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_data_flows') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DataFlowSummaryCollection'
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


    # Retrieves a list of all dependent objects for a specific application.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Array<String>] :identifier Used to filter by the identifier of the published object.
    #    (default to [])
    # @option opts [Array<String>] :type Used to filter by the object type of the object.
    #   It can be suffixed with an optional filter operator InSubtree.
    #   For Data Integration APIs, a filter based on type Task is used.
    #    (default to [])
    # @option opts [String] :type_in_subtree Used in association with type parameter. If value is true,
    #   then type all sub types of the given type parameter is considered.
    #   If value is false, then sub types are not considered. Default is false.
    #    (default to [])
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 20)
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 1)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DependentObjectSummaryCollection DependentObjectSummaryCollection}
    def list_dependent_objects(workspace_id, application_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_dependent_objects.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_dependent_objects." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling list_dependent_objects." if application_key.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/dependentObjects'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:identifier] = OCI::ApiClient.build_collection_params(opts[:identifier], :multi) if opts[:identifier] && !opts[:identifier].empty?
      query_params[:type] = OCI::ApiClient.build_collection_params(opts[:type], :multi) if opts[:type] && !opts[:type].empty?
      query_params[:typeInSubtree] = opts[:type_in_subtree] if opts[:type_in_subtree]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_dependent_objects') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DependentObjectSummaryCollection'
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


    # Retrieves a lists of external publication validations in a workspace and provides options to filter the list.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_key The task key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Array<String>] :identifier Used to filter by the identifier of the object. (default to [])
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ExternalPublicationValidationSummaryCollection ExternalPublicationValidationSummaryCollection}
    def list_external_publication_validations(workspace_id, task_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_external_publication_validations.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_external_publication_validations." if workspace_id.nil?
      raise "Missing the required parameter 'task_key' when calling list_external_publication_validations." if task_key.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_key' must not be blank" if OCI::Internal::Util.blank_string?(task_key)

      path = '/workspaces/{workspaceId}/tasks/{taskKey}/externalPublicationValidations'.sub('{workspaceId}', workspace_id.to_s).sub('{taskKey}', task_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:identifier] = OCI::ApiClient.build_collection_params(opts[:identifier], :multi) if opts[:identifier] && !opts[:identifier].empty?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_external_publication_validations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ExternalPublicationValidationSummaryCollection'
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


    # Retrieves a list of external publications in an application and provides options to filter the list.
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_key The task key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 1)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ExternalPublicationSummaryCollection ExternalPublicationSummaryCollection}
    def list_external_publications(workspace_id, task_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_external_publications.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_external_publications." if workspace_id.nil?
      raise "Missing the required parameter 'task_key' when calling list_external_publications." if task_key.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_key' must not be blank" if OCI::Internal::Util.blank_string?(task_key)

      path = '/workspaces/{workspaceId}/tasks/{taskKey}/externalPublications'.sub('{workspaceId}', workspace_id.to_s).sub('{taskKey}', task_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_external_publications') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ExternalPublicationSummaryCollection'
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


    # Retrieves a list of folders in a project and provides options to filter the list.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :aggregator_key Used to filter by the project or the folder object.
    #
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Array<String>] :identifier Used to filter by the identifier of the object. (default to [])
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::FolderSummaryCollection FolderSummaryCollection}
    def list_folders(workspace_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_folders.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_folders." if workspace_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/folders'.sub('{workspaceId}', workspace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:aggregatorKey] = opts[:aggregator_key] if opts[:aggregator_key]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:identifier] = OCI::ApiClient.build_collection_params(opts[:identifier], :multi) if opts[:identifier] && !opts[:identifier].empty?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_folders') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::FolderSummaryCollection'
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


    # Retrieves a list of patches in an application and provides options to filter the list.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :since_patch Specifies the patch key to query from.
    # @option opts [String] :to_patch Specifies the patch key to query to.
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 1)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::PatchChangeSummaryCollection PatchChangeSummaryCollection}
    def list_patch_changes(workspace_id, application_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_patch_changes.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_patch_changes." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling list_patch_changes." if application_key.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/patchChanges'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sincePatch] = opts[:since_patch] if opts[:since_patch]
      query_params[:toPatch] = opts[:to_patch] if opts[:to_patch]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_patch_changes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::PatchChangeSummaryCollection'
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


    # Retrieves a list of patches in an application and provides options to filter the list. For listing changes based on a period and logical objects changed, see ListPatchChanges API.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Array<String>] :identifier Used to filter by the identifier of the published object.
    #    (default to [])
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 20)
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 1)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::PatchSummaryCollection PatchSummaryCollection}
    def list_patches(workspace_id, application_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_patches.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_patches." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling list_patches." if application_key.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/patches'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:identifier] = OCI::ApiClient.build_collection_params(opts[:identifier], :multi) if opts[:identifier] && !opts[:identifier].empty?
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_patches') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::PatchSummaryCollection'
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


    # Retrieves a lists of projects in a workspace and provides options to filter the list.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Array<String>] :identifier Used to filter by the identifier of the object. (default to [])
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ProjectSummaryCollection ProjectSummaryCollection}
    def list_projects(workspace_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_projects.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_projects." if workspace_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/projects'.sub('{workspaceId}', workspace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:identifier] = OCI::ApiClient.build_collection_params(opts[:identifier], :multi) if opts[:identifier] && !opts[:identifier].empty?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_projects') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ProjectSummaryCollection'
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


    # Retrieves a list of all the published objects for a specified application.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Array<String>] :identifier Used to filter by the identifier of the published object.
    #    (default to [])
    # @option opts [Array<String>] :type Used to filter by the object type of the object.
    #   It can be suffixed with an optional filter operator InSubtree.
    #   For Data Integration APIs, a filter based on type Task is used.
    #    (default to [])
    # @option opts [String] :type_in_subtree Used in association with type parameter. If value is true,
    #   then type all sub types of the given type parameter is considered.
    #   If value is false, then sub types are not considered. Default is false.
    #    (default to [])
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 20)
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 1)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::PublishedObjectSummaryCollection PublishedObjectSummaryCollection}
    def list_published_objects(workspace_id, application_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_published_objects.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_published_objects." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling list_published_objects." if application_key.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/publishedObjects'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:identifier] = OCI::ApiClient.build_collection_params(opts[:identifier], :multi) if opts[:identifier] && !opts[:identifier].empty?
      query_params[:type] = OCI::ApiClient.build_collection_params(opts[:type], :multi) if opts[:type] && !opts[:type].empty?
      query_params[:typeInSubtree] = opts[:type_in_subtree] if opts[:type_in_subtree]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_published_objects') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::PublishedObjectSummaryCollection'
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


    # Retrieves a list of references in an application. Reference objects are created when dataflows and tasks use objects, such as data assets and connections.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ReferenceSummaryCollection ReferenceSummaryCollection}
    def list_references(workspace_id, application_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_references.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_references." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling list_references." if application_key.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/references'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_references') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ReferenceSummaryCollection'
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
    # @param [String] workspace_id The workspace ID.
    # @param [String] connection_key The connection key.
    # @param [String] schema_resource_name Schema resource name used for retrieving schemas.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::SchemaSummaryCollection SchemaSummaryCollection}
    def list_schemas(workspace_id, connection_key, schema_resource_name, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_schemas.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_schemas." if workspace_id.nil?
      raise "Missing the required parameter 'connection_key' when calling list_schemas." if connection_key.nil?
      raise "Missing the required parameter 'schema_resource_name' when calling list_schemas." if schema_resource_name.nil?

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)

      path = '/workspaces/{workspaceId}/connections/{connectionKey}/schemas'.sub('{workspaceId}', workspace_id.to_s).sub('{connectionKey}', connection_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:schemaResourceName] = schema_resource_name
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_schemas') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::SchemaSummaryCollection'
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


    # Gets log entries for task runs using its key.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [String] task_run_key The task run key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @return [Response] A Response object with data of type Array<{OCI::DataIntegration::Models::TaskRunLogSummary TaskRunLogSummary}>
    def list_task_run_logs(workspace_id, application_key, task_run_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_task_run_logs.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_task_run_logs." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling list_task_run_logs." if application_key.nil?
      raise "Missing the required parameter 'task_run_key' when calling list_task_run_logs." if task_run_key.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)
      raise "Parameter value for 'task_run_key' must not be blank" if OCI::Internal::Util.blank_string?(task_run_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/taskRuns/{taskRunKey}/logs'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s).sub('{taskRunKey}', task_run_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_task_run_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataIntegration::Models::TaskRunLogSummary>'
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


    # Retrieves a list of task runs and provides options to filter the list.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Array<String>] :identifier Used to filter by the identifier of the object. (default to [])
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::TaskRunSummaryCollection TaskRunSummaryCollection}
    def list_task_runs(workspace_id, application_key, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_task_runs.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_task_runs." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling list_task_runs." if application_key.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/taskRuns'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:identifier] = OCI::ApiClient.build_collection_params(opts[:identifier], :multi) if opts[:identifier] && !opts[:identifier].empty?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_task_runs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::TaskRunSummaryCollection'
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


    # Retrieves a list of task validations within the specified workspace.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :key Used to filter by the key of the object.
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [String] :identifier Used to filter by the identifier of the object.
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::TaskValidationSummaryCollection TaskValidationSummaryCollection}
    def list_task_validations(workspace_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_task_validations.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_task_validations." if workspace_id.nil?

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/taskValidations'.sub('{workspaceId}', workspace_id.to_s)
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

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_task_validations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::TaskValidationSummaryCollection'
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


    # Retrieves a list of all tasks in a specified project or folder.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :folder_id Unique key of the folder.
    # @option opts [Array<String>] :fields Specifies the fields to get for an object. (default to [])
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Array<String>] :key Used to filter by the key of the object. (default to [])
    # @option opts [Array<String>] :identifier Used to filter by the identifier of the object. (default to [])
    # @option opts [Array<String>] :type Used to filter by the object type of the object. It can be suffixed with an optional filter operator InSubtree. If this operator is not specified, then exact match is considered. <br><br><B>Examples:</B><br> <ul> <li><B>?type=DATA_LOADER_TASK&typeInSubtree=false</B> returns all objects of type data loader task</li> <li><B>?type=DATA_LOADER_TASK</B> returns all objects of type data loader task</li> <li><B>?type=DATA_LOADER_TASK&typeInSubtree=true</B> returns all objects of type data loader task</li> </ul> (default to [])
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::TaskSummaryCollection TaskSummaryCollection}
    def list_tasks(workspace_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_tasks.' if logger

      raise "Missing the required parameter 'workspace_id' when calling list_tasks." if workspace_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/tasks'.sub('{workspaceId}', workspace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:folderId] = opts[:folder_id] if opts[:folder_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :multi) if opts[:fields] && !opts[:fields].empty?
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:key] = OCI::ApiClient.build_collection_params(opts[:key], :multi) if opts[:key] && !opts[:key].empty?
      query_params[:identifier] = OCI::ApiClient.build_collection_params(opts[:identifier], :multi) if opts[:identifier] && !opts[:identifier].empty?
      query_params[:type] = OCI::ApiClient.build_collection_params(opts[:type], :multi) if opts[:type] && !opts[:type].empty?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_tasks') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::TaskSummaryCollection'
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


    # Retrieves a paginated list of errors for a given work request.
    #
    # @param [String] work_request_id The ID of the asynchronous work request to retrieve.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @return [Response] A Response object with data of type Array<{OCI::DataIntegration::Models::WorkRequestError WorkRequestError}>
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/workRequestErrors'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataIntegration::Models::WorkRequestError>'
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


    # Retrieves a paginated list of logs for a given work request.
    #
    # @param [String] work_request_id The ID of the asynchronous work request to retrieve.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @return [Response] A Response object with data of type Array<{OCI::DataIntegration::Models::WorkRequestLogEntry WorkRequestLogEntry}>
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/logs'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataIntegration::Models::WorkRequestLogEntry>'
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
    # @option opts [String] :work_request_status The work request status.
    #   Allowed values are: ACCEPTED, IN_PROGRESS, FAILED, SUCCEEDED, CANCELING, CANCELED
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @return [Response] A Response object with data of type Array<{OCI::DataIntegration::Models::WorkRequestSummary WorkRequestSummary}>
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      if opts[:work_request_status] && !%w[ACCEPTED IN_PROGRESS FAILED SUCCEEDED CANCELING CANCELED].include?(opts[:work_request_status])
        raise 'Invalid value for "work_request_status", must be one of ACCEPTED, IN_PROGRESS, FAILED, SUCCEEDED, CANCELING, CANCELED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:workRequestStatus] = opts[:work_request_status] if opts[:work_request_status]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataIntegration::Models::WorkRequestSummary>'
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


    # Retrieves a list of Data Integration workspaces.
    #
    # @param [String] compartment_id The OCID of the compartment containing the resources you want to list.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Used to filter by the name of the object.
    # @option opts [Integer] :limit Sets the maximum number of results per page, or items to return in a paginated `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine). (default to 100)
    # @option opts [String] :page For list pagination. The value for this parameter is the `opc-next-page` or the `opc-prev-page` response header from the previous `List` call. See [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :lifecycle_state The lifecycle state of a resource. When specified, the operation only returns resources that match the given lifecycle state. When not specified, all lifecycle states are processed as a match.
    # @option opts [String] :sort_order Specifies sort order to use, either `ASC` (ascending) or `DESC` (descending). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order. Sorting related parameters are ignored when parameter `query` is present (search operation and sorting order is by relevance score in descending order). (default to TIME_CREATED)
    #   Allowed values are: TIME_CREATED, DISPLAY_NAME
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If
    #   you need to contact Oracle about a particular request,
    #   please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::DataIntegration::Models::WorkspaceSummary WorkspaceSummary}>
    def list_workspaces(compartment_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#list_workspaces.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_workspaces." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DataIntegration::Models::Workspace::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataIntegration::Models::Workspace::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIME_CREATED DISPLAY_NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_CREATED, DISPLAY_NAME.'
      end

      path = '/workspaces'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#list_workspaces') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataIntegration::Models::WorkspaceSummary>'
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


    # Starts a workspace.
    #
    # @param [String] workspace_id The workspace ID.
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
    def start_workspace(workspace_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#start_workspace.' if logger

      raise "Missing the required parameter 'workspace_id' when calling start_workspace." if workspace_id.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/actions/start'.sub('{workspaceId}', workspace_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#start_workspace') do
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


    # Stops a workspace.
    #
    # @param [String] workspace_id The workspace ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :quiesce_timeout Used to set the timeout for Data Integration to gracefully close down any running jobs before stopping the workspace. (default to 0)
    # @option opts [BOOLEAN] :is_force_operation Used to force close down the workspace. (default to false)
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
    def stop_workspace(workspace_id, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#stop_workspace.' if logger

      raise "Missing the required parameter 'workspace_id' when calling stop_workspace." if workspace_id.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}/actions/stop'.sub('{workspaceId}', workspace_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:quiesceTimeout] = opts[:quiesce_timeout] if opts[:quiesce_timeout]
      query_params[:isForceOperation] = opts[:is_force_operation] if !opts[:is_force_operation].nil?

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#stop_workspace') do
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


    # Updates an application.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [OCI::DataIntegration::Models::UpdateApplicationDetails] update_application_details The details needed to update an application.
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
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Application Application}
    def update_application(workspace_id, application_key, update_application_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#update_application.' if logger

      raise "Missing the required parameter 'workspace_id' when calling update_application." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling update_application." if application_key.nil?
      raise "Missing the required parameter 'update_application_details' when calling update_application." if update_application_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_application_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#update_application') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Application'
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
    # @param [String] workspace_id The workspace ID.
    # @param [String] connection_key The connection key.
    # @param [OCI::DataIntegration::Models::UpdateConnectionDetails] update_connection_details The information needed to update a connection.
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
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Connection Connection}
    def update_connection(workspace_id, connection_key, update_connection_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#update_connection.' if logger

      raise "Missing the required parameter 'workspace_id' when calling update_connection." if workspace_id.nil?
      raise "Missing the required parameter 'connection_key' when calling update_connection." if connection_key.nil?
      raise "Missing the required parameter 'update_connection_details' when calling update_connection." if update_connection_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'connection_key' must not be blank" if OCI::Internal::Util.blank_string?(connection_key)

      path = '/workspaces/{workspaceId}/connections/{connectionKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{connectionKey}', connection_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#update_connection') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Connection'
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
    # @param [String] workspace_id The workspace ID.
    # @param [String] data_asset_key The data asset key.
    # @param [OCI::DataIntegration::Models::UpdateDataAssetDetails] update_data_asset_details The information needed to update a data asset.
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
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DataAsset DataAsset}
    def update_data_asset(workspace_id, data_asset_key, update_data_asset_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#update_data_asset.' if logger

      raise "Missing the required parameter 'workspace_id' when calling update_data_asset." if workspace_id.nil?
      raise "Missing the required parameter 'data_asset_key' when calling update_data_asset." if data_asset_key.nil?
      raise "Missing the required parameter 'update_data_asset_details' when calling update_data_asset." if update_data_asset_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'data_asset_key' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_key)

      path = '/workspaces/{workspaceId}/dataAssets/{dataAssetKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{dataAssetKey}', data_asset_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#update_data_asset') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DataAsset'
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


    # Updates a specific data flow.
    # @param [String] workspace_id The workspace ID.
    # @param [String] data_flow_key The data flow key.
    # @param [OCI::DataIntegration::Models::UpdateDataFlowDetails] update_data_flow_details The details needed to updated a data flow.
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
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::DataFlow DataFlow}
    def update_data_flow(workspace_id, data_flow_key, update_data_flow_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#update_data_flow.' if logger

      raise "Missing the required parameter 'workspace_id' when calling update_data_flow." if workspace_id.nil?
      raise "Missing the required parameter 'data_flow_key' when calling update_data_flow." if data_flow_key.nil?
      raise "Missing the required parameter 'update_data_flow_details' when calling update_data_flow." if update_data_flow_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'data_flow_key' must not be blank" if OCI::Internal::Util.blank_string?(data_flow_key)

      path = '/workspaces/{workspaceId}/dataFlows/{dataFlowKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{dataFlowKey}', data_flow_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_data_flow_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#update_data_flow') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::DataFlow'
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


    # Updates the external publication object.
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_key The task key.
    # @param [String] external_publications_key The external published object key.
    # @param [OCI::DataIntegration::Models::UpdateExternalPublicationDetails] update_external_publication_details The information to be updated.
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
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::ExternalPublication ExternalPublication}
    def update_external_publication(workspace_id, task_key, external_publications_key, update_external_publication_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#update_external_publication.' if logger

      raise "Missing the required parameter 'workspace_id' when calling update_external_publication." if workspace_id.nil?
      raise "Missing the required parameter 'task_key' when calling update_external_publication." if task_key.nil?
      raise "Missing the required parameter 'external_publications_key' when calling update_external_publication." if external_publications_key.nil?
      raise "Missing the required parameter 'update_external_publication_details' when calling update_external_publication." if update_external_publication_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_key' must not be blank" if OCI::Internal::Util.blank_string?(task_key)
      raise "Parameter value for 'external_publications_key' must not be blank" if OCI::Internal::Util.blank_string?(external_publications_key)

      path = '/workspaces/{workspaceId}/tasks/{taskKey}/externalPublications/{externalPublicationsKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{taskKey}', task_key.to_s).sub('{externalPublicationsKey}', external_publications_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_external_publication_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#update_external_publication') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::ExternalPublication'
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


    # Updates a specific folder.
    # @param [String] workspace_id The workspace ID.
    # @param [String] folder_key The folder key.
    # @param [OCI::DataIntegration::Models::UpdateFolderDetails] update_folder_details The details needed to update a folder.
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
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Folder Folder}
    def update_folder(workspace_id, folder_key, update_folder_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#update_folder.' if logger

      raise "Missing the required parameter 'workspace_id' when calling update_folder." if workspace_id.nil?
      raise "Missing the required parameter 'folder_key' when calling update_folder." if folder_key.nil?
      raise "Missing the required parameter 'update_folder_details' when calling update_folder." if update_folder_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'folder_key' must not be blank" if OCI::Internal::Util.blank_string?(folder_key)

      path = '/workspaces/{workspaceId}/folders/{folderKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{folderKey}', folder_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#update_folder') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Folder'
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


    # Updates a specific project.
    # @param [String] workspace_id The workspace ID.
    # @param [String] project_key The project key.
    # @param [OCI::DataIntegration::Models::UpdateProjectDetails] update_project_details The details needed to update a project.
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
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Project Project}
    def update_project(workspace_id, project_key, update_project_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#update_project.' if logger

      raise "Missing the required parameter 'workspace_id' when calling update_project." if workspace_id.nil?
      raise "Missing the required parameter 'project_key' when calling update_project." if project_key.nil?
      raise "Missing the required parameter 'update_project_details' when calling update_project." if update_project_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'project_key' must not be blank" if OCI::Internal::Util.blank_string?(project_key)

      path = '/workspaces/{workspaceId}/projects/{projectKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{projectKey}', project_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_project_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#update_project') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Project'
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


    # Updates the application references. For example, to map a data asset to a different target object.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [String] reference_key The reference key.
    # @param [OCI::DataIntegration::Models::UpdateReferenceDetails] update_reference_details The details needed to update the references.
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
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again.
    #
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Reference Reference}
    def update_reference(workspace_id, application_key, reference_key, update_reference_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#update_reference.' if logger

      raise "Missing the required parameter 'workspace_id' when calling update_reference." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling update_reference." if application_key.nil?
      raise "Missing the required parameter 'reference_key' when calling update_reference." if reference_key.nil?
      raise "Missing the required parameter 'update_reference_details' when calling update_reference." if update_reference_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)
      raise "Parameter value for 'reference_key' must not be blank" if OCI::Internal::Util.blank_string?(reference_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/references/{referenceKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s).sub('{referenceKey}', reference_key.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(update_reference_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#update_reference') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Reference'
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


    # Updates a specific task. For example, you can update the task description or move the task to a different folder by changing the `aggregatorKey` to a different folder in the registry.
    # @param [String] workspace_id The workspace ID.
    # @param [String] task_key The task key.
    # @param [OCI::DataIntegration::Models::UpdateTaskDetails] update_task_details The details needed to update a task.
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
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Task Task}
    def update_task(workspace_id, task_key, update_task_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#update_task.' if logger

      raise "Missing the required parameter 'workspace_id' when calling update_task." if workspace_id.nil?
      raise "Missing the required parameter 'task_key' when calling update_task." if task_key.nil?
      raise "Missing the required parameter 'update_task_details' when calling update_task." if update_task_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'task_key' must not be blank" if OCI::Internal::Util.blank_string?(task_key)

      path = '/workspaces/{workspaceId}/tasks/{taskKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{taskKey}', task_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_task_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#update_task') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Task'
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


    # Updates the status of the task run. For example, aborts a task run.
    # @param [String] workspace_id The workspace ID.
    # @param [String] application_key The application key.
    # @param [String] task_run_key The task run key.
    # @param [OCI::DataIntegration::Models::UpdateTaskRunDetails] update_task_run_details The details needed to update the status of a task run.
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
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::TaskRunDetails TaskRunDetails}
    def update_task_run(workspace_id, application_key, task_run_key, update_task_run_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#update_task_run.' if logger

      raise "Missing the required parameter 'workspace_id' when calling update_task_run." if workspace_id.nil?
      raise "Missing the required parameter 'application_key' when calling update_task_run." if application_key.nil?
      raise "Missing the required parameter 'task_run_key' when calling update_task_run." if task_run_key.nil?
      raise "Missing the required parameter 'update_task_run_details' when calling update_task_run." if update_task_run_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)
      raise "Parameter value for 'application_key' must not be blank" if OCI::Internal::Util.blank_string?(application_key)
      raise "Parameter value for 'task_run_key' must not be blank" if OCI::Internal::Util.blank_string?(task_run_key)

      path = '/workspaces/{workspaceId}/applications/{applicationKey}/taskRuns/{taskRunKey}'.sub('{workspaceId}', workspace_id.to_s).sub('{applicationKey}', application_key.to_s).sub('{taskRunKey}', task_run_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_task_run_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#update_task_run') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::TaskRunDetails'
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


    # Updates the specified Data Integration workspace.
    # @param [String] workspace_id The workspace ID.
    # @param [OCI::DataIntegration::Models::UpdateWorkspaceDetails] update_workspace_details The information needed to update the workspace.
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
    # @return [Response] A Response object with data of type {OCI::DataIntegration::Models::Workspace Workspace}
    def update_workspace(workspace_id, update_workspace_details, opts = {})
      logger.debug 'Calling operation DataIntegrationClient#update_workspace.' if logger

      raise "Missing the required parameter 'workspace_id' when calling update_workspace." if workspace_id.nil?
      raise "Missing the required parameter 'update_workspace_details' when calling update_workspace." if update_workspace_details.nil?
      raise "Parameter value for 'workspace_id' must not be blank" if OCI::Internal::Util.blank_string?(workspace_id)

      path = '/workspaces/{workspaceId}'.sub('{workspaceId}', workspace_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_workspace_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataIntegrationClient#update_workspace') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataIntegration::Models::Workspace'
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
