# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the DevOps API to create DevOps projects, configure code repositories,  add artifacts to deploy, build and test software applications, configure  target deployment environments, and deploy software applications.  For more information, see [DevOps](/Content/devops/using/home.htm).
  class Devops::DevopsClient
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


    # Creates a new DevopsClient.
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
        @endpoint = endpoint + '/20210630'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "DevopsClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://devops.{region}.oci.{secondLevelDomain}') + '/20210630'
      logger.info "DevopsClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Submit stage approval.
    # @param [String] deployment_id Unique deployment identifier.
    # @param [OCI::Devops::Models::ApproveDeploymentDetails] approve_deployment_details The stage information for approval.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Deployment Deployment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/approve_deployment.rb.html) to see an example of how to use approve_deployment API.
    def approve_deployment(deployment_id, approve_deployment_details, opts = {})
      logger.debug 'Calling operation DevopsClient#approve_deployment.' if logger

      raise "Missing the required parameter 'deployment_id' when calling approve_deployment." if deployment_id.nil?
      raise "Missing the required parameter 'approve_deployment_details' when calling approve_deployment." if approve_deployment_details.nil?
      raise "Parameter value for 'deployment_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_id)

      path = '/deployments/{deploymentId}/actions/approve'.sub('{deploymentId}', deployment_id.to_s)
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

      post_body = @api_client.object_to_http_body(approve_deployment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#approve_deployment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Deployment'
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


    # Cancels the build run based on the build run ID provided in the request.
    # @param [OCI::Devops::Models::CancelBuildRunDetails] cancel_build_run_details Parameter details required to cancel a build run.
    # @param [String] build_run_id Unique build run identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::BuildRun BuildRun}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/cancel_build_run.rb.html) to see an example of how to use cancel_build_run API.
    def cancel_build_run(cancel_build_run_details, build_run_id, opts = {})
      logger.debug 'Calling operation DevopsClient#cancel_build_run.' if logger

      raise "Missing the required parameter 'cancel_build_run_details' when calling cancel_build_run." if cancel_build_run_details.nil?
      raise "Missing the required parameter 'build_run_id' when calling cancel_build_run." if build_run_id.nil?
      raise "Parameter value for 'build_run_id' must not be blank" if OCI::Internal::Util.blank_string?(build_run_id)

      path = '/buildRuns/{buildRunId}/actions/cancel'.sub('{buildRunId}', build_run_id.to_s)
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

      post_body = @api_client.object_to_http_body(cancel_build_run_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#cancel_build_run') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::BuildRun'
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


    # Cancels a deployment resource by identifier.
    # @param [String] deployment_id Unique deployment identifier.
    # @param [OCI::Devops::Models::CancelDeploymentDetails] cancel_deployment_details The information regarding the deployment to be canceled.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Deployment Deployment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/cancel_deployment.rb.html) to see an example of how to use cancel_deployment API.
    def cancel_deployment(deployment_id, cancel_deployment_details, opts = {})
      logger.debug 'Calling operation DevopsClient#cancel_deployment.' if logger

      raise "Missing the required parameter 'deployment_id' when calling cancel_deployment." if deployment_id.nil?
      raise "Missing the required parameter 'cancel_deployment_details' when calling cancel_deployment." if cancel_deployment_details.nil?
      raise "Parameter value for 'deployment_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_id)

      path = '/deployments/{deploymentId}/actions/cancel'.sub('{deploymentId}', deployment_id.to_s)
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

      post_body = @api_client.object_to_http_body(cancel_deployment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#cancel_deployment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Deployment'
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


    # Moves a project resource from one compartment OCID to another.
    # @param [String] project_id Unique project identifier.
    # @param [OCI::Devops::Models::ChangeProjectCompartmentDetails] change_project_compartment_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/change_project_compartment.rb.html) to see an example of how to use change_project_compartment API.
    def change_project_compartment(project_id, change_project_compartment_details, opts = {})
      logger.debug 'Calling operation DevopsClient#change_project_compartment.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#change_project_compartment') do
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


    # Creates a new build pipeline.
    #
    # @param [OCI::Devops::Models::CreateBuildPipelineDetails] create_build_pipeline_details Details for the new build pipeline.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::BuildPipeline BuildPipeline}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/create_build_pipeline.rb.html) to see an example of how to use create_build_pipeline API.
    def create_build_pipeline(create_build_pipeline_details, opts = {})
      logger.debug 'Calling operation DevopsClient#create_build_pipeline.' if logger

      raise "Missing the required parameter 'create_build_pipeline_details' when calling create_build_pipeline." if create_build_pipeline_details.nil?

      path = '/buildPipelines'
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

      post_body = @api_client.object_to_http_body(create_build_pipeline_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#create_build_pipeline') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::BuildPipeline'
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


    # Creates a new stage.
    #
    # @param [OCI::Devops::Models::CreateBuildPipelineStageDetails] create_build_pipeline_stage_details Details for the new stage.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::BuildPipelineStage BuildPipelineStage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/create_build_pipeline_stage.rb.html) to see an example of how to use create_build_pipeline_stage API.
    def create_build_pipeline_stage(create_build_pipeline_stage_details, opts = {})
      logger.debug 'Calling operation DevopsClient#create_build_pipeline_stage.' if logger

      raise "Missing the required parameter 'create_build_pipeline_stage_details' when calling create_build_pipeline_stage." if create_build_pipeline_stage_details.nil?

      path = '/buildPipelineStages'
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

      post_body = @api_client.object_to_http_body(create_build_pipeline_stage_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#create_build_pipeline_stage') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::BuildPipelineStage'
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


    # Starts a build pipeline run for a predefined build pipeline.
    #
    # @param [OCI::Devops::Models::CreateBuildRunDetails] create_build_run_details Parameter details required to create a new build run.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::BuildRun BuildRun}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/create_build_run.rb.html) to see an example of how to use create_build_run API.
    def create_build_run(create_build_run_details, opts = {})
      logger.debug 'Calling operation DevopsClient#create_build_run.' if logger

      raise "Missing the required parameter 'create_build_run_details' when calling create_build_run." if create_build_run_details.nil?

      path = '/buildRuns'
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_build_run_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#create_build_run') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::BuildRun'
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


    # Creates a new connection.
    #
    # @param [OCI::Devops::Models::CreateConnectionDetails] create_connection_details Details for the new connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Connection Connection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/create_connection.rb.html) to see an example of how to use create_connection API.
    def create_connection(create_connection_details, opts = {})
      logger.debug 'Calling operation DevopsClient#create_connection.' if logger

      raise "Missing the required parameter 'create_connection_details' when calling create_connection." if create_connection_details.nil?

      path = '/connections'
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

      post_body = @api_client.object_to_http_body(create_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#create_connection') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Connection'
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


    # Creates a new deployment artifact.
    # @param [OCI::Devops::Models::CreateDeployArtifactDetails] create_deploy_artifact_details Details for the new deployment artifact.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployArtifact DeployArtifact}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/create_deploy_artifact.rb.html) to see an example of how to use create_deploy_artifact API.
    def create_deploy_artifact(create_deploy_artifact_details, opts = {})
      logger.debug 'Calling operation DevopsClient#create_deploy_artifact.' if logger

      raise "Missing the required parameter 'create_deploy_artifact_details' when calling create_deploy_artifact." if create_deploy_artifact_details.nil?

      path = '/deployArtifacts'
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

      post_body = @api_client.object_to_http_body(create_deploy_artifact_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#create_deploy_artifact') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployArtifact'
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


    # Creates a new deployment environment.
    # @param [OCI::Devops::Models::CreateDeployEnvironmentDetails] create_deploy_environment_details Details for the new deployment environment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployEnvironment DeployEnvironment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/create_deploy_environment.rb.html) to see an example of how to use create_deploy_environment API.
    def create_deploy_environment(create_deploy_environment_details, opts = {})
      logger.debug 'Calling operation DevopsClient#create_deploy_environment.' if logger

      raise "Missing the required parameter 'create_deploy_environment_details' when calling create_deploy_environment." if create_deploy_environment_details.nil?

      path = '/deployEnvironments'
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

      post_body = @api_client.object_to_http_body(create_deploy_environment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#create_deploy_environment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployEnvironment'
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


    # Creates a new deployment pipeline.
    # @param [OCI::Devops::Models::CreateDeployPipelineDetails] create_deploy_pipeline_details Details for the new deployment pipeline.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployPipeline DeployPipeline}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/create_deploy_pipeline.rb.html) to see an example of how to use create_deploy_pipeline API.
    def create_deploy_pipeline(create_deploy_pipeline_details, opts = {})
      logger.debug 'Calling operation DevopsClient#create_deploy_pipeline.' if logger

      raise "Missing the required parameter 'create_deploy_pipeline_details' when calling create_deploy_pipeline." if create_deploy_pipeline_details.nil?

      path = '/deployPipelines'
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

      post_body = @api_client.object_to_http_body(create_deploy_pipeline_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#create_deploy_pipeline') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployPipeline'
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


    # Creates a new deployment stage.
    # @param [OCI::Devops::Models::CreateDeployStageDetails] create_deploy_stage_details Details for the new DeployStage.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployStage DeployStage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/create_deploy_stage.rb.html) to see an example of how to use create_deploy_stage API.
    def create_deploy_stage(create_deploy_stage_details, opts = {})
      logger.debug 'Calling operation DevopsClient#create_deploy_stage.' if logger

      raise "Missing the required parameter 'create_deploy_stage_details' when calling create_deploy_stage." if create_deploy_stage_details.nil?

      path = '/deployStages'
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

      post_body = @api_client.object_to_http_body(create_deploy_stage_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#create_deploy_stage') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployStage'
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


    # Creates a new deployment.
    # @param [OCI::Devops::Models::CreateDeploymentDetails] create_deployment_details Details for the new deployment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Deployment Deployment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/create_deployment.rb.html) to see an example of how to use create_deployment API.
    def create_deployment(create_deployment_details, opts = {})
      logger.debug 'Calling operation DevopsClient#create_deployment.' if logger

      raise "Missing the required parameter 'create_deployment_details' when calling create_deployment." if create_deployment_details.nil?

      path = '/deployments'
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

      post_body = @api_client.object_to_http_body(create_deployment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#create_deployment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Deployment'
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


    # Creates a new project.
    # @param [OCI::Devops::Models::CreateProjectDetails] create_project_details Details for the new project.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Project Project}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/create_project.rb.html) to see an example of how to use create_project API.
    def create_project(create_project_details, opts = {})
      logger.debug 'Calling operation DevopsClient#create_project.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#create_project') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Project'
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


    # Creates a new repository.
    #
    # @param [OCI::Devops::Models::CreateRepositoryDetails] create_repository_details Details for the new repository.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Repository Repository}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/create_repository.rb.html) to see an example of how to use create_repository API.
    def create_repository(create_repository_details, opts = {})
      logger.debug 'Calling operation DevopsClient#create_repository.' if logger

      raise "Missing the required parameter 'create_repository_details' when calling create_repository." if create_repository_details.nil?

      path = '/repositories'
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

      post_body = @api_client.object_to_http_body(create_repository_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#create_repository') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Repository'
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


    # Creates a new trigger.
    #
    # @param [OCI::Devops::Models::CreateTriggerDetails] create_trigger_details Details for the new trigger.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::TriggerCreateResult TriggerCreateResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/create_trigger.rb.html) to see an example of how to use create_trigger API.
    def create_trigger(create_trigger_details, opts = {})
      logger.debug 'Calling operation DevopsClient#create_trigger.' if logger

      raise "Missing the required parameter 'create_trigger_details' when calling create_trigger." if create_trigger_details.nil?

      path = '/triggers'
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

      post_body = @api_client.object_to_http_body(create_trigger_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#create_trigger') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::TriggerCreateResult'
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


    # Deletes a build pipeline resource by identifier.
    # @param [String] build_pipeline_id Unique build pipeline identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/delete_build_pipeline.rb.html) to see an example of how to use delete_build_pipeline API.
    def delete_build_pipeline(build_pipeline_id, opts = {})
      logger.debug 'Calling operation DevopsClient#delete_build_pipeline.' if logger

      raise "Missing the required parameter 'build_pipeline_id' when calling delete_build_pipeline." if build_pipeline_id.nil?
      raise "Parameter value for 'build_pipeline_id' must not be blank" if OCI::Internal::Util.blank_string?(build_pipeline_id)

      path = '/buildPipelines/{buildPipelineId}'.sub('{buildPipelineId}', build_pipeline_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#delete_build_pipeline') do
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


    # Deletes a stage based on the stage ID provided in the request.
    # @param [String] build_pipeline_stage_id Unique stage identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/delete_build_pipeline_stage.rb.html) to see an example of how to use delete_build_pipeline_stage API.
    def delete_build_pipeline_stage(build_pipeline_stage_id, opts = {})
      logger.debug 'Calling operation DevopsClient#delete_build_pipeline_stage.' if logger

      raise "Missing the required parameter 'build_pipeline_stage_id' when calling delete_build_pipeline_stage." if build_pipeline_stage_id.nil?
      raise "Parameter value for 'build_pipeline_stage_id' must not be blank" if OCI::Internal::Util.blank_string?(build_pipeline_stage_id)

      path = '/buildPipelineStages/{buildPipelineStageId}'.sub('{buildPipelineStageId}', build_pipeline_stage_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#delete_build_pipeline_stage') do
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


    # Deletes a connection resource by identifier.
    # @param [String] connection_id Unique connection identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/delete_connection.rb.html) to see an example of how to use delete_connection API.
    def delete_connection(connection_id, opts = {})
      logger.debug 'Calling operation DevopsClient#delete_connection.' if logger

      raise "Missing the required parameter 'connection_id' when calling delete_connection." if connection_id.nil?
      raise "Parameter value for 'connection_id' must not be blank" if OCI::Internal::Util.blank_string?(connection_id)

      path = '/connections/{connectionId}'.sub('{connectionId}', connection_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#delete_connection') do
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


    # Deletes a deployment artifact resource by identifier.
    # @param [String] deploy_artifact_id Unique artifact identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/delete_deploy_artifact.rb.html) to see an example of how to use delete_deploy_artifact API.
    def delete_deploy_artifact(deploy_artifact_id, opts = {})
      logger.debug 'Calling operation DevopsClient#delete_deploy_artifact.' if logger

      raise "Missing the required parameter 'deploy_artifact_id' when calling delete_deploy_artifact." if deploy_artifact_id.nil?
      raise "Parameter value for 'deploy_artifact_id' must not be blank" if OCI::Internal::Util.blank_string?(deploy_artifact_id)

      path = '/deployArtifacts/{deployArtifactId}'.sub('{deployArtifactId}', deploy_artifact_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#delete_deploy_artifact') do
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


    # Deletes a deployment environment resource by identifier.
    # @param [String] deploy_environment_id Unique environment identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/delete_deploy_environment.rb.html) to see an example of how to use delete_deploy_environment API.
    def delete_deploy_environment(deploy_environment_id, opts = {})
      logger.debug 'Calling operation DevopsClient#delete_deploy_environment.' if logger

      raise "Missing the required parameter 'deploy_environment_id' when calling delete_deploy_environment." if deploy_environment_id.nil?
      raise "Parameter value for 'deploy_environment_id' must not be blank" if OCI::Internal::Util.blank_string?(deploy_environment_id)

      path = '/deployEnvironments/{deployEnvironmentId}'.sub('{deployEnvironmentId}', deploy_environment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#delete_deploy_environment') do
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


    # Deletes a deployment pipeline resource by identifier.
    # @param [String] deploy_pipeline_id Unique pipeline identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/delete_deploy_pipeline.rb.html) to see an example of how to use delete_deploy_pipeline API.
    def delete_deploy_pipeline(deploy_pipeline_id, opts = {})
      logger.debug 'Calling operation DevopsClient#delete_deploy_pipeline.' if logger

      raise "Missing the required parameter 'deploy_pipeline_id' when calling delete_deploy_pipeline." if deploy_pipeline_id.nil?
      raise "Parameter value for 'deploy_pipeline_id' must not be blank" if OCI::Internal::Util.blank_string?(deploy_pipeline_id)

      path = '/deployPipelines/{deployPipelineId}'.sub('{deployPipelineId}', deploy_pipeline_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#delete_deploy_pipeline') do
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


    # Deletes a deployment stage resource by identifier.
    # @param [String] deploy_stage_id Unique stage identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/delete_deploy_stage.rb.html) to see an example of how to use delete_deploy_stage API.
    def delete_deploy_stage(deploy_stage_id, opts = {})
      logger.debug 'Calling operation DevopsClient#delete_deploy_stage.' if logger

      raise "Missing the required parameter 'deploy_stage_id' when calling delete_deploy_stage." if deploy_stage_id.nil?
      raise "Parameter value for 'deploy_stage_id' must not be blank" if OCI::Internal::Util.blank_string?(deploy_stage_id)

      path = '/deployStages/{deployStageId}'.sub('{deployStageId}', deploy_stage_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#delete_deploy_stage') do
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


    # Deletes a project resource by identifier
    # @param [String] project_id Unique project identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/delete_project.rb.html) to see an example of how to use delete_project API.
    def delete_project(project_id, opts = {})
      logger.debug 'Calling operation DevopsClient#delete_project.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#delete_project') do
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


    # Deletes a Repository's Ref by its name. Returns an error if the name is ambiguous. Can be disambiguated by using full names like \"heads/<name>\" or \"tags/<name>\".
    # @param [String] repository_id Unique repository identifier.
    # @param [String] ref_name A filter to return only resources that match the given reference name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/delete_ref.rb.html) to see an example of how to use delete_ref API.
    def delete_ref(repository_id, ref_name, opts = {})
      logger.debug 'Calling operation DevopsClient#delete_ref.' if logger

      raise "Missing the required parameter 'repository_id' when calling delete_ref." if repository_id.nil?
      raise "Missing the required parameter 'ref_name' when calling delete_ref." if ref_name.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)
      raise "Parameter value for 'ref_name' must not be blank" if OCI::Internal::Util.blank_string?(ref_name)

      path = '/repositories/{repositoryId}/refs/{refName}'.sub('{repositoryId}', repository_id.to_s).sub('{refName}', ref_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#delete_ref') do
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


    # Deletes a repository resource by identifier.
    # @param [String] repository_id Unique repository identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/delete_repository.rb.html) to see an example of how to use delete_repository API.
    def delete_repository(repository_id, opts = {})
      logger.debug 'Calling operation DevopsClient#delete_repository.' if logger

      raise "Missing the required parameter 'repository_id' when calling delete_repository." if repository_id.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)

      path = '/repositories/{repositoryId}'.sub('{repositoryId}', repository_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#delete_repository') do
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


    # Deletes a trigger resource by identifier.
    # @param [String] trigger_id Unique trigger identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/delete_trigger.rb.html) to see an example of how to use delete_trigger API.
    def delete_trigger(trigger_id, opts = {})
      logger.debug 'Calling operation DevopsClient#delete_trigger.' if logger

      raise "Missing the required parameter 'trigger_id' when calling delete_trigger." if trigger_id.nil?
      raise "Parameter value for 'trigger_id' must not be blank" if OCI::Internal::Util.blank_string?(trigger_id)

      path = '/triggers/{triggerId}'.sub('{triggerId}', trigger_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#delete_trigger') do
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


    # Retrieves a build pipeline by identifier.
    # @param [String] build_pipeline_id Unique build pipeline identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::BuildPipeline BuildPipeline}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_build_pipeline.rb.html) to see an example of how to use get_build_pipeline API.
    def get_build_pipeline(build_pipeline_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_build_pipeline.' if logger

      raise "Missing the required parameter 'build_pipeline_id' when calling get_build_pipeline." if build_pipeline_id.nil?
      raise "Parameter value for 'build_pipeline_id' must not be blank" if OCI::Internal::Util.blank_string?(build_pipeline_id)

      path = '/buildPipelines/{buildPipelineId}'.sub('{buildPipelineId}', build_pipeline_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_build_pipeline') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::BuildPipeline'
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


    # Retrieves a stage based on the stage ID provided in the request.
    # @param [String] build_pipeline_stage_id Unique stage identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::BuildPipelineStage BuildPipelineStage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_build_pipeline_stage.rb.html) to see an example of how to use get_build_pipeline_stage API.
    def get_build_pipeline_stage(build_pipeline_stage_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_build_pipeline_stage.' if logger

      raise "Missing the required parameter 'build_pipeline_stage_id' when calling get_build_pipeline_stage." if build_pipeline_stage_id.nil?
      raise "Parameter value for 'build_pipeline_stage_id' must not be blank" if OCI::Internal::Util.blank_string?(build_pipeline_stage_id)

      path = '/buildPipelineStages/{buildPipelineStageId}'.sub('{buildPipelineStageId}', build_pipeline_stage_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_build_pipeline_stage') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::BuildPipelineStage'
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


    # Returns the details of a build run for a given build run ID.
    #
    # @param [String] build_run_id Unique build run identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::BuildRun BuildRun}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_build_run.rb.html) to see an example of how to use get_build_run API.
    def get_build_run(build_run_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_build_run.' if logger

      raise "Missing the required parameter 'build_run_id' when calling get_build_run." if build_run_id.nil?
      raise "Parameter value for 'build_run_id' must not be blank" if OCI::Internal::Util.blank_string?(build_run_id)

      path = '/buildRuns/{buildRunId}'.sub('{buildRunId}', build_run_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_build_run') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::BuildRun'
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


    # Retrieves a repository's commit by commit ID.
    # @param [String] repository_id Unique repository identifier.
    # @param [String] commit_id A filter to return only resources that match the given commit ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::RepositoryCommit RepositoryCommit}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_commit.rb.html) to see an example of how to use get_commit API.
    def get_commit(repository_id, commit_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_commit.' if logger

      raise "Missing the required parameter 'repository_id' when calling get_commit." if repository_id.nil?
      raise "Missing the required parameter 'commit_id' when calling get_commit." if commit_id.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)
      raise "Parameter value for 'commit_id' must not be blank" if OCI::Internal::Util.blank_string?(commit_id)

      path = '/repositories/{repositoryId}/commits/{commitId}'.sub('{repositoryId}', repository_id.to_s).sub('{commitId}', commit_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_commit') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::RepositoryCommit'
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


    # Compares two revisions for their differences. Supports comparison between two references or commits.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [String] target_version The commit or reference name where changes are coming from.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :base_version The commit or reference name to compare changes against. If base version is not provided, the difference goes against an empty tree.
    # @option opts [BOOLEAN] :is_comparison_from_merge_base Boolean value to indicate whether to use merge base or most recent revision.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DiffResponse DiffResponse}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_commit_diff.rb.html) to see an example of how to use get_commit_diff API.
    def get_commit_diff(repository_id, target_version, opts = {})
      logger.debug 'Calling operation DevopsClient#get_commit_diff.' if logger

      raise "Missing the required parameter 'repository_id' when calling get_commit_diff." if repository_id.nil?
      raise "Missing the required parameter 'target_version' when calling get_commit_diff." if target_version.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)

      path = '/repositories/{repositoryId}/diff'.sub('{repositoryId}', repository_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:targetVersion] = target_version
      query_params[:baseVersion] = opts[:base_version] if opts[:base_version]
      query_params[:isComparisonFromMergeBase] = opts[:is_comparison_from_merge_base] if !opts[:is_comparison_from_merge_base].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_commit_diff') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DiffResponse'
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


    # Retrieves a connection by identifier.
    # @param [String] connection_id Unique connection identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Connection Connection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_connection.rb.html) to see an example of how to use get_connection API.
    def get_connection(connection_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_connection.' if logger

      raise "Missing the required parameter 'connection_id' when calling get_connection." if connection_id.nil?
      raise "Parameter value for 'connection_id' must not be blank" if OCI::Internal::Util.blank_string?(connection_id)

      path = '/connections/{connectionId}'.sub('{connectionId}', connection_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_connection') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Connection'
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


    # Retrieves a deployment artifact by identifier.
    # @param [String] deploy_artifact_id Unique artifact identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployArtifact DeployArtifact}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_deploy_artifact.rb.html) to see an example of how to use get_deploy_artifact API.
    def get_deploy_artifact(deploy_artifact_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_deploy_artifact.' if logger

      raise "Missing the required parameter 'deploy_artifact_id' when calling get_deploy_artifact." if deploy_artifact_id.nil?
      raise "Parameter value for 'deploy_artifact_id' must not be blank" if OCI::Internal::Util.blank_string?(deploy_artifact_id)

      path = '/deployArtifacts/{deployArtifactId}'.sub('{deployArtifactId}', deploy_artifact_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_deploy_artifact') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployArtifact'
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


    # Retrieves a deployment environment by identifier.
    # @param [String] deploy_environment_id Unique environment identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployEnvironment DeployEnvironment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_deploy_environment.rb.html) to see an example of how to use get_deploy_environment API.
    def get_deploy_environment(deploy_environment_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_deploy_environment.' if logger

      raise "Missing the required parameter 'deploy_environment_id' when calling get_deploy_environment." if deploy_environment_id.nil?
      raise "Parameter value for 'deploy_environment_id' must not be blank" if OCI::Internal::Util.blank_string?(deploy_environment_id)

      path = '/deployEnvironments/{deployEnvironmentId}'.sub('{deployEnvironmentId}', deploy_environment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_deploy_environment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployEnvironment'
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


    # Retrieves a deployment pipeline by identifier.
    # @param [String] deploy_pipeline_id Unique pipeline identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployPipeline DeployPipeline}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_deploy_pipeline.rb.html) to see an example of how to use get_deploy_pipeline API.
    def get_deploy_pipeline(deploy_pipeline_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_deploy_pipeline.' if logger

      raise "Missing the required parameter 'deploy_pipeline_id' when calling get_deploy_pipeline." if deploy_pipeline_id.nil?
      raise "Parameter value for 'deploy_pipeline_id' must not be blank" if OCI::Internal::Util.blank_string?(deploy_pipeline_id)

      path = '/deployPipelines/{deployPipelineId}'.sub('{deployPipelineId}', deploy_pipeline_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_deploy_pipeline') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployPipeline'
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


    # Retrieves a deployment stage by identifier.
    # @param [String] deploy_stage_id Unique stage identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployStage DeployStage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_deploy_stage.rb.html) to see an example of how to use get_deploy_stage API.
    def get_deploy_stage(deploy_stage_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_deploy_stage.' if logger

      raise "Missing the required parameter 'deploy_stage_id' when calling get_deploy_stage." if deploy_stage_id.nil?
      raise "Parameter value for 'deploy_stage_id' must not be blank" if OCI::Internal::Util.blank_string?(deploy_stage_id)

      path = '/deployStages/{deployStageId}'.sub('{deployStageId}', deploy_stage_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_deploy_stage') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployStage'
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


    # Retrieves a deployment by identifier.
    # @param [String] deployment_id Unique deployment identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Deployment Deployment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_deployment.rb.html) to see an example of how to use get_deployment API.
    def get_deployment(deployment_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_deployment.' if logger

      raise "Missing the required parameter 'deployment_id' when calling get_deployment." if deployment_id.nil?
      raise "Parameter value for 'deployment_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_id)

      path = '/deployments/{deploymentId}'.sub('{deploymentId}', deployment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_deployment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Deployment'
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


    # Gets the line-by-line difference between files on different commits.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [String] file_path Path to a file within a repository.
    # @param [String] base_version The branch to compare changes against.
    # @param [String] target_version The branch where changes are coming from.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_comparison_from_merge_base Boolean to indicate whether to use merge base or most recent revision.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::FileDiffResponse FileDiffResponse}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_file_diff.rb.html) to see an example of how to use get_file_diff API.
    def get_file_diff(repository_id, file_path, base_version, target_version, opts = {})
      logger.debug 'Calling operation DevopsClient#get_file_diff.' if logger

      raise "Missing the required parameter 'repository_id' when calling get_file_diff." if repository_id.nil?
      raise "Missing the required parameter 'file_path' when calling get_file_diff." if file_path.nil?
      raise "Missing the required parameter 'base_version' when calling get_file_diff." if base_version.nil?
      raise "Missing the required parameter 'target_version' when calling get_file_diff." if target_version.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)
      raise "Parameter value for 'file_path' must not be blank" if OCI::Internal::Util.blank_string?(file_path)

      path = '/repositories/{repositoryId}/diffs/{filePath}'.sub('{repositoryId}', repository_id.to_s).sub('{filePath}', file_path.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:baseVersion] = base_version
      query_params[:targetVersion] = target_version
      query_params[:isComparisonFromMergeBase] = opts[:is_comparison_from_merge_base] if !opts[:is_comparison_from_merge_base].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_file_diff') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::FileDiffResponse'
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


    # Returns either current mirror record or last successful mirror record for a specific mirror repository.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [String] mirror_record_type The field of mirror record type. Only one mirror record type can be provided:
    #   current - The current mirror record.
    #   lastSuccessful - The last successful mirror record.
    #
    #   Allowed values are: current, lastSuccessful
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::RepositoryMirrorRecord RepositoryMirrorRecord}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_mirror_record.rb.html) to see an example of how to use get_mirror_record API.
    def get_mirror_record(repository_id, mirror_record_type, opts = {})
      logger.debug 'Calling operation DevopsClient#get_mirror_record.' if logger

      raise "Missing the required parameter 'repository_id' when calling get_mirror_record." if repository_id.nil?
      raise "Missing the required parameter 'mirror_record_type' when calling get_mirror_record." if mirror_record_type.nil?
      unless %w[current lastSuccessful].include?(mirror_record_type)
        raise "Invalid value for 'mirror_record_type', must be one of current, lastSuccessful."
      end
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)
      raise "Parameter value for 'mirror_record_type' must not be blank" if OCI::Internal::Util.blank_string?(mirror_record_type)

      path = '/repositories/{repositoryId}/mirrorRecords/{mirrorRecordType}'.sub('{repositoryId}', repository_id.to_s).sub('{mirrorRecordType}', mirror_record_type.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_mirror_record') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::RepositoryMirrorRecord'
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


    # Retrieves blob of specific branch name/commit ID and file path.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :file_path A filter to return only commits that affect any of the specified paths.
    # @option opts [String] :ref_name A filter to return only resources that match the given reference name.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::RepositoryObject RepositoryObject}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_object.rb.html) to see an example of how to use get_object API.
    def get_object(repository_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_object.' if logger

      raise "Missing the required parameter 'repository_id' when calling get_object." if repository_id.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)

      path = '/repositories/{repositoryId}/object'.sub('{repositoryId}', repository_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:filePath] = opts[:file_path] if opts[:file_path]
      query_params[:refName] = opts[:ref_name] if opts[:ref_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_object') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::RepositoryObject'
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


    # Retrieve contents of a specified object.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [String] sha The SHA of a blob or tree.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :file_path A filter to return only commits that affect any of the specified paths.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_object_content.rb.html) to see an example of how to use get_object_content API.
    def get_object_content(repository_id, sha, opts = {}, &block)
      logger.debug 'Calling operation DevopsClient#get_object_content.' if logger

      raise "Missing the required parameter 'repository_id' when calling get_object_content." if repository_id.nil?
      raise "Missing the required parameter 'sha' when calling get_object_content." if sha.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)
      raise "Parameter value for 'sha' must not be blank" if OCI::Internal::Util.blank_string?(sha)

      path = '/repositories/{repositoryId}/objects/{sha}/content'.sub('{repositoryId}', repository_id.to_s).sub('{sha}', sha.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:filePath] = opts[:file_path] if opts[:file_path]

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/json'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_object_content') do
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


    # Retrieves a project by identifier.
    # @param [String] project_id Unique project identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Project Project}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_project.rb.html) to see an example of how to use get_project API.
    def get_project(project_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_project.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_project') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Project'
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


    # Retrieves a repository's reference by its name with preference for branches over tags if the name is ambiguous. This can be disambiguated by using full names like \"heads/<name>\" or \"tags/<name>\".
    # @param [String] repository_id Unique repository identifier.
    # @param [String] ref_name A filter to return only resources that match the given reference name.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::RepositoryRef RepositoryRef}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_ref.rb.html) to see an example of how to use get_ref API.
    def get_ref(repository_id, ref_name, opts = {})
      logger.debug 'Calling operation DevopsClient#get_ref.' if logger

      raise "Missing the required parameter 'repository_id' when calling get_ref." if repository_id.nil?
      raise "Missing the required parameter 'ref_name' when calling get_ref." if ref_name.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)
      raise "Parameter value for 'ref_name' must not be blank" if OCI::Internal::Util.blank_string?(ref_name)

      path = '/repositories/{repositoryId}/refs/{refName}'.sub('{repositoryId}', repository_id.to_s).sub('{refName}', ref_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_ref') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::RepositoryRef'
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


    # Retrieves a repository by identifier.
    # @param [String] repository_id Unique repository identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @option opts [Array<String>] :fields Fields parameter can contain multiple flags useful in deciding the API functionality.
    #   Allowed values are: branchCount, commitCount, sizeInBytes
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Repository Repository}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_repository.rb.html) to see an example of how to use get_repository API.
    def get_repository(repository_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_repository.' if logger

      raise "Missing the required parameter 'repository_id' when calling get_repository." if repository_id.nil?


      fields_allowable_values = %w[branchCount commitCount sizeInBytes]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of branchCount, commitCount, sizeInBytes.'
          end
        end
      end
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)

      path = '/repositories/{repositoryId}'.sub('{repositoryId}', repository_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_repository') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Repository'
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


    # Returns the archived repository information.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :ref_name A filter to return only resources that match the given reference name.
    # @option opts [String] :format The archive format query parameter for downloading repository endpoint.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_repository_archive_content.rb.html) to see an example of how to use get_repository_archive_content API.
    def get_repository_archive_content(repository_id, opts = {}, &block)
      logger.debug 'Calling operation DevopsClient#get_repository_archive_content.' if logger

      raise "Missing the required parameter 'repository_id' when calling get_repository_archive_content." if repository_id.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)

      path = '/repositories/{repositoryId}/archive/content'.sub('{repositoryId}', repository_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:refName] = opts[:ref_name] if opts[:ref_name]
      query_params[:format] = opts[:format] if opts[:format]

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/json'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_repository_archive_content') do
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


    # Retrieve lines of a specified file. Supports starting line number and limit.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [String] file_path Path to a file within a repository.
    # @param [String] revision Retrieve file lines from specific revision.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :start_line_number Line number from where to start returning file lines. (default to 1)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::RepositoryFileLines RepositoryFileLines}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_repository_file_lines.rb.html) to see an example of how to use get_repository_file_lines API.
    def get_repository_file_lines(repository_id, file_path, revision, opts = {})
      logger.debug 'Calling operation DevopsClient#get_repository_file_lines.' if logger

      raise "Missing the required parameter 'repository_id' when calling get_repository_file_lines." if repository_id.nil?
      raise "Missing the required parameter 'file_path' when calling get_repository_file_lines." if file_path.nil?
      raise "Missing the required parameter 'revision' when calling get_repository_file_lines." if revision.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)
      raise "Parameter value for 'file_path' must not be blank" if OCI::Internal::Util.blank_string?(file_path)

      path = '/repositories/{repositoryId}/files/{filePath}/lines'.sub('{repositoryId}', repository_id.to_s).sub('{filePath}', file_path.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:revision] = revision
      query_params[:startLineNumber] = opts[:start_line_number] if opts[:start_line_number]
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_repository_file_lines') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::RepositoryFileLines'
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


    # Retrieves a trigger by identifier.
    # @param [String] trigger_id Unique trigger identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Trigger Trigger}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_trigger.rb.html) to see an example of how to use get_trigger API.
    def get_trigger(trigger_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_trigger.' if logger

      raise "Missing the required parameter 'trigger_id' when calling get_trigger." if trigger_id.nil?
      raise "Parameter value for 'trigger_id' must not be blank" if OCI::Internal::Util.blank_string?(trigger_id)

      path = '/triggers/{triggerId}'.sub('{triggerId}', trigger_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_trigger') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Trigger'
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
    # @param [String] work_request_id The ID of the asynchronous work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation DevopsClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::WorkRequest'
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


    # Retrieve a list of all the authors.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :ref_name A filter to return only resources that match the given reference name.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::RepositoryAuthorCollection RepositoryAuthorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_authors.rb.html) to see an example of how to use list_authors API.
    def list_authors(repository_id, opts = {})
      logger.debug 'Calling operation DevopsClient#list_authors.' if logger

      raise "Missing the required parameter 'repository_id' when calling list_authors." if repository_id.nil?

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)

      path = '/repositories/{repositoryId}/authors'.sub('{repositoryId}', repository_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:refName] = opts[:ref_name] if opts[:ref_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_authors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::RepositoryAuthorCollection'
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


    # Returns a list of all stages in a compartment or build pipeline.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :id Unique identifier or OCID for listing a single resource by ID.
    # @option opts [String] :build_pipeline_id The OCID of the parent build pipeline.
    # @option opts [String] :compartment_id The OCID of the compartment in which to list resources.
    # @option opts [String] :lifecycle_state A filter to return the stages that matches the given lifecycle state.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for time created is descending. Default order for display name is ascending. If no value is specified, then the default time created value is considered. (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::BuildPipelineStageCollection BuildPipelineStageCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_build_pipeline_stages.rb.html) to see an example of how to use list_build_pipeline_stages API.
    def list_build_pipeline_stages(opts = {})
      logger.debug 'Calling operation DevopsClient#list_build_pipeline_stages.' if logger


      if opts[:lifecycle_state] && !OCI::Devops::Models::BuildPipelineStage::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Devops::Models::BuildPipelineStage::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/buildPipelineStages'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:buildPipelineId] = opts[:build_pipeline_id] if opts[:build_pipeline_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_build_pipeline_stages') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::BuildPipelineStageCollection'
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


    # Returns a list of build pipelines.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :id Unique identifier or OCID for listing a single resource by ID.
    # @option opts [String] :project_id unique project identifier
    # @option opts [String] :compartment_id The OCID of the compartment in which to list resources.
    # @option opts [String] :lifecycle_state A filter to return only build pipelines that matches the given lifecycle state.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for time created is descending. Default order for display name is ascending. If no value is specified, then the default time created value is considered. (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::BuildPipelineCollection BuildPipelineCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_build_pipelines.rb.html) to see an example of how to use list_build_pipelines API.
    def list_build_pipelines(opts = {})
      logger.debug 'Calling operation DevopsClient#list_build_pipelines.' if logger


      if opts[:lifecycle_state] && !OCI::Devops::Models::BuildPipeline::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Devops::Models::BuildPipeline::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/buildPipelines'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:projectId] = opts[:project_id] if opts[:project_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_build_pipelines') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::BuildPipelineCollection'
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


    # Returns a list of build run summary.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :id Unique identifier or OCID for listing a single resource by ID.
    # @option opts [String] :build_pipeline_id Unique build pipeline identifier.
    # @option opts [String] :project_id unique project identifier
    # @option opts [String] :compartment_id The OCID of the compartment in which to list resources.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :lifecycle_state A filter to return only build runs that matches the given lifecycle state.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for time created is descending. Default order for display name is ascending. If no value is specified, then the default time created value is considered. (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::BuildRunSummaryCollection BuildRunSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_build_runs.rb.html) to see an example of how to use list_build_runs API.
    def list_build_runs(opts = {})
      logger.debug 'Calling operation DevopsClient#list_build_runs.' if logger


      if opts[:lifecycle_state] && !OCI::Devops::Models::BuildRun::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Devops::Models::BuildRun::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/buildRuns'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:buildPipelineId] = opts[:build_pipeline_id] if opts[:build_pipeline_id]
      query_params[:projectId] = opts[:project_id] if opts[:project_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_build_runs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::BuildRunSummaryCollection'
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


    # Compares two revisions and lists the differences. Supports comparison between two references or commits.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [String] base_version The commit or reference name to compare changes against.
    # @param [String] target_version The commit or reference name where changes are coming from.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_comparison_from_merge_base Boolean value to indicate whether to use merge base or most recent revision.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DiffCollection DiffCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_commit_diffs.rb.html) to see an example of how to use list_commit_diffs API.
    def list_commit_diffs(repository_id, base_version, target_version, opts = {})
      logger.debug 'Calling operation DevopsClient#list_commit_diffs.' if logger

      raise "Missing the required parameter 'repository_id' when calling list_commit_diffs." if repository_id.nil?
      raise "Missing the required parameter 'base_version' when calling list_commit_diffs." if base_version.nil?
      raise "Missing the required parameter 'target_version' when calling list_commit_diffs." if target_version.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)

      path = '/repositories/{repositoryId}/diffs'.sub('{repositoryId}', repository_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:baseVersion] = base_version
      query_params[:targetVersion] = target_version
      query_params[:isComparisonFromMergeBase] = opts[:is_comparison_from_merge_base] if !opts[:is_comparison_from_merge_base].nil?
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_commit_diffs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DiffCollection'
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


    # Returns a list of commits.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :ref_name A filter to return only resources that match the given reference name.
    # @option opts [String] :exclude_ref_name A filter to exclude commits that match the given reference name.
    # @option opts [String] :file_path A filter to return only commits that affect any of the specified paths.
    # @option opts [DateTime] :timestamp_greater_than_or_equal_to A filter to return commits only created after the specified timestamp value.
    # @option opts [DateTime] :timestamp_less_than_or_equal_to A filter to return commits only created before the specified timestamp value.
    # @option opts [String] :commit_message A filter to return any commits that contains the given message.
    # @option opts [String] :author_name A filter to return any commits that are pushed by the requested author.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::RepositoryCommitCollection RepositoryCommitCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_commits.rb.html) to see an example of how to use list_commits API.
    def list_commits(repository_id, opts = {})
      logger.debug 'Calling operation DevopsClient#list_commits.' if logger

      raise "Missing the required parameter 'repository_id' when calling list_commits." if repository_id.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)

      path = '/repositories/{repositoryId}/commits'.sub('{repositoryId}', repository_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:refName] = opts[:ref_name] if opts[:ref_name]
      query_params[:excludeRefName] = opts[:exclude_ref_name] if opts[:exclude_ref_name]
      query_params[:filePath] = opts[:file_path] if opts[:file_path]
      query_params[:timestampGreaterThanOrEqualTo] = opts[:timestamp_greater_than_or_equal_to] if opts[:timestamp_greater_than_or_equal_to]
      query_params[:timestampLessThanOrEqualTo] = opts[:timestamp_less_than_or_equal_to] if opts[:timestamp_less_than_or_equal_to]
      query_params[:commitMessage] = opts[:commit_message] if opts[:commit_message]
      query_params[:authorName] = opts[:author_name] if opts[:author_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_commits') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::RepositoryCommitCollection'
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


    # Returns a list of connections.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :id Unique identifier or OCID for listing a single resource by ID.
    # @option opts [String] :project_id unique project identifier
    # @option opts [String] :compartment_id The OCID of the compartment in which to list resources.
    # @option opts [String] :lifecycle_state A filter to return only connections that matches the given lifecycle state.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :connection_type A filter to return only resources that match the given connection type.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for time created is descending. Default order for display name is ascending. If no value is specified, then the default time created value is considered. (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::ConnectionCollection ConnectionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_connections.rb.html) to see an example of how to use list_connections API.
    def list_connections(opts = {})
      logger.debug 'Calling operation DevopsClient#list_connections.' if logger


      if opts[:lifecycle_state] && !OCI::Devops::Models::Connection::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Devops::Models::Connection::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:connection_type] && !OCI::Devops::Models::Connection::CONNECTION_TYPE_ENUM.include?(opts[:connection_type])
        raise 'Invalid value for "connection_type", must be one of the values in OCI::Devops::Models::Connection::CONNECTION_TYPE_ENUM.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/connections'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:projectId] = opts[:project_id] if opts[:project_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:connectionType] = opts[:connection_type] if opts[:connection_type]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_connections') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::ConnectionCollection'
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


    # Returns a list of deployment artifacts.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :id Unique identifier or OCID for listing a single resource by ID.
    # @option opts [String] :project_id unique project identifier
    # @option opts [String] :compartment_id The OCID of the compartment in which to list resources.
    # @option opts [String] :lifecycle_state A filter to return only DeployArtifacts that matches the given lifecycleState.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for time created is descending. Default order for display name is ascending. If no value is specified, then the default time created value is considered. (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployArtifactCollection DeployArtifactCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_deploy_artifacts.rb.html) to see an example of how to use list_deploy_artifacts API.
    def list_deploy_artifacts(opts = {})
      logger.debug 'Calling operation DevopsClient#list_deploy_artifacts.' if logger


      if opts[:lifecycle_state] && !OCI::Devops::Models::DeployArtifact::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Devops::Models::DeployArtifact::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/deployArtifacts'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:projectId] = opts[:project_id] if opts[:project_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_deploy_artifacts') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployArtifactCollection'
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


    # Returns a list of deployment environments.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :project_id unique project identifier
    # @option opts [String] :compartment_id The OCID of the compartment in which to list resources.
    # @option opts [String] :id Unique identifier or OCID for listing a single resource by ID.
    # @option opts [String] :lifecycle_state A filter to return only DeployEnvironments that matches the given lifecycleState.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for time created is descending. Default order for display name is ascending. If no value is specified, then the default time created value is considered. (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployEnvironmentCollection DeployEnvironmentCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_deploy_environments.rb.html) to see an example of how to use list_deploy_environments API.
    def list_deploy_environments(opts = {})
      logger.debug 'Calling operation DevopsClient#list_deploy_environments.' if logger


      if opts[:lifecycle_state] && !OCI::Devops::Models::DeployEnvironment::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Devops::Models::DeployEnvironment::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/deployEnvironments'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:projectId] = opts[:project_id] if opts[:project_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:id] = opts[:id] if opts[:id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_deploy_environments') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployEnvironmentCollection'
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


    # Returns a list of deployment pipelines.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :id Unique identifier or OCID for listing a single resource by ID.
    # @option opts [String] :project_id unique project identifier
    # @option opts [String] :compartment_id The OCID of the compartment in which to list resources.
    # @option opts [String] :lifecycle_state A filter to return only DeployPipelines that matches the given lifecycleState.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for time created is descending. Default order for display name is ascending. If no value is specified, then the default time created value is considered. (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployPipelineCollection DeployPipelineCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_deploy_pipelines.rb.html) to see an example of how to use list_deploy_pipelines API.
    def list_deploy_pipelines(opts = {})
      logger.debug 'Calling operation DevopsClient#list_deploy_pipelines.' if logger


      if opts[:lifecycle_state] && !OCI::Devops::Models::DeployPipeline::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Devops::Models::DeployPipeline::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/deployPipelines'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:projectId] = opts[:project_id] if opts[:project_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_deploy_pipelines') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployPipelineCollection'
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


    # Retrieves a list of deployment stages.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :id Unique identifier or OCID for listing a single resource by ID.
    # @option opts [String] :deploy_pipeline_id The ID of the parent pipeline.
    # @option opts [String] :compartment_id The OCID of the compartment in which to list resources.
    # @option opts [String] :lifecycle_state A filter to return only deployment stages that matches the given lifecycle state.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for time created is descending. Default order for display name is ascending. If no value is specified, then the default time created value is considered. (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployStageCollection DeployStageCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_deploy_stages.rb.html) to see an example of how to use list_deploy_stages API.
    def list_deploy_stages(opts = {})
      logger.debug 'Calling operation DevopsClient#list_deploy_stages.' if logger


      if opts[:lifecycle_state] && !OCI::Devops::Models::DeployStage::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Devops::Models::DeployStage::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/deployStages'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:deployPipelineId] = opts[:deploy_pipeline_id] if opts[:deploy_pipeline_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_deploy_stages') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployStageCollection'
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


    # Returns a list of deployments.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :deploy_pipeline_id The ID of the parent pipeline.
    # @option opts [String] :id Unique identifier or OCID for listing a single resource by ID.
    # @option opts [String] :compartment_id The OCID of the compartment in which to list resources.
    # @option opts [String] :project_id unique project identifier
    # @option opts [String] :lifecycle_state A filter to return only Deployments that matches the given lifecycleState.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for time created is descending. Default order for display name is ascending. If no value is specified, then the default time created value is considered. (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @option opts [DateTime] :time_created_less_than Search for DevOps resources that were created before a specific date. Specifying this parameter corresponding to `timeCreatedLessThan` parameter will retrieve all assessments created before the specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as defined by [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339).
    # @option opts [DateTime] :time_created_greater_than_or_equal_to Search for DevOps resources that were created after a specific date. Specifying this parameter corresponding to `timeCreatedGreaterThanOrEqualTo` parameter will retrieve all security assessments created after the specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as defined by [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339).
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeploymentCollection DeploymentCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_deployments.rb.html) to see an example of how to use list_deployments API.
    def list_deployments(opts = {})
      logger.debug 'Calling operation DevopsClient#list_deployments.' if logger


      if opts[:lifecycle_state] && !OCI::Devops::Models::Deployment::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Devops::Models::Deployment::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/deployments'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:deployPipelineId] = opts[:deploy_pipeline_id] if opts[:deploy_pipeline_id]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:projectId] = opts[:project_id] if opts[:project_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_deployments') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeploymentCollection'
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


    # Returns a list of mirror entry in history within 30 days.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::RepositoryMirrorRecordCollection RepositoryMirrorRecordCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_mirror_records.rb.html) to see an example of how to use list_mirror_records API.
    def list_mirror_records(repository_id, opts = {})
      logger.debug 'Calling operation DevopsClient#list_mirror_records.' if logger

      raise "Missing the required parameter 'repository_id' when calling list_mirror_records." if repository_id.nil?

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)

      path = '/repositories/{repositoryId}/mirrorRecords'.sub('{repositoryId}', repository_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_mirror_records') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::RepositoryMirrorRecordCollection'
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


    # Retrieves a list of files and directories in a repository.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :ref The name of branch/tag or commit hash it points to. If names conflict, order of preference is commit > branch > tag.
    #   You can disambiguate with \"heads/foobar\" and \"tags/foobar\". If left blank repository's default branch will be used.
    #
    # @option opts [BOOLEAN] :paths_in_subtree Flag to determine if files must be retrived recursively. Flag is False by default.
    # @option opts [String] :folder_path The fully qualified path to the folder whose contents are returned, including the folder name. For example, /examples is a fully-qualified path to a folder named examples that was created off of the root directory (/) of a repository.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order is ascending. If no value is specified name is default.
    #    (default to name)
    #   Allowed values are: type, sizeInBytes, name
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::RepositoryPathCollection RepositoryPathCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_paths.rb.html) to see an example of how to use list_paths API.
    def list_paths(repository_id, opts = {})
      logger.debug 'Calling operation DevopsClient#list_paths.' if logger

      raise "Missing the required parameter 'repository_id' when calling list_paths." if repository_id.nil?

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[type sizeInBytes name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of type, sizeInBytes, name.'
      end
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)

      path = '/repositories/{repositoryId}/paths'.sub('{repositoryId}', repository_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:ref] = opts[:ref] if opts[:ref]
      query_params[:pathsInSubtree] = opts[:paths_in_subtree] if !opts[:paths_in_subtree].nil?
      query_params[:folderPath] = opts[:folder_path] if opts[:folder_path]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_paths') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::RepositoryPathCollection'
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


    # Returns a list of projects.
    # @param [String] compartment_id The OCID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :id Unique identifier or OCID for listing a single resource by ID.
    # @option opts [String] :lifecycle_state A filter to return only Projects that matches the given lifecycleState.
    # @option opts [String] :name A filter to return only resources that match the entire name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for time created is descending. Default order for display name is ascending. If no value is specified, then the default time created value is considered. (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::ProjectCollection ProjectCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_projects.rb.html) to see an example of how to use list_projects API.
    def list_projects(compartment_id, opts = {})
      logger.debug 'Calling operation DevopsClient#list_projects.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_projects." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Devops::Models::Project::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Devops::Models::Project::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
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
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_projects') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::ProjectCollection'
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


    # Returns a list of references.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :ref_type Reference type to distinguish between branch and tag. If it is not specified, all references are returned.
    #   Allowed values are: BRANCH, TAG
    # @option opts [String] :commit_id Commit ID in a repository.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :ref_name A filter to return only resources that match the given reference name.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for reference name is ascending. Default order for reference type is ascending. If no value is specified reference name is default.
    #    (default to refName)
    #   Allowed values are: refType, refName
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::RepositoryRefCollection RepositoryRefCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_refs.rb.html) to see an example of how to use list_refs API.
    def list_refs(repository_id, opts = {})
      logger.debug 'Calling operation DevopsClient#list_refs.' if logger

      raise "Missing the required parameter 'repository_id' when calling list_refs." if repository_id.nil?

      if opts[:ref_type] && !%w[BRANCH TAG].include?(opts[:ref_type])
        raise 'Invalid value for "ref_type", must be one of BRANCH, TAG.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[refType refName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of refType, refName.'
      end
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)

      path = '/repositories/{repositoryId}/refs'.sub('{repositoryId}', repository_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:refType] = opts[:ref_type] if opts[:ref_type]
      query_params[:commitId] = opts[:commit_id] if opts[:commit_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:refName] = opts[:ref_name] if opts[:ref_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_refs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::RepositoryRefCollection'
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


    # Returns a list of repositories given a compartment ID or a project ID.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The OCID of the compartment in which to list resources.
    # @option opts [String] :project_id unique project identifier
    # @option opts [String] :repository_id Unique repository identifier.
    # @option opts [String] :lifecycle_state A filter to return only resources whose lifecycle state matches the given lifecycle state.
    # @option opts [String] :name A filter to return only resources that match the entire name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for time created is descending. Default order for name is ascending. If no value is specified time created is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, name
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::RepositoryCollection RepositoryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_repositories.rb.html) to see an example of how to use list_repositories API.
    def list_repositories(opts = {})
      logger.debug 'Calling operation DevopsClient#list_repositories.' if logger


      if opts[:lifecycle_state] && !OCI::Devops::Models::Repository::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Devops::Models::Repository::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, name.'
      end

      path = '/repositories'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:projectId] = opts[:project_id] if opts[:project_id]
      query_params[:repositoryId] = opts[:repository_id] if opts[:repository_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_repositories') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::RepositoryCollection'
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


    # Returns a list of triggers.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The OCID of the compartment in which to list resources.
    # @option opts [String] :project_id unique project identifier
    # @option opts [String] :lifecycle_state A filter to return only triggers that matches the given lifecycle state.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :id Unique trigger identifier.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for time created is descending. Default order for display name is ascending. If no value is specified, then the default time created value is considered. (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::TriggerCollection TriggerCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_triggers.rb.html) to see an example of how to use list_triggers API.
    def list_triggers(opts = {})
      logger.debug 'Calling operation DevopsClient#list_triggers.' if logger


      if opts[:lifecycle_state] && !OCI::Devops::Models::Trigger::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Devops::Models::Trigger::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/triggers'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:projectId] = opts[:project_id] if opts[:project_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_triggers') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::TriggerCollection'
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


    # Returns a list of errors for a given work request.
    # @param [String] work_request_id The ID of the asynchronous work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. Default sort order is descending and is based on the timeAccepted field. (default to timeAccepted)
    #   Allowed values are: timeAccepted
    # @return [Response] A Response object with data of type {OCI::Devops::Models::WorkRequestErrorCollection WorkRequestErrorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation DevopsClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeAccepted].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeAccepted.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::WorkRequestErrorCollection'
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


    # Returns a list of logs for a given work request.
    # @param [String] work_request_id The ID of the asynchronous work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. Default sort order is descending and is based on the timeAccepted field. (default to timeAccepted)
    #   Allowed values are: timeAccepted
    # @return [Response] A Response object with data of type {OCI::Devops::Models::WorkRequestLogEntryCollection WorkRequestLogEntryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation DevopsClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeAccepted].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeAccepted.'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::WorkRequestLogEntryCollection'
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
    # @param [String] compartment_id The OCID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :work_request_id The ID of the asynchronous work request.
    # @option opts [String] :status A filter to return only resources where the lifecycle state matches the given operation status.
    # @option opts [String] :resource_id The ID of the resource affected by the work request.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :sort_order The sort order to use. Use either ascending or descending. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. Default sort order is descending and is based on the timeAccepted field. (default to timeAccepted)
    #   Allowed values are: timeAccepted
    # @return [Response] A Response object with data of type {OCI::Devops::Models::WorkRequestCollection WorkRequestCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation DevopsClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      if opts[:status] && !OCI::Devops::Models::OPERATION_STATUS_ENUM.include?(opts[:status])
        raise 'Invalid value for "status", must be one of the values in OCI::Devops::Models::OPERATION_STATUS_ENUM.'
      end

      if opts[:sort_order] && !OCI::Devops::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Devops::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeAccepted].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeAccepted.'
      end

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:workRequestId] = opts[:work_request_id] if opts[:work_request_id]
      query_params[:status] = opts[:status] if opts[:status]
      query_params[:resourceId] = opts[:resource_id] if opts[:resource_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::WorkRequestCollection'
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


    # Synchronize a mirrored repository to the latest version from external providers.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/mirror_repository.rb.html) to see an example of how to use mirror_repository API.
    def mirror_repository(repository_id, opts = {})
      logger.debug 'Calling operation DevopsClient#mirror_repository.' if logger

      raise "Missing the required parameter 'repository_id' when calling mirror_repository." if repository_id.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)

      path = '/repositories/{repositoryId}/actions/mirror'.sub('{repositoryId}', repository_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#mirror_repository') do
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


    # Creates a new reference or updates an existing one.
    #
    # @param [String] repository_id Unique repository identifier.
    # @param [String] ref_name A filter to return only resources that match the given reference name.
    # @param [OCI::Devops::Models::PutRepositoryRefDetails] put_repository_ref_details The information to create a reference with the type specified in the query.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated earlier due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::RepositoryRef RepositoryRef}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/put_repository_ref.rb.html) to see an example of how to use put_repository_ref API.
    def put_repository_ref(repository_id, ref_name, put_repository_ref_details, opts = {})
      logger.debug 'Calling operation DevopsClient#put_repository_ref.' if logger

      raise "Missing the required parameter 'repository_id' when calling put_repository_ref." if repository_id.nil?
      raise "Missing the required parameter 'ref_name' when calling put_repository_ref." if ref_name.nil?
      raise "Missing the required parameter 'put_repository_ref_details' when calling put_repository_ref." if put_repository_ref_details.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)
      raise "Parameter value for 'ref_name' must not be blank" if OCI::Internal::Util.blank_string?(ref_name)

      path = '/repositories/{repositoryId}/refs/{refName}'.sub('{repositoryId}', repository_id.to_s).sub('{refName}', ref_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(put_repository_ref_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#put_repository_ref') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::RepositoryRef'
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


    # Updates the build pipeline.
    # @param [String] build_pipeline_id Unique build pipeline identifier.
    # @param [OCI::Devops::Models::UpdateBuildPipelineDetails] update_build_pipeline_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::BuildPipeline BuildPipeline}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/update_build_pipeline.rb.html) to see an example of how to use update_build_pipeline API.
    def update_build_pipeline(build_pipeline_id, update_build_pipeline_details, opts = {})
      logger.debug 'Calling operation DevopsClient#update_build_pipeline.' if logger

      raise "Missing the required parameter 'build_pipeline_id' when calling update_build_pipeline." if build_pipeline_id.nil?
      raise "Missing the required parameter 'update_build_pipeline_details' when calling update_build_pipeline." if update_build_pipeline_details.nil?
      raise "Parameter value for 'build_pipeline_id' must not be blank" if OCI::Internal::Util.blank_string?(build_pipeline_id)

      path = '/buildPipelines/{buildPipelineId}'.sub('{buildPipelineId}', build_pipeline_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_build_pipeline_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#update_build_pipeline') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::BuildPipeline'
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


    # Updates the stage based on the stage ID provided in the request.
    # @param [String] build_pipeline_stage_id Unique stage identifier.
    # @param [OCI::Devops::Models::UpdateBuildPipelineStageDetails] update_build_pipeline_stage_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::BuildPipelineStage BuildPipelineStage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/update_build_pipeline_stage.rb.html) to see an example of how to use update_build_pipeline_stage API.
    def update_build_pipeline_stage(build_pipeline_stage_id, update_build_pipeline_stage_details, opts = {})
      logger.debug 'Calling operation DevopsClient#update_build_pipeline_stage.' if logger

      raise "Missing the required parameter 'build_pipeline_stage_id' when calling update_build_pipeline_stage." if build_pipeline_stage_id.nil?
      raise "Missing the required parameter 'update_build_pipeline_stage_details' when calling update_build_pipeline_stage." if update_build_pipeline_stage_details.nil?
      raise "Parameter value for 'build_pipeline_stage_id' must not be blank" if OCI::Internal::Util.blank_string?(build_pipeline_stage_id)

      path = '/buildPipelineStages/{buildPipelineStageId}'.sub('{buildPipelineStageId}', build_pipeline_stage_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_build_pipeline_stage_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#update_build_pipeline_stage') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::BuildPipelineStage'
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


    # Updates the build run.
    # @param [String] build_run_id Unique build run identifier.
    # @param [OCI::Devops::Models::UpdateBuildRunDetails] update_build_run_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::BuildRun BuildRun}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/update_build_run.rb.html) to see an example of how to use update_build_run API.
    def update_build_run(build_run_id, update_build_run_details, opts = {})
      logger.debug 'Calling operation DevopsClient#update_build_run.' if logger

      raise "Missing the required parameter 'build_run_id' when calling update_build_run." if build_run_id.nil?
      raise "Missing the required parameter 'update_build_run_details' when calling update_build_run." if update_build_run_details.nil?
      raise "Parameter value for 'build_run_id' must not be blank" if OCI::Internal::Util.blank_string?(build_run_id)

      path = '/buildRuns/{buildRunId}'.sub('{buildRunId}', build_run_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_build_run_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#update_build_run') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::BuildRun'
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


    # Updates the connection.
    # @param [String] connection_id Unique connection identifier.
    # @param [OCI::Devops::Models::UpdateConnectionDetails] update_connection_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Connection Connection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/update_connection.rb.html) to see an example of how to use update_connection API.
    def update_connection(connection_id, update_connection_details, opts = {})
      logger.debug 'Calling operation DevopsClient#update_connection.' if logger

      raise "Missing the required parameter 'connection_id' when calling update_connection." if connection_id.nil?
      raise "Missing the required parameter 'update_connection_details' when calling update_connection." if update_connection_details.nil?
      raise "Parameter value for 'connection_id' must not be blank" if OCI::Internal::Util.blank_string?(connection_id)

      path = '/connections/{connectionId}'.sub('{connectionId}', connection_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#update_connection') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Connection'
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


    # Updates the deployment artifact.
    # @param [String] deploy_artifact_id Unique artifact identifier.
    # @param [OCI::Devops::Models::UpdateDeployArtifactDetails] update_deploy_artifact_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployArtifact DeployArtifact}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/update_deploy_artifact.rb.html) to see an example of how to use update_deploy_artifact API.
    def update_deploy_artifact(deploy_artifact_id, update_deploy_artifact_details, opts = {})
      logger.debug 'Calling operation DevopsClient#update_deploy_artifact.' if logger

      raise "Missing the required parameter 'deploy_artifact_id' when calling update_deploy_artifact." if deploy_artifact_id.nil?
      raise "Missing the required parameter 'update_deploy_artifact_details' when calling update_deploy_artifact." if update_deploy_artifact_details.nil?
      raise "Parameter value for 'deploy_artifact_id' must not be blank" if OCI::Internal::Util.blank_string?(deploy_artifact_id)

      path = '/deployArtifacts/{deployArtifactId}'.sub('{deployArtifactId}', deploy_artifact_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_deploy_artifact_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#update_deploy_artifact') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployArtifact'
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


    # Updates the deployment environment.
    # @param [String] deploy_environment_id Unique environment identifier.
    # @param [OCI::Devops::Models::UpdateDeployEnvironmentDetails] update_deploy_environment_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployEnvironment DeployEnvironment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/update_deploy_environment.rb.html) to see an example of how to use update_deploy_environment API.
    def update_deploy_environment(deploy_environment_id, update_deploy_environment_details, opts = {})
      logger.debug 'Calling operation DevopsClient#update_deploy_environment.' if logger

      raise "Missing the required parameter 'deploy_environment_id' when calling update_deploy_environment." if deploy_environment_id.nil?
      raise "Missing the required parameter 'update_deploy_environment_details' when calling update_deploy_environment." if update_deploy_environment_details.nil?
      raise "Parameter value for 'deploy_environment_id' must not be blank" if OCI::Internal::Util.blank_string?(deploy_environment_id)

      path = '/deployEnvironments/{deployEnvironmentId}'.sub('{deployEnvironmentId}', deploy_environment_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_deploy_environment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#update_deploy_environment') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployEnvironment'
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


    # Updates the deployment pipeline.
    # @param [String] deploy_pipeline_id Unique pipeline identifier.
    # @param [OCI::Devops::Models::UpdateDeployPipelineDetails] update_deploy_pipeline_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployPipeline DeployPipeline}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/update_deploy_pipeline.rb.html) to see an example of how to use update_deploy_pipeline API.
    def update_deploy_pipeline(deploy_pipeline_id, update_deploy_pipeline_details, opts = {})
      logger.debug 'Calling operation DevopsClient#update_deploy_pipeline.' if logger

      raise "Missing the required parameter 'deploy_pipeline_id' when calling update_deploy_pipeline." if deploy_pipeline_id.nil?
      raise "Missing the required parameter 'update_deploy_pipeline_details' when calling update_deploy_pipeline." if update_deploy_pipeline_details.nil?
      raise "Parameter value for 'deploy_pipeline_id' must not be blank" if OCI::Internal::Util.blank_string?(deploy_pipeline_id)

      path = '/deployPipelines/{deployPipelineId}'.sub('{deployPipelineId}', deploy_pipeline_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_deploy_pipeline_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#update_deploy_pipeline') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployPipeline'
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


    # Updates the deployment stage.
    # @param [String] deploy_stage_id Unique stage identifier.
    # @param [OCI::Devops::Models::UpdateDeployStageDetails] update_deploy_stage_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::DeployStage DeployStage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/update_deploy_stage.rb.html) to see an example of how to use update_deploy_stage API.
    def update_deploy_stage(deploy_stage_id, update_deploy_stage_details, opts = {})
      logger.debug 'Calling operation DevopsClient#update_deploy_stage.' if logger

      raise "Missing the required parameter 'deploy_stage_id' when calling update_deploy_stage." if deploy_stage_id.nil?
      raise "Missing the required parameter 'update_deploy_stage_details' when calling update_deploy_stage." if update_deploy_stage_details.nil?
      raise "Parameter value for 'deploy_stage_id' must not be blank" if OCI::Internal::Util.blank_string?(deploy_stage_id)

      path = '/deployStages/{deployStageId}'.sub('{deployStageId}', deploy_stage_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_deploy_stage_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#update_deploy_stage') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::DeployStage'
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


    # Updates the deployment.
    # @param [String] deployment_id Unique deployment identifier.
    # @param [OCI::Devops::Models::UpdateDeploymentDetails] update_deployment_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Deployment Deployment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/update_deployment.rb.html) to see an example of how to use update_deployment API.
    def update_deployment(deployment_id, update_deployment_details, opts = {})
      logger.debug 'Calling operation DevopsClient#update_deployment.' if logger

      raise "Missing the required parameter 'deployment_id' when calling update_deployment." if deployment_id.nil?
      raise "Missing the required parameter 'update_deployment_details' when calling update_deployment." if update_deployment_details.nil?
      raise "Parameter value for 'deployment_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_id)

      path = '/deployments/{deploymentId}'.sub('{deploymentId}', deployment_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_deployment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#update_deployment') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Deployment'
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


    # Updates the project.
    # @param [String] project_id Unique project identifier.
    # @param [OCI::Devops::Models::UpdateProjectDetails] update_project_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Project Project}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/update_project.rb.html) to see an example of how to use update_project API.
    def update_project(project_id, update_project_details, opts = {})
      logger.debug 'Calling operation DevopsClient#update_project.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#update_project') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Project'
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


    # Updates the repository.
    # @param [String] repository_id Unique repository identifier.
    # @param [OCI::Devops::Models::UpdateRepositoryDetails] update_repository_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Repository Repository}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/update_repository.rb.html) to see an example of how to use update_repository API.
    def update_repository(repository_id, update_repository_details, opts = {})
      logger.debug 'Calling operation DevopsClient#update_repository.' if logger

      raise "Missing the required parameter 'repository_id' when calling update_repository." if repository_id.nil?
      raise "Missing the required parameter 'update_repository_details' when calling update_repository." if update_repository_details.nil?
      raise "Parameter value for 'repository_id' must not be blank" if OCI::Internal::Util.blank_string?(repository_id)

      path = '/repositories/{repositoryId}'.sub('{repositoryId}', repository_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_repository_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#update_repository') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Repository'
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


    # Updates the trigger.
    # @param [String] trigger_id Unique trigger identifier.
    # @param [OCI::Devops::Models::UpdateTriggerDetails] update_trigger_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource. The resource will be updated or deleted only if the etag you provide matches the resource's current etag value.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request.  If you need to contact Oracle about a particular request, provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Devops::Models::Trigger Trigger}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/devops/update_trigger.rb.html) to see an example of how to use update_trigger API.
    def update_trigger(trigger_id, update_trigger_details, opts = {})
      logger.debug 'Calling operation DevopsClient#update_trigger.' if logger

      raise "Missing the required parameter 'trigger_id' when calling update_trigger." if trigger_id.nil?
      raise "Missing the required parameter 'update_trigger_details' when calling update_trigger." if update_trigger_details.nil?
      raise "Parameter value for 'trigger_id' must not be blank" if OCI::Internal::Util.blank_string?(trigger_id)

      path = '/triggers/{triggerId}'.sub('{triggerId}', trigger_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_trigger_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DevopsClient#update_trigger') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Devops::Models::Trigger'
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
