# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Logging Management API to create, read, list, update, and delete log groups, log objects, and agent configurations.
  class Logging::LoggingManagementClient
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


    # Creates a new LoggingManagementClient.
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
        @endpoint = endpoint + '/20200531'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "LoggingManagementClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://logging.{region}.oci.{secondLevelDomain}') + '/20200531'
      logger.info "LoggingManagementClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a log group into a different compartment within the same tenancy.  When provided, the If-Match is checked against the resource ETag values.
    # For information about moving resources between compartments, see [Moving Resources Between Compartments](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] log_group_id OCID of a log group to work with.
    # @param [OCI::Logging::Models::ChangeLogGroupCompartmentDetails] change_log_group_compartment_details Request to change the compartment of a given resource.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/change_log_group_compartment.rb.html) to see an example of how to use change_log_group_compartment API.
    def change_log_group_compartment(log_group_id, change_log_group_compartment_details, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#change_log_group_compartment.' if logger

      raise "Missing the required parameter 'log_group_id' when calling change_log_group_compartment." if log_group_id.nil?
      raise "Missing the required parameter 'change_log_group_compartment_details' when calling change_log_group_compartment." if change_log_group_compartment_details.nil?
      raise "Parameter value for 'log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_group_id)

      path = '/logGroups/{logGroupId}/actions/changeCompartment'.sub('{logGroupId}', log_group_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_log_group_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#change_log_group_compartment') do
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


    # Moves a log into a different log group within the same tenancy.  When provided, the If-Match is checked against the ETag values of the resource.
    #
    # @param [String] log_group_id OCID of a log group to work with.
    # @param [String] log_id OCID of a log to work with.
    # @param [OCI::Logging::Models::ChangeLogLogGroupDetails] change_log_log_group_details Request to change the log group of a given log.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/change_log_log_group.rb.html) to see an example of how to use change_log_log_group API.
    def change_log_log_group(log_group_id, log_id, change_log_log_group_details, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#change_log_log_group.' if logger

      raise "Missing the required parameter 'log_group_id' when calling change_log_log_group." if log_group_id.nil?
      raise "Missing the required parameter 'log_id' when calling change_log_log_group." if log_id.nil?
      raise "Missing the required parameter 'change_log_log_group_details' when calling change_log_log_group." if change_log_log_group_details.nil?
      raise "Parameter value for 'log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_group_id)
      raise "Parameter value for 'log_id' must not be blank" if OCI::Internal::Util.blank_string?(log_id)

      path = '/logGroups/{logGroupId}/logs/{logId}/actions/changeLogGroup'.sub('{logGroupId}', log_group_id.to_s).sub('{logId}', log_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_log_log_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#change_log_log_group') do
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


    # Moves a saved search into a different compartment within the same tenancy. For information about moving
    # resources between compartments, see [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] log_saved_search_id OCID of the logSavedSearch
    #
    # @param [OCI::Logging::Models::ChangeLogSavedSearchCompartmentDetails] change_log_saved_search_compartment_details Contains details indicating which compartment the resource should move to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error, without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (e.g., if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/change_log_saved_search_compartment.rb.html) to see an example of how to use change_log_saved_search_compartment API.
    def change_log_saved_search_compartment(log_saved_search_id, change_log_saved_search_compartment_details, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#change_log_saved_search_compartment.' if logger

      raise "Missing the required parameter 'log_saved_search_id' when calling change_log_saved_search_compartment." if log_saved_search_id.nil?
      raise "Missing the required parameter 'change_log_saved_search_compartment_details' when calling change_log_saved_search_compartment." if change_log_saved_search_compartment_details.nil?
      raise "Parameter value for 'log_saved_search_id' must not be blank" if OCI::Internal::Util.blank_string?(log_saved_search_id)

      path = '/logSavedSearches/{logSavedSearchId}/actions/changeCompartment'.sub('{logSavedSearchId}', log_saved_search_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_log_saved_search_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#change_log_saved_search_compartment') do
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


    # Moves the unified agent configuration into a different compartment within the same tenancy.  When provided, the If-Match is checked against the ETag values of the resource.
    # For information about moving resources between compartments, see [Moving Resources Between Compartments](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] unified_agent_configuration_id The OCID of the Unified Agent configuration.
    # @param [OCI::Logging::Models::ChangeUnifiedAgentConfigurationCompartmentDetails] change_unified_agent_configuration_compartment_details Request to change the compartment of a given resource.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error, without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (e.g., if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/change_unified_agent_configuration_compartment.rb.html) to see an example of how to use change_unified_agent_configuration_compartment API.
    def change_unified_agent_configuration_compartment(unified_agent_configuration_id, change_unified_agent_configuration_compartment_details, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#change_unified_agent_configuration_compartment.' if logger

      raise "Missing the required parameter 'unified_agent_configuration_id' when calling change_unified_agent_configuration_compartment." if unified_agent_configuration_id.nil?
      raise "Missing the required parameter 'change_unified_agent_configuration_compartment_details' when calling change_unified_agent_configuration_compartment." if change_unified_agent_configuration_compartment_details.nil?
      raise "Parameter value for 'unified_agent_configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(unified_agent_configuration_id)

      path = '/unifiedAgentConfigurations/{unifiedAgentConfigurationId}/actions/changeCompartment'.sub('{unifiedAgentConfigurationId}', unified_agent_configuration_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_unified_agent_configuration_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#change_unified_agent_configuration_compartment') do
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


    # Creates a log within the specified log group. This call fails if a log group has already been created
    # with the same displayName or (service, resource, category) triplet.
    #
    # @param [String] log_group_id OCID of a log group to work with.
    # @param [OCI::Logging::Models::CreateLogDetails] create_log_details Log object configuration details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error, without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (e.g., if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/create_log.rb.html) to see an example of how to use create_log API.
    def create_log(log_group_id, create_log_details, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#create_log.' if logger

      raise "Missing the required parameter 'log_group_id' when calling create_log." if log_group_id.nil?
      raise "Missing the required parameter 'create_log_details' when calling create_log." if create_log_details.nil?
      raise "Parameter value for 'log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_group_id)

      path = '/logGroups/{logGroupId}/logs'.sub('{logGroupId}', log_group_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_log_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#create_log') do
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


    # Create a new log group with a unique display name. This call fails
    # if the log group is already created with the same displayName in the compartment.
    #
    # @param [OCI::Logging::Models::CreateLogGroupDetails] create_log_group_details Details to create log group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error, without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (e.g., if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/create_log_group.rb.html) to see an example of how to use create_log_group API.
    def create_log_group(create_log_group_details, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#create_log_group.' if logger

      raise "Missing the required parameter 'create_log_group_details' when calling create_log_group." if create_log_group_details.nil?

      path = '/logGroups'
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

      post_body = @api_client.object_to_http_body(create_log_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#create_log_group') do
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


    # Creates a new LogSavedSearch.
    #
    # @param [OCI::Logging::Models::CreateLogSavedSearchDetails] create_log_saved_search_details Specification of the Saved Search to create
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error, without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (e.g., if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Logging::Models::LogSavedSearch LogSavedSearch}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/create_log_saved_search.rb.html) to see an example of how to use create_log_saved_search API.
    def create_log_saved_search(create_log_saved_search_details, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#create_log_saved_search.' if logger

      raise "Missing the required parameter 'create_log_saved_search_details' when calling create_log_saved_search." if create_log_saved_search_details.nil?

      path = '/logSavedSearches'
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

      post_body = @api_client.object_to_http_body(create_log_saved_search_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#create_log_saved_search') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Logging::Models::LogSavedSearch'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Create unified agent configuration registration.
    # @param [OCI::Logging::Models::CreateUnifiedAgentConfigurationDetails] create_unified_agent_configuration_details Unified agent configuration creation object.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error, without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated
    #   before then due to conflicting operations (e.g., if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/create_unified_agent_configuration.rb.html) to see an example of how to use create_unified_agent_configuration API.
    def create_unified_agent_configuration(create_unified_agent_configuration_details, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#create_unified_agent_configuration.' if logger

      raise "Missing the required parameter 'create_unified_agent_configuration_details' when calling create_unified_agent_configuration." if create_unified_agent_configuration_details.nil?

      path = '/unifiedAgentConfigurations'
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

      post_body = @api_client.object_to_http_body(create_unified_agent_configuration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#create_unified_agent_configuration') do
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


    # Deletes the log object in a log group.
    # @param [String] log_group_id OCID of a log group to work with.
    # @param [String] log_id OCID of a log to work with.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/delete_log.rb.html) to see an example of how to use delete_log API.
    def delete_log(log_group_id, log_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#delete_log.' if logger

      raise "Missing the required parameter 'log_group_id' when calling delete_log." if log_group_id.nil?
      raise "Missing the required parameter 'log_id' when calling delete_log." if log_id.nil?
      raise "Parameter value for 'log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_group_id)
      raise "Parameter value for 'log_id' must not be blank" if OCI::Internal::Util.blank_string?(log_id)

      path = '/logGroups/{logGroupId}/logs/{logId}'.sub('{logGroupId}', log_group_id.to_s).sub('{logId}', log_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#delete_log') do
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


    # Deletes the specified log group.
    # @param [String] log_group_id OCID of a log group to work with.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/delete_log_group.rb.html) to see an example of how to use delete_log_group API.
    def delete_log_group(log_group_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#delete_log_group.' if logger

      raise "Missing the required parameter 'log_group_id' when calling delete_log_group." if log_group_id.nil?
      raise "Parameter value for 'log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_group_id)

      path = '/logGroups/{logGroupId}'.sub('{logGroupId}', log_group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#delete_log_group') do
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


    # Deletes the specified log saved search.
    # @param [String] log_saved_search_id OCID of the logSavedSearch
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
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/delete_log_saved_search.rb.html) to see an example of how to use delete_log_saved_search API.
    def delete_log_saved_search(log_saved_search_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#delete_log_saved_search.' if logger

      raise "Missing the required parameter 'log_saved_search_id' when calling delete_log_saved_search." if log_saved_search_id.nil?
      raise "Parameter value for 'log_saved_search_id' must not be blank" if OCI::Internal::Util.blank_string?(log_saved_search_id)

      path = '/logSavedSearches/{logSavedSearchId}'.sub('{logSavedSearchId}', log_saved_search_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#delete_log_saved_search') do
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


    # Delete unified agent configuration.
    # @param [String] unified_agent_configuration_id The OCID of the Unified Agent configuration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/delete_unified_agent_configuration.rb.html) to see an example of how to use delete_unified_agent_configuration API.
    def delete_unified_agent_configuration(unified_agent_configuration_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#delete_unified_agent_configuration.' if logger

      raise "Missing the required parameter 'unified_agent_configuration_id' when calling delete_unified_agent_configuration." if unified_agent_configuration_id.nil?
      raise "Parameter value for 'unified_agent_configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(unified_agent_configuration_id)

      path = '/unifiedAgentConfigurations/{unifiedAgentConfigurationId}'.sub('{unifiedAgentConfigurationId}', unified_agent_configuration_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#delete_unified_agent_configuration') do
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


    # Cancel a work request that has not started yet.
    #
    # @param [String] work_request_id The asynchronous request ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/delete_work_request.rb.html) to see an example of how to use delete_work_request API.
    def delete_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#delete_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling delete_work_request." if work_request_id.nil?
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#delete_work_request') do
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


    # Gets the log object configuration for the log object OCID.
    #
    # @param [String] log_group_id OCID of a log group to work with.
    # @param [String] log_id OCID of a log to work with.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Logging::Models::Log Log}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/get_log.rb.html) to see an example of how to use get_log API.
    def get_log(log_group_id, log_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#get_log.' if logger

      raise "Missing the required parameter 'log_group_id' when calling get_log." if log_group_id.nil?
      raise "Missing the required parameter 'log_id' when calling get_log." if log_id.nil?
      raise "Parameter value for 'log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_group_id)
      raise "Parameter value for 'log_id' must not be blank" if OCI::Internal::Util.blank_string?(log_id)

      path = '/logGroups/{logGroupId}/logs/{logId}'.sub('{logGroupId}', log_group_id.to_s).sub('{logId}', log_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#get_log') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Logging::Models::Log'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get the specified log group's information.
    # @param [String] log_group_id OCID of a log group to work with.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Logging::Models::LogGroup LogGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/get_log_group.rb.html) to see an example of how to use get_log_group API.
    def get_log_group(log_group_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#get_log_group.' if logger

      raise "Missing the required parameter 'log_group_id' when calling get_log_group." if log_group_id.nil?
      raise "Parameter value for 'log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_group_id)

      path = '/logGroups/{logGroupId}'.sub('{logGroupId}', log_group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#get_log_group') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Logging::Models::LogGroup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves a LogIncludedSearch.
    # @param [String] compartment_id Compartment OCID to list resources in. See compartmentIdInSubtree
    #        for nested compartments traversal.
    #
    # @param [String] log_included_search_id OCID of the included search
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Logging::Models::LogIncludedSearch LogIncludedSearch}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/get_log_included_search.rb.html) to see an example of how to use get_log_included_search API.
    def get_log_included_search(compartment_id, log_included_search_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#get_log_included_search.' if logger

      raise "Missing the required parameter 'compartment_id' when calling get_log_included_search." if compartment_id.nil?
      raise "Missing the required parameter 'log_included_search_id' when calling get_log_included_search." if log_included_search_id.nil?
      raise "Parameter value for 'log_included_search_id' must not be blank" if OCI::Internal::Util.blank_string?(log_included_search_id)

      path = '/logIncludedSearch/{logIncludedSearchId}'.sub('{logIncludedSearchId}', log_included_search_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#get_log_included_search') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Logging::Models::LogIncludedSearch'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves a log saved search.
    # @param [String] log_saved_search_id OCID of the logSavedSearch
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Logging::Models::LogSavedSearch LogSavedSearch}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/get_log_saved_search.rb.html) to see an example of how to use get_log_saved_search API.
    def get_log_saved_search(log_saved_search_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#get_log_saved_search.' if logger

      raise "Missing the required parameter 'log_saved_search_id' when calling get_log_saved_search." if log_saved_search_id.nil?
      raise "Parameter value for 'log_saved_search_id' must not be blank" if OCI::Internal::Util.blank_string?(log_saved_search_id)

      path = '/logSavedSearches/{logSavedSearchId}'.sub('{logSavedSearchId}', log_saved_search_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#get_log_saved_search') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Logging::Models::LogSavedSearch'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get the unified agent configuration for an ID.
    # @param [String] unified_agent_configuration_id The OCID of the Unified Agent configuration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Logging::Models::UnifiedAgentConfiguration UnifiedAgentConfiguration}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/get_unified_agent_configuration.rb.html) to see an example of how to use get_unified_agent_configuration API.
    def get_unified_agent_configuration(unified_agent_configuration_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#get_unified_agent_configuration.' if logger

      raise "Missing the required parameter 'unified_agent_configuration_id' when calling get_unified_agent_configuration." if unified_agent_configuration_id.nil?
      raise "Parameter value for 'unified_agent_configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(unified_agent_configuration_id)

      path = '/unifiedAgentConfigurations/{unifiedAgentConfigurationId}'.sub('{unifiedAgentConfigurationId}', unified_agent_configuration_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#get_unified_agent_configuration') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Logging::Models::UnifiedAgentConfiguration'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the work request with the given ID.
    # @param [String] work_request_id The asynchronous request ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Logging::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Logging::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists all log groups for the specified compartment or tenancy.
    # @param [String] compartment_id Compartment OCID to list resources in. See compartmentIdInSubtree
    #        for nested compartments traversal.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_compartment_id_in_subtree Specifies whether or not nested compartments should be traversed. Defaults to false. (default to false)
    # @option opts [String] :display_name Resource name
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` or `opc-previous-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #    (default to 100)
    # @option opts [String] :sort_by The field to sort by (one column only). Default sort order is
    #   ascending exception of `timeCreated` and `timeLastModified` columns (descending).
    #
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :sort_order The sort order to use, whether 'asc' or 'desc'.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Logging::Models::LogGroupSummary LogGroupSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/list_log_groups.rb.html) to see an example of how to use list_log_groups API.
    def list_log_groups(compartment_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#list_log_groups.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_log_groups." if compartment_id.nil?

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/logGroups'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:isCompartmentIdInSubtree] = opts[:is_compartment_id_in_subtree] if !opts[:is_compartment_id_in_subtree].nil?
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#list_log_groups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Logging::Models::LogGroupSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists Logging Included Searches for this compartment.
    #
    # @param [String] compartment_id Compartment OCID to list resources in. See compartmentIdInSubtree
    #        for nested compartments traversal.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :log_included_search_id OCID of the LogIncludedSearch
    #
    # @option opts [String] :display_name Resource name
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` or `opc-previous-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #    (default to 100)
    # @option opts [String] :sort_by The field to sort by (one column only). Default sort order is
    #   ascending exception of `timeCreated` and `timeLastModified` columns (descending).
    #
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :sort_order The sort order to use, whether 'asc' or 'desc'.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Logging::Models::LogIncludedSearchSummaryCollection LogIncludedSearchSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/list_log_included_searches.rb.html) to see an example of how to use list_log_included_searches API.
    def list_log_included_searches(compartment_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#list_log_included_searches.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_log_included_searches." if compartment_id.nil?

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/logIncludedSearches'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:logIncludedSearchId] = opts[:log_included_search_id] if opts[:log_included_search_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#list_log_included_searches') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Logging::Models::LogIncludedSearchSummaryCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists Logging Saved Searches for this compartment.
    #
    # @param [String] compartment_id Compartment OCID to list resources in. See compartmentIdInSubtree
    #        for nested compartments traversal.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :log_saved_search_id OCID of the LogSavedSearch
    #
    # @option opts [String] :name Resource name
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` or `opc-previous-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #    (default to 100)
    # @option opts [String] :sort_by The field to sort by (one column only). Default sort order is
    #   ascending exception of `timeCreated` and `timeLastModified` columns (descending).
    #
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :sort_order The sort order to use, whether 'asc' or 'desc'.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Logging::Models::LogSavedSearchSummaryCollection LogSavedSearchSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/list_log_saved_searches.rb.html) to see an example of how to use list_log_saved_searches API.
    def list_log_saved_searches(compartment_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#list_log_saved_searches.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_log_saved_searches." if compartment_id.nil?

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/logSavedSearches'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:logSavedSearchId] = opts[:log_saved_search_id] if opts[:log_saved_search_id]
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#list_log_saved_searches') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Logging::Models::LogSavedSearchSummaryCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the specified log group's log objects.
    # @param [String] log_group_id OCID of a log group to work with.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :log_type The logType that the log object is for, whether custom or service.
    #   Allowed values are: CUSTOM, SERVICE
    # @option opts [String] :source_service Service that created the log object.
    # @option opts [String] :source_resource Log object resource.
    # @option opts [String] :display_name Resource name
    # @option opts [String] :lifecycle_state Lifecycle state of the log object
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` or `opc-previous-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #    (default to 100)
    # @option opts [String] :sort_by The field to sort by (one column only). Default sort order is
    #   ascending exception of `timeCreated` and `timeLastModified` columns (descending).
    #
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :sort_order The sort order to use, whether 'asc' or 'desc'.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Logging::Models::LogSummary LogSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/list_logs.rb.html) to see an example of how to use list_logs API.
    def list_logs(log_group_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#list_logs.' if logger

      raise "Missing the required parameter 'log_group_id' when calling list_logs." if log_group_id.nil?

      if opts[:log_type] && !%w[CUSTOM SERVICE].include?(opts[:log_type])
        raise 'Invalid value for "log_type", must be one of CUSTOM, SERVICE.'
      end

      if opts[:lifecycle_state] && !OCI::Logging::Models::LOG_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Logging::Models::LOG_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_group_id)

      path = '/logGroups/{logGroupId}/logs'.sub('{logGroupId}', log_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:logType] = opts[:log_type] if opts[:log_type]
      query_params[:sourceService] = opts[:source_service] if opts[:source_service]
      query_params[:sourceResource] = opts[:source_resource] if opts[:source_resource]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#list_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Logging::Models::LogSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists all services that support logging.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Logging::Models::ServiceSummary ServiceSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/list_services.rb.html) to see an example of how to use list_services API.
    def list_services(opts = {})
      logger.debug 'Calling operation LoggingManagementClient#list_services.' if logger


      path = '/v2/registry/services'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#list_services') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Logging::Models::ServiceSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists all unified agent configurations in the specified compartment.
    # @param [String] compartment_id Compartment OCID to list resources in. See compartmentIdInSubtree
    #        for nested compartments traversal.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :log_id Custom log OCID to list resources with the log as destination.
    #
    # @option opts [BOOLEAN] :is_compartment_id_in_subtree Specifies whether or not nested compartments should be traversed. Defaults to false. (default to false)
    # @option opts [String] :group_id The OCID of a group or a dynamic group.
    # @option opts [String] :display_name Resource name
    # @option opts [String] :lifecycle_state Lifecycle state of the log object
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #    (default to 100)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` or `opc-previous-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_by The field to sort by (one column only). Default sort order is
    #   ascending exception of `timeCreated` and `timeLastModified` columns (descending).
    #
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :sort_order The sort order to use, whether 'asc' or 'desc'.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Logging::Models::UnifiedAgentConfigurationCollection UnifiedAgentConfigurationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/list_unified_agent_configurations.rb.html) to see an example of how to use list_unified_agent_configurations API.
    def list_unified_agent_configurations(compartment_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#list_unified_agent_configurations.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_unified_agent_configurations." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Logging::Models::LOG_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Logging::Models::LOG_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/unifiedAgentConfigurations'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:logId] = opts[:log_id] if opts[:log_id]
      query_params[:isCompartmentIdInSubtree] = opts[:is_compartment_id_in_subtree] if !opts[:is_compartment_id_in_subtree].nil?
      query_params[:groupId] = opts[:group_id] if opts[:group_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#list_unified_agent_configurations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Logging::Models::UnifiedAgentConfigurationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Return a list of errors for a given work request.
    #
    # @param [String] work_request_id The asynchronous request ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` or `opc-previous-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #    (default to 100)
    # @return [Response] A Response object with data of type Array<{OCI::Logging::Models::WorkRequestError WorkRequestError}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#list_work_request_errors.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Logging::Models::WorkRequestError>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Return a list of logs for a given work request.
    #
    # @param [String] work_request_id The asynchronous request ID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` or `opc-previous-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #    (default to 100)
    # @return [Response] A Response object with data of type Array<{OCI::Logging::Models::WorkRequestLog WorkRequestLog}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#list_work_request_logs.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Logging::Models::WorkRequestLog>'
        )
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
    # @param [String] compartment_id Compartment OCID to list resources in. See compartmentIdInSubtree
    #        for nested compartments traversal.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :status Filter results by work request status.
    # @option opts [String] :id <b>Filter</b> results by [OCID](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/identifiers.htm). Must be an OCID of the correct type for the resource type.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` or `opc-previous-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #    (default to 100)
    # @option opts [String] :sort_order The sort order to use, whether 'asc' or 'desc'.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Specifies the field to sort by. Accepts only one field. By default, when you sort by time fields, results are shown in descending order. All other fields default to ascending order.
    #
    #   Allowed values are: operationType, status, timeAccepted
    # @return [Response] A Response object with data of type Array<{OCI::Logging::Models::WorkRequestSummary WorkRequestSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      if opts[:status] && !OCI::Logging::Models::OPERATION_STATUS_ENUM.include?(opts[:status])
        raise 'Invalid value for "status", must be one of the values in OCI::Logging::Models::OPERATION_STATUS_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[operationType status timeAccepted].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of operationType, status, timeAccepted.'
      end

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:status] = opts[:status] if opts[:status]
      query_params[:id] = opts[:id] if opts[:id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Logging::Models::WorkRequestSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the existing log object with the associated configuration. This call
    #       fails if the log object does not exist.
    #
    # @param [String] log_group_id OCID of a log group to work with.
    # @param [String] log_id OCID of a log to work with.
    # @param [OCI::Logging::Models::UpdateLogDetails] update_log_details Log config parameters to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/update_log.rb.html) to see an example of how to use update_log API.
    def update_log(log_group_id, log_id, update_log_details, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#update_log.' if logger

      raise "Missing the required parameter 'log_group_id' when calling update_log." if log_group_id.nil?
      raise "Missing the required parameter 'log_id' when calling update_log." if log_id.nil?
      raise "Missing the required parameter 'update_log_details' when calling update_log." if update_log_details.nil?
      raise "Parameter value for 'log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_group_id)
      raise "Parameter value for 'log_id' must not be blank" if OCI::Internal::Util.blank_string?(log_id)

      path = '/logGroups/{logGroupId}/logs/{logId}'.sub('{logGroupId}', log_group_id.to_s).sub('{logId}', log_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_log_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#update_log') do
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


    # Updates the existing log group with the associated configuration. This call
    #       fails if the log group does not exist.
    #
    # @param [String] log_group_id OCID of a log group to work with.
    # @param [OCI::Logging::Models::UpdateLogGroupDetails] update_log_group_details LogGroup config parameters to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/update_log_group.rb.html) to see an example of how to use update_log_group API.
    def update_log_group(log_group_id, update_log_group_details, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#update_log_group.' if logger

      raise "Missing the required parameter 'log_group_id' when calling update_log_group." if log_group_id.nil?
      raise "Missing the required parameter 'update_log_group_details' when calling update_log_group." if update_log_group_details.nil?
      raise "Parameter value for 'log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_group_id)

      path = '/logGroups/{logGroupId}'.sub('{logGroupId}', log_group_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_log_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#update_log_group') do
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


    # Updates an  existing log saved search.
    #
    # @param [String] log_saved_search_id OCID of the logSavedSearch
    #
    # @param [OCI::Logging::Models::UpdateLogSavedSearchDetails] update_log_saved_search_details Updates to the saved search.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `if-match` parameter to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Logging::Models::LogSavedSearch LogSavedSearch}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/update_log_saved_search.rb.html) to see an example of how to use update_log_saved_search API.
    def update_log_saved_search(log_saved_search_id, update_log_saved_search_details, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#update_log_saved_search.' if logger

      raise "Missing the required parameter 'log_saved_search_id' when calling update_log_saved_search." if log_saved_search_id.nil?
      raise "Missing the required parameter 'update_log_saved_search_details' when calling update_log_saved_search." if update_log_saved_search_details.nil?
      raise "Parameter value for 'log_saved_search_id' must not be blank" if OCI::Internal::Util.blank_string?(log_saved_search_id)

      path = '/logSavedSearches/{logSavedSearchId}'.sub('{logSavedSearchId}', log_saved_search_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_log_saved_search_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#update_log_saved_search') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Logging::Models::LogSavedSearch'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Update an existing unified agent configuration. This call
    #       fails if the log group does not exist.
    #
    # @param [String] unified_agent_configuration_id The OCID of the Unified Agent configuration.
    # @param [OCI::Logging::Models::UpdateUnifiedAgentConfigurationDetails] update_unified_agent_configuration_details Unified agent configuration to update. Empty group associations list doesn't modify the list, null value for group association clears all the previous associations.
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
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/logging/update_unified_agent_configuration.rb.html) to see an example of how to use update_unified_agent_configuration API.
    def update_unified_agent_configuration(unified_agent_configuration_id, update_unified_agent_configuration_details, opts = {})
      logger.debug 'Calling operation LoggingManagementClient#update_unified_agent_configuration.' if logger

      raise "Missing the required parameter 'unified_agent_configuration_id' when calling update_unified_agent_configuration." if unified_agent_configuration_id.nil?
      raise "Missing the required parameter 'update_unified_agent_configuration_details' when calling update_unified_agent_configuration." if update_unified_agent_configuration_details.nil?
      raise "Parameter value for 'unified_agent_configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(unified_agent_configuration_id)

      path = '/unifiedAgentConfigurations/{unifiedAgentConfigurationId}'.sub('{unifiedAgentConfigurationId}', unified_agent_configuration_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_unified_agent_configuration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoggingManagementClient#update_unified_agent_configuration') do
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

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)

      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
