# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # OCI AI Service solutions can help Enterprise customers integrate AI into their products immediately by using our proven,
  # pre-trained/custom models or containers, and without a need to set up in house team of AI and ML experts.
  # This allows enterprises to focus on business drivers and development work rather than AI/ML operations, shortening the time to market.
  class AiAnomalyDetection::AnomalyDetectionClient
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


    # Creates a new AnomalyDetectionClient.
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
        @endpoint = endpoint + '/20210101'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "AnomalyDetectionClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://anomalydetection.aiservice.{region}.oci.{secondLevelDomain}') + '/20210101'
      logger.info "AnomalyDetectionClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Cancel work request with the given ID.
    # @param [String] work_request_id The ID of the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/cancel_work_request.rb.html) to see an example of how to use cancel_work_request API.
    def cancel_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#cancel_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling cancel_work_request." if work_request_id.nil?
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#cancel_work_request') do
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


    # Moves a resource into a different compartment. When provided, 'If-Match' is checked against 'ETag' values of the resource.
    # @param [String] ai_private_endpoint_id Unique private reverse connection identifier.
    # @param [OCI::AiAnomalyDetection::Models::ChangeAiPrivateEndpointCompartmentDetails] change_ai_private_endpoint_compartment_details Details for the target compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/change_ai_private_endpoint_compartment.rb.html) to see an example of how to use change_ai_private_endpoint_compartment API.
    def change_ai_private_endpoint_compartment(ai_private_endpoint_id, change_ai_private_endpoint_compartment_details, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#change_ai_private_endpoint_compartment.' if logger

      raise "Missing the required parameter 'ai_private_endpoint_id' when calling change_ai_private_endpoint_compartment." if ai_private_endpoint_id.nil?
      raise "Missing the required parameter 'change_ai_private_endpoint_compartment_details' when calling change_ai_private_endpoint_compartment." if change_ai_private_endpoint_compartment_details.nil?
      raise "Parameter value for 'ai_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(ai_private_endpoint_id)

      path = '/aiPrivateEndpoints/{aiPrivateEndpointId}/actions/changeCompartment'.sub('{aiPrivateEndpointId}', ai_private_endpoint_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_ai_private_endpoint_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#change_ai_private_endpoint_compartment') do
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


    # Changing the compartment of a data asset.
    # @param [String] data_asset_id The OCID of the Data Asset.
    # @param [OCI::AiAnomalyDetection::Models::ChangeDataAssetCompartmentDetails] change_data_asset_compartment_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::DataAsset DataAsset}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/change_data_asset_compartment.rb.html) to see an example of how to use change_data_asset_compartment API.
    def change_data_asset_compartment(data_asset_id, change_data_asset_compartment_details, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#change_data_asset_compartment.' if logger

      raise "Missing the required parameter 'data_asset_id' when calling change_data_asset_compartment." if data_asset_id.nil?
      raise "Missing the required parameter 'change_data_asset_compartment_details' when calling change_data_asset_compartment." if change_data_asset_compartment_details.nil?
      raise "Parameter value for 'data_asset_id' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_id)

      path = '/dataAssets/{dataAssetId}/actions/changeCompartment'.sub('{dataAssetId}', data_asset_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_data_asset_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#change_data_asset_compartment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::DataAsset'
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


    # Moves a Model resource from one compartment to another. When provided, If-Match is checked against ETag values of the resource.
    # @param [String] model_id The OCID of the Model.
    # @param [OCI::AiAnomalyDetection::Models::ChangeModelCompartmentDetails] change_model_compartment_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/change_model_compartment.rb.html) to see an example of how to use change_model_compartment API.
    def change_model_compartment(model_id, change_model_compartment_details, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#change_model_compartment.' if logger

      raise "Missing the required parameter 'model_id' when calling change_model_compartment." if model_id.nil?
      raise "Missing the required parameter 'change_model_compartment_details' when calling change_model_compartment." if change_model_compartment_details.nil?
      raise "Parameter value for 'model_id' must not be blank" if OCI::Internal::Util.blank_string?(model_id)

      path = '/models/{modelId}/actions/changeCompartment'.sub('{modelId}', model_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_model_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#change_model_compartment') do
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


    # Moves a Project resource from one compartment to another. When provided, If-Match is checked against ETag values of the resource.
    # @param [String] project_id The OCID of the Project.
    # @param [OCI::AiAnomalyDetection::Models::ChangeProjectCompartmentDetails] change_project_compartment_details The details to change the compartment of the project.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/change_project_compartment.rb.html) to see an example of how to use change_project_compartment API.
    def change_project_compartment(project_id, change_project_compartment_details, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#change_project_compartment.' if logger

      raise "Missing the required parameter 'project_id' when calling change_project_compartment." if project_id.nil?
      raise "Missing the required parameter 'change_project_compartment_details' when calling change_project_compartment." if change_project_compartment_details.nil?
      raise "Parameter value for 'project_id' must not be blank" if OCI::Internal::Util.blank_string?(project_id)

      path = '/projects/{projectId}/actions/changeCompartment'.sub('{projectId}', project_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_project_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#change_project_compartment') do
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


    # Create a new private reverse connection endpoint.
    # @param [OCI::AiAnomalyDetection::Models::CreateAiPrivateEndpointDetails] create_ai_private_endpoint_details The information used to create the private reverse connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/create_ai_private_endpoint.rb.html) to see an example of how to use create_ai_private_endpoint API.
    def create_ai_private_endpoint(create_ai_private_endpoint_details, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#create_ai_private_endpoint.' if logger

      raise "Missing the required parameter 'create_ai_private_endpoint_details' when calling create_ai_private_endpoint." if create_ai_private_endpoint_details.nil?

      path = '/aiPrivateEndpoints'
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

      post_body = @api_client.object_to_http_body(create_ai_private_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#create_ai_private_endpoint') do
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


    # Creates a new DataAsset.
    #
    # @param [OCI::AiAnomalyDetection::Models::CreateDataAssetDetails] create_data_asset_details Details for the new DataAsset.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::DataAsset DataAsset}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/create_data_asset.rb.html) to see an example of how to use create_data_asset API.
    def create_data_asset(create_data_asset_details, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#create_data_asset.' if logger

      raise "Missing the required parameter 'create_data_asset_details' when calling create_data_asset." if create_data_asset_details.nil?

      path = '/dataAssets'
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

      post_body = @api_client.object_to_http_body(create_data_asset_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#create_data_asset') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::DataAsset'
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


    # Creates a new Model.
    #
    # @param [OCI::AiAnomalyDetection::Models::CreateModelDetails] create_model_details Details for the new Model.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::Model Model}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/create_model.rb.html) to see an example of how to use create_model API.
    def create_model(create_model_details, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#create_model.' if logger

      raise "Missing the required parameter 'create_model_details' when calling create_model." if create_model_details.nil?

      path = '/models'
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

      post_body = @api_client.object_to_http_body(create_model_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#create_model') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::Model'
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


    # Creates a new Project.
    #
    # @param [OCI::AiAnomalyDetection::Models::CreateProjectDetails] create_project_details Details for the new Project.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::Project Project}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/create_project.rb.html) to see an example of how to use create_project API.
    def create_project(create_project_details, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#create_project.' if logger

      raise "Missing the required parameter 'create_project_details' when calling create_project." if create_project_details.nil?

      path = '/projects'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#create_project') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::Project'
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


    # Deletes a private reverse connection endpoint by identifier.
    # @param [String] ai_private_endpoint_id Unique private reverse connection identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/delete_ai_private_endpoint.rb.html) to see an example of how to use delete_ai_private_endpoint API.
    def delete_ai_private_endpoint(ai_private_endpoint_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#delete_ai_private_endpoint.' if logger

      raise "Missing the required parameter 'ai_private_endpoint_id' when calling delete_ai_private_endpoint." if ai_private_endpoint_id.nil?
      raise "Parameter value for 'ai_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(ai_private_endpoint_id)

      path = '/aiPrivateEndpoints/{aiPrivateEndpointId}'.sub('{aiPrivateEndpointId}', ai_private_endpoint_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#delete_ai_private_endpoint') do
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


    # Deletes a DataAsset resource by identifier
    # @param [String] data_asset_id The OCID of the Data Asset.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/delete_data_asset.rb.html) to see an example of how to use delete_data_asset API.
    def delete_data_asset(data_asset_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#delete_data_asset.' if logger

      raise "Missing the required parameter 'data_asset_id' when calling delete_data_asset." if data_asset_id.nil?
      raise "Parameter value for 'data_asset_id' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_id)

      path = '/dataAssets/{dataAssetId}'.sub('{dataAssetId}', data_asset_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#delete_data_asset') do
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


    # Deletes an ai model resource by identifier. This operation fails with a 409 error unless all associated resources are in a DELETED state. You must delete all associated resources before deleting a project.
    # @param [String] model_id The OCID of the Model.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/delete_model.rb.html) to see an example of how to use delete_model API.
    def delete_model(model_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#delete_model.' if logger

      raise "Missing the required parameter 'model_id' when calling delete_model." if model_id.nil?
      raise "Parameter value for 'model_id' must not be blank" if OCI::Internal::Util.blank_string?(model_id)

      path = '/models/{modelId}'.sub('{modelId}', model_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#delete_model') do
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


    # Deletes a Project resource by identifier. This operation fails with a 409 error unless all associated resources (models deployments or data assets) are in a DELETED state. You must delete all associated resources before deleting a project.
    # @param [String] project_id The OCID of the Project.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/delete_project.rb.html) to see an example of how to use delete_project API.
    def delete_project(project_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#delete_project.' if logger

      raise "Missing the required parameter 'project_id' when calling delete_project." if project_id.nil?
      raise "Parameter value for 'project_id' must not be blank" if OCI::Internal::Util.blank_string?(project_id)

      path = '/projects/{projectId}'.sub('{projectId}', project_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#delete_project') do
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


    # Make a detect call with an anomaly model and detection data
    # @param [OCI::AiAnomalyDetection::Models::DetectAnomaliesDetails] detect_anomalies_details The input is either:
    #     - JSON object in the request. This object is defined and SDK will generate the
    #       object for it
    #     - Data embedded as base64 string in format of either
    #       - CSV
    #       - JSON
    #       If this option is chosen then customer has to provide the content of specified
    #       CSV or JSON in base64 encoded string. The Embedded JSON will still has to be
    #       in same format as inline request JSON
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::AnomalyDetectResult AnomalyDetectResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/detect_anomalies.rb.html) to see an example of how to use detect_anomalies API.
    def detect_anomalies(detect_anomalies_details, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#detect_anomalies.' if logger

      raise "Missing the required parameter 'detect_anomalies_details' when calling detect_anomalies." if detect_anomalies_details.nil?

      path = '/actions/detectAnomalies'
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

      post_body = @api_client.object_to_http_body(detect_anomalies_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#detect_anomalies') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::AnomalyDetectResult'
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


    # Gets a specific private reverse connection by identifier.
    # @param [String] ai_private_endpoint_id Unique private reverse connection identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::AiPrivateEndpoint AiPrivateEndpoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/get_ai_private_endpoint.rb.html) to see an example of how to use get_ai_private_endpoint API.
    def get_ai_private_endpoint(ai_private_endpoint_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#get_ai_private_endpoint.' if logger

      raise "Missing the required parameter 'ai_private_endpoint_id' when calling get_ai_private_endpoint." if ai_private_endpoint_id.nil?
      raise "Parameter value for 'ai_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(ai_private_endpoint_id)

      path = '/aiPrivateEndpoints/{aiPrivateEndpointId}'.sub('{aiPrivateEndpointId}', ai_private_endpoint_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#get_ai_private_endpoint') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::AiPrivateEndpoint'
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


    # Gets a DataAsset by identifier
    # @param [String] data_asset_id The OCID of the Data Asset.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::DataAsset DataAsset}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/get_data_asset.rb.html) to see an example of how to use get_data_asset API.
    def get_data_asset(data_asset_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#get_data_asset.' if logger

      raise "Missing the required parameter 'data_asset_id' when calling get_data_asset." if data_asset_id.nil?
      raise "Parameter value for 'data_asset_id' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_id)

      path = '/dataAssets/{dataAssetId}'.sub('{dataAssetId}', data_asset_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#get_data_asset') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::DataAsset'
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


    # Gets a Model by identifier
    # @param [String] model_id The OCID of the Model.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::Model Model}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/get_model.rb.html) to see an example of how to use get_model API.
    def get_model(model_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#get_model.' if logger

      raise "Missing the required parameter 'model_id' when calling get_model." if model_id.nil?
      raise "Parameter value for 'model_id' must not be blank" if OCI::Internal::Util.blank_string?(model_id)

      path = '/models/{modelId}'.sub('{modelId}', model_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#get_model') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::Model'
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


    # Gets a Project by identifier
    # @param [String] project_id The OCID of the Project.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::Project Project}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/get_project.rb.html) to see an example of how to use get_project API.
    def get_project(project_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#get_project.' if logger

      raise "Missing the required parameter 'project_id' when calling get_project." if project_id.nil?
      raise "Parameter value for 'project_id' must not be blank" if OCI::Internal::Util.blank_string?(project_id)

      path = '/projects/{projectId}'.sub('{projectId}', project_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#get_project') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::Project'
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
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::WorkRequest'
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


    # Returns a list of all the AI private endpoints in the specified compartment.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state <b>Filter</b> results by the specified lifecycle state. Must be a valid
    #   state for the resource type.
    #
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :id unique AiPrivateEndpoint identifier
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::AiPrivateEndpointCollection AiPrivateEndpointCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/list_ai_private_endpoints.rb.html) to see an example of how to use list_ai_private_endpoints API.
    def list_ai_private_endpoints(compartment_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#list_ai_private_endpoints.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_ai_private_endpoints." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::AiAnomalyDetection::Models::AiPrivateEndpoint::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::AiAnomalyDetection::Models::AiPrivateEndpoint::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::AiAnomalyDetection::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::AiAnomalyDetection::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/aiPrivateEndpoints'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:id] = opts[:id] if opts[:id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#list_ai_private_endpoints') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::AiPrivateEndpointCollection'
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


    # Returns a list of DataAssets.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :project_id The ID of the project for which to list the objects.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :lifecycle_state <b>Filter</b> results by the specified lifecycle state. Must be a valid
    #   state for the resource type.
    #
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::DataAssetCollection DataAssetCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/list_data_assets.rb.html) to see an example of how to use list_data_assets API.
    def list_data_assets(compartment_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#list_data_assets.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_data_assets." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::AiAnomalyDetection::Models::DataAsset::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::AiAnomalyDetection::Models::DataAsset::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::AiAnomalyDetection::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::AiAnomalyDetection::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/dataAssets'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:projectId] = opts[:project_id] if opts[:project_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#list_data_assets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::DataAssetCollection'
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


    # Returns a list of Models.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :project_id The ID of the project for which to list the objects.
    # @option opts [String] :lifecycle_state <b>Filter</b> results by the specified lifecycle state. Must be a valid
    #   state for the resource type.
    #
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field.
    #   By default, when you sort by `timeCreated`, the results are shown
    #   in descending order. When you sort by `displayName`, the results are
    #   shown in ascending order. Sort order for the `displayName` field is case sensitive.
    #
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::ModelCollection ModelCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/list_models.rb.html) to see an example of how to use list_models API.
    def list_models(compartment_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#list_models.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_models." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::AiAnomalyDetection::Models::Model::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::AiAnomalyDetection::Models::Model::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::AiAnomalyDetection::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::AiAnomalyDetection::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/models'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:projectId] = opts[:project_id] if opts[:project_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#list_models') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::ModelCollection'
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


    # Returns a list of  Projects.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state <b>Filter</b> results by the specified lifecycle state. Must be a valid
    #   state for the resource type.
    #
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field.
    #   By default, when you sort by `timeCreated`, the results are shown
    #   in descending order. When you sort by `displayName`, the results are
    #   shown in ascending order. Sort order for the `displayName` field is case sensitive.
    #
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::ProjectCollection ProjectCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/list_projects.rb.html) to see an example of how to use list_projects API.
    def list_projects(compartment_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#list_projects.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_projects." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::AiAnomalyDetection::Models::Project::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::AiAnomalyDetection::Models::Project::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::AiAnomalyDetection::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::AiAnomalyDetection::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/projects'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#list_projects') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::ProjectCollection'
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
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::WorkRequestErrorCollection WorkRequestErrorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::WorkRequestErrorCollection'
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
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::WorkRequestLogEntryCollection WorkRequestLogEntryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#list_work_request_logs.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::WorkRequestLogEntryCollection'
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
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :work_request_id The ID of the asynchronous work request.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::WorkRequestSummaryCollection WorkRequestSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:workRequestId] = opts[:work_request_id] if opts[:work_request_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::WorkRequestSummaryCollection'
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


    # Updates the private reverse connection endpoint.
    # @param [String] ai_private_endpoint_id Unique private reverse connection identifier.
    # @param [OCI::AiAnomalyDetection::Models::UpdateAiPrivateEndpointDetails] update_ai_private_endpoint_details The information to be updated in private reverse connection
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/update_ai_private_endpoint.rb.html) to see an example of how to use update_ai_private_endpoint API.
    def update_ai_private_endpoint(ai_private_endpoint_id, update_ai_private_endpoint_details, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#update_ai_private_endpoint.' if logger

      raise "Missing the required parameter 'ai_private_endpoint_id' when calling update_ai_private_endpoint." if ai_private_endpoint_id.nil?
      raise "Missing the required parameter 'update_ai_private_endpoint_details' when calling update_ai_private_endpoint." if update_ai_private_endpoint_details.nil?
      raise "Parameter value for 'ai_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(ai_private_endpoint_id)

      path = '/aiPrivateEndpoints/{aiPrivateEndpointId}'.sub('{aiPrivateEndpointId}', ai_private_endpoint_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_ai_private_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#update_ai_private_endpoint') do
        @api_client.call_api(
          :PUT,
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


    # Updates the DataAsset
    # @param [String] data_asset_id The OCID of the Data Asset.
    # @param [OCI::AiAnomalyDetection::Models::UpdateDataAssetDetails] update_data_asset_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::DataAsset DataAsset}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/update_data_asset.rb.html) to see an example of how to use update_data_asset API.
    def update_data_asset(data_asset_id, update_data_asset_details, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#update_data_asset.' if logger

      raise "Missing the required parameter 'data_asset_id' when calling update_data_asset." if data_asset_id.nil?
      raise "Missing the required parameter 'update_data_asset_details' when calling update_data_asset." if update_data_asset_details.nil?
      raise "Parameter value for 'data_asset_id' must not be blank" if OCI::Internal::Util.blank_string?(data_asset_id)

      path = '/dataAssets/{dataAssetId}'.sub('{dataAssetId}', data_asset_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_data_asset_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#update_data_asset') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::DataAsset'
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


    # Updates the Model
    # @param [String] model_id The OCID of the Model.
    # @param [OCI::AiAnomalyDetection::Models::UpdateModelDetails] update_model_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/update_model.rb.html) to see an example of how to use update_model API.
    def update_model(model_id, update_model_details, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#update_model.' if logger

      raise "Missing the required parameter 'model_id' when calling update_model." if model_id.nil?
      raise "Missing the required parameter 'update_model_details' when calling update_model." if update_model_details.nil?
      raise "Parameter value for 'model_id' must not be blank" if OCI::Internal::Util.blank_string?(model_id)

      path = '/models/{modelId}'.sub('{modelId}', model_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_model_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#update_model') do
        @api_client.call_api(
          :PUT,
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


    # Updates the Project
    # @param [String] project_id The OCID of the Project.
    # @param [OCI::AiAnomalyDetection::Models::UpdateProjectDetails] update_project_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::AiAnomalyDetection::Models::Project Project}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/aianomalydetection/update_project.rb.html) to see an example of how to use update_project API.
    def update_project(project_id, update_project_details, opts = {})
      logger.debug 'Calling operation AnomalyDetectionClient#update_project.' if logger

      raise "Missing the required parameter 'project_id' when calling update_project." if project_id.nil?
      raise "Missing the required parameter 'update_project_details' when calling update_project." if update_project_details.nil?
      raise "Parameter value for 'project_id' must not be blank" if OCI::Internal::Util.blank_string?(project_id)

      path = '/projects/{projectId}'.sub('{projectId}', project_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_project_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnomalyDetectionClient#update_project') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AiAnomalyDetection::Models::Project'
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
