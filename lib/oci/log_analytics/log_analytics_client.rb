# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The LogAnalytics API for the LogAnalytics service.
  class LogAnalytics::LogAnalyticsClient
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


    # Creates a new LogAnalyticsClient.
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
        @endpoint = endpoint + '/20200601'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "LogAnalyticsClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://loganalytics.{region}.oci.{secondLevelDomain}') + '/20200601'
      logger.info "LogAnalyticsClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Adds association between input source log analytics entity and destination entities.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [OCI::LogAnalytics::Models::AddEntityAssociationDetails] add_entity_association_details This parameter specifies the entity OCIDs with which associations are to be created. Specify destination OCIDs as comma separated string.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def add_entity_association(namespace_name, log_analytics_entity_id, add_entity_association_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#add_entity_association.' if logger

      raise "Missing the required parameter 'namespace_name' when calling add_entity_association." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling add_entity_association." if log_analytics_entity_id.nil?
      raise "Missing the required parameter 'add_entity_association_details' when calling add_entity_association." if add_entity_association_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}/actions/addEntityAssociations'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
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

      post_body = @api_client.object_to_http_body(add_entity_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#add_entity_association') do
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


    # get basic information about a specified set of labels
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::LabelNames] basic_details List of label names to get information on
    # @param [BOOLEAN] is_include_deleted flag for whether or not to include information on deleted labels
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :basic_label_sort_by sort by label (default to name)
    #   Allowed values are: name, priority
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLabelCollection LogAnalyticsLabelCollection}
    def batch_get_basic_info(namespace_name, basic_details, is_include_deleted, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#batch_get_basic_info.' if logger

      raise "Missing the required parameter 'namespace_name' when calling batch_get_basic_info." if namespace_name.nil?
      raise "Missing the required parameter 'basic_details' when calling batch_get_basic_info." if basic_details.nil?
      raise "Missing the required parameter 'is_include_deleted' when calling batch_get_basic_info." if is_include_deleted.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:basic_label_sort_by] && !%w[name priority].include?(opts[:basic_label_sort_by])
        raise 'Invalid value for "basic_label_sort_by", must be one of name, priority.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/labels/actions/basicInfo'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isIncludeDeleted] = is_include_deleted
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:basicLabelSortBy] = opts[:basic_label_sort_by] if opts[:basic_label_sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(basic_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#batch_get_basic_info') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLabelCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Cancel/Remove query job work request.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
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
    # @return [Response] A Response object with data of type nil
    def cancel_query_work_request(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#cancel_query_work_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling cancel_query_work_request." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling cancel_query_work_request." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/queryWorkRequests/{workRequestId}'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#cancel_query_work_request') do
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


    # Update the compartment of the log analytics entity with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [OCI::LogAnalytics::Models::ChangeLogAnalyticsEntityCompartmentDetails] change_log_analytics_entity_compartment_details Log analytics entity compartment Id to be updated.
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
    def change_log_analytics_entity_compartment(namespace_name, log_analytics_entity_id, change_log_analytics_entity_compartment_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#change_log_analytics_entity_compartment.' if logger

      raise "Missing the required parameter 'namespace_name' when calling change_log_analytics_entity_compartment." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling change_log_analytics_entity_compartment." if log_analytics_entity_id.nil?
      raise "Missing the required parameter 'change_log_analytics_entity_compartment_details' when calling change_log_analytics_entity_compartment." if change_log_analytics_entity_compartment_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}/actions/changeCompartment'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_log_analytics_entity_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#change_log_analytics_entity_compartment') do
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


    # Updates the compartment of the Log-Analytics group with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_log_group_id unique logAnalytics log group identifier
    # @param [OCI::LogAnalytics::Models::ChangeLogAnalyticsLogGroupCompartmentDetails] change_log_analytics_log_group_compartment_details The information to be updated.
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
    def change_log_analytics_log_group_compartment(namespace_name, log_analytics_log_group_id, change_log_analytics_log_group_compartment_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#change_log_analytics_log_group_compartment.' if logger

      raise "Missing the required parameter 'namespace_name' when calling change_log_analytics_log_group_compartment." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_log_group_id' when calling change_log_analytics_log_group_compartment." if log_analytics_log_group_id.nil?
      raise "Missing the required parameter 'change_log_analytics_log_group_compartment_details' when calling change_log_analytics_log_group_compartment." if change_log_analytics_log_group_compartment_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_log_group_id)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroups/{logAnalyticsLogGroupId}/actions/changeCompartment'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsLogGroupId}', log_analytics_log_group_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_log_analytics_log_group_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#change_log_analytics_log_group_compartment') do
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


    # Move the rule from it's current compartment to given compartment.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_object_collection_rule_id The Logging Analytics Object Collection Rule [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm)
    # @param [OCI::LogAnalytics::Models::ChangeLogAnalyticsObjectCollectionRuleCompartmentDetails] change_log_analytics_object_collection_rule_compartment_details The new compartment this Object Collection Rule will be moved to.
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
    def change_log_analytics_object_collection_rule_compartment(namespace_name, log_analytics_object_collection_rule_id, change_log_analytics_object_collection_rule_compartment_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#change_log_analytics_object_collection_rule_compartment.' if logger

      raise "Missing the required parameter 'namespace_name' when calling change_log_analytics_object_collection_rule_compartment." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_object_collection_rule_id' when calling change_log_analytics_object_collection_rule_compartment." if log_analytics_object_collection_rule_id.nil?
      raise "Missing the required parameter 'change_log_analytics_object_collection_rule_compartment_details' when calling change_log_analytics_object_collection_rule_compartment." if change_log_analytics_object_collection_rule_compartment_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_object_collection_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_object_collection_rule_id)

      path = '/namespaces/{namespaceName}/logAnalyticsObjectCollectionRules/{logAnalyticsObjectCollectionRuleId}/actions/changeCompartment'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsObjectCollectionRuleId}', log_analytics_object_collection_rule_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_log_analytics_object_collection_rule_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#change_log_analytics_object_collection_rule_compartment') do
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


    # Move the scheduled task into a different compartment within the same tenancy.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
    # @param [OCI::LogAnalytics::Models::ChangeScheduledTaskCompartmentDetails] change_scheduled_task_compartment_details The destination compartment identifier.
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
    def change_scheduled_task_compartment(namespace_name, scheduled_task_id, change_scheduled_task_compartment_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#change_scheduled_task_compartment.' if logger

      raise "Missing the required parameter 'namespace_name' when calling change_scheduled_task_compartment." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling change_scheduled_task_compartment." if scheduled_task_id.nil?
      raise "Missing the required parameter 'change_scheduled_task_compartment_details' when calling change_scheduled_task_compartment." if change_scheduled_task_compartment_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}/actions/changeCompartment'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_scheduled_task_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#change_scheduled_task_compartment') do
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


    # Clean accumulated acceleration data stored for the accelerated saved search.
    # The ScheduledTask taskType must be ACCELERATION.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_start Optional parameter to specify start of time range, in the format defined by RFC3339.
    #   Default value is beginning of time.
    #
    # @option opts [DateTime] :time_end Optional parameter to specify end of time range, in the format defined by RFC3339.
    #   Default value is end of time.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    def clean(namespace_name, scheduled_task_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#clean.' if logger

      raise "Missing the required parameter 'namespace_name' when calling clean." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling clean." if scheduled_task_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}/actions/clean'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:timeStart] = opts[:time_start] if opts[:time_start]
      query_params[:timeEnd] = opts[:time_end] if opts[:time_end]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#clean') do
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


    # Create a new log analytics entity.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateLogAnalyticsEntityDetails] create_log_analytics_entity_details Details for the new log analytics entity.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntity LogAnalyticsEntity}
    def create_log_analytics_entity(namespace_name, create_log_analytics_entity_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#create_log_analytics_entity.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_log_analytics_entity." if namespace_name.nil?
      raise "Missing the required parameter 'create_log_analytics_entity_details' when calling create_log_analytics_entity." if create_log_analytics_entity_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(create_log_analytics_entity_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#create_log_analytics_entity') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntity'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Add custom log analytics entity type.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateLogAnalyticsEntityTypeDetails] create_log_analytics_entity_type_details Definition for custom log analytics entity type.
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
    def create_log_analytics_entity_type(namespace_name, create_log_analytics_entity_type_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#create_log_analytics_entity_type.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_log_analytics_entity_type." if namespace_name.nil?
      raise "Missing the required parameter 'create_log_analytics_entity_type_details' when calling create_log_analytics_entity_type." if create_log_analytics_entity_type_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntityTypes'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(create_log_analytics_entity_type_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#create_log_analytics_entity_type') do
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


    # Creates a new Log-Analytics group.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateLogAnalyticsLogGroupDetails] create_log_analytics_log_group_details Details for the new Log-Analytics group.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLogGroup LogAnalyticsLogGroup}
    def create_log_analytics_log_group(namespace_name, create_log_analytics_log_group_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#create_log_analytics_log_group.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_log_analytics_log_group." if namespace_name.nil?
      raise "Missing the required parameter 'create_log_analytics_log_group_details' when calling create_log_analytics_log_group." if create_log_analytics_log_group_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroups'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(create_log_analytics_log_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#create_log_analytics_log_group') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLogGroup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Create a configuration to collect logs from object storage bucket.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateLogAnalyticsObjectCollectionRuleDetails] create_log_analytics_object_collection_rule_details Details of the rule to be created.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule LogAnalyticsObjectCollectionRule}
    def create_log_analytics_object_collection_rule(namespace_name, create_log_analytics_object_collection_rule_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#create_log_analytics_object_collection_rule.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_log_analytics_object_collection_rule." if namespace_name.nil?
      raise "Missing the required parameter 'create_log_analytics_object_collection_rule_details' when calling create_log_analytics_object_collection_rule." if create_log_analytics_object_collection_rule_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsObjectCollectionRules'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(create_log_analytics_object_collection_rule_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#create_log_analytics_object_collection_rule') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Schedule a task as specified and return task info.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::CreateScheduledTaskDetails] create_scheduled_task_details Scheduled task to be created.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ScheduledTask ScheduledTask}
    def create_scheduled_task(namespace_name, create_scheduled_task_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#create_scheduled_task.' if logger

      raise "Missing the required parameter 'namespace_name' when calling create_scheduled_task." if namespace_name.nil?
      raise "Missing the required parameter 'create_scheduled_task_details' when calling create_scheduled_task." if create_scheduled_task_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/scheduledTasks'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(create_scheduled_task_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#create_scheduled_task') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ScheduledTask'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # delete associations
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::DeleteLogAnalyticsAssociationDetails] delete_log_analytics_association_details details for association
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
    # @return [Response] A Response object with data of type nil
    def delete_associations(namespace_name, delete_log_analytics_association_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_associations.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_associations." if namespace_name.nil?
      raise "Missing the required parameter 'delete_log_analytics_association_details' when calling delete_associations." if delete_log_analytics_association_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/associations/actions/delete'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(delete_log_analytics_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_associations') do
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


    # delete field with specified name
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] field_name name of the field to get
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_field(namespace_name, field_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_field.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_field." if namespace_name.nil?
      raise "Missing the required parameter 'field_name' when calling delete_field." if field_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'field_name' must not be blank" if OCI::Internal::Util.blank_string?(field_name)

      path = '/namespaces/{namespaceName}/fields/{fieldName}'.sub('{namespaceName}', namespace_name.to_s).sub('{fieldName}', field_name.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_field') do
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


    # delete a label
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] label_name name of the label to get
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_label(namespace_name, label_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_label.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_label." if namespace_name.nil?
      raise "Missing the required parameter 'label_name' when calling delete_label." if label_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'label_name' must not be blank" if OCI::Internal::Util.blank_string?(label_name)

      path = '/namespaces/{namespaceName}/labels/{labelName}'.sub('{namespaceName}', namespace_name.to_s).sub('{labelName}', label_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_label') do
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


    # Delete log analytics entity with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
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
    def delete_log_analytics_entity(namespace_name, log_analytics_entity_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_log_analytics_entity.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_log_analytics_entity." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling delete_log_analytics_entity." if log_analytics_entity_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_log_analytics_entity') do
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


    # Delete the log analytics entity type with the given name.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] entity_type_name Log analytics entity type name.
    #
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
    def delete_log_analytics_entity_type(namespace_name, entity_type_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_log_analytics_entity_type.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_log_analytics_entity_type." if namespace_name.nil?
      raise "Missing the required parameter 'entity_type_name' when calling delete_log_analytics_entity_type." if entity_type_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'entity_type_name' must not be blank" if OCI::Internal::Util.blank_string?(entity_type_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntityTypes/{entityTypeName}'.sub('{namespaceName}', namespace_name.to_s).sub('{entityTypeName}', entity_type_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_log_analytics_entity_type') do
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


    # Deletes the Log-Analytics group with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_log_group_id unique logAnalytics log group identifier
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
    def delete_log_analytics_log_group(namespace_name, log_analytics_log_group_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_log_analytics_log_group.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_log_analytics_log_group." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_log_group_id' when calling delete_log_analytics_log_group." if log_analytics_log_group_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_log_group_id)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroups/{logAnalyticsLogGroupId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsLogGroupId}', log_analytics_log_group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_log_analytics_log_group') do
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


    # Deletes a configured object storage bucket based collection rule to stop the log collection of the configured bucket .
    # It will not delete the already collected log data from the configured bucket.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_object_collection_rule_id The Logging Analytics Object Collection Rule [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm)
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
    # @return [Response] A Response object with data of type nil
    def delete_log_analytics_object_collection_rule(namespace_name, log_analytics_object_collection_rule_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_log_analytics_object_collection_rule.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_log_analytics_object_collection_rule." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_object_collection_rule_id' when calling delete_log_analytics_object_collection_rule." if log_analytics_object_collection_rule_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_object_collection_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_object_collection_rule_id)

      path = '/namespaces/{namespaceName}/logAnalyticsObjectCollectionRules/{logAnalyticsObjectCollectionRuleId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsObjectCollectionRuleId}', log_analytics_object_collection_rule_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_log_analytics_object_collection_rule') do
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


    # delete parser with specified name
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] parser_name parserName
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_parser(namespace_name, parser_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_parser.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_parser." if namespace_name.nil?
      raise "Missing the required parameter 'parser_name' when calling delete_parser." if parser_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'parser_name' must not be blank" if OCI::Internal::Util.blank_string?(parser_name)

      path = '/namespaces/{namespaceName}/parsers/{parserName}'.sub('{namespaceName}', namespace_name.to_s).sub('{parserName}', parser_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_parser') do
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


    # Delete the scheduled task.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
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
    # @return [Response] A Response object with data of type nil
    def delete_scheduled_task(namespace_name, scheduled_task_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_scheduled_task.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_scheduled_task." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling delete_scheduled_task." if scheduled_task_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_scheduled_task') do
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


    # delete source with specified ID
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name source name
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_source(namespace_name, source_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_source.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_source." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling delete_source." if source_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_source') do
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


    # Deletes an Upload by its reference.
    # It deletes all the logs in storage asscoiated with the upload and the corresponding upload metadata.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_reference Unique internal identifier to refer to upload container
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
    def delete_upload(namespace_name, upload_reference, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_upload.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_upload." if namespace_name.nil?
      raise "Missing the required parameter 'upload_reference' when calling delete_upload." if upload_reference.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'upload_reference' must not be blank" if OCI::Internal::Util.blank_string?(upload_reference)

      path = '/namespaces/{namespaceName}/uploads/{uploadReference}'.sub('{namespaceName}', namespace_name.to_s).sub('{uploadReference}', upload_reference.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_upload') do
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


    # Deletes a specific log file inside an upload by providing upload file reference.
    # It deletes all the logs in storage asscoiated with the upload file and the corresponding upload metadata.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_reference Unique internal identifier to refer to upload container
    # @param [String] file_reference Unique internal identifier to refer to upload file
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def delete_upload_file(namespace_name, upload_reference, file_reference, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_upload_file.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_upload_file." if namespace_name.nil?
      raise "Missing the required parameter 'upload_reference' when calling delete_upload_file." if upload_reference.nil?
      raise "Missing the required parameter 'file_reference' when calling delete_upload_file." if file_reference.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'upload_reference' must not be blank" if OCI::Internal::Util.blank_string?(upload_reference)
      raise "Parameter value for 'file_reference' must not be blank" if OCI::Internal::Util.blank_string?(file_reference)

      path = '/namespaces/{namespaceName}/uploads/{uploadReference}/files/{fileReference}'.sub('{namespaceName}', namespace_name.to_s).sub('{uploadReference}', upload_reference.to_s).sub('{fileReference}', file_reference.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_upload_file') do
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


    # Suppresses a specific warning inside an upload.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_reference Unique internal identifier to refer to upload container
    # @param [String] warning_reference Unique internal identifier to refer to upload warning
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def delete_upload_warning(namespace_name, upload_reference, warning_reference, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#delete_upload_warning.' if logger

      raise "Missing the required parameter 'namespace_name' when calling delete_upload_warning." if namespace_name.nil?
      raise "Missing the required parameter 'upload_reference' when calling delete_upload_warning." if upload_reference.nil?
      raise "Missing the required parameter 'warning_reference' when calling delete_upload_warning." if warning_reference.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'upload_reference' must not be blank" if OCI::Internal::Util.blank_string?(upload_reference)
      raise "Parameter value for 'warning_reference' must not be blank" if OCI::Internal::Util.blank_string?(warning_reference)

      path = '/namespaces/{namespaceName}/uploads/{uploadReference}/warnings/{warningReference}'.sub('{namespaceName}', namespace_name.to_s).sub('{uploadReference}', upload_reference.to_s).sub('{warningReference}', warning_reference.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#delete_upload_warning') do
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


    # This API disables archiving.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Success Success}
    def disable_archiving(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#disable_archiving.' if logger

      raise "Missing the required parameter 'namespace_name' when calling disable_archiving." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/disableArchiving'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#disable_archiving') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Success'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # THis API enables archiving.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Success Success}
    def enable_archiving(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#enable_archiving.' if logger

      raise "Missing the required parameter 'namespace_name' when calling enable_archiving." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/enableArchiving'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#enable_archiving') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Success'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This API estimates the size of data to be purged based based on time interval, purge query etc.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::EstimatePurgeDataSizeDetails] estimate_purge_data_size_details This is the input to estimate the size of data to be purged.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::EstimatePurgeDataSizeResult EstimatePurgeDataSizeResult}
    def estimate_purge_data_size(namespace_name, estimate_purge_data_size_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#estimate_purge_data_size.' if logger

      raise "Missing the required parameter 'namespace_name' when calling estimate_purge_data_size." if namespace_name.nil?
      raise "Missing the required parameter 'estimate_purge_data_size_details' when calling estimate_purge_data_size." if estimate_purge_data_size_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/estimatePurgeDataSize'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(estimate_purge_data_size_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#estimate_purge_data_size') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::EstimatePurgeDataSizeResult'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # export
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::ExportContent] export_custom_content_details content to export
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
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    def export_custom_content(namespace_name, export_custom_content_details, opts = {}, &block)
      logger.debug 'Calling operation LogAnalyticsClient#export_custom_content.' if logger

      raise "Missing the required parameter 'namespace_name' when calling export_custom_content." if namespace_name.nil?
      raise "Missing the required parameter 'export_custom_content_details' when calling export_custom_content." if export_custom_content_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/contents/actions/exportCustomContent'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(export_custom_content_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#export_custom_content') do
        if !block.nil?
          @api_client.call_api(
            :POST,
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
              :POST,
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
                :POST,
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
            :POST,
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


    # Export data based on query. Endpoint returns a stream of data. Endpoint is synchronous. Queries must deliver first result within 60 seconds or calls are subject to timeout.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::ExportDetails] export_details Query to be exported
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    def export_query_result(namespace_name, export_details, opts = {}, &block)
      logger.debug 'Calling operation LogAnalyticsClient#export_query_result.' if logger

      raise "Missing the required parameter 'namespace_name' when calling export_query_result." if namespace_name.nil?
      raise "Missing the required parameter 'export_details' when calling export_query_result." if export_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/search/actions/export'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(export_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#export_query_result') do
        if !block.nil?
          @api_client.call_api(
            :POST,
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
              :POST,
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
                :POST,
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
            :POST,
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


    # structured log fieldpaths
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::LogAnalyticsParser] logan_parser_details parser definition
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :parser_type type - possible values are xml or json (default to JSON)
    #   Allowed values are: XML, JSON
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ExtractLogFieldResults ExtractLogFieldResults}
    def extract_structured_log_field_paths(namespace_name, logan_parser_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#extract_structured_log_field_paths.' if logger

      raise "Missing the required parameter 'namespace_name' when calling extract_structured_log_field_paths." if namespace_name.nil?
      raise "Missing the required parameter 'logan_parser_details' when calling extract_structured_log_field_paths." if logan_parser_details.nil?

      if opts[:parser_type] && !%w[XML JSON].include?(opts[:parser_type])
        raise 'Invalid value for "parser_type", must be one of XML, JSON.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parsers/actions/extractLogFieldPaths'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:parserType] = opts[:parser_type] if opts[:parser_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(logan_parser_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#extract_structured_log_field_paths') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ExtractLogFieldResults'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # structured log header paths
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::LogAnalyticsParser] logan_parser_details parser definition
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :parser_type type - possible values are xml or json (default to JSON)
    #   Allowed values are: XML, JSON
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ExtractLogHeaderResults ExtractLogHeaderResults}
    def extract_structured_log_header_paths(namespace_name, logan_parser_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#extract_structured_log_header_paths.' if logger

      raise "Missing the required parameter 'namespace_name' when calling extract_structured_log_header_paths." if namespace_name.nil?
      raise "Missing the required parameter 'logan_parser_details' when calling extract_structured_log_header_paths." if logan_parser_details.nil?

      if opts[:parser_type] && !%w[XML JSON].include?(opts[:parser_type])
        raise 'Invalid value for "parser_type", must be one of XML, JSON.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parsers/actions/extractLogHeaderPaths'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:parserType] = opts[:parser_type] if opts[:parser_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(logan_parser_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#extract_structured_log_header_paths') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ExtractLogHeaderResults'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Each filter specifies an operator, a field and one or more values to be inserted into the provided query as criteria.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::FilterDetails] filter_details Query string and filters to add or remove
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::FilterOutput FilterOutput}
    def filter(namespace_name, filter_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#filter.' if logger

      raise "Missing the required parameter 'namespace_name' when calling filter." if namespace_name.nil?
      raise "Missing the required parameter 'filter_details' when calling filter." if filter_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/search/actions/filter'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(filter_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#filter') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::FilterOutput'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # association summary
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::AssociationSummaryReport AssociationSummaryReport}
    def get_association_summary(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_association_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_association_summary." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_association_summary." if compartment_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/associationSummary'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_association_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::AssociationSummaryReport'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # extract column names from SQL query
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] sql_query sql query to get the columns
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ColumnNameCollection ColumnNameCollection}
    def get_column_names(namespace_name, sql_query, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_column_names.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_column_names." if namespace_name.nil?
      raise "Missing the required parameter 'sql_query' when calling get_column_names." if sql_query.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sources/sqlColumnNames'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:sqlQuery] = sql_query

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_column_names') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ColumnNameCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # association summary by source
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsConfigWorkRequest LogAnalyticsConfigWorkRequest}
    def get_config_work_request(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_config_work_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_config_work_request." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling get_config_work_request." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/configWorkRequests/{workRequestId}'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_config_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsConfigWorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get common field with specified name
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] field_name name of the field to get
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsField LogAnalyticsField}
    def get_field(namespace_name, field_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_field.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_field." if namespace_name.nil?
      raise "Missing the required parameter 'field_name' when calling get_field." if field_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'field_name' must not be blank" if OCI::Internal::Util.blank_string?(field_name)

      path = '/namespaces/{namespaceName}/fields/{fieldName}'.sub('{namespaceName}', namespace_name.to_s).sub('{fieldName}', field_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_field') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsField'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get field summary
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_show_detail show detail flag (default to false)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::FieldSummaryReport FieldSummaryReport}
    def get_fields_summary(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_fields_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_fields_summary." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/fieldSummary'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isShowDetail] = opts[:is_show_detail] if !opts[:is_show_detail].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_fields_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::FieldSummaryReport'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get label with specified name
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] label_name name of the label to get
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLabel LogAnalyticsLabel}
    def get_label(namespace_name, label_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_label.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_label." if namespace_name.nil?
      raise "Missing the required parameter 'label_name' when calling get_label." if label_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'label_name' must not be blank" if OCI::Internal::Util.blank_string?(label_name)

      path = '/namespaces/{namespaceName}/labels/{labelName}'.sub('{namespaceName}', namespace_name.to_s).sub('{labelName}', label_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_label') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLabel'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get total count
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LabelSummaryReport LabelSummaryReport}
    def get_label_summary(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_label_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_label_summary." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/labelSummary'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_label_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LabelSummaryReport'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns log analytics entities count summary.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntitySummaryReport LogAnalyticsEntitySummaryReport}
    def get_log_analytics_entities_summary(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_entities_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_entities_summary." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_log_analytics_entities_summary." if compartment_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/entitySummary'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_entities_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntitySummaryReport'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve the log analytics entity with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntity LogAnalyticsEntity}
    def get_log_analytics_entity(namespace_name, log_analytics_entity_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_entity.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_entity." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling get_log_analytics_entity." if log_analytics_entity_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_entity') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntity'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve the log analytics entity type with the given name.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] entity_type_name Log analytics entity type name.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntityType LogAnalyticsEntityType}
    def get_log_analytics_entity_type(namespace_name, entity_type_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_entity_type.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_entity_type." if namespace_name.nil?
      raise "Missing the required parameter 'entity_type_name' when calling get_log_analytics_entity_type." if entity_type_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'entity_type_name' must not be blank" if OCI::Internal::Util.blank_string?(entity_type_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntityTypes/{entityTypeName}'.sub('{namespaceName}', namespace_name.to_s).sub('{entityTypeName}', entity_type_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_entity_type') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntityType'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves the Log-Analytics group with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_log_group_id unique logAnalytics log group identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLogGroup LogAnalyticsLogGroup}
    def get_log_analytics_log_group(namespace_name, log_analytics_log_group_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_log_group.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_log_group." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_log_group_id' when calling get_log_analytics_log_group." if log_analytics_log_group_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_log_group_id)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroups/{logAnalyticsLogGroupId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsLogGroupId}', log_analytics_log_group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_log_group') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLogGroup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a count of Log-Analytics groups.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogGroupSummaryReport LogGroupSummaryReport}
    def get_log_analytics_log_groups_summary(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_log_groups_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_log_groups_summary." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_log_analytics_log_groups_summary." if compartment_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroupsSummary'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_log_groups_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogGroupSummaryReport'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a configured object storage based collection rule by given id
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_object_collection_rule_id The Logging Analytics Object Collection Rule [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm)
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule LogAnalyticsObjectCollectionRule}
    def get_log_analytics_object_collection_rule(namespace_name, log_analytics_object_collection_rule_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_log_analytics_object_collection_rule.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_log_analytics_object_collection_rule." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_object_collection_rule_id' when calling get_log_analytics_object_collection_rule." if log_analytics_object_collection_rule_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_object_collection_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_object_collection_rule_id)

      path = '/namespaces/{namespaceName}/logAnalyticsObjectCollectionRules/{logAnalyticsObjectCollectionRuleId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsObjectCollectionRuleId}', log_analytics_object_collection_rule_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_log_analytics_object_collection_rule') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This API gets the namespace details of a tenancy already onboarded in Logging Analytics Application
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Namespace Namespace}
    def get_namespace(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_namespace.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_namespace." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_namespace') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Namespace'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get parser with fields by Name
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] parser_name parserName
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsParser LogAnalyticsParser}
    def get_parser(namespace_name, parser_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_parser.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_parser." if namespace_name.nil?
      raise "Missing the required parameter 'parser_name' when calling get_parser." if parser_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'parser_name' must not be blank" if OCI::Internal::Util.blank_string?(parser_name)

      path = '/namespaces/{namespaceName}/parsers/{parserName}'.sub('{namespaceName}', namespace_name.to_s).sub('{parserName}', parser_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_parser') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsParser'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # parser summary
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ParserSummaryReport ParserSummaryReport}
    def get_parser_summary(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_parser_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_parser_summary." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parsersSummary'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_parser_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ParserSummaryReport'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns the intermediate results for a query that was specified to run asynchronously if the query has not completed,
    # otherwise the final query results identified by a queryWorkRequestId returned when submitting the query execute asynchronously.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit Maximum number of results to return in this request.  Note a limit=-1 returns all results from pageId onwards up to maxtotalCount. (default to 10)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [BOOLEAN] :should_include_columns Include columns in response (default to true)
    # @option opts [BOOLEAN] :should_include_fields Include fields in response (default to true)
    # @option opts [String] :output_mode Specifies the format for the returned results. (default to JSON_ROWS)
    #   Allowed values are: JSON_ROWS
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::QueryAggregation QueryAggregation}
    def get_query_result(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_query_result.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_query_result." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling get_query_result." if work_request_id.nil?

      if opts[:output_mode] && !%w[JSON_ROWS].include?(opts[:output_mode])
        raise 'Invalid value for "output_mode", must be one of JSON_ROWS.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/search/actions/query'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:workRequestId] = work_request_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:shouldIncludeColumns] = opts[:should_include_columns] if !opts[:should_include_columns].nil?
      query_params[:shouldIncludeFields] = opts[:should_include_fields] if !opts[:should_include_fields].nil?
      query_params[:outputMode] = opts[:output_mode] if opts[:output_mode]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_query_result') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::QueryAggregation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve work request details by workRequestId. This endpoint can be polled for status tracking of work request. Clients should poll using the interval returned in the retry-after header.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::QueryWorkRequest QueryWorkRequest}
    def get_query_work_request(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_query_work_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_query_work_request." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling get_query_work_request." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/queryWorkRequests/{workRequestId}'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_query_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::QueryWorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get the scheduled task for the specified task identifier.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ScheduledTask ScheduledTask}
    def get_scheduled_task(namespace_name, scheduled_task_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_scheduled_task.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_scheduled_task." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling get_scheduled_task." if scheduled_task_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_scheduled_task') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ScheduledTask'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get source with specified name
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name source name
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsSource LogAnalyticsSource}
    def get_source(namespace_name, source_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_source.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_source." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling get_source." if source_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_source." if compartment_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_source') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsSource'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # source summary
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::SourceSummaryReport SourceSummaryReport}
    def get_source_summary(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_source_summary.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_source_summary." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sourceSummary'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_source_summary') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::SourceSummaryReport'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This API gets the storage configuration of a tenancy
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Storage Storage}
    def get_storage(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_storage.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_storage." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_storage') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Storage'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This API gets storage usage information of a tenancy.  Storage usage information includes active, archived or recalled
    # data.  The unit of return data is in bytes.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::StorageUsage StorageUsage}
    def get_storage_usage(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_storage_usage.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_storage_usage." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/usage'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_storage_usage') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::StorageUsage'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This API returns work request details specified by {workRequestId}. This API can be polled for status tracking of
    # work request.  Clients should poll using the interval returned in retry-after header.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::StorageWorkRequest StorageWorkRequest}
    def get_storage_work_request(work_request_id, namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_storage_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling get_storage_work_request." if work_request_id.nil?
      raise "Missing the required parameter 'namespace_name' when calling get_storage_work_request." if namespace_name.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storageWorkRequests/{workRequestId}'.sub('{workRequestId}', work_request_id.to_s).sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_storage_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::StorageWorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets an On-Demand Upload info by reference
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_reference Unique internal identifier to refer to upload container
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Upload Upload}
    def get_upload(namespace_name, upload_reference, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_upload.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_upload." if namespace_name.nil?
      raise "Missing the required parameter 'upload_reference' when calling get_upload." if upload_reference.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'upload_reference' must not be blank" if OCI::Internal::Util.blank_string?(upload_reference)

      path = '/namespaces/{namespaceName}/uploads/{uploadReference}'.sub('{namespaceName}', namespace_name.to_s).sub('{uploadReference}', upload_reference.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_upload') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Upload'
        )
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
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::WorkRequest WorkRequest}
    def get_work_request(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#get_work_request.' if logger

      raise "Missing the required parameter 'namespace_name' when calling get_work_request." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling get_work_request." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/workRequests/{workRequestId}'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # register custom content
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String, IO] import_custom_content_file_body The file to upload which contains the custom content.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_overwrite is overwrite
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsImportCustomContent LogAnalyticsImportCustomContent}
    def import_custom_content(namespace_name, import_custom_content_file_body, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#import_custom_content.' if logger

      raise "Missing the required parameter 'namespace_name' when calling import_custom_content." if namespace_name.nil?
      raise "Missing the required parameter 'import_custom_content_file_body' when calling import_custom_content." if import_custom_content_file_body.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/contents/actions/importCustomContent'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isOverwrite] = opts[:is_overwrite] if !opts[:is_overwrite].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(import_custom_content_file_body)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#import_custom_content') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsImportCustomContent'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # list of entities that have been associated to at least one source
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :entity_id The entity OCID.
    #
    # @option opts [String] :entity_type entity type name
    # @option opts [String] :entity_type_display_name entity type display name
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by sort by field (default to entityName)
    #   Allowed values are: entityName, entityTypeDisplayName, associationCount
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsAssociatedEntityCollection LogAnalyticsAssociatedEntityCollection}
    def list_associated_entities(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_associated_entities.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_associated_entities." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_associated_entities." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[entityName entityTypeDisplayName associationCount].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of entityName, entityTypeDisplayName, associationCount.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/associatedEntities'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:entityId] = opts[:entity_id] if opts[:entity_id]
      query_params[:entityType] = opts[:entity_type] if opts[:entity_type]
      query_params[:entityTypeDisplayName] = opts[:entity_type_display_name] if opts[:entity_type_display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_associated_entities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsAssociatedEntityCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # association summary by source
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by work requests sort by (default to timeAccepted)
    #   Allowed values are: timeAccepted
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsConfigWorkRequestCollection LogAnalyticsConfigWorkRequestCollection}
    def list_config_work_requests(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_config_work_requests.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_config_work_requests." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_config_work_requests." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeAccepted].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeAccepted.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/configWorkRequests'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_config_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsConfigWorkRequestCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Return a list of log analytics entities associated with input source log analytics entity.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :direct_or_all_associations Indicates whether to return direct associated entities or direct and inferred associated entities.
    #    (default to DIRECT)
    #   Allowed values are: DIRECT, ALL
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort entities by. Only one sort order may be provided. Default order for timeCreated and timeUpdated
    #   is descending. Default order for entity name is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, name
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntityCollection LogAnalyticsEntityCollection}
    def list_entity_associations(namespace_name, log_analytics_entity_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_entity_associations.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_entity_associations." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling list_entity_associations." if log_analytics_entity_id.nil?

      if opts[:direct_or_all_associations] && !%w[DIRECT ALL].include?(opts[:direct_or_all_associations])
        raise 'Invalid value for "direct_or_all_associations", must be one of DIRECT, ALL.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, name.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}/entityAssociations'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:directOrAllAssociations] = opts[:direct_or_all_associations] if opts[:direct_or_all_associations]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_entity_associations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntityCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # entity associations summary
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :entity_id The entity OCID.
    #
    # @option opts [String] :entity_type entity type name
    # @option opts [String] :entity_type_display_name entity type display name
    # @option opts [String] :life_cycle_state Status (default to ALL)
    #   Allowed values are: ALL, ACCEPTED, IN_PROGRESS, SUCCEEDED, FAILED
    # @option opts [BOOLEAN] :is_show_total is Show Total
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by sort by field (default to sourceDisplayName)
    #   Allowed values are: sourceDisplayName, timeLastAttempted, status
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsAssociationCollection LogAnalyticsAssociationCollection}
    def list_entity_source_associations(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_entity_source_associations.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_entity_source_associations." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_entity_source_associations." if compartment_id.nil?

      if opts[:life_cycle_state] && !%w[ALL ACCEPTED IN_PROGRESS SUCCEEDED FAILED].include?(opts[:life_cycle_state])
        raise 'Invalid value for "life_cycle_state", must be one of ALL, ACCEPTED, IN_PROGRESS, SUCCEEDED, FAILED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[sourceDisplayName timeLastAttempted status].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of sourceDisplayName, timeLastAttempted, status.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/entityAssociations'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:entityId] = opts[:entity_id] if opts[:entity_id]
      query_params[:entityType] = opts[:entity_type] if opts[:entity_type]
      query_params[:entityTypeDisplayName] = opts[:entity_type_display_name] if opts[:entity_type_display_name]
      query_params[:lifeCycleState] = opts[:life_cycle_state] if opts[:life_cycle_state]
      query_params[:isShowTotal] = opts[:is_show_total] if !opts[:is_show_total].nil?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_entity_source_associations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsAssociationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get all common field with specified display name and description
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_match_all isMatchAll
    # @option opts [String] :source_ids comma delimited list of source ids
    # @option opts [String] :source_names comma delimited list of source Names
    # @option opts [String] :parser_type parserType (default to ALL)
    #   Allowed values are: ALL, REGEX, XML, JSON
    # @option opts [String] :parser_ids comma delimited list of parser ids
    # @option opts [String] :parser_names comma delimited list of parser names
    # @option opts [BOOLEAN] :is_include_parser isIncludeParser (default to true)
    # @option opts [String] :filter filter
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by sort by field (default to name)
    #   Allowed values are: name, dataType
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsFieldCollection LogAnalyticsFieldCollection}
    def list_fields(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_fields.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_fields." if namespace_name.nil?

      if opts[:parser_type] && !%w[ALL REGEX XML JSON].include?(opts[:parser_type])
        raise 'Invalid value for "parser_type", must be one of ALL, REGEX, XML, JSON.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[name dataType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, dataType.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/fields'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isMatchAll] = opts[:is_match_all] if !opts[:is_match_all].nil?
      query_params[:sourceIds] = opts[:source_ids] if opts[:source_ids]
      query_params[:sourceNames] = opts[:source_names] if opts[:source_names]
      query_params[:parserType] = opts[:parser_type] if opts[:parser_type]
      query_params[:parserIds] = opts[:parser_ids] if opts[:parser_ids]
      query_params[:parserNames] = opts[:parser_names] if opts[:parser_names]
      query_params[:isIncludeParser] = opts[:is_include_parser] if !opts[:is_include_parser].nil?
      query_params[:filter] = opts[:filter] if opts[:filter]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_fields') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsFieldCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get list of priorities
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LabelPriorityCollection LabelPriorityCollection}
    def list_label_priorities(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_label_priorities.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_label_priorities." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/labelPriorities'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_label_priorities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LabelPriorityCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get details of sources using the label
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :label_name label name
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :label_source_sort_by sort by source displayname (default to sourceDisplayName)
    #   Allowed values are: sourceDisplayName, labelFieldDisplayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LabelSourceCollection LabelSourceCollection}
    def list_label_source_details(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_label_source_details.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_label_source_details." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:label_source_sort_by] && !%w[sourceDisplayName labelFieldDisplayName].include?(opts[:label_source_sort_by])
        raise 'Invalid value for "label_source_sort_by", must be one of sourceDisplayName, labelFieldDisplayName.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/labelSourceDetails'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:labelName] = opts[:label_name] if opts[:label_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:labelSourceSortBy] = opts[:label_source_sort_by] if opts[:label_source_sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_label_source_details') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LabelSourceCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get labels passing specified filter
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :label_name label name
    # @option opts [String] :label_display_text search by label display name or description
    # @option opts [String] :is_system Is system param of value (all, custom, sourceUsing)
    #    (default to ALL)
    #   Allowed values are: ALL, CUSTOM, BUILT_IN
    # @option opts [String] :label_priority label priority (default to NONE)
    #   Allowed values are: NONE, LOW, MEDIUM, HIGH
    # @option opts [BOOLEAN] :is_count_pop isCountPop
    # @option opts [BOOLEAN] :is_alias_pop isAliasPop
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :label_sort_by sort by label (default to name)
    #   Allowed values are: name, priority, sourceUsing
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLabelCollection LogAnalyticsLabelCollection}
    def list_labels(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_labels.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_labels." if namespace_name.nil?

      if opts[:is_system] && !%w[ALL CUSTOM BUILT_IN].include?(opts[:is_system])
        raise 'Invalid value for "is_system", must be one of ALL, CUSTOM, BUILT_IN.'
      end

      if opts[:label_priority] && !%w[NONE LOW MEDIUM HIGH].include?(opts[:label_priority])
        raise 'Invalid value for "label_priority", must be one of NONE, LOW, MEDIUM, HIGH.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:label_sort_by] && !%w[name priority sourceUsing].include?(opts[:label_sort_by])
        raise 'Invalid value for "label_sort_by", must be one of name, priority, sourceUsing.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/labels'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:labelName] = opts[:label_name] if opts[:label_name]
      query_params[:labelDisplayText] = opts[:label_display_text] if opts[:label_display_text]
      query_params[:isSystem] = opts[:is_system] if opts[:is_system]
      query_params[:labelPriority] = opts[:label_priority] if opts[:label_priority]
      query_params[:isCountPop] = opts[:is_count_pop] if !opts[:is_count_pop].nil?
      query_params[:isAliasPop] = opts[:is_alias_pop] if !opts[:is_alias_pop].nil?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:labelSortBy] = opts[:label_sort_by] if opts[:label_sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_labels') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLabelCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Return a list of log analytics entities.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name A filter to return only log analytics entities whose name matches the entire name given. The match
    #   is case-insensitive.
    #
    # @option opts [String] :name_contains A filter to return only log analytics entities whose name contains the name given. The match
    #   is case-insensitive.
    #
    # @option opts [Array<String>] :entity_type_name A filter to return only log analytics entities whose entityTypeName matches the entire log analytics entity type name of
    #   one of the entityTypeNames given in the list. The match is case-insensitive.
    #    (default to [])
    # @option opts [String] :cloud_resource_id A filter to return only log analytics entities whose cloudResourceId matches the cloudResourceId given.
    #
    # @option opts [String] :lifecycle_state A filter to return only those log analytics entities with the specified lifecycle state. The state
    #   value is case-insensitive.
    #    (default to ACTIVE)
    # @option opts [String] :lifecycle_details_contains A filter to return only log analytics entities whose lifecycleDetails contains the specified string.
    #
    # @option opts [String] :is_management_agent_id_null A filter to return only those log analytics entities whose managementAgentId is null or is not null.
    #
    #   Allowed values are: true, false
    # @option opts [String] :hostname A filter to return only log analytics entities whose hostname matches the entire hostname given.
    #
    # @option opts [String] :hostname_contains A filter to return only log analytics entities whose hostname contains the substring given.
    #   The match is case-insensitive.
    #
    # @option opts [String] :source_id A filter to return only log analytics entities whose sourceId matches the sourceId given.
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort entities by. Only one sort order may be provided. Default order for timeCreated and timeUpdated
    #   is descending. Default order for entity name is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, name
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntityCollection LogAnalyticsEntityCollection}
    def list_log_analytics_entities(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_log_analytics_entities.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_log_analytics_entities." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_log_analytics_entities." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::LogAnalytics::Models::ENTITY_LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::LogAnalytics::Models::ENTITY_LIFECYCLE_STATES_ENUM.'
      end

      if opts[:is_management_agent_id_null] && !%w[true false].include?(opts[:is_management_agent_id_null])
        raise 'Invalid value for "is_management_agent_id_null", must be one of true, false.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, name.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:nameContains] = opts[:name_contains] if opts[:name_contains]
      query_params[:entityTypeName] = OCI::ApiClient.build_collection_params(opts[:entity_type_name], :multi) if opts[:entity_type_name] && !opts[:entity_type_name].empty?
      query_params[:cloudResourceId] = opts[:cloud_resource_id] if opts[:cloud_resource_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:lifecycleDetailsContains] = opts[:lifecycle_details_contains] if opts[:lifecycle_details_contains]
      query_params[:isManagementAgentIdNull] = opts[:is_management_agent_id_null] if opts[:is_management_agent_id_null]
      query_params[:hostname] = opts[:hostname] if opts[:hostname]
      query_params[:hostnameContains] = opts[:hostname_contains] if opts[:hostname_contains]
      query_params[:sourceId] = opts[:source_id] if opts[:source_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_log_analytics_entities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntityCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Return a list of log analytics entity types.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name A filter to return only log analytics entity types whose name matches the entire name given. The match is
    #   case-insensitive.
    #
    # @option opts [String] :name_contains A filter to return only log analytics entity types whose name or internalName contains name given. The match
    #   is case-insensitive.
    #
    # @option opts [String] :cloud_type A filter to return CLOUD or NON_CLOUD entity types.
    #    (default to CLOUD)
    # @option opts [String] :lifecycle_state A filter to return only those log analytics entities with the specified lifecycle state. The state
    #   value is case-insensitive.
    #    (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated and timeUpdated
    #   is descending. Default order for name is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, name
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntityTypeCollection LogAnalyticsEntityTypeCollection}
    def list_log_analytics_entity_types(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_log_analytics_entity_types.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_log_analytics_entity_types." if namespace_name.nil?

      if opts[:cloud_type] && !OCI::LogAnalytics::Models::ENTITY_CLOUD_TYPE_ENUM.include?(opts[:cloud_type])
        raise 'Invalid value for "cloud_type", must be one of the values in OCI::LogAnalytics::Models::ENTITY_CLOUD_TYPE_ENUM.'
      end

      if opts[:lifecycle_state] && !OCI::LogAnalytics::Models::ENTITY_LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::LogAnalytics::Models::ENTITY_LIFECYCLE_STATES_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, name.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntityTypes'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:nameContains] = opts[:name_contains] if opts[:name_contains]
      query_params[:cloudType] = opts[:cloud_type] if opts[:cloud_type]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_log_analytics_entity_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntityTypeCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of Log-Analytics groups.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only log analytics log groups whose displayName matches the entire display name given.
    #   The match is case-insensitive.
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLogGroupSummaryCollection LogAnalyticsLogGroupSummaryCollection}
    def list_log_analytics_log_groups(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_log_analytics_log_groups.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_log_analytics_log_groups." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_log_analytics_log_groups." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, displayName.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroups'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_log_analytics_log_groups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLogGroupSummaryCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets list of configuration details of Object Storage based collection rules.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name A filter to return rules only matching with this name.
    # @option opts [String] :lifecycle_state Lifecycle state filter.
    #    (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 50)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeUpdated is descending.
    #   Default order for name is ascending. If no value is specified timeUpdated is default.
    #    (default to timeUpdated)
    #   Allowed values are: timeUpdated, timeCreated, name
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRuleCollection LogAnalyticsObjectCollectionRuleCollection}
    def list_log_analytics_object_collection_rules(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_log_analytics_object_collection_rules.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_log_analytics_object_collection_rules." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_log_analytics_object_collection_rules." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::LogAnalytics::Models::LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::LogAnalytics::Models::LIFECYCLE_STATES_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeUpdated timeCreated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeUpdated, timeCreated, name.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/logAnalyticsObjectCollectionRules'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_log_analytics_object_collection_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRuleCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get all meta source types
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by sort by field (default to name)
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsMetaSourceTypeCollection LogAnalyticsMetaSourceTypeCollection}
    def list_meta_source_types(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_meta_source_types.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_meta_source_types." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sourceMetaTypes'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_meta_source_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsMetaSourceTypeCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Given a tenancy OCID, this API returns the namespace of the tenancy if it is valid and subscribed to the region.  The
    # result also indicates if the tenancy is onboarded with Logging Analytics.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::NamespaceCollection NamespaceCollection}
    def list_namespaces(compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_namespaces.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_namespaces." if compartment_id.nil?

      path = '/namespaces'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_namespaces') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::NamespaceCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get pre-process plugin instance
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :parser_name parserName
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by sort by field (default to name)
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsParserFunctionCollection LogAnalyticsParserFunctionCollection}
    def list_parser_functions(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_parser_functions.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_parser_functions." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parserFunctions'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:parserName] = opts[:parser_name] if opts[:parser_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_parser_functions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsParserFunctionCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get pre-process Meta plugins
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by sort by field (default to name)
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsParserMetaPluginCollection LogAnalyticsParserMetaPluginCollection}
    def list_parser_meta_plugins(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_parser_meta_plugins.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_parser_meta_plugins." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parserMetaPlugins'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_parser_meta_plugins') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsParserMetaPluginCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List parsers passing specified filter
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_match_all isMatchAll
    # @option opts [String] :source_type source type (default to OS_FILE)
    #   Allowed values are: OS_FILE, SYSLOG, ODL, OS_WINDOWS_SYS
    # @option opts [String] :parser_name parserName
    # @option opts [String] :parser_display_text search by parser display name or description
    # @option opts [String] :parser_type parserType (default to ALL)
    #   Allowed values are: ALL, REGEX, XML, JSON
    # @option opts [String] :is_system Is system param of value (all, custom, sourceUsing)
    #    (default to ALL)
    #   Allowed values are: ALL, CUSTOM, BUILT_IN
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by sort by parser (default to name)
    #   Allowed values are: name, type, sourcesCount, timeUpdated
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsParserCollection LogAnalyticsParserCollection}
    def list_parsers(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_parsers.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_parsers." if namespace_name.nil?

      if opts[:source_type] && !%w[OS_FILE SYSLOG ODL OS_WINDOWS_SYS].include?(opts[:source_type])
        raise 'Invalid value for "source_type", must be one of OS_FILE, SYSLOG, ODL, OS_WINDOWS_SYS.'
      end

      if opts[:parser_type] && !%w[ALL REGEX XML JSON].include?(opts[:parser_type])
        raise 'Invalid value for "parser_type", must be one of ALL, REGEX, XML, JSON.'
      end

      if opts[:is_system] && !%w[ALL CUSTOM BUILT_IN].include?(opts[:is_system])
        raise 'Invalid value for "is_system", must be one of ALL, CUSTOM, BUILT_IN.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[name type sourcesCount timeUpdated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, type, sourcesCount, timeUpdated.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parsers'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isMatchAll] = opts[:is_match_all] if !opts[:is_match_all].nil?
      query_params[:sourceType] = opts[:source_type] if opts[:source_type]
      query_params[:parserName] = opts[:parser_name] if opts[:parser_name]
      query_params[:parserDisplayText] = opts[:parser_display_text] if opts[:parser_display_text]
      query_params[:parserType] = opts[:parser_type] if opts[:parser_type]
      query_params[:isSystem] = opts[:is_system] if opts[:is_system]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_parsers') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsParserCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List active asynchronous queries.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :mode Filter based on job execution mode (default to ALL)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeStarted is descending. If no value is specified timeStarted is default.
    #    (default to tinmeStarted)
    #   Allowed values are: timeStarted, timeExpires
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::QueryWorkRequestCollection QueryWorkRequestCollection}
    def list_query_work_requests(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_query_work_requests.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_query_work_requests." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_query_work_requests." if compartment_id.nil?

      if opts[:mode] && !OCI::LogAnalytics::Models::JOB_MODE_FILTER_ENUM.include?(opts[:mode])
        raise 'Invalid value for "mode", must be one of the values in OCI::LogAnalytics::Models::JOB_MODE_FILTER_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeStarted timeExpires].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeStarted, timeExpires.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/queryWorkRequests'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:mode] = opts[:mode] if opts[:mode]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_query_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::QueryWorkRequestCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists scheduled tasks.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] task_type Required parameter to specify schedule task type.
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    #    (default to null)
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, displayName
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ScheduledTaskCollection ScheduledTaskCollection}
    def list_scheduled_tasks(namespace_name, task_type, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_scheduled_tasks.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_scheduled_tasks." if namespace_name.nil?
      raise "Missing the required parameter 'task_type' when calling list_scheduled_tasks." if task_type.nil?
      unless OCI::LogAnalytics::Models::TASK_TYPE_ENUM.include?(task_type)
        raise 'Invalid value for "task_type", must be one of the values in OCI::LogAnalytics::Models::TASK_TYPE_ENUM.'
      end

      raise "Missing the required parameter 'compartment_id' when calling list_scheduled_tasks." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, displayName.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/scheduledTasks'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:taskType] = task_type
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_scheduled_tasks') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ScheduledTaskCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # association summary by source
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name sourceName
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :entity_id The entity OCID.
    #
    # @option opts [String] :life_cycle_state Status (default to ALL)
    #   Allowed values are: ALL, ACCEPTED, IN_PROGRESS, SUCCEEDED, FAILED
    # @option opts [BOOLEAN] :is_show_total is Show Total
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by sort by field (default to entityName)
    #   Allowed values are: entityName, timeLastAttempted, status
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsAssociationCollection LogAnalyticsAssociationCollection}
    def list_source_associations(namespace_name, source_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_source_associations.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_source_associations." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling list_source_associations." if source_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_source_associations." if compartment_id.nil?

      if opts[:life_cycle_state] && !%w[ALL ACCEPTED IN_PROGRESS SUCCEEDED FAILED].include?(opts[:life_cycle_state])
        raise 'Invalid value for "life_cycle_state", must be one of ALL, ACCEPTED, IN_PROGRESS, SUCCEEDED, FAILED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[entityName timeLastAttempted status].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of entityName, timeLastAttempted, status.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sourceAssociations'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:sourceName] = source_name
      query_params[:compartmentId] = compartment_id
      query_params[:entityId] = opts[:entity_id] if opts[:entity_id]
      query_params[:lifeCycleState] = opts[:life_cycle_state] if opts[:life_cycle_state]
      query_params[:isShowTotal] = opts[:is_show_total] if !opts[:is_show_total].nil?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_source_associations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsAssociationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get source extended fields for source with specified Id
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name source name
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by sort by source extended field definition (default to baseFieldName)
    #   Allowed values are: baseFieldName, regularExpression
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsSourceExtendedFieldDefinitionCollection LogAnalyticsSourceExtendedFieldDefinitionCollection}
    def list_source_extended_field_definitions(namespace_name, source_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_source_extended_field_definitions.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_source_extended_field_definitions." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling list_source_extended_field_definitions." if source_name.nil?

      if opts[:sort_by] && !%w[baseFieldName regularExpression].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of baseFieldName, regularExpression.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}/extendedFieldDefinitions'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
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
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_source_extended_field_definitions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsSourceExtendedFieldDefinitionCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # list source label operators
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by sort by field (default to name)
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLabelOperatorCollection LogAnalyticsLabelOperatorCollection}
    def list_source_label_operators(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_source_label_operators.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_source_label_operators." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sourceLabelOperators'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_source_label_operators') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLabelOperatorCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get source meta functions
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by sort by field (default to name)
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsMetaFunctionCollection LogAnalyticsMetaFunctionCollection}
    def list_source_meta_functions(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_source_meta_functions.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_source_meta_functions." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sourceMetaFunctions'.sub('{namespaceName}', namespace_name.to_s)
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
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_source_meta_functions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsMetaFunctionCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # get source patterns for source with specified Id
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] source_name source name
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_include is included source patterns
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_by sort by source pattern text (default to patternText)
    #   Allowed values are: patternText
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsSourcePatternCollection LogAnalyticsSourcePatternCollection}
    def list_source_patterns(namespace_name, source_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_source_patterns.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_source_patterns." if namespace_name.nil?
      raise "Missing the required parameter 'source_name' when calling list_source_patterns." if source_name.nil?

      if opts[:sort_by] && !%w[patternText].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of patternText.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'source_name' must not be blank" if OCI::Internal::Util.blank_string?(source_name)

      path = '/namespaces/{namespaceName}/sources/{sourceName}/patterns'.sub('{namespaceName}', namespace_name.to_s).sub('{sourceName}', source_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isInclude] = opts[:is_include] if !opts[:is_include].nil?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_source_patterns') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsSourcePatternCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # source list
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :entity_type entityType
    # @option opts [String] :source_display_text search by source display name or description
    # @option opts [String] :is_system Is system param of value (all, custom, sourceUsing)
    #    (default to ALL)
    #   Allowed values are: ALL, CUSTOM, BUILT_IN
    # @option opts [BOOLEAN] :is_auto_associated auto association flag
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by sort by source (default to name)
    #   Allowed values are: name, timeUpdated, associationCount, sourceType
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :name A filter to return only log analytics entities whose name matches the entire name given. The match
    #   is case-insensitive.
    #
    # @option opts [BOOLEAN] :is_simplified is simplified
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsSourceCollection LogAnalyticsSourceCollection}
    def list_sources(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_sources.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_sources." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_sources." if compartment_id.nil?

      if opts[:is_system] && !%w[ALL CUSTOM BUILT_IN].include?(opts[:is_system])
        raise 'Invalid value for "is_system", must be one of ALL, CUSTOM, BUILT_IN.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[name timeUpdated associationCount sourceType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, timeUpdated, associationCount, sourceType.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sources'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:entityType] = opts[:entity_type] if opts[:entity_type]
      query_params[:sourceDisplayText] = opts[:source_display_text] if opts[:source_display_text]
      query_params[:isSystem] = opts[:is_system] if opts[:is_system]
      query_params[:isAutoAssociated] = opts[:is_auto_associated] if !opts[:is_auto_associated].nil?
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:isSimplified] = opts[:is_simplified] if !opts[:is_simplified].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_sources') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsSourceCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This API returns the list of work request errors if any.
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::WorkRequestErrorCollection WorkRequestErrorCollection}
    def list_storage_work_request_errors(compartment_id, work_request_id, namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_storage_work_request_errors.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_storage_work_request_errors." if compartment_id.nil?
      raise "Missing the required parameter 'work_request_id' when calling list_storage_work_request_errors." if work_request_id.nil?
      raise "Missing the required parameter 'namespace_name' when calling list_storage_work_request_errors." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storageWorkRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s).sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_storage_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::WorkRequestErrorCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This API lists storage work requests.  Use query parameters to narrow down or sort the result list.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by This is the query parameter of which field to sort by. Only one sort order may be provided. Default order for timeAccepted
    #   is descending. If no value is specified timeAccepted is default.
    #    (default to timeAccepted)
    #   Allowed values are: timeAccepted, timeExpires, timeFinished
    # @option opts [String] :operation_type The is the work request type query parameter
    # @option opts [String] :status The is the work request status query parameter
    # @option opts [DateTime] :time_started The is the query parameter of when the processing of work request was started
    # @option opts [DateTime] :time_finished The is the query parameter of when the processing of work request was finished
    # @option opts [String] :policy_name This is the query parameter of purge policy name
    # @option opts [String] :policy_id This is the query parameter of purge policy ID
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::StorageWorkRequestCollection StorageWorkRequestCollection}
    def list_storage_work_requests(compartment_id, namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_storage_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_storage_work_requests." if compartment_id.nil?
      raise "Missing the required parameter 'namespace_name' when calling list_storage_work_requests." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeAccepted timeExpires timeFinished].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeAccepted, timeExpires, timeFinished.'
      end

      if opts[:operation_type] && !OCI::LogAnalytics::Models::STORAGE_OPERATION_TYPE_ENUM.include?(opts[:operation_type])
        raise 'Invalid value for "operation_type", must be one of the values in OCI::LogAnalytics::Models::STORAGE_OPERATION_TYPE_ENUM.'
      end

      if opts[:status] && !OCI::LogAnalytics::Models::WORK_REQUEST_STATUS_ENUM.include?(opts[:status])
        raise 'Invalid value for "status", must be one of the values in OCI::LogAnalytics::Models::WORK_REQUEST_STATUS_ENUM.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storageWorkRequests'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:operationType] = opts[:operation_type] if opts[:operation_type]
      query_params[:status] = opts[:status] if opts[:status]
      query_params[:timeStarted] = opts[:time_started] if opts[:time_started]
      query_params[:timeFinished] = opts[:time_finished] if opts[:time_finished]
      query_params[:policyName] = opts[:policy_name] if opts[:policy_name]
      query_params[:policyId] = opts[:policy_id] if opts[:policy_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_storage_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::StorageWorkRequestCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the list of character encodings supported for log files.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 100)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::CharEncodingCollection CharEncodingCollection}
    def list_supported_char_encodings(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_supported_char_encodings.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_supported_char_encodings." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/supportedCharEncodings'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_supported_char_encodings') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::CharEncodingCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets timezones that are supported when performing uploads.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 100)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::TimezoneCollection TimezoneCollection}
    def list_supported_timezones(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_supported_timezones.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_supported_timezones." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/supportedTimezones'.sub('{namespaceName}', namespace_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_supported_timezones') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::TimezoneCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets list of files in an upload.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_reference Unique internal identifier to refer to upload container
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 50)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, fileName, logGroup, sourceName, status
    # @option opts [String] :search_str Search string used to filtering uploads based on file name, log group name and log source name.
    # @option opts [Array<String>] :status Upload Status. (default to [])
    #   Allowed values are: IN_PROGRESS, SUCCESSFUL, FAILED
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::UploadFileCollection UploadFileCollection}
    def list_upload_files(namespace_name, upload_reference, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_upload_files.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_upload_files." if namespace_name.nil?
      raise "Missing the required parameter 'upload_reference' when calling list_upload_files." if upload_reference.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated fileName logGroup sourceName status].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, fileName, logGroup, sourceName, status.'
      end


      status_allowable_values = %w[IN_PROGRESS SUCCESSFUL FAILED]
      if opts[:status] && !opts[:status].empty?
        opts[:status].each do |val_to_check|
          unless status_allowable_values.include?(val_to_check)
            raise 'Invalid value for "status", must be one of IN_PROGRESS, SUCCESSFUL, FAILED.'
          end
        end
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'upload_reference' must not be blank" if OCI::Internal::Util.blank_string?(upload_reference)

      path = '/namespaces/{namespaceName}/uploads/{uploadReference}/files'.sub('{namespaceName}', namespace_name.to_s).sub('{uploadReference}', upload_reference.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:searchStr] = opts[:search_str] if opts[:search_str]
      query_params[:status] = OCI::ApiClient.build_collection_params(opts[:status], :multi) if opts[:status] && !opts[:status].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_upload_files') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::UploadFileCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets list of warnings in an upload explaining the failures due to incorrect configuration.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_reference Unique internal identifier to refer to upload container
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 50)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::UploadWarningCollection UploadWarningCollection}
    def list_upload_warnings(namespace_name, upload_reference, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_upload_warnings.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_upload_warnings." if namespace_name.nil?
      raise "Missing the required parameter 'upload_reference' when calling list_upload_warnings." if upload_reference.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'upload_reference' must not be blank" if OCI::Internal::Util.blank_string?(upload_reference)

      path = '/namespaces/{namespaceName}/uploads/{uploadReference}/warnings'.sub('{namespaceName}', namespace_name.to_s).sub('{uploadReference}', upload_reference.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_upload_warnings') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::UploadWarningCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all On-demand uploads.
    # To use this and other API operations, you must be authorized in an IAM policy.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name Name of the upload container.
    # @option opts [String] :name_contains A filter to return only uploads whose name contains the given name.
    #
    # @option opts [Integer] :limit The maximum number of items to return. (default to 50)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeUpdated is descending.
    #   Default order for name is ascending. If no value is specified timeUpdated is default.
    #    (default to timeUpdated)
    #   Allowed values are: timeUpdated, timeCreated, name
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::UploadCollection UploadCollection}
    def list_uploads(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_uploads.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_uploads." if namespace_name.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeUpdated timeCreated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeUpdated, timeCreated, name.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/uploads'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:nameContains] = opts[:name_contains] if opts[:name_contains]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_uploads') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::UploadCollection'
        )
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
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::WorkRequestErrorCollection WorkRequestErrorCollection}
    def list_work_request_errors(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_work_request_errors." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/workRequests/{workRequestId}/errors'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::WorkRequestErrorCollection'
        )
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
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::WorkRequestLogCollection WorkRequestLogCollection}
    def list_work_request_logs(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_work_request_logs." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/workRequests/{workRequestId}/logs'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::WorkRequestLogCollection'
        )
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
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::WorkRequestCollection WorkRequestCollection}
    def list_work_requests(namespace_name, compartment_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#list_work_requests.' if logger

      raise "Missing the required parameter 'namespace_name' when calling list_work_requests." if namespace_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/workRequests'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::WorkRequestCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Off-boards a tenant from Logging Analytics
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
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
    def offboard_namespace(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#offboard_namespace.' if logger

      raise "Missing the required parameter 'namespace_name' when calling offboard_namespace." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/actions/offboard'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#offboard_namespace') do
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


    # On-boards a tenant to Logging Analytics.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
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
    # @return [Response] A Response object with data of type nil
    def onboard_namespace(namespace_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#onboard_namespace.' if logger

      raise "Missing the required parameter 'namespace_name' when calling onboard_namespace." if namespace_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/actions/onboard'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#onboard_namespace') do
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


    # Describe query
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::ParseQueryDetails] parse_query_details Query string to be parsed
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ParseQueryOutput ParseQueryOutput}
    def parse_query(namespace_name, parse_query_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#parse_query.' if logger

      raise "Missing the required parameter 'namespace_name' when calling parse_query." if namespace_name.nil?
      raise "Missing the required parameter 'parse_query_details' when calling parse_query." if parse_query_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/search/actions/parse'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(parse_query_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#parse_query') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ParseQueryOutput'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This API submits a work request to purge data. Only data from log groups that the user has permission to delete
    # will be purged.  To purge all data, the user must have permission to all log groups.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::PurgeStorageDataDetails] purge_storage_data_details This is the input to purge old data.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def purge_storage_data(namespace_name, purge_storage_data_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#purge_storage_data.' if logger

      raise "Missing the required parameter 'namespace_name' when calling purge_storage_data." if namespace_name.nil?
      raise "Missing the required parameter 'purge_storage_data_details' when calling purge_storage_data." if purge_storage_data_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/purgeData'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(purge_storage_data_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#purge_storage_data') do
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


    # Put the work request specified by {workRequestId} into the background. Backgrounded queries will preserve query results on query completion for up to 7 days for recall. After 7 days the results and query expire.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] work_request_id Work Request Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the asynchronous request.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::QueryWorkRequest QueryWorkRequest}
    def put_query_work_request_background(namespace_name, work_request_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#put_query_work_request_background.' if logger

      raise "Missing the required parameter 'namespace_name' when calling put_query_work_request_background." if namespace_name.nil?
      raise "Missing the required parameter 'work_request_id' when calling put_query_work_request_background." if work_request_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/namespaces/{namespaceName}/queryWorkRequests/{workRequestId}/actions/background'.sub('{namespaceName}', namespace_name.to_s).sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#put_query_work_request_background') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::QueryWorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Performs a log analytics search, if shouldRunAsync is false returns the query results once they become available subject to 60 second timeout. If a query is subject to exceed that time then it should be run asynchronously. Asynchronous query submissions return the queryWorkRequestId to use for execution tracking, query submission lifecycle actions and to poll for query results.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::QueryDetails] query_details Query to be executed.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit Maximum number of results to return in this request.  Note a limit=-1 returns all results from pageId onwards up to maxtotalCount. (default to 10)
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::QueryAggregation QueryAggregation}
    def query(namespace_name, query_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#query.' if logger

      raise "Missing the required parameter 'namespace_name' when calling query." if namespace_name.nil?
      raise "Missing the required parameter 'query_details' when calling query." if query_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/search/actions/query'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(query_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#query') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::QueryAggregation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This API submits a work request to recall archived data based on time interval and data type.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::RecallArchivedDataDetails] recall_archived_data_details This is the input to recall archived data.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def recall_archived_data(namespace_name, recall_archived_data_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#recall_archived_data.' if logger

      raise "Missing the required parameter 'namespace_name' when calling recall_archived_data." if namespace_name.nil?
      raise "Missing the required parameter 'recall_archived_data_details' when calling recall_archived_data." if recall_archived_data_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/recallArchivedData'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(recall_archived_data_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#recall_archived_data') do
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


    # register lookup
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] type type - possible values are Lookup or Dictionary
    #   Allowed values are: Lookup, Dictionary
    # @param [String, IO] register_lookup_content_file_body file containing data for lookup creation
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name A filter to return only log analytics entities whose name matches the entire name given. The match
    #   is case-insensitive.
    #
    # @option opts [String] :description Description of the fields to get
    # @option opts [String] :char_encoding Character Encoding (default to UTF-8)
    # @option opts [BOOLEAN] :is_hidden is hidden
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLookup LogAnalyticsLookup}
    def register_lookup(namespace_name, type, register_lookup_content_file_body, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#register_lookup.' if logger

      raise "Missing the required parameter 'namespace_name' when calling register_lookup." if namespace_name.nil?
      raise "Missing the required parameter 'type' when calling register_lookup." if type.nil?
      unless %w[Lookup Dictionary].include?(type)
        raise "Invalid value for 'type', must be one of Lookup, Dictionary."
      end
      raise "Missing the required parameter 'register_lookup_content_file_body' when calling register_lookup." if register_lookup_content_file_body.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/lookups/actions/register'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:type] = type
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:description] = opts[:description] if opts[:description]
      query_params[:charEncoding] = opts[:char_encoding] if opts[:char_encoding]
      query_params[:isHidden] = opts[:is_hidden] if !opts[:is_hidden].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(register_lookup_content_file_body)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#register_lookup') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLookup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This API submits a work request to release recalled data based on time interval and data type.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::ReleaseRecalledDataDetails] release_recalled_data_details This is the input to release recalled data
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def release_recalled_data(namespace_name, release_recalled_data_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#release_recalled_data.' if logger

      raise "Missing the required parameter 'namespace_name' when calling release_recalled_data." if namespace_name.nil?
      raise "Missing the required parameter 'release_recalled_data_details' when calling release_recalled_data." if release_recalled_data_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage/actions/releaseRecalledData'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(release_recalled_data_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#release_recalled_data') do
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


    # Delete association between input source log analytics entity and destination entities.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [OCI::LogAnalytics::Models::RemoveEntityAssociationsDetails] remove_entity_associations_details This parameter specifies the entity OCIDs with which associations are to be deleted. Specify destination OCIDs as comma separated string.
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
    def remove_entity_associations(namespace_name, log_analytics_entity_id, remove_entity_associations_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#remove_entity_associations.' if logger

      raise "Missing the required parameter 'namespace_name' when calling remove_entity_associations." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling remove_entity_associations." if log_analytics_entity_id.nil?
      raise "Missing the required parameter 'remove_entity_associations_details' when calling remove_entity_associations." if remove_entity_associations_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}/actions/removeEntityAssociations'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
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

      post_body = @api_client.object_to_http_body(remove_entity_associations_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#remove_entity_associations') do
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


    # Execute the saved search acceleration task in the foreground.
    # The ScheduledTask taskType must be ACCELERATION.
    # Optionally specify time range (timeStart and timeEnd). The default is all time.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_start Optional parameter to specify start of time range, in the format defined by RFC3339.
    #   Default value is beginning of time.
    #
    # @option opts [DateTime] :time_end Optional parameter to specify end of time range, in the format defined by RFC3339.
    #   Default value is end of time.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    def run(namespace_name, scheduled_task_id, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#run.' if logger

      raise "Missing the required parameter 'namespace_name' when calling run." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling run." if scheduled_task_id.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}/actions/run'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:timeStart] = opts[:time_start] if opts[:time_start]
      query_params[:timeEnd] = opts[:time_end] if opts[:time_end]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#run') do
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


    # Returns a context specific list of either commands, fields, or values to append to the end of the specified query string if applicable.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::SuggestDetails] suggest_details Query string seeking suggestions for.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::SuggestOutput SuggestOutput}
    def suggest(namespace_name, suggest_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#suggest.' if logger

      raise "Missing the required parameter 'namespace_name' when calling suggest." if namespace_name.nil?
      raise "Missing the required parameter 'suggest_details' when calling suggest." if suggest_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/search/actions/suggest'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(suggest_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#suggest') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::SuggestOutput'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # test parser
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::TestParserPayloadDetails] test_parser_payload_details Details for test payload
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :scope scope
    #   Allowed values are: LOG_LINES, LOG_ENTRIES, LOG_LINES_LOG_ENTRIES
    # @option opts [String] :req_origin_module module
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ParserTestResult ParserTestResult}
    def test_parser(namespace_name, test_parser_payload_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#test_parser.' if logger

      raise "Missing the required parameter 'namespace_name' when calling test_parser." if namespace_name.nil?
      raise "Missing the required parameter 'test_parser_payload_details' when calling test_parser." if test_parser_payload_details.nil?

      if opts[:scope] && !%w[LOG_LINES LOG_ENTRIES LOG_LINES_LOG_ENTRIES].include?(opts[:scope])
        raise 'Invalid value for "scope", must be one of LOG_LINES, LOG_ENTRIES, LOG_LINES_LOG_ENTRIES.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parsers/actions/test'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = opts[:scope] if opts[:scope]
      query_params[:reqOriginModule] = opts[:req_origin_module] if opts[:req_origin_module]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(test_parser_payload_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#test_parser') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ParserTestResult'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Update the log analytics entity with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_entity_id The log analytics entity OCID.
    #
    # @param [OCI::LogAnalytics::Models::UpdateLogAnalyticsEntityDetails] update_log_analytics_entity_details The information to be updated.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsEntity LogAnalyticsEntity}
    def update_log_analytics_entity(namespace_name, log_analytics_entity_id, update_log_analytics_entity_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_log_analytics_entity.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_log_analytics_entity." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_entity_id' when calling update_log_analytics_entity." if log_analytics_entity_id.nil?
      raise "Missing the required parameter 'update_log_analytics_entity_details' when calling update_log_analytics_entity." if update_log_analytics_entity_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_entity_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_entity_id)

      path = '/namespaces/{namespaceName}/logAnalyticsEntities/{logAnalyticsEntityId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsEntityId}', log_analytics_entity_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_log_analytics_entity_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_log_analytics_entity') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsEntity'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Update custom log analytics entity type. Out of box entity types cannot be udpated.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpdateLogAnalyticsEntityTypeDetails] update_log_analytics_entity_type_details Log analytics entity type update details.
    # @param [String] entity_type_name Log analytics entity type name.
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
    # @return [Response] A Response object with data of type nil
    def update_log_analytics_entity_type(namespace_name, update_log_analytics_entity_type_details, entity_type_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_log_analytics_entity_type.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_log_analytics_entity_type." if namespace_name.nil?
      raise "Missing the required parameter 'update_log_analytics_entity_type_details' when calling update_log_analytics_entity_type." if update_log_analytics_entity_type_details.nil?
      raise "Missing the required parameter 'entity_type_name' when calling update_log_analytics_entity_type." if entity_type_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'entity_type_name' must not be blank" if OCI::Internal::Util.blank_string?(entity_type_name)

      path = '/namespaces/{namespaceName}/logAnalyticsEntityTypes/{entityTypeName}'.sub('{namespaceName}', namespace_name.to_s).sub('{entityTypeName}', entity_type_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_log_analytics_entity_type_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_log_analytics_entity_type') do
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


    # Updates the Log-Analytics group with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_log_group_id unique logAnalytics log group identifier
    # @param [OCI::LogAnalytics::Models::UpdateLogAnalyticsLogGroupDetails] update_log_analytics_log_group_details The information to be updated.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLogGroup LogAnalyticsLogGroup}
    def update_log_analytics_log_group(namespace_name, log_analytics_log_group_id, update_log_analytics_log_group_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_log_analytics_log_group.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_log_analytics_log_group." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_log_group_id' when calling update_log_analytics_log_group." if log_analytics_log_group_id.nil?
      raise "Missing the required parameter 'update_log_analytics_log_group_details' when calling update_log_analytics_log_group." if update_log_analytics_log_group_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_log_group_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_log_group_id)

      path = '/namespaces/{namespaceName}/logAnalyticsLogGroups/{logAnalyticsLogGroupId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsLogGroupId}', log_analytics_log_group_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_log_analytics_log_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_log_analytics_log_group') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLogGroup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Update the rule with the given id.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] log_analytics_object_collection_rule_id The Logging Analytics Object Collection Rule [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm)
    # @param [OCI::LogAnalytics::Models::UpdateLogAnalyticsObjectCollectionRuleDetails] update_log_analytics_object_collection_rule_details The rule config to be updated.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule LogAnalyticsObjectCollectionRule}
    def update_log_analytics_object_collection_rule(namespace_name, log_analytics_object_collection_rule_id, update_log_analytics_object_collection_rule_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_log_analytics_object_collection_rule.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_log_analytics_object_collection_rule." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_object_collection_rule_id' when calling update_log_analytics_object_collection_rule." if log_analytics_object_collection_rule_id.nil?
      raise "Missing the required parameter 'update_log_analytics_object_collection_rule_details' when calling update_log_analytics_object_collection_rule." if update_log_analytics_object_collection_rule_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'log_analytics_object_collection_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(log_analytics_object_collection_rule_id)

      path = '/namespaces/{namespaceName}/logAnalyticsObjectCollectionRules/{logAnalyticsObjectCollectionRuleId}'.sub('{namespaceName}', namespace_name.to_s).sub('{logAnalyticsObjectCollectionRuleId}', log_analytics_object_collection_rule_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_log_analytics_object_collection_rule_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_log_analytics_object_collection_rule') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsObjectCollectionRule'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Update the scheduled task. Schedules may be updated only for taskType SAVED_SEARCH and PURGE.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] scheduled_task_id Unique scheduledTask id returned from task create.
    #   If invalid will lead to a 404 not found.
    #
    # @param [OCI::LogAnalytics::Models::UpdateScheduledTaskDetails] update_scheduled_task_details Update details.
    #   Schedules may be updated only for taskType SAVED_SEARCH and PURGE.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ScheduledTask ScheduledTask}
    def update_scheduled_task(namespace_name, scheduled_task_id, update_scheduled_task_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_scheduled_task.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_scheduled_task." if namespace_name.nil?
      raise "Missing the required parameter 'scheduled_task_id' when calling update_scheduled_task." if scheduled_task_id.nil?
      raise "Missing the required parameter 'update_scheduled_task_details' when calling update_scheduled_task." if update_scheduled_task_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)
      raise "Parameter value for 'scheduled_task_id' must not be blank" if OCI::Internal::Util.blank_string?(scheduled_task_id)

      path = '/namespaces/{namespaceName}/scheduledTasks/{scheduledTaskId}'.sub('{namespaceName}', namespace_name.to_s).sub('{scheduledTaskId}', scheduled_task_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_scheduled_task_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_scheduled_task') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ScheduledTask'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This API updates the archiving configuration
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpdateStorageDetails] update_storage_details This is the archiving configuration
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Storage Storage}
    def update_storage(namespace_name, update_storage_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#update_storage.' if logger

      raise "Missing the required parameter 'namespace_name' when calling update_storage." if namespace_name.nil?
      raise "Missing the required parameter 'update_storage_details' when calling update_storage." if update_storage_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/storage'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_storage_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#update_storage') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Storage'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Accepts log data for processing by Logging Analytics.
    #
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] upload_name The name of the upload. This can be considered as a container name where different kind of logs will be collected and searched together. This upload name/id can further be used for retrieving the details of the upload, including its status or deleting the upload.
    #
    # @param [String] log_source_name Name of the log source that will be used to process the files being uploaded.
    #
    # @param [String] filename The name of the file being uploaded. The extension of the filename part will be used to detect the type of file (like zip, tar).
    #
    # @param [String] opc_meta_loggrpid The log group OCID to which the log data in this upload will be mapped to.
    #
    # @param [String, IO] upload_log_file_body Log data
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :entity_id The entity OCID.
    #
    # @option opts [String] :timezone Timezone to be used when processing log entries whose timestamps do not include an explicit timezone. When this property is not specified, the timezone of the entity specified is used. If the entity is also not specified or do not have a valid timezone then UTC is used
    #
    # @option opts [String] :char_encoding Character Encoding (default to UTF-8)
    # @option opts [String] :date_format This property is used to specify the format of the date. This is to be used for ambiguous dates like 12/11/10. This property can take any of the following values -  MONTH_DAY_YEAR, DAY_MONTH_YEAR, YEAR_MONTH_DAY, MONTH_DAY, DAY_MONTH.
    #
    # @option opts [String] :date_year Used to indicate the year where the log entries timestamp do not mention year (Ex: Nov  8 20:45:56).
    #
    # @option opts [BOOLEAN] :invalidate_cache This property can be used to reset configuration cache in case of an issue with the upload. (default to false)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :content_md5 The base-64 encoded MD5 hash of the body. If the Content-MD5 header is present, Logging Analytics performs an integrity check
    #   on the body of the HTTP request by computing the MD5 hash for the body and comparing it to the MD5 hash supplied in the header.
    #   If the two hashes do not match, the log data is rejected and an HTTP-400 Unmatched Content MD5 error is returned with the message:
    #
    #   \"The computed MD5 of the request body (ACTUAL_MD5) does not match the Content-MD5 header (HEADER_MD5)\"
    #
    # @option opts [String] :content_type The content type of the log data.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::Upload Upload}
    def upload_log_file(namespace_name, upload_name, log_source_name, filename, opc_meta_loggrpid, upload_log_file_body, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#upload_log_file.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upload_log_file." if namespace_name.nil?
      raise "Missing the required parameter 'upload_name' when calling upload_log_file." if upload_name.nil?
      raise "Missing the required parameter 'log_source_name' when calling upload_log_file." if log_source_name.nil?
      raise "Missing the required parameter 'filename' when calling upload_log_file." if filename.nil?
      raise "Missing the required parameter 'opc_meta_loggrpid' when calling upload_log_file." if opc_meta_loggrpid.nil?
      raise "Missing the required parameter 'upload_log_file_body' when calling upload_log_file." if upload_log_file_body.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/actions/uploadLogFile'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :exclude_body

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:uploadName] = upload_name
      query_params[:logSourceName] = log_source_name
      query_params[:filename] = filename
      query_params[:entityId] = opts[:entity_id] if opts[:entity_id]
      query_params[:timezone] = opts[:timezone] if opts[:timezone]
      query_params[:charEncoding] = opts[:char_encoding] if opts[:char_encoding]
      query_params[:dateFormat] = opts[:date_format] if opts[:date_format]
      query_params[:dateYear] = opts[:date_year] if opts[:date_year]
      query_params[:invalidateCache] = opts[:invalidate_cache] if !opts[:invalidate_cache].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'opc-meta-loggrpid'] = opc_meta_loggrpid
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'content-md5'] = opts[:content_md5] if opts[:content_md5]
      header_params[:'content-type'] = opts[:content_type] if opts[:content_type]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upload_log_file_body)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#upload_log_file') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::Upload'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # create or update associations for a source
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsAssociationDetails] upsert_log_analytics_association_details list of association details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_from_republish isFromRepublish
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    def upsert_associations(namespace_name, upsert_log_analytics_association_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#upsert_associations.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upsert_associations." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_association_details' when calling upsert_associations." if upsert_log_analytics_association_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/associations/actions/upsert'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isFromRepublish] = opts[:is_from_republish] if !opts[:is_from_republish].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upsert_log_analytics_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#upsert_associations') do
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


    # Defines or update a field.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsFieldDetails] upsert_log_analytics_field_details Details for the new LogAnalyticsFieldDetails.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsField LogAnalyticsField}
    def upsert_field(namespace_name, upsert_log_analytics_field_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#upsert_field.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upsert_field." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_field_details' when calling upsert_field." if upsert_log_analytics_field_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/fields/actions/upsert'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(upsert_log_analytics_field_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#upsert_field') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsField'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Define or update a label.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsLabelDetails] upsert_log_analytics_label_details Details for the new LogAnalyticsTagDetails.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsLabel LogAnalyticsLabel}
    def upsert_label(namespace_name, upsert_log_analytics_label_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#upsert_label.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upsert_label." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_label_details' when calling upsert_label." if upsert_log_analytics_label_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/labels/actions/upsert'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(upsert_log_analytics_label_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#upsert_label') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsLabel'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Define or update parser
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsParserDetails] upsert_log_analytics_parser_details Details for the new LoganParserDetails.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsParser LogAnalyticsParser}
    def upsert_parser(namespace_name, upsert_log_analytics_parser_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#upsert_parser.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upsert_parser." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_parser_details' when calling upsert_parser." if upsert_log_analytics_parser_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/parsers/actions/upsert'.sub('{namespaceName}', namespace_name.to_s)
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

      post_body = @api_client.object_to_http_body(upsert_log_analytics_parser_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#upsert_parser') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsParser'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Define or update a source
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsSourceDetails] upsert_log_analytics_source_details Details for the new LoganSourceDetails.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :create_like_source_id create like sourceId
    # @option opts [BOOLEAN] :is_incremental is incremental
    # @option opts [BOOLEAN] :is_ignore_warning is ignore warning
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsSource LogAnalyticsSource}
    def upsert_source(namespace_name, upsert_log_analytics_source_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#upsert_source.' if logger

      raise "Missing the required parameter 'namespace_name' when calling upsert_source." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_source_details' when calling upsert_source." if upsert_log_analytics_source_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sources/actions/upsert'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:createLikeSourceId] = opts[:create_like_source_id] if opts[:create_like_source_id]
      query_params[:isIncremental] = opts[:is_incremental] if !opts[:is_incremental].nil?
      query_params[:isIgnoreWarning] = opts[:is_ignore_warning] if !opts[:is_ignore_warning].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upsert_log_analytics_source_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#upsert_source') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsSource'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # association parameter validation
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsAssociationDetails] upsert_log_analytics_association_details Details for the new log analytics associations.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by sort by field (default to sourceDisplayName)
    #   Allowed values are: sourceDisplayName, status
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::LogAnalyticsAssociationParameterCollection LogAnalyticsAssociationParameterCollection}
    def validate_association_parameters(namespace_name, upsert_log_analytics_association_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#validate_association_parameters.' if logger

      raise "Missing the required parameter 'namespace_name' when calling validate_association_parameters." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_association_details' when calling validate_association_parameters." if upsert_log_analytics_association_details.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[sourceDisplayName status].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of sourceDisplayName, status.'
      end
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/associations/actions/validateParameters'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upsert_log_analytics_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#validate_association_parameters') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::LogAnalyticsAssociationParameterCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Validates a log file to check whether it is eligible to upload or not.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] object_location Location of the log file
    # @param [String] filename The name of the file being uploaded. The extension of the filename part will be used to detect the type of file (like zip, tar).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::FileValidationResponse FileValidationResponse}
    def validate_file(namespace_name, object_location, filename, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#validate_file.' if logger

      raise "Missing the required parameter 'namespace_name' when calling validate_file." if namespace_name.nil?
      raise "Missing the required parameter 'object_location' when calling validate_file." if object_location.nil?
      raise "Missing the required parameter 'filename' when calling validate_file." if filename.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/uploads/actions/validateFile'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:objectLocation] = object_location
      query_params[:filename] = filename

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#validate_file') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::FileValidationResponse'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Pre-define or update a source
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::UpsertLogAnalyticsSourceDetails] upsert_log_analytics_source_details Details for the new LoganSourceDetails.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :create_like_source_id create like sourceId
    # @option opts [BOOLEAN] :is_incremental is incremental
    # @option opts [BOOLEAN] :is_ignore_warning is ignore warning
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::SourceValidateResults SourceValidateResults}
    def validate_source(namespace_name, upsert_log_analytics_source_details, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#validate_source.' if logger

      raise "Missing the required parameter 'namespace_name' when calling validate_source." if namespace_name.nil?
      raise "Missing the required parameter 'upsert_log_analytics_source_details' when calling validate_source." if upsert_log_analytics_source_details.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sources/actions/validate'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:createLikeSourceId] = opts[:create_like_source_id] if opts[:create_like_source_id]
      query_params[:isIncremental] = opts[:is_incremental] if !opts[:is_incremental].nil?
      query_params[:isIgnoreWarning] = opts[:is_ignore_warning] if !opts[:is_ignore_warning].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(upsert_log_analytics_source_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#validate_source') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::SourceValidateResults'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # test extended fields
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [OCI::LogAnalytics::Models::LogAnalyticsSource] log_analytics_source Details for the new LogAnalyticsSource.
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
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::ExtendedFieldsValidationResult ExtendedFieldsValidationResult}
    def validate_source_extended_field_details(namespace_name, log_analytics_source, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#validate_source_extended_field_details.' if logger

      raise "Missing the required parameter 'namespace_name' when calling validate_source_extended_field_details." if namespace_name.nil?
      raise "Missing the required parameter 'log_analytics_source' when calling validate_source_extended_field_details." if log_analytics_source.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/sources/actions/validateExtendedFields'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json;charset=UTF-8'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(log_analytics_source)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#validate_source_extended_field_details') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::ExtendedFieldsValidationResult'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Validates the source mapping for given file and provides match status and parsed representation of log data.
    # @param [String] namespace_name The Logging Analytics namespace used for the request.
    #
    # @param [String] object_location Location of the log file
    # @param [String] filename The name of the file being uploaded. The extension of the filename part will be used to detect the type of file (like zip, tar).
    #
    # @param [String] log_source_name Name of the log source that will be used to process the files being uploaded.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::LogAnalytics::Models::SourceMappingResponse SourceMappingResponse}
    def validate_source_mapping(namespace_name, object_location, filename, log_source_name, opts = {})
      logger.debug 'Calling operation LogAnalyticsClient#validate_source_mapping.' if logger

      raise "Missing the required parameter 'namespace_name' when calling validate_source_mapping." if namespace_name.nil?
      raise "Missing the required parameter 'object_location' when calling validate_source_mapping." if object_location.nil?
      raise "Missing the required parameter 'filename' when calling validate_source_mapping." if filename.nil?
      raise "Missing the required parameter 'log_source_name' when calling validate_source_mapping." if log_source_name.nil?
      raise "Parameter value for 'namespace_name' must not be blank" if OCI::Internal::Util.blank_string?(namespace_name)

      path = '/namespaces/{namespaceName}/uploads/actions/validateSourceMapping'.sub('{namespaceName}', namespace_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:objectLocation] = object_location
      query_params[:filename] = filename
      query_params[:logSourceName] = log_source_name

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LogAnalyticsClient#validate_source_mapping') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LogAnalytics::Models::SourceMappingResponse'
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
