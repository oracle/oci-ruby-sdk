# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Data Flow APIs to run any Apache Spark application at any scale without deploying or managing any infrastructure.
  class DataFlow::DataFlowClient
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


    # Creates a new DataFlowClient.
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
        @endpoint = endpoint + '/20200129'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "DataFlowClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://dataflow.{region}.oci.{secondLevelDomain}') + '/20200129'
      logger.info "DataFlowClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves an application into a different compartment. When provided, If-Match is checked against ETag values of the resource.
    # Associated resources, like runs, will not be automatically moved.
    #
    # @param [String] application_id The unique ID for an application.
    #
    # @param [OCI::DataFlow::Models::ChangeApplicationCompartmentDetails] change_application_compartment_details Details for changing an application's compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error
    #   without risk of executing that same action again. Retry tokens expire after 24 hours,
    #   but can be invalidated before then due to conflicting operations.
    #   For example, if a resource has been deleted and purged from the system, then a retry of the original creation request may be rejected.
    #
    # @return [Response] A Response object with data of type nil
    def change_application_compartment(application_id, change_application_compartment_details, opts = {})
      logger.debug 'Calling operation DataFlowClient#change_application_compartment.' if logger

      raise "Missing the required parameter 'application_id' when calling change_application_compartment." if application_id.nil?
      raise "Missing the required parameter 'change_application_compartment_details' when calling change_application_compartment." if change_application_compartment_details.nil?
      raise "Parameter value for 'application_id' must not be blank" if OCI::Internal::Util.blank_string?(application_id)

      path = '/applications/{applicationId}/actions/changeCompartment'.sub('{applicationId}', application_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_application_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#change_application_compartment') do
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


    # Moves a private endpoint into a different compartment. When provided, If-Match is checked against ETag values of the resource.
    #
    # @param [String] private_endpoint_id The unique ID for a private endpoint.
    #
    # @param [OCI::DataFlow::Models::ChangePrivateEndpointCompartmentDetails] change_private_endpoint_compartment_details Details for changing a private endpoint's compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def change_private_endpoint_compartment(private_endpoint_id, change_private_endpoint_compartment_details, opts = {})
      logger.debug 'Calling operation DataFlowClient#change_private_endpoint_compartment.' if logger

      raise "Missing the required parameter 'private_endpoint_id' when calling change_private_endpoint_compartment." if private_endpoint_id.nil?
      raise "Missing the required parameter 'change_private_endpoint_compartment_details' when calling change_private_endpoint_compartment." if change_private_endpoint_compartment_details.nil?
      raise "Parameter value for 'private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(private_endpoint_id)

      path = '/privateEndpoints/{privateEndpointId}/actions/changeCompartment'.sub('{privateEndpointId}', private_endpoint_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_private_endpoint_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#change_private_endpoint_compartment') do
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


    # Moves a run into a different compartment. When provided, If-Match is checked against ETag
    # values of the resource. Associated resources, like historical metrics, will not be
    # automatically moved. The run must be in a terminal state (CANCELED, FAILED, SUCCEEDED) in
    # order for it to be moved to a different compartment
    #
    # @param [String] run_id The unique ID for the run
    #
    # @param [OCI::DataFlow::Models::ChangeRunCompartmentDetails] change_run_compartment_details Details for changing a run's compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error
    #   without risk of executing that same action again. Retry tokens expire after 24 hours,
    #   but can be invalidated before then due to conflicting operations.
    #   For example, if a resource has been deleted and purged from the system, then a retry of the original creation request may be rejected.
    #
    # @return [Response] A Response object with data of type nil
    def change_run_compartment(run_id, change_run_compartment_details, opts = {})
      logger.debug 'Calling operation DataFlowClient#change_run_compartment.' if logger

      raise "Missing the required parameter 'run_id' when calling change_run_compartment." if run_id.nil?
      raise "Missing the required parameter 'change_run_compartment_details' when calling change_run_compartment." if change_run_compartment_details.nil?
      raise "Parameter value for 'run_id' must not be blank" if OCI::Internal::Util.blank_string?(run_id)

      path = '/runs/{runId}/actions/changeCompartment'.sub('{runId}', run_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_run_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#change_run_compartment') do
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
    # @param [OCI::DataFlow::Models::CreateApplicationDetails] create_application_details Details to create an application.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error
    #   without risk of executing that same action again. Retry tokens expire after 24 hours,
    #   but can be invalidated before then due to conflicting operations.
    #   For example, if a resource has been deleted and purged from the system, then a retry of the original creation request may be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::DataFlow::Models::Application Application}
    def create_application(create_application_details, opts = {})
      logger.debug 'Calling operation DataFlowClient#create_application.' if logger

      raise "Missing the required parameter 'create_application_details' when calling create_application." if create_application_details.nil?

      path = '/applications'
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

      post_body = @api_client.object_to_http_body(create_application_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#create_application') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataFlow::Models::Application'
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


    # Creates a private endpoint to be used by an application.
    #
    # @param [OCI::DataFlow::Models::CreatePrivateEndpointDetails] create_private_endpoint_details Details to create a private endpoint.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error
    #   without risk of executing that same action again. Retry tokens expire after 24 hours,
    #   but can be invalidated before then due to conflicting operations.
    #   For example, if a resource has been deleted and purged from the system, then a retry of the original creation request may be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::DataFlow::Models::PrivateEndpoint PrivateEndpoint}
    def create_private_endpoint(create_private_endpoint_details, opts = {})
      logger.debug 'Calling operation DataFlowClient#create_private_endpoint.' if logger

      raise "Missing the required parameter 'create_private_endpoint_details' when calling create_private_endpoint." if create_private_endpoint_details.nil?

      path = '/privateEndpoints'
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

      post_body = @api_client.object_to_http_body(create_private_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#create_private_endpoint') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataFlow::Models::PrivateEndpoint'
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


    # Creates a run for an application.
    #
    # @param [OCI::DataFlow::Models::CreateRunDetails] create_run_details Details for creating a run of an application.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error
    #   without risk of executing that same action again. Retry tokens expire after 24 hours,
    #   but can be invalidated before then due to conflicting operations.
    #   For example, if a resource has been deleted and purged from the system, then a retry of the original creation request may be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::DataFlow::Models::Run Run}
    def create_run(create_run_details, opts = {})
      logger.debug 'Calling operation DataFlowClient#create_run.' if logger

      raise "Missing the required parameter 'create_run_details' when calling create_run." if create_run_details.nil?

      path = '/runs'
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

      post_body = @api_client.object_to_http_body(create_run_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#create_run') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataFlow::Models::Run'
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


    # Deletes an application using an `applicationId`.
    #
    # @param [String] application_id The unique ID for an application.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_application(application_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#delete_application.' if logger

      raise "Missing the required parameter 'application_id' when calling delete_application." if application_id.nil?
      raise "Parameter value for 'application_id' must not be blank" if OCI::Internal::Util.blank_string?(application_id)

      path = '/applications/{applicationId}'.sub('{applicationId}', application_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#delete_application') do
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


    # Deletes a private endpoint using a `privateEndpointId`.
    #
    # @param [String] private_endpoint_id The unique ID for a private endpoint.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_private_endpoint(private_endpoint_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#delete_private_endpoint.' if logger

      raise "Missing the required parameter 'private_endpoint_id' when calling delete_private_endpoint." if private_endpoint_id.nil?
      raise "Parameter value for 'private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(private_endpoint_id)

      path = '/privateEndpoints/{privateEndpointId}'.sub('{privateEndpointId}', private_endpoint_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#delete_private_endpoint') do
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


    # Cancels the specified run if it has not already completed or was previously cancelled.
    # If a run is in progress, the executing job will be killed.
    #
    # @param [String] run_id The unique ID for the run
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_run(run_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#delete_run.' if logger

      raise "Missing the required parameter 'run_id' when calling delete_run." if run_id.nil?
      raise "Parameter value for 'run_id' must not be blank" if OCI::Internal::Util.blank_string?(run_id)

      path = '/runs/{runId}'.sub('{runId}', run_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#delete_run') do
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


    # Retrieves an application using an `applicationId`.
    #
    # @param [String] application_id The unique ID for an application.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::DataFlow::Models::Application Application}
    def get_application(application_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#get_application.' if logger

      raise "Missing the required parameter 'application_id' when calling get_application." if application_id.nil?
      raise "Parameter value for 'application_id' must not be blank" if OCI::Internal::Util.blank_string?(application_id)

      path = '/applications/{applicationId}'.sub('{applicationId}', application_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#get_application') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataFlow::Models::Application'
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


    # Retrieves an private endpoint using a `privateEndpointId`.
    #
    # @param [String] private_endpoint_id The unique ID for a private endpoint.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::DataFlow::Models::PrivateEndpoint PrivateEndpoint}
    def get_private_endpoint(private_endpoint_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#get_private_endpoint.' if logger

      raise "Missing the required parameter 'private_endpoint_id' when calling get_private_endpoint." if private_endpoint_id.nil?
      raise "Parameter value for 'private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(private_endpoint_id)

      path = '/privateEndpoints/{privateEndpointId}'.sub('{privateEndpointId}', private_endpoint_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#get_private_endpoint') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataFlow::Models::PrivateEndpoint'
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


    # Retrieves the run for the specified `runId`.
    #
    # @param [String] run_id The unique ID for the run
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::DataFlow::Models::Run Run}
    def get_run(run_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#get_run.' if logger

      raise "Missing the required parameter 'run_id' when calling get_run." if run_id.nil?
      raise "Parameter value for 'run_id' must not be blank" if OCI::Internal::Util.blank_string?(run_id)

      path = '/runs/{runId}'.sub('{runId}', run_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#get_run') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataFlow::Models::Run'
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


    # Retrieves the content of an run log.
    #
    # @param [String] run_id The unique ID for the run
    #
    # @param [String] name The name of the log. Avoid entering confidential information.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    def get_run_log(run_id, name, opts = {}, &block)
      logger.debug 'Calling operation DataFlowClient#get_run_log.' if logger

      raise "Missing the required parameter 'run_id' when calling get_run_log." if run_id.nil?
      raise "Missing the required parameter 'name' when calling get_run_log." if name.nil?
      raise "Parameter value for 'run_id' must not be blank" if OCI::Internal::Util.blank_string?(run_id)
      raise "Parameter value for 'name' must not be blank" if OCI::Internal::Util.blank_string?(name)

      path = '/runs/{runId}/logs/{name}'.sub('{runId}', run_id.to_s).sub('{name}', name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/octet-stream'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#get_run_log') do
        if !block.nil?
          @api_client.call_api(
            :GET,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'Stream',
            &block
          )
        elsif opts[:response_target]
          if opts[:response_target].respond_to? :write
            @api_client.call_api(
              :GET,
              path,
              endpoint,
              header_params: header_params,
              query_params: query_params,
              operation_signing_strategy: operation_signing_strategy,
              body: post_body,
              return_type: 'Stream',
              &proc { |chunk, _response| opts[:response_target].write(chunk) }
            )
          elsif opts[:response_target].is_a?(String)
            File.open(opts[:response_target], 'wb') do |output|
              return @api_client.call_api(
                :GET,
                path,
                endpoint,
                header_params: header_params,
                query_params: query_params,
                operation_signing_strategy: operation_signing_strategy,
                body: post_body,
                return_type: 'Stream',
                &proc { |chunk, _response| output.write(chunk) }
              )
            end
          end
        else
          @api_client.call_api(
            :GET,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'String'
          )
        end
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the status of the work request with the given OCID.
    #
    # @param [String] work_request_id The unique ID for a work request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @return [Response] A Response object with data of type {OCI::DataFlow::Models::WorkRequest WorkRequest}
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataFlow::Models::WorkRequest'
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


    # Lists all applications in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [Integer] :limit The maximum number of results to return in a paginated `List` call.
    #    (default to 100)
    # @option opts [String] :page The value of the `opc-next-page` or `opc-prev-page` response header from the last `List` call
    #   to sent back to server for getting the next page of results.
    #
    # @option opts [String] :sort_by The field used to sort the results. Multiple fields are not supported.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName, language
    # @option opts [String] :sort_order The ordering of results in ascending or descending order.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :display_name The query parameter for the Spark application name.
    #
    # @option opts [String] :owner_principal_id The OCID of the user who created the resource.
    #
    # @option opts [String] :display_name_starts_with The displayName prefix.
    #
    # @return [Response] A Response object with data of type Array<{OCI::DataFlow::Models::ApplicationSummary ApplicationSummary}>
    def list_applications(compartment_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#list_applications.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_applications." if compartment_id.nil?

      if opts[:sort_by] && !%w[timeCreated displayName language].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName, language.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/applications'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:ownerPrincipalId] = opts[:owner_principal_id] if opts[:owner_principal_id]
      query_params[:displayNameStartsWith] = opts[:display_name_starts_with] if opts[:display_name_starts_with]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#list_applications') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataFlow::Models::ApplicationSummary>'
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


    # Lists all private endpoints in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [Integer] :limit The maximum number of results to return in a paginated `List` call.
    #    (default to 100)
    # @option opts [String] :page The value of the `opc-next-page` or `opc-prev-page` response header from the last `List` call
    #   to sent back to server for getting the next page of results.
    #
    # @option opts [String] :lifecycle_state The LifecycleState of the private endpoint.
    #
    # @option opts [String] :sort_by The field used to sort the results. Multiple fields are not supported.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated
    # @option opts [String] :sort_order The ordering of results in ascending or descending order.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :display_name The query parameter for the Spark application name.
    #
    # @option opts [String] :owner_principal_id The OCID of the user who created the resource.
    #
    # @option opts [String] :display_name_starts_with The displayName prefix.
    #
    # @return [Response] A Response object with data of type {OCI::DataFlow::Models::PrivateEndpointCollection PrivateEndpointCollection}
    def list_private_endpoints(compartment_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#list_private_endpoints.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_private_endpoints." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DataFlow::Models::PRIVATE_ENDPOINT_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataFlow::Models::PRIVATE_ENDPOINT_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/privateEndpoints'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:ownerPrincipalId] = opts[:owner_principal_id] if opts[:owner_principal_id]
      query_params[:displayNameStartsWith] = opts[:display_name_starts_with] if opts[:display_name_starts_with]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#list_private_endpoints') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataFlow::Models::PrivateEndpointCollection'
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


    # Retrieves summaries of the run's logs.
    #
    # @param [String] run_id The unique ID for the run
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [Integer] :limit The maximum number of results to return in a paginated \"List\" call.
    #    (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` or `opc-prev-page` response header from the last `List` call
    #   to sent back to server for getting the next page of results.
    #
    # @return [Response] A Response object with data of type Array<{OCI::DataFlow::Models::RunLogSummary RunLogSummary}>
    def list_run_logs(run_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#list_run_logs.' if logger

      raise "Missing the required parameter 'run_id' when calling list_run_logs." if run_id.nil?
      raise "Parameter value for 'run_id' must not be blank" if OCI::Internal::Util.blank_string?(run_id)

      path = '/runs/{runId}/logs'.sub('{runId}', run_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#list_run_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataFlow::Models::RunLogSummary>'
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


    # Lists all runs of an application in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String] :application_id The ID of the application.
    #
    # @option opts [String] :owner_principal_id The OCID of the user who created the resource.
    #
    # @option opts [String] :display_name_starts_with The displayName prefix.
    #
    # @option opts [String] :lifecycle_state The LifecycleState of the run.
    #
    # @option opts [DateTime] :time_created_greater_than The epoch time that the resource was created.
    #
    # @option opts [Integer] :limit The maximum number of results to return in a paginated `List` call.
    #    (default to 100)
    # @option opts [String] :page The value of the `opc-next-page` or `opc-prev-page` response header from the last `List` call
    #   to sent back to server for getting the next page of results.
    #
    # @option opts [String] :sort_by The field used to sort the results. Multiple fields are not supported.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName, language, runDurationInMilliseconds, lifecycleState, totalOCpu, dataReadInBytes, dataWrittenInBytes
    # @option opts [String] :sort_order The ordering of results in ascending or descending order.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :display_name The query parameter for the Spark application name.
    #
    # @return [Response] A Response object with data of type Array<{OCI::DataFlow::Models::RunSummary RunSummary}>
    def list_runs(compartment_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#list_runs.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_runs." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DataFlow::Models::RUN_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataFlow::Models::RUN_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName language runDurationInMilliseconds lifecycleState totalOCpu dataReadInBytes dataWrittenInBytes].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName, language, runDurationInMilliseconds, lifecycleState, totalOCpu, dataReadInBytes, dataWrittenInBytes.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/runs'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:applicationId] = opts[:application_id] if opts[:application_id]
      query_params[:ownerPrincipalId] = opts[:owner_principal_id] if opts[:owner_principal_id]
      query_params[:displayNameStartsWith] = opts[:display_name_starts_with] if opts[:display_name_starts_with]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeCreatedGreaterThan] = opts[:time_created_greater_than] if opts[:time_created_greater_than]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#list_runs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataFlow::Models::RunSummary>'
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
    # @param [String] work_request_id The unique ID for a work request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of results to return in a paginated `List` call.
    #    (default to 100)
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String] :page The value of the `opc-next-page` or `opc-prev-page` response header from the last `List` call
    #   to sent back to server for getting the next page of results.
    #
    # @return [Response] A Response object with data of type {OCI::DataFlow::Models::WorkRequestErrorCollection WorkRequestErrorCollection}
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataFlow::Models::WorkRequestErrorCollection'
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


    # Return a paginated list of logs for a given work request.
    #
    # @param [String] work_request_id The unique ID for a work request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of results to return in a paginated `List` call.
    #    (default to 100)
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String] :page The value of the `opc-next-page` or `opc-prev-page` response header from the last `List` call
    #   to sent back to server for getting the next page of results.
    #
    # @return [Response] A Response object with data of type {OCI::DataFlow::Models::WorkRequestLogCollection WorkRequestLogCollection}
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/logs'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataFlow::Models::WorkRequestLogCollection'
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
    # @param [String] compartment_id The OCID of the compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of results to return in a paginated `List` call.
    #    (default to 100)
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String] :page The value of the `opc-next-page` or `opc-prev-page` response header from the last `List` call
    #   to sent back to server for getting the next page of results.
    #
    # @return [Response] A Response object with data of type {OCI::DataFlow::Models::WorkRequestCollection WorkRequestCollection}
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataFlow::Models::WorkRequestCollection'
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


    # Updates an application using an `applicationId`.
    #
    # @param [OCI::DataFlow::Models::UpdateApplicationDetails] update_application_details Details for updating an application.
    #
    # @param [String] application_id The unique ID for an application.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::DataFlow::Models::Application Application}
    def update_application(update_application_details, application_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#update_application.' if logger

      raise "Missing the required parameter 'update_application_details' when calling update_application." if update_application_details.nil?
      raise "Missing the required parameter 'application_id' when calling update_application." if application_id.nil?
      raise "Parameter value for 'application_id' must not be blank" if OCI::Internal::Util.blank_string?(application_id)

      path = '/applications/{applicationId}'.sub('{applicationId}', application_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_application_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#update_application') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataFlow::Models::Application'
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


    # Updates a private endpoint using a `privateEndpointId`.  If changes to a private endpoint match
    # a previously defined private endpoint, then a 409 status code will be returned.  This indicates
    # that a conflict has been detected.
    #
    # @param [OCI::DataFlow::Models::UpdatePrivateEndpointDetails] update_private_endpoint_details Details for updating a private endpoint.
    #
    # @param [String] private_endpoint_id The unique ID for a private endpoint.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def update_private_endpoint(update_private_endpoint_details, private_endpoint_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#update_private_endpoint.' if logger

      raise "Missing the required parameter 'update_private_endpoint_details' when calling update_private_endpoint." if update_private_endpoint_details.nil?
      raise "Missing the required parameter 'private_endpoint_id' when calling update_private_endpoint." if private_endpoint_id.nil?
      raise "Parameter value for 'private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(private_endpoint_id)

      path = '/privateEndpoints/{privateEndpointId}'.sub('{privateEndpointId}', private_endpoint_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_private_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#update_private_endpoint') do
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


    # Updates a run using a `runId`.
    #
    # @param [OCI::DataFlow::Models::UpdateRunDetails] update_run_details Details for updating a run.
    #
    # @param [String] run_id The unique ID for the run
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request. If provided, the returned request ID will include this value.
    #   Otherwise, a random request ID will be generated by the service.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::DataFlow::Models::Run Run}
    def update_run(update_run_details, run_id, opts = {})
      logger.debug 'Calling operation DataFlowClient#update_run.' if logger

      raise "Missing the required parameter 'update_run_details' when calling update_run." if update_run_details.nil?
      raise "Missing the required parameter 'run_id' when calling update_run." if run_id.nil?
      raise "Parameter value for 'run_id' must not be blank" if OCI::Internal::Util.blank_string?(run_id)

      path = '/runs/{runId}'.sub('{runId}', run_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_run_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataFlowClient#update_run') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataFlow::Models::Run'
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
