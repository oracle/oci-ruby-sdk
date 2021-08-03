# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Operations Insights API to perform data extraction operations to obtain database
  # resource utilization, performance statistics, and reference information. For more information,
  # see [About Oracle Cloud Infrastructure Operations Insights](https://docs.cloud.oracle.com/en-us/iaas/operations-insights/doc/operations-insights.html).
  class Opsi::OperationsInsightsClient
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


    # Creates a new OperationsInsightsClient.
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
        @endpoint = endpoint + '/20200630'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "OperationsInsightsClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://operationsinsights.{region}.oci.{secondLevelDomain}') + '/20200630'
      logger.info "OperationsInsightsClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a DatabaseInsight resource from one compartment identifier to another. When provided, If-Match is checked against ETag values of the resource.
    # @param [String] database_insight_id Unique database insight identifier
    # @param [OCI::Opsi::Models::ChangeDatabaseInsightCompartmentDetails] change_database_insight_compartment_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/change_database_insight_compartment.rb.html) to see an example of how to use change_database_insight_compartment API.
    def change_database_insight_compartment(database_insight_id, change_database_insight_compartment_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#change_database_insight_compartment.' if logger

      raise "Missing the required parameter 'database_insight_id' when calling change_database_insight_compartment." if database_insight_id.nil?
      raise "Missing the required parameter 'change_database_insight_compartment_details' when calling change_database_insight_compartment." if change_database_insight_compartment_details.nil?
      raise "Parameter value for 'database_insight_id' must not be blank" if OCI::Internal::Util.blank_string?(database_insight_id)

      path = '/databaseInsights/{databaseInsightId}/actions/changeCompartment'.sub('{databaseInsightId}', database_insight_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_database_insight_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#change_database_insight_compartment') do
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


    # Moves a EnterpriseManagerBridge resource from one compartment to another. When provided, If-Match is checked against ETag values of the resource.
    # @param [String] enterprise_manager_bridge_id Unique Enterprise Manager bridge identifier
    # @param [OCI::Opsi::Models::ChangeEnterpriseManagerBridgeCompartmentDetails] change_enterprise_manager_bridge_compartment_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/change_enterprise_manager_bridge_compartment.rb.html) to see an example of how to use change_enterprise_manager_bridge_compartment API.
    def change_enterprise_manager_bridge_compartment(enterprise_manager_bridge_id, change_enterprise_manager_bridge_compartment_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#change_enterprise_manager_bridge_compartment.' if logger

      raise "Missing the required parameter 'enterprise_manager_bridge_id' when calling change_enterprise_manager_bridge_compartment." if enterprise_manager_bridge_id.nil?
      raise "Missing the required parameter 'change_enterprise_manager_bridge_compartment_details' when calling change_enterprise_manager_bridge_compartment." if change_enterprise_manager_bridge_compartment_details.nil?
      raise "Parameter value for 'enterprise_manager_bridge_id' must not be blank" if OCI::Internal::Util.blank_string?(enterprise_manager_bridge_id)

      path = '/enterpriseManagerBridges/{enterpriseManagerBridgeId}/actions/changeCompartment'.sub('{enterpriseManagerBridgeId}', enterprise_manager_bridge_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_enterprise_manager_bridge_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#change_enterprise_manager_bridge_compartment') do
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


    # Moves a HostInsight resource from one compartment identifier to another. When provided, If-Match is checked against ETag values of the resource.
    # @param [String] host_insight_id Unique host insight identifier
    # @param [OCI::Opsi::Models::ChangeHostInsightCompartmentDetails] change_host_insight_compartment_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/change_host_insight_compartment.rb.html) to see an example of how to use change_host_insight_compartment API.
    def change_host_insight_compartment(host_insight_id, change_host_insight_compartment_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#change_host_insight_compartment.' if logger

      raise "Missing the required parameter 'host_insight_id' when calling change_host_insight_compartment." if host_insight_id.nil?
      raise "Missing the required parameter 'change_host_insight_compartment_details' when calling change_host_insight_compartment." if change_host_insight_compartment_details.nil?
      raise "Parameter value for 'host_insight_id' must not be blank" if OCI::Internal::Util.blank_string?(host_insight_id)

      path = '/hostInsights/{hostInsightId}/actions/changeCompartment'.sub('{hostInsightId}', host_insight_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_host_insight_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#change_host_insight_compartment') do
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


    # Create a Database Insight resource for a database in Operations Insights. The database will be enabled in Operations Insights. Database metric collection and analysis will be started.
    #
    # @param [OCI::Opsi::Models::CreateDatabaseInsightDetails] create_database_insight_details Details for the database for which a Database Insight resource will be created in Operations Insights.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::DatabaseInsight DatabaseInsight}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/create_database_insight.rb.html) to see an example of how to use create_database_insight API.
    def create_database_insight(create_database_insight_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#create_database_insight.' if logger

      raise "Missing the required parameter 'create_database_insight_details' when calling create_database_insight." if create_database_insight_details.nil?

      path = '/databaseInsights'
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

      post_body = @api_client.object_to_http_body(create_database_insight_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#create_database_insight') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::DatabaseInsight'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Create a Enterprise Manager bridge in Operations Insights.
    #
    # @param [OCI::Opsi::Models::CreateEnterpriseManagerBridgeDetails] create_enterprise_manager_bridge_details Details for the Enterprise Manager bridge to be created in Operations Insights.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::EnterpriseManagerBridge EnterpriseManagerBridge}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/create_enterprise_manager_bridge.rb.html) to see an example of how to use create_enterprise_manager_bridge API.
    def create_enterprise_manager_bridge(create_enterprise_manager_bridge_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#create_enterprise_manager_bridge.' if logger

      raise "Missing the required parameter 'create_enterprise_manager_bridge_details' when calling create_enterprise_manager_bridge." if create_enterprise_manager_bridge_details.nil?

      path = '/enterpriseManagerBridges'
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

      post_body = @api_client.object_to_http_body(create_enterprise_manager_bridge_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#create_enterprise_manager_bridge') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::EnterpriseManagerBridge'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Create a Host Insight resource for a host in Operations Insights. The host will be enabled in Operations Insights. Host metric collection and analysis will be started.
    #
    # @param [OCI::Opsi::Models::CreateHostInsightDetails] create_host_insight_details Details for the host for which a Host Insight resource will be created in Operations Insights.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::HostInsight HostInsight}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/create_host_insight.rb.html) to see an example of how to use create_host_insight API.
    def create_host_insight(create_host_insight_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#create_host_insight.' if logger

      raise "Missing the required parameter 'create_host_insight_details' when calling create_host_insight." if create_host_insight_details.nil?

      path = '/hostInsights'
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

      post_body = @api_client.object_to_http_body(create_host_insight_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#create_host_insight') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::HostInsight'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes a database insight. The database insight will be deleted and cannot be enabled again.
    # @param [String] database_insight_id Unique database insight identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/delete_database_insight.rb.html) to see an example of how to use delete_database_insight API.
    def delete_database_insight(database_insight_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#delete_database_insight.' if logger

      raise "Missing the required parameter 'database_insight_id' when calling delete_database_insight." if database_insight_id.nil?
      raise "Parameter value for 'database_insight_id' must not be blank" if OCI::Internal::Util.blank_string?(database_insight_id)

      path = '/databaseInsights/{databaseInsightId}'.sub('{databaseInsightId}', database_insight_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#delete_database_insight') do
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


    # Deletes an Operations Insights Enterprise Manager bridge. If any database insight is still referencing this bridge, the operation will fail.
    # @param [String] enterprise_manager_bridge_id Unique Enterprise Manager bridge identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/delete_enterprise_manager_bridge.rb.html) to see an example of how to use delete_enterprise_manager_bridge API.
    def delete_enterprise_manager_bridge(enterprise_manager_bridge_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#delete_enterprise_manager_bridge.' if logger

      raise "Missing the required parameter 'enterprise_manager_bridge_id' when calling delete_enterprise_manager_bridge." if enterprise_manager_bridge_id.nil?
      raise "Parameter value for 'enterprise_manager_bridge_id' must not be blank" if OCI::Internal::Util.blank_string?(enterprise_manager_bridge_id)

      path = '/enterpriseManagerBridges/{enterpriseManagerBridgeId}'.sub('{enterpriseManagerBridgeId}', enterprise_manager_bridge_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#delete_enterprise_manager_bridge') do
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


    # Deletes a host insight. The host insight will be deleted and cannot be enabled again.
    # @param [String] host_insight_id Unique host insight identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/delete_host_insight.rb.html) to see an example of how to use delete_host_insight API.
    def delete_host_insight(host_insight_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#delete_host_insight.' if logger

      raise "Missing the required parameter 'host_insight_id' when calling delete_host_insight." if host_insight_id.nil?
      raise "Parameter value for 'host_insight_id' must not be blank" if OCI::Internal::Util.blank_string?(host_insight_id)

      path = '/hostInsights/{hostInsightId}'.sub('{hostInsightId}', host_insight_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#delete_host_insight') do
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


    # Disables a database in Operations Insights. Database metric collection and analysis will be stopped.
    # @param [String] database_insight_id Unique database insight identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/disable_database_insight.rb.html) to see an example of how to use disable_database_insight API.
    def disable_database_insight(database_insight_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#disable_database_insight.' if logger

      raise "Missing the required parameter 'database_insight_id' when calling disable_database_insight." if database_insight_id.nil?
      raise "Parameter value for 'database_insight_id' must not be blank" if OCI::Internal::Util.blank_string?(database_insight_id)

      path = '/databaseInsights/{databaseInsightId}/actions/disable'.sub('{databaseInsightId}', database_insight_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#disable_database_insight') do
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


    # Disables a host in Operations Insights. Host metric collection and analysis will be stopped.
    # @param [String] host_insight_id Unique host insight identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/disable_host_insight.rb.html) to see an example of how to use disable_host_insight API.
    def disable_host_insight(host_insight_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#disable_host_insight.' if logger

      raise "Missing the required parameter 'host_insight_id' when calling disable_host_insight." if host_insight_id.nil?
      raise "Parameter value for 'host_insight_id' must not be blank" if OCI::Internal::Util.blank_string?(host_insight_id)

      path = '/hostInsights/{hostInsightId}/actions/disable'.sub('{hostInsightId}', host_insight_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#disable_host_insight') do
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


    # Enables a database in Operations Insights. Database metric collection and analysis will be started.
    # @param [OCI::Opsi::Models::EnableDatabaseInsightDetails] enable_database_insight_details Details for the database to be enabled in Operations Insights.
    # @param [String] database_insight_id Unique database insight identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/enable_database_insight.rb.html) to see an example of how to use enable_database_insight API.
    def enable_database_insight(enable_database_insight_details, database_insight_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#enable_database_insight.' if logger

      raise "Missing the required parameter 'enable_database_insight_details' when calling enable_database_insight." if enable_database_insight_details.nil?
      raise "Missing the required parameter 'database_insight_id' when calling enable_database_insight." if database_insight_id.nil?
      raise "Parameter value for 'database_insight_id' must not be blank" if OCI::Internal::Util.blank_string?(database_insight_id)

      path = '/databaseInsights/{databaseInsightId}/actions/enable'.sub('{databaseInsightId}', database_insight_id.to_s)
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

      post_body = @api_client.object_to_http_body(enable_database_insight_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#enable_database_insight') do
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


    # Enables a host in Operations Insights. Host metric collection and analysis will be started.
    # @param [OCI::Opsi::Models::EnableHostInsightDetails] enable_host_insight_details Details for the host to be enabled in Operations Insights.
    # @param [String] host_insight_id Unique host insight identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/enable_host_insight.rb.html) to see an example of how to use enable_host_insight API.
    def enable_host_insight(enable_host_insight_details, host_insight_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#enable_host_insight.' if logger

      raise "Missing the required parameter 'enable_host_insight_details' when calling enable_host_insight." if enable_host_insight_details.nil?
      raise "Missing the required parameter 'host_insight_id' when calling enable_host_insight." if host_insight_id.nil?
      raise "Parameter value for 'host_insight_id' must not be blank" if OCI::Internal::Util.blank_string?(host_insight_id)

      path = '/hostInsights/{hostInsightId}/actions/enable'.sub('{hostInsightId}', host_insight_id.to_s)
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

      post_body = @api_client.object_to_http_body(enable_host_insight_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#enable_host_insight') do
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


    # Gets details of a database insight.
    # @param [String] database_insight_id Unique database insight identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::DatabaseInsight DatabaseInsight}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/get_database_insight.rb.html) to see an example of how to use get_database_insight API.
    def get_database_insight(database_insight_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#get_database_insight.' if logger

      raise "Missing the required parameter 'database_insight_id' when calling get_database_insight." if database_insight_id.nil?
      raise "Parameter value for 'database_insight_id' must not be blank" if OCI::Internal::Util.blank_string?(database_insight_id)

      path = '/databaseInsights/{databaseInsightId}'.sub('{databaseInsightId}', database_insight_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#get_database_insight') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::DatabaseInsight'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets details of an Operations Insights Enterprise Manager bridge.
    # @param [String] enterprise_manager_bridge_id Unique Enterprise Manager bridge identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::EnterpriseManagerBridge EnterpriseManagerBridge}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/get_enterprise_manager_bridge.rb.html) to see an example of how to use get_enterprise_manager_bridge API.
    def get_enterprise_manager_bridge(enterprise_manager_bridge_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#get_enterprise_manager_bridge.' if logger

      raise "Missing the required parameter 'enterprise_manager_bridge_id' when calling get_enterprise_manager_bridge." if enterprise_manager_bridge_id.nil?
      raise "Parameter value for 'enterprise_manager_bridge_id' must not be blank" if OCI::Internal::Util.blank_string?(enterprise_manager_bridge_id)

      path = '/enterpriseManagerBridges/{enterpriseManagerBridgeId}'.sub('{enterpriseManagerBridgeId}', enterprise_manager_bridge_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#get_enterprise_manager_bridge') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::EnterpriseManagerBridge'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets details of a host insight.
    # @param [String] host_insight_id Unique host insight identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::HostInsight HostInsight}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/get_host_insight.rb.html) to see an example of how to use get_host_insight API.
    def get_host_insight(host_insight_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#get_host_insight.' if logger

      raise "Missing the required parameter 'host_insight_id' when calling get_host_insight." if host_insight_id.nil?
      raise "Parameter value for 'host_insight_id' must not be blank" if OCI::Internal::Util.blank_string?(host_insight_id)

      path = '/hostInsights/{hostInsightId}'.sub('{hostInsightId}', host_insight_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#get_host_insight') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::HostInsight'
        )
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
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This is a generic ingest endpoint for all database configuration metrics.
    # @param [OCI::Opsi::Models::IngestDatabaseConfigurationDetails] ingest_database_configuration_details Payload for one or more database configuration metrics for a particular database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :database_id Optional [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #
    # @option opts [String] :id [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database insight resource.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::IngestDatabaseConfigurationResponseDetails IngestDatabaseConfigurationResponseDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/ingest_database_configuration.rb.html) to see an example of how to use ingest_database_configuration API.
    def ingest_database_configuration(ingest_database_configuration_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#ingest_database_configuration.' if logger

      raise "Missing the required parameter 'ingest_database_configuration_details' when calling ingest_database_configuration." if ingest_database_configuration_details.nil?

      path = '/databaseInsights/actions/ingestDatabaseConfiguration'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:databaseId] = opts[:database_id] if opts[:database_id]
      query_params[:id] = opts[:id] if opts[:id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(ingest_database_configuration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#ingest_database_configuration') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::IngestDatabaseConfigurationResponseDetails'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This is a generic ingest endpoint for all the host configuration metrics
    # @param [String] id Required [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the host insight resource.
    #
    # @param [OCI::Opsi::Models::IngestHostConfigurationDetails] ingest_host_configuration_details Payload for one or more host configuration metrics for a particular host.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::IngestHostConfigurationResponseDetails IngestHostConfigurationResponseDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/ingest_host_configuration.rb.html) to see an example of how to use ingest_host_configuration API.
    def ingest_host_configuration(id, ingest_host_configuration_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#ingest_host_configuration.' if logger

      raise "Missing the required parameter 'id' when calling ingest_host_configuration." if id.nil?
      raise "Missing the required parameter 'ingest_host_configuration_details' when calling ingest_host_configuration." if ingest_host_configuration_details.nil?

      path = '/hostInsights/actions/ingestHostConfiguration'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:id] = id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(ingest_host_configuration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#ingest_host_configuration') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::IngestHostConfigurationResponseDetails'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This is a generic ingest endpoint for all the host performance metrics
    # @param [String] id Required [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the host insight resource.
    #
    # @param [OCI::Opsi::Models::IngestHostMetricsDetails] ingest_host_metrics_details Payload for one or more host performance metrics for a particular host.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::IngestHostMetricsResponseDetails IngestHostMetricsResponseDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/ingest_host_metrics.rb.html) to see an example of how to use ingest_host_metrics API.
    def ingest_host_metrics(id, ingest_host_metrics_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#ingest_host_metrics.' if logger

      raise "Missing the required parameter 'id' when calling ingest_host_metrics." if id.nil?
      raise "Missing the required parameter 'ingest_host_metrics_details' when calling ingest_host_metrics." if ingest_host_metrics_details.nil?

      path = '/hostInsights/actions/ingestHostMetrics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:id] = id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(ingest_host_metrics_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#ingest_host_metrics') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::IngestHostMetricsResponseDetails'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # The sqlbucket endpoint takes in a JSON payload, persists it in Operations Insights ingest pipeline.
    # Either databaseId or id must be specified.
    #
    # @param [OCI::Opsi::Models::IngestSqlBucketDetails] ingest_sql_bucket_details Collection of SQL bucket objects for a particular database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @option opts [String] :database_id Optional [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #
    # @option opts [String] :id [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database insight resource.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::IngestSqlBucketResponseDetails IngestSqlBucketResponseDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/ingest_sql_bucket.rb.html) to see an example of how to use ingest_sql_bucket API.
    def ingest_sql_bucket(ingest_sql_bucket_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#ingest_sql_bucket.' if logger

      raise "Missing the required parameter 'ingest_sql_bucket_details' when calling ingest_sql_bucket." if ingest_sql_bucket_details.nil?

      path = '/databaseInsights/actions/ingestSqlBucket'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:databaseId] = opts[:database_id] if opts[:database_id]
      query_params[:id] = opts[:id] if opts[:id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(ingest_sql_bucket_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#ingest_sql_bucket') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::IngestSqlBucketResponseDetails'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # The SqlPlanLines endpoint takes in a JSON payload, persists it in Operation Insights ingest pipeline.
    # Either databaseId or id must be specified.
    #
    # @param [OCI::Opsi::Models::IngestSqlPlanLinesDetails] ingest_sql_plan_lines_details Collection of SQL plan line objects for a particular database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @option opts [String] :database_id Optional [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #
    # @option opts [String] :id [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database insight resource.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::IngestSqlPlanLinesResponseDetails IngestSqlPlanLinesResponseDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/ingest_sql_plan_lines.rb.html) to see an example of how to use ingest_sql_plan_lines API.
    def ingest_sql_plan_lines(ingest_sql_plan_lines_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#ingest_sql_plan_lines.' if logger

      raise "Missing the required parameter 'ingest_sql_plan_lines_details' when calling ingest_sql_plan_lines." if ingest_sql_plan_lines_details.nil?

      path = '/databaseInsights/actions/ingestSqlPlanLines'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:databaseId] = opts[:database_id] if opts[:database_id]
      query_params[:id] = opts[:id] if opts[:id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(ingest_sql_plan_lines_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#ingest_sql_plan_lines') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::IngestSqlPlanLinesResponseDetails'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # The SqlText endpoint takes in a JSON payload, persists it in Operation Insights ingest pipeline.
    # Either databaseId or id must be specified.
    # Disclaimer: SQL text being uploaded explicitly via APIs is not masked. Any sensitive literals contained in the sqlFullText column should be masked prior to ingestion.
    #
    # @param [OCI::Opsi::Models::IngestSqlTextDetails] ingest_sql_text_details Collection of SQL text objects for a particular database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @option opts [String] :database_id Optional [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #
    # @option opts [String] :id [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database insight resource.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::IngestSqlTextResponseDetails IngestSqlTextResponseDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/ingest_sql_text.rb.html) to see an example of how to use ingest_sql_text API.
    def ingest_sql_text(ingest_sql_text_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#ingest_sql_text.' if logger

      raise "Missing the required parameter 'ingest_sql_text_details' when calling ingest_sql_text." if ingest_sql_text_details.nil?

      path = '/databaseInsights/actions/ingestSqlText'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:databaseId] = opts[:database_id] if opts[:database_id]
      query_params[:id] = opts[:id] if opts[:id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(ingest_sql_text_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#ingest_sql_text') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::IngestSqlTextResponseDetails'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of database insight configurations based on the query parameters specified. Either compartmentId or databaseInsightId query parameter must be specified.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @option opts [String] :enterprise_manager_bridge_id Unique Enterprise Manager bridge identifier
    # @option opts [Array<String>] :id Optional list of database insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #    (default to [])
    # @option opts [Array<String>] :database_type Filter by one or more database type.
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to
    #   return in a paginated \"List\" call.
    #   For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    # @option opts [String] :sort_by Database configuration list sort options. If `fields` parameter is selected, the `sortBy` parameter must be one of the fields specified.
    #    (default to databaseName)
    #   Allowed values are: databaseName, databaseDisplayName, databaseType
    # @option opts [Array<String>] :host_name Filter by one or more hostname.
    #    (default to [])
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::DatabaseConfigurationCollection DatabaseConfigurationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/list_database_configurations.rb.html) to see an example of how to use list_database_configurations API.
    def list_database_configurations(opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_database_configurations.' if logger



      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D EXTERNAL-PDB EXTERNAL-NONCDB]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Opsi::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Opsi::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[databaseName databaseDisplayName databaseType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of databaseName, databaseDisplayName, databaseType.'
      end

      path = '/databaseInsights/databaseConfigurations'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:enterpriseManagerBridgeId] = opts[:enterprise_manager_bridge_id] if opts[:enterprise_manager_bridge_id]
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:databaseId] = OCI::ApiClient.build_collection_params(opts[:database_id], :multi) if opts[:database_id] && !opts[:database_id].empty?
      query_params[:databaseType] = OCI::ApiClient.build_collection_params(opts[:database_type], :multi) if opts[:database_type] && !opts[:database_type].empty?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:hostName] = OCI::ApiClient.build_collection_params(opts[:host_name], :multi) if opts[:host_name] && !opts[:host_name].empty?
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#list_database_configurations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::DatabaseConfigurationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of database insights based on the query parameters specified. Either compartmentId or id query parameter must be specified.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @option opts [String] :enterprise_manager_bridge_id Unique Enterprise Manager bridge identifier
    # @option opts [Array<String>] :id Optional list of database insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [Array<String>] :status Resource Status (default to [ENABLED])
    #   Allowed values are: DISABLED, ENABLED, TERMINATED
    # @option opts [Array<String>] :lifecycle_state Lifecycle states (default to [ACTIVE])
    #   Allowed values are: CREATING, UPDATING, ACTIVE, DELETING, DELETED, FAILED, NEEDS_ATTENTION
    # @option opts [Array<String>] :database_type Filter by one or more database type.
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #    (default to [])
    # @option opts [Array<String>] :fields Specifies the fields to return in a database summary response. By default all fields are returned if omitted.
    #    (default to [])
    #   Allowed values are: compartmentId, databaseName, databaseDisplayName, databaseType, databaseVersion, databaseHostNames, freeformTags, definedTags
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to
    #   return in a paginated \"List\" call.
    #   For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    # @option opts [String] :sort_by Database insight list sort options. If `fields` parameter is selected, the `sortBy` parameter must be one of the fields specified.
    #
    #   Allowed values are: databaseName, databaseDisplayName, databaseType
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::DatabaseInsightsCollection DatabaseInsightsCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/list_database_insights.rb.html) to see an example of how to use list_database_insights API.
    def list_database_insights(opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_database_insights.' if logger



      status_allowable_values = %w[DISABLED ENABLED TERMINATED]
      if opts[:status] && !opts[:status].empty?
        opts[:status].each do |val_to_check|
          unless status_allowable_values.include?(val_to_check)
            raise 'Invalid value for "status", must be one of DISABLED, ENABLED, TERMINATED.'
          end
        end
      end


      lifecycle_state_allowable_values = %w[CREATING UPDATING ACTIVE DELETING DELETED FAILED NEEDS_ATTENTION]
      if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
        opts[:lifecycle_state].each do |val_to_check|
          unless lifecycle_state_allowable_values.include?(val_to_check)
            raise 'Invalid value for "lifecycle_state", must be one of CREATING, UPDATING, ACTIVE, DELETING, DELETED, FAILED, NEEDS_ATTENTION.'
          end
        end
      end


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D EXTERNAL-PDB EXTERNAL-NONCDB]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.'
          end
        end
      end


      fields_allowable_values = %w[compartmentId databaseName databaseDisplayName databaseType databaseVersion databaseHostNames freeformTags definedTags]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of compartmentId, databaseName, databaseDisplayName, databaseType, databaseVersion, databaseHostNames, freeformTags, definedTags.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Opsi::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Opsi::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[databaseName databaseDisplayName databaseType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of databaseName, databaseDisplayName, databaseType.'
      end

      path = '/databaseInsights'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:enterpriseManagerBridgeId] = opts[:enterprise_manager_bridge_id] if opts[:enterprise_manager_bridge_id]
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:status] = OCI::ApiClient.build_collection_params(opts[:status], :multi) if opts[:status] && !opts[:status].empty?
      query_params[:lifecycleState] = OCI::ApiClient.build_collection_params(opts[:lifecycle_state], :multi) if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
      query_params[:databaseType] = OCI::ApiClient.build_collection_params(opts[:database_type], :multi) if opts[:database_type] && !opts[:database_type].empty?
      query_params[:databaseId] = OCI::ApiClient.build_collection_params(opts[:database_id], :multi) if opts[:database_id] && !opts[:database_id].empty?
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#list_database_insights') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::DatabaseInsightsCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of Operations Insights Enterprise Manager bridges. Either compartmentId or id must be specified.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name.
    # @option opts [String] :id Unique Enterprise Manager bridge identifier
    # @option opts [Array<String>] :lifecycle_state Lifecycle states (default to [ACTIVE])
    #   Allowed values are: CREATING, UPDATING, ACTIVE, DELETING, DELETED, FAILED, NEEDS_ATTENTION
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to
    #   return in a paginated \"List\" call.
    #   For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::EnterpriseManagerBridgeCollection EnterpriseManagerBridgeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/list_enterprise_manager_bridges.rb.html) to see an example of how to use list_enterprise_manager_bridges API.
    def list_enterprise_manager_bridges(opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_enterprise_manager_bridges.' if logger



      lifecycle_state_allowable_values = %w[CREATING UPDATING ACTIVE DELETING DELETED FAILED NEEDS_ATTENTION]
      if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
        opts[:lifecycle_state].each do |val_to_check|
          unless lifecycle_state_allowable_values.include?(val_to_check)
            raise 'Invalid value for "lifecycle_state", must be one of CREATING, UPDATING, ACTIVE, DELETING, DELETED, FAILED, NEEDS_ATTENTION.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Opsi::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Opsi::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/enterpriseManagerBridges'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:lifecycleState] = OCI::ApiClient.build_collection_params(opts[:lifecycle_state], :multi) if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#list_enterprise_manager_bridges') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::EnterpriseManagerBridgeCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of host insights based on the query parameters specified. Either compartmentId or id query parameter must be specified.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @option opts [Array<String>] :id Optional list of host insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [Array<String>] :status Resource Status (default to [ENABLED])
    #   Allowed values are: DISABLED, ENABLED, TERMINATED
    # @option opts [Array<String>] :lifecycle_state Lifecycle states (default to [ACTIVE])
    #   Allowed values are: CREATING, UPDATING, ACTIVE, DELETING, DELETED, FAILED, NEEDS_ATTENTION
    # @option opts [Array<String>] :host_type Filter by one or more host types.
    #   Possible value is EXTERNAL-HOST.
    #    (default to [])
    # @option opts [Array<String>] :platform_type Filter by one or more platform types.
    #   Possible value is LINUX.
    #    (default to [])
    #   Allowed values are: LINUX
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to
    #   return in a paginated \"List\" call.
    #   For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    # @option opts [String] :sort_by Host insight list sort options. If `fields` parameter is selected, the `sortBy` parameter must be one of the fields specified.
    #
    #   Allowed values are: hostName, hostType
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::HostInsightSummaryCollection HostInsightSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/list_host_insights.rb.html) to see an example of how to use list_host_insights API.
    def list_host_insights(opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_host_insights.' if logger



      status_allowable_values = %w[DISABLED ENABLED TERMINATED]
      if opts[:status] && !opts[:status].empty?
        opts[:status].each do |val_to_check|
          unless status_allowable_values.include?(val_to_check)
            raise 'Invalid value for "status", must be one of DISABLED, ENABLED, TERMINATED.'
          end
        end
      end


      lifecycle_state_allowable_values = %w[CREATING UPDATING ACTIVE DELETING DELETED FAILED NEEDS_ATTENTION]
      if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
        opts[:lifecycle_state].each do |val_to_check|
          unless lifecycle_state_allowable_values.include?(val_to_check)
            raise 'Invalid value for "lifecycle_state", must be one of CREATING, UPDATING, ACTIVE, DELETING, DELETED, FAILED, NEEDS_ATTENTION.'
          end
        end
      end


      platform_type_allowable_values = %w[LINUX]
      if opts[:platform_type] && !opts[:platform_type].empty?
        opts[:platform_type].each do |val_to_check|
          unless platform_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "platform_type", must be one of LINUX.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Opsi::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Opsi::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[hostName hostType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of hostName, hostType.'
      end

      path = '/hostInsights'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:status] = OCI::ApiClient.build_collection_params(opts[:status], :multi) if opts[:status] && !opts[:status].empty?
      query_params[:lifecycleState] = OCI::ApiClient.build_collection_params(opts[:lifecycle_state], :multi) if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
      query_params[:hostType] = OCI::ApiClient.build_collection_params(opts[:host_type], :multi) if opts[:host_type] && !opts[:host_type].empty?
      query_params[:platformType] = OCI::ApiClient.build_collection_params(opts[:platform_type], :multi) if opts[:platform_type] && !opts[:platform_type].empty?
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#list_host_insights') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::HostInsightSummaryCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get a list of hosted entities details.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] id Required [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the host insight resource.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Array<String>] :platform_type Filter by one or more platform types.
    #   Possible value is LINUX.
    #    (default to [])
    #   Allowed values are: LINUX
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to
    #   return in a paginated \"List\" call.
    #   For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    # @option opts [String] :sort_by Hosted entity list sort options.
    #
    #   Allowed values are: entityName, entityType
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::HostedEntityCollection HostedEntityCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/list_hosted_entities.rb.html) to see an example of how to use list_hosted_entities API.
    def list_hosted_entities(compartment_id, id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_hosted_entities.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_hosted_entities." if compartment_id.nil?
      raise "Missing the required parameter 'id' when calling list_hosted_entities." if id.nil?


      platform_type_allowable_values = %w[LINUX]
      if opts[:platform_type] && !opts[:platform_type].empty?
        opts[:platform_type].each do |val_to_check|
          unless platform_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "platform_type", must be one of LINUX.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Opsi::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Opsi::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[entityName entityType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of entityName, entityType.'
      end

      path = '/hostInsights/hostedEntities'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:id] = id
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:platformType] = OCI::ApiClient.build_collection_params(opts[:platform_type], :multi) if opts[:platform_type] && !opts[:platform_type].empty?
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#list_hosted_entities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::HostedEntityCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of importable entities for an Operations Insights Enterprise Manager bridge that have not been imported before.
    #
    # @param [String] enterprise_manager_bridge_id Unique Enterprise Manager bridge identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to
    #   return in a paginated \"List\" call.
    #   For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::ImportableEnterpriseManagerEntityCollection ImportableEnterpriseManagerEntityCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/list_importable_enterprise_manager_entities.rb.html) to see an example of how to use list_importable_enterprise_manager_entities API.
    def list_importable_enterprise_manager_entities(enterprise_manager_bridge_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_importable_enterprise_manager_entities.' if logger

      raise "Missing the required parameter 'enterprise_manager_bridge_id' when calling list_importable_enterprise_manager_entities." if enterprise_manager_bridge_id.nil?
      raise "Parameter value for 'enterprise_manager_bridge_id' must not be blank" if OCI::Internal::Util.blank_string?(enterprise_manager_bridge_id)

      path = '/enterpriseManagerBridges/{enterpriseManagerBridgeId}/importableEnterpriseManagerEntities'.sub('{enterpriseManagerBridgeId}', enterprise_manager_bridge_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#list_importable_enterprise_manager_entities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::ImportableEnterpriseManagerEntityCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Query SQL Warehouse to list the plan xml for a given SQL execution plan. This returns a SqlPlanCollection object, but is currently limited to a single plan.
    # Either databaseId or id must be specified.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] sql_identifier Unique SQL_ID for a SQL Statement.
    #   Example: `6rgjh9bjmy2s7`
    #
    # @param [Array<Integer>] plan_hash Unique plan hash for a SQL Plan of a particular SQL Statement.
    #   Example: `9820154385`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :database_id Optional [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #
    # @option opts [String] :id [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database insight resource.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlPlanCollection SqlPlanCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/list_sql_plans.rb.html) to see an example of how to use list_sql_plans API.
    def list_sql_plans(compartment_id, sql_identifier, plan_hash, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_sql_plans.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_sql_plans." if compartment_id.nil?
      raise "Missing the required parameter 'sql_identifier' when calling list_sql_plans." if sql_identifier.nil?
      raise "Missing the required parameter 'plan_hash' when calling list_sql_plans." if plan_hash.nil?

      path = '/databaseInsights/sqlPlans'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:sqlIdentifier] = sql_identifier
      query_params[:planHash] = OCI::ApiClient.build_collection_params(plan_hash, :multi)
      query_params[:databaseId] = opts[:database_id] if opts[:database_id]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#list_sql_plans') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SqlPlanCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Search SQL by SQL Identifier across databases and get the SQL Text and the details of the databases executing the SQL for a given time period.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] sql_identifier Unique SQL_ID for a SQL Statement.
    #   Example: `6rgjh9bjmy2s7`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlSearchCollection SqlSearchCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/list_sql_searches.rb.html) to see an example of how to use list_sql_searches API.
    def list_sql_searches(compartment_id, sql_identifier, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_sql_searches.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_sql_searches." if compartment_id.nil?
      raise "Missing the required parameter 'sql_identifier' when calling list_sql_searches." if sql_identifier.nil?

      path = '/databaseInsights/sqlSearches'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:sqlIdentifier] = sql_identifier
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#list_sql_searches') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SqlSearchCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Query SQL Warehouse to get the full SQL Text for a SQL.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Array<String>] sql_identifier One or more unique SQL_IDs for a SQL Statement.
    #   Example: `6rgjh9bjmy2s7`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the assosicated DBaaS entity.
    #    (default to [])
    # @option opts [Array<String>] :id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database insight resource.
    #    (default to [])
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlTextCollection SqlTextCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/list_sql_texts.rb.html) to see an example of how to use list_sql_texts API.
    def list_sql_texts(compartment_id, sql_identifier, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_sql_texts.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_sql_texts." if compartment_id.nil?
      raise "Missing the required parameter 'sql_identifier' when calling list_sql_texts." if sql_identifier.nil?

      path = '/databaseInsights/sqlTexts'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:sqlIdentifier] = OCI::ApiClient.build_collection_params(sql_identifier, :multi)
      query_params[:databaseId] = OCI::ApiClient.build_collection_params(opts[:database_id], :multi) if opts[:database_id] && !opts[:database_id].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#list_sql_texts') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SqlTextCollection'
        )
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
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to
    #   return in a paginated \"List\" call.
    #   For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::WorkRequestErrorCollection WorkRequestErrorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_work_request_errors.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::WorkRequestErrorCollection'
        )
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
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to
    #   return in a paginated \"List\" call.
    #   For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::WorkRequestLogEntryCollection WorkRequestLogEntryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_work_request_logs.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::WorkRequestLogEntryCollection'
        )
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
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to
    #   return in a paginated \"List\" call.
    #   For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::WorkRequestCollection WorkRequestCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      path = '/workRequests'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::WorkRequestCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns response with time series data (endTimestamp, capacity, baseCapacity) for the time period specified.
    # The maximum time range for analysis is 2 years, hence this is intentionally not paginated.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] resource_metric Filter by resource metric.
    #   Supported values are CPU , STORAGE, MEMORY and IO.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Array<String>] :database_type Filter by one or more database type.
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #    (default to [])
    # @option opts [Array<String>] :id Optional list of database insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [String] :utilization_level Filter by utilization level by the following buckets:
    #     - HIGH_UTILIZATION: DBs with utilization greater or equal than 75.
    #     - LOW_UTILIZATION: DBs with utilization lower than 25.
    #     - MEDIUM_HIGH_UTILIZATION: DBs with utilization greater or equal than 50 but lower than 75.
    #     - MEDIUM_LOW_UTILIZATION: DBs with utilization greater or equal than 25 but lower than 50.
    #
    #   Allowed values are: HIGH_UTILIZATION, LOW_UTILIZATION, MEDIUM_HIGH_UTILIZATION, MEDIUM_LOW_UTILIZATION
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    # @option opts [String] :sort_by Sorts using end timestamp , capacity or baseCapacity
    #    (default to endTimestamp)
    #   Allowed values are: endTimestamp, capacity, baseCapacity
    # @option opts [String] :tablespace_name Tablespace name for a database
    #
    # @option opts [Array<String>] :host_name Filter by one or more hostname.
    #    (default to [])
    # @option opts [BOOLEAN] :is_database_instance_level_metrics Flag to indicate if database instance level metrics should be returned. The flag is ignored when a host name filter is not applied.
    #   When a hostname filter is applied this flag will determine whether to return metrics for the instances located on the specified host or for the
    #   whole database which contains an instance on this host.
    #    (default to false)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeDatabaseInsightResourceCapacityTrendAggregationCollection SummarizeDatabaseInsightResourceCapacityTrendAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_database_insight_resource_capacity_trend.rb.html) to see an example of how to use summarize_database_insight_resource_capacity_trend API.
    def summarize_database_insight_resource_capacity_trend(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_database_insight_resource_capacity_trend.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_database_insight_resource_capacity_trend." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_database_insight_resource_capacity_trend." if resource_metric.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D EXTERNAL-PDB EXTERNAL-NONCDB]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.'
          end
        end
      end

      if opts[:utilization_level] && !%w[HIGH_UTILIZATION LOW_UTILIZATION MEDIUM_HIGH_UTILIZATION MEDIUM_LOW_UTILIZATION].include?(opts[:utilization_level])
        raise 'Invalid value for "utilization_level", must be one of HIGH_UTILIZATION, LOW_UTILIZATION, MEDIUM_HIGH_UTILIZATION, MEDIUM_LOW_UTILIZATION.'
      end

      if opts[:sort_order] && !OCI::Opsi::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Opsi::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[endTimestamp capacity baseCapacity].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of endTimestamp, capacity, baseCapacity.'
      end

      path = '/databaseInsights/resourceCapacityTrend'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceMetric] = resource_metric
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:databaseType] = OCI::ApiClient.build_collection_params(opts[:database_type], :multi) if opts[:database_type] && !opts[:database_type].empty?
      query_params[:databaseId] = OCI::ApiClient.build_collection_params(opts[:database_id], :multi) if opts[:database_id] && !opts[:database_id].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:utilizationLevel] = opts[:utilization_level] if opts[:utilization_level]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:tablespaceName] = opts[:tablespace_name] if opts[:tablespace_name]
      query_params[:hostName] = OCI::ApiClient.build_collection_params(opts[:host_name], :multi) if opts[:host_name] && !opts[:host_name].empty?
      query_params[:isDatabaseInstanceLevelMetrics] = opts[:is_database_instance_level_metrics] if !opts[:is_database_instance_level_metrics].nil?
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_database_insight_resource_capacity_trend') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SummarizeDatabaseInsightResourceCapacityTrendAggregationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get Forecast predictions for CPU and Storage resources since a time in the past.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] resource_metric Filter by resource metric.
    #   Supported values are CPU , STORAGE, MEMORY and IO.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Array<String>] :database_type Filter by one or more database type.
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #    (default to [])
    # @option opts [Array<String>] :id Optional list of database insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [String] :statistic Choose the type of statistic metric data to be used for forecasting. (default to AVG)
    #   Allowed values are: AVG, MAX
    # @option opts [Integer] :forecast_days Number of days used for utilization forecast analysis.
    #    (default to 30)
    # @option opts [String] :forecast_model Choose algorithm model for the forecasting.
    #   Possible values:
    #     - LINEAR: Uses linear regression algorithm for forecasting.
    #     - ML_AUTO: Automatically detects best algorithm to use for forecasting.
    #     - ML_NO_AUTO: Automatically detects seasonality of the data for forecasting using linear or seasonal algorithm.
    #    (default to ML_NO_AUTO)
    #   Allowed values are: LINEAR, ML_AUTO, ML_NO_AUTO
    # @option opts [String] :utilization_level Filter by utilization level by the following buckets:
    #     - HIGH_UTILIZATION: DBs with utilization greater or equal than 75.
    #     - LOW_UTILIZATION: DBs with utilization lower than 25.
    #     - MEDIUM_HIGH_UTILIZATION: DBs with utilization greater or equal than 50 but lower than 75.
    #     - MEDIUM_LOW_UTILIZATION: DBs with utilization greater or equal than 25 but lower than 50.
    #
    #   Allowed values are: HIGH_UTILIZATION, LOW_UTILIZATION, MEDIUM_HIGH_UTILIZATION, MEDIUM_LOW_UTILIZATION
    # @option opts [Integer] :confidence This parameter is used to change data's confidence level, this data is ingested by the
    #   forecast algorithm.
    #   Confidence is the probability of an interval to contain the expected population parameter.
    #   Manipulation of this value will lead to different results.
    #   If not set, default confidence value is 95%.
    #    (default to 95)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Array<String>] :host_name Filter by one or more hostname.
    #    (default to [])
    # @option opts [String] :tablespace_name Tablespace name for a database
    #
    # @option opts [BOOLEAN] :is_database_instance_level_metrics Flag to indicate if database instance level metrics should be returned. The flag is ignored when a host name filter is not applied.
    #   When a hostname filter is applied this flag will determine whether to return metrics for the instances located on the specified host or for the
    #   whole database which contains an instance on this host.
    #    (default to false)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeDatabaseInsightResourceForecastTrendAggregation SummarizeDatabaseInsightResourceForecastTrendAggregation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_database_insight_resource_forecast_trend.rb.html) to see an example of how to use summarize_database_insight_resource_forecast_trend API.
    def summarize_database_insight_resource_forecast_trend(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_database_insight_resource_forecast_trend.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_database_insight_resource_forecast_trend." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_database_insight_resource_forecast_trend." if resource_metric.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D EXTERNAL-PDB EXTERNAL-NONCDB]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.'
          end
        end
      end

      if opts[:statistic] && !%w[AVG MAX].include?(opts[:statistic])
        raise 'Invalid value for "statistic", must be one of AVG, MAX.'
      end

      if opts[:forecast_model] && !%w[LINEAR ML_AUTO ML_NO_AUTO].include?(opts[:forecast_model])
        raise 'Invalid value for "forecast_model", must be one of LINEAR, ML_AUTO, ML_NO_AUTO.'
      end

      if opts[:utilization_level] && !%w[HIGH_UTILIZATION LOW_UTILIZATION MEDIUM_HIGH_UTILIZATION MEDIUM_LOW_UTILIZATION].include?(opts[:utilization_level])
        raise 'Invalid value for "utilization_level", must be one of HIGH_UTILIZATION, LOW_UTILIZATION, MEDIUM_HIGH_UTILIZATION, MEDIUM_LOW_UTILIZATION.'
      end

      path = '/databaseInsights/resourceForecastTrend'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceMetric] = resource_metric
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:databaseType] = OCI::ApiClient.build_collection_params(opts[:database_type], :multi) if opts[:database_type] && !opts[:database_type].empty?
      query_params[:databaseId] = OCI::ApiClient.build_collection_params(opts[:database_id], :multi) if opts[:database_id] && !opts[:database_id].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:statistic] = opts[:statistic] if opts[:statistic]
      query_params[:forecastDays] = opts[:forecast_days] if opts[:forecast_days]
      query_params[:forecastModel] = opts[:forecast_model] if opts[:forecast_model]
      query_params[:utilizationLevel] = opts[:utilization_level] if opts[:utilization_level]
      query_params[:confidence] = opts[:confidence] if opts[:confidence]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:hostName] = OCI::ApiClient.build_collection_params(opts[:host_name], :multi) if opts[:host_name] && !opts[:host_name].empty?
      query_params[:tablespaceName] = opts[:tablespace_name] if opts[:tablespace_name]
      query_params[:isDatabaseInstanceLevelMetrics] = opts[:is_database_instance_level_metrics] if !opts[:is_database_instance_level_metrics].nil?
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_database_insight_resource_forecast_trend') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SummarizeDatabaseInsightResourceForecastTrendAggregation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the Resource statistics (usage,capacity, usage change percent, utilization percent, base capacity, isAutoScalingEnabled) for each database filtered by utilization level
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] resource_metric Filter by resource metric.
    #   Supported values are CPU , STORAGE, MEMORY and IO.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Array<String>] :database_type Filter by one or more database type.
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #    (default to [])
    # @option opts [Array<String>] :id Optional list of database insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [Integer] :percentile Percentile values of daily usage to be used for computing the aggregate resource usage.
    #    (default to 90)
    # @option opts [String] :insight_by Return data of a specific insight
    #   Possible values are High Utilization, Low Utilization, Any ,High Utilization Forecast,
    #   Low Utilization Forecast
    #    (default to [ANY])
    # @option opts [Integer] :forecast_days Number of days used for utilization forecast analysis.
    #    (default to 30)
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to
    #   return in a paginated \"List\" call.
    #   For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    # @option opts [String] :sort_by The order in which resource statistics records are listed
    #    (default to utilizationPercent)
    #   Allowed values are: utilizationPercent, usage, usageChangePercent, databaseName, databaseType
    # @option opts [Array<String>] :host_name Filter by one or more hostname.
    #    (default to [])
    # @option opts [BOOLEAN] :is_database_instance_level_metrics Flag to indicate if database instance level metrics should be returned. The flag is ignored when a host name filter is not applied.
    #   When a hostname filter is applied this flag will determine whether to return metrics for the instances located on the specified host or for the
    #   whole database which contains an instance on this host.
    #    (default to false)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeDatabaseInsightResourceStatisticsAggregationCollection SummarizeDatabaseInsightResourceStatisticsAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_database_insight_resource_statistics.rb.html) to see an example of how to use summarize_database_insight_resource_statistics API.
    def summarize_database_insight_resource_statistics(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_database_insight_resource_statistics.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_database_insight_resource_statistics." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_database_insight_resource_statistics." if resource_metric.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D EXTERNAL-PDB EXTERNAL-NONCDB]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Opsi::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Opsi::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[utilizationPercent usage usageChangePercent databaseName databaseType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of utilizationPercent, usage, usageChangePercent, databaseName, databaseType.'
      end

      path = '/databaseInsights/resourceStatistics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceMetric] = resource_metric
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:databaseType] = OCI::ApiClient.build_collection_params(opts[:database_type], :multi) if opts[:database_type] && !opts[:database_type].empty?
      query_params[:databaseId] = OCI::ApiClient.build_collection_params(opts[:database_id], :multi) if opts[:database_id] && !opts[:database_id].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:percentile] = opts[:percentile] if opts[:percentile]
      query_params[:insightBy] = opts[:insight_by] if opts[:insight_by]
      query_params[:forecastDays] = opts[:forecast_days] if opts[:forecast_days]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:hostName] = OCI::ApiClient.build_collection_params(opts[:host_name], :multi) if opts[:host_name] && !opts[:host_name].empty?
      query_params[:isDatabaseInstanceLevelMetrics] = opts[:is_database_instance_level_metrics] if !opts[:is_database_instance_level_metrics].nil?
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_database_insight_resource_statistics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SummarizeDatabaseInsightResourceStatisticsAggregationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # A cumulative distribution function is used to rank the usage data points per database within the specified time period.
    # For each database, the minimum data point with a ranking > the percentile value is included in the summation.
    # Linear regression functions are used to calculate the usage change percentage.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] resource_metric Filter by resource metric.
    #   Supported values are CPU , STORAGE, MEMORY and IO.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Array<String>] :database_type Filter by one or more database type.
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #    (default to [])
    # @option opts [Array<String>] :id Optional list of database insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [Array<String>] :host_name Filter by one or more hostname.
    #    (default to [])
    # @option opts [BOOLEAN] :is_database_instance_level_metrics Flag to indicate if database instance level metrics should be returned. The flag is ignored when a host name filter is not applied.
    #   When a hostname filter is applied this flag will determine whether to return metrics for the instances located on the specified host or for the
    #   whole database which contains an instance on this host.
    #    (default to false)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :percentile Percentile values of daily usage to be used for computing the aggregate resource usage.
    #    (default to 90)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeDatabaseInsightResourceUsageAggregation SummarizeDatabaseInsightResourceUsageAggregation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_database_insight_resource_usage.rb.html) to see an example of how to use summarize_database_insight_resource_usage API.
    def summarize_database_insight_resource_usage(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_database_insight_resource_usage.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_database_insight_resource_usage." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_database_insight_resource_usage." if resource_metric.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D EXTERNAL-PDB EXTERNAL-NONCDB]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.'
          end
        end
      end

      path = '/databaseInsights/resourceUsageSummary'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceMetric] = resource_metric
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:databaseType] = OCI::ApiClient.build_collection_params(opts[:database_type], :multi) if opts[:database_type] && !opts[:database_type].empty?
      query_params[:databaseId] = OCI::ApiClient.build_collection_params(opts[:database_id], :multi) if opts[:database_id] && !opts[:database_id].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:hostName] = OCI::ApiClient.build_collection_params(opts[:host_name], :multi) if opts[:host_name] && !opts[:host_name].empty?
      query_params[:isDatabaseInstanceLevelMetrics] = opts[:is_database_instance_level_metrics] if !opts[:is_database_instance_level_metrics].nil?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:percentile] = opts[:percentile] if opts[:percentile]
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_database_insight_resource_usage') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SummarizeDatabaseInsightResourceUsageAggregation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns response with time series data (endTimestamp, usage, capacity) for the time period specified.
    # The maximum time range for analysis is 2 years, hence this is intentionally not paginated.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] resource_metric Filter by resource metric.
    #   Supported values are CPU , STORAGE, MEMORY and IO.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Array<String>] :database_type Filter by one or more database type.
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #    (default to [])
    # @option opts [Array<String>] :id Optional list of database insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    # @option opts [String] :sort_by Sorts using end timestamp, usage or capacity
    #    (default to endTimestamp)
    #   Allowed values are: endTimestamp, usage, capacity
    # @option opts [Array<String>] :host_name Filter by one or more hostname.
    #    (default to [])
    # @option opts [BOOLEAN] :is_database_instance_level_metrics Flag to indicate if database instance level metrics should be returned. The flag is ignored when a host name filter is not applied.
    #   When a hostname filter is applied this flag will determine whether to return metrics for the instances located on the specified host or for the
    #   whole database which contains an instance on this host.
    #    (default to false)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeDatabaseInsightResourceUsageTrendAggregationCollection SummarizeDatabaseInsightResourceUsageTrendAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_database_insight_resource_usage_trend.rb.html) to see an example of how to use summarize_database_insight_resource_usage_trend API.
    def summarize_database_insight_resource_usage_trend(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_database_insight_resource_usage_trend.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_database_insight_resource_usage_trend." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_database_insight_resource_usage_trend." if resource_metric.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D EXTERNAL-PDB EXTERNAL-NONCDB]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Opsi::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Opsi::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[endTimestamp usage capacity].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of endTimestamp, usage, capacity.'
      end

      path = '/databaseInsights/resourceUsageTrend'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceMetric] = resource_metric
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:databaseType] = OCI::ApiClient.build_collection_params(opts[:database_type], :multi) if opts[:database_type] && !opts[:database_type].empty?
      query_params[:databaseId] = OCI::ApiClient.build_collection_params(opts[:database_id], :multi) if opts[:database_id] && !opts[:database_id].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:hostName] = OCI::ApiClient.build_collection_params(opts[:host_name], :multi) if opts[:host_name] && !opts[:host_name].empty?
      query_params[:isDatabaseInstanceLevelMetrics] = opts[:is_database_instance_level_metrics] if !opts[:is_database_instance_level_metrics].nil?
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_database_insight_resource_usage_trend') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SummarizeDatabaseInsightResourceUsageTrendAggregationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets resources with current utilization (high and low) and projected utilization (high and low) for a resource type over specified time period.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] resource_metric Filter by resource metric.
    #   Supported values are CPU , STORAGE, MEMORY and IO.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Array<String>] :database_type Filter by one or more database type.
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #    (default to [])
    # @option opts [Array<String>] :id Optional list of database insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [Integer] :forecast_days Number of days used for utilization forecast analysis.
    #    (default to 30)
    # @option opts [Array<String>] :host_name Filter by one or more hostname.
    #    (default to [])
    # @option opts [BOOLEAN] :is_database_instance_level_metrics Flag to indicate if database instance level metrics should be returned. The flag is ignored when a host name filter is not applied.
    #   When a hostname filter is applied this flag will determine whether to return metrics for the instances located on the specified host or for the
    #   whole database which contains an instance on this host.
    #    (default to false)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeDatabaseInsightResourceUtilizationInsightAggregation SummarizeDatabaseInsightResourceUtilizationInsightAggregation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_database_insight_resource_utilization_insight.rb.html) to see an example of how to use summarize_database_insight_resource_utilization_insight API.
    def summarize_database_insight_resource_utilization_insight(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_database_insight_resource_utilization_insight.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_database_insight_resource_utilization_insight." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_database_insight_resource_utilization_insight." if resource_metric.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D EXTERNAL-PDB EXTERNAL-NONCDB]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.'
          end
        end
      end

      path = '/databaseInsights/resourceUtilizationInsight'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceMetric] = resource_metric
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:databaseType] = OCI::ApiClient.build_collection_params(opts[:database_type], :multi) if opts[:database_type] && !opts[:database_type].empty?
      query_params[:databaseId] = OCI::ApiClient.build_collection_params(opts[:database_id], :multi) if opts[:database_id] && !opts[:database_id].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:forecastDays] = opts[:forecast_days] if opts[:forecast_days]
      query_params[:hostName] = OCI::ApiClient.build_collection_params(opts[:host_name], :multi) if opts[:host_name] && !opts[:host_name].empty?
      query_params[:isDatabaseInstanceLevelMetrics] = opts[:is_database_instance_level_metrics] if !opts[:is_database_instance_level_metrics].nil?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_database_insight_resource_utilization_insight') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SummarizeDatabaseInsightResourceUtilizationInsightAggregation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns response with usage time series data (endTimestamp, usage, capacity) with breakdown by tablespaceName for the time period specified.
    # The maximum time range for analysis is 2 years, hence this is intentionally not paginated.
    # Either databaseId or id must be specified.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [String] :database_id Optional [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #
    # @option opts [String] :id [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database insight resource.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to
    #   return in a paginated \"List\" call.
    #   For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeDatabaseInsightTablespaceUsageTrendAggregationCollection SummarizeDatabaseInsightTablespaceUsageTrendAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_database_insight_tablespace_usage_trend.rb.html) to see an example of how to use summarize_database_insight_tablespace_usage_trend API.
    def summarize_database_insight_tablespace_usage_trend(compartment_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_database_insight_tablespace_usage_trend.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_database_insight_tablespace_usage_trend." if compartment_id.nil?

      path = '/databaseInsights/tablespaceUsageTrend'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:databaseId] = opts[:database_id] if opts[:database_id]
      query_params[:id] = opts[:id] if opts[:id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_database_insight_tablespace_usage_trend') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SummarizeDatabaseInsightTablespaceUsageTrendAggregationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns response with time series data (endTimestamp, capacity) for the time period specified.
    # The maximum time range for analysis is 2 years, hence this is intentionally not paginated.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] resource_metric Filter by host resource metric.
    #   Supported values are CPU, MEMORY, and LOGICAL_MEMORY.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Array<String>] :platform_type Filter by one or more platform types.
    #   Possible value is LINUX.
    #    (default to [])
    #   Allowed values are: LINUX
    # @option opts [Array<String>] :id Optional list of host insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [String] :utilization_level Filter by utilization level by the following buckets:
    #     - HIGH_UTILIZATION: DBs with utilization greater or equal than 75.
    #     - LOW_UTILIZATION: DBs with utilization lower than 25.
    #     - MEDIUM_HIGH_UTILIZATION: DBs with utilization greater or equal than 50 but lower than 75.
    #     - MEDIUM_LOW_UTILIZATION: DBs with utilization greater or equal than 25 but lower than 50.
    #
    #   Allowed values are: HIGH_UTILIZATION, LOW_UTILIZATION, MEDIUM_HIGH_UTILIZATION, MEDIUM_LOW_UTILIZATION
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    # @option opts [String] :sort_by Sorts using end timestamp or capacity
    #    (default to endTimestamp)
    #   Allowed values are: endTimestamp, capacity
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeHostInsightResourceCapacityTrendAggregationCollection SummarizeHostInsightResourceCapacityTrendAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_host_insight_resource_capacity_trend.rb.html) to see an example of how to use summarize_host_insight_resource_capacity_trend API.
    def summarize_host_insight_resource_capacity_trend(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_host_insight_resource_capacity_trend.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_host_insight_resource_capacity_trend." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_host_insight_resource_capacity_trend." if resource_metric.nil?


      platform_type_allowable_values = %w[LINUX]
      if opts[:platform_type] && !opts[:platform_type].empty?
        opts[:platform_type].each do |val_to_check|
          unless platform_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "platform_type", must be one of LINUX.'
          end
        end
      end

      if opts[:utilization_level] && !%w[HIGH_UTILIZATION LOW_UTILIZATION MEDIUM_HIGH_UTILIZATION MEDIUM_LOW_UTILIZATION].include?(opts[:utilization_level])
        raise 'Invalid value for "utilization_level", must be one of HIGH_UTILIZATION, LOW_UTILIZATION, MEDIUM_HIGH_UTILIZATION, MEDIUM_LOW_UTILIZATION.'
      end

      if opts[:sort_order] && !OCI::Opsi::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Opsi::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[endTimestamp capacity].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of endTimestamp, capacity.'
      end

      path = '/hostInsights/resourceCapacityTrend'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceMetric] = resource_metric
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:platformType] = OCI::ApiClient.build_collection_params(opts[:platform_type], :multi) if opts[:platform_type] && !opts[:platform_type].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:utilizationLevel] = opts[:utilization_level] if opts[:utilization_level]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_host_insight_resource_capacity_trend') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SummarizeHostInsightResourceCapacityTrendAggregationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get Forecast predictions for CPU or memory resources since a time in the past.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] resource_metric Filter by host resource metric.
    #   Supported values are CPU, MEMORY, and LOGICAL_MEMORY.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Array<String>] :platform_type Filter by one or more platform types.
    #   Possible value is LINUX.
    #    (default to [])
    #   Allowed values are: LINUX
    # @option opts [Array<String>] :id Optional list of host insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [String] :statistic Choose the type of statistic metric data to be used for forecasting. (default to AVG)
    #   Allowed values are: AVG, MAX
    # @option opts [Integer] :forecast_days Number of days used for utilization forecast analysis.
    #    (default to 30)
    # @option opts [String] :forecast_model Choose algorithm model for the forecasting.
    #   Possible values:
    #     - LINEAR: Uses linear regression algorithm for forecasting.
    #     - ML_AUTO: Automatically detects best algorithm to use for forecasting.
    #     - ML_NO_AUTO: Automatically detects seasonality of the data for forecasting using linear or seasonal algorithm.
    #    (default to ML_NO_AUTO)
    #   Allowed values are: LINEAR, ML_AUTO, ML_NO_AUTO
    # @option opts [String] :utilization_level Filter by utilization level by the following buckets:
    #     - HIGH_UTILIZATION: DBs with utilization greater or equal than 75.
    #     - LOW_UTILIZATION: DBs with utilization lower than 25.
    #     - MEDIUM_HIGH_UTILIZATION: DBs with utilization greater or equal than 50 but lower than 75.
    #     - MEDIUM_LOW_UTILIZATION: DBs with utilization greater or equal than 25 but lower than 50.
    #
    #   Allowed values are: HIGH_UTILIZATION, LOW_UTILIZATION, MEDIUM_HIGH_UTILIZATION, MEDIUM_LOW_UTILIZATION
    # @option opts [Integer] :confidence This parameter is used to change data's confidence level, this data is ingested by the
    #   forecast algorithm.
    #   Confidence is the probability of an interval to contain the expected population parameter.
    #   Manipulation of this value will lead to different results.
    #   If not set, default confidence value is 95%.
    #    (default to 95)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeHostInsightResourceForecastTrendAggregation SummarizeHostInsightResourceForecastTrendAggregation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_host_insight_resource_forecast_trend.rb.html) to see an example of how to use summarize_host_insight_resource_forecast_trend API.
    def summarize_host_insight_resource_forecast_trend(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_host_insight_resource_forecast_trend.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_host_insight_resource_forecast_trend." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_host_insight_resource_forecast_trend." if resource_metric.nil?


      platform_type_allowable_values = %w[LINUX]
      if opts[:platform_type] && !opts[:platform_type].empty?
        opts[:platform_type].each do |val_to_check|
          unless platform_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "platform_type", must be one of LINUX.'
          end
        end
      end

      if opts[:statistic] && !%w[AVG MAX].include?(opts[:statistic])
        raise 'Invalid value for "statistic", must be one of AVG, MAX.'
      end

      if opts[:forecast_model] && !%w[LINEAR ML_AUTO ML_NO_AUTO].include?(opts[:forecast_model])
        raise 'Invalid value for "forecast_model", must be one of LINEAR, ML_AUTO, ML_NO_AUTO.'
      end

      if opts[:utilization_level] && !%w[HIGH_UTILIZATION LOW_UTILIZATION MEDIUM_HIGH_UTILIZATION MEDIUM_LOW_UTILIZATION].include?(opts[:utilization_level])
        raise 'Invalid value for "utilization_level", must be one of HIGH_UTILIZATION, LOW_UTILIZATION, MEDIUM_HIGH_UTILIZATION, MEDIUM_LOW_UTILIZATION.'
      end

      path = '/hostInsights/resourceForecastTrend'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceMetric] = resource_metric
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:platformType] = OCI::ApiClient.build_collection_params(opts[:platform_type], :multi) if opts[:platform_type] && !opts[:platform_type].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:statistic] = opts[:statistic] if opts[:statistic]
      query_params[:forecastDays] = opts[:forecast_days] if opts[:forecast_days]
      query_params[:forecastModel] = opts[:forecast_model] if opts[:forecast_model]
      query_params[:utilizationLevel] = opts[:utilization_level] if opts[:utilization_level]
      query_params[:confidence] = opts[:confidence] if opts[:confidence]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_host_insight_resource_forecast_trend') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SummarizeHostInsightResourceForecastTrendAggregation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the resource statistics (usage, capacity, usage change percent, utilization percent, load) for each host filtered
    # by utilization level.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] resource_metric Filter by host resource metric.
    #   Supported values are CPU, MEMORY, and LOGICAL_MEMORY.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Array<String>] :platform_type Filter by one or more platform types.
    #   Possible value is LINUX.
    #    (default to [])
    #   Allowed values are: LINUX
    # @option opts [Array<String>] :id Optional list of host insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [Integer] :percentile Percentile values of daily usage to be used for computing the aggregate resource usage.
    #    (default to 90)
    # @option opts [String] :insight_by Return data of a specific insight
    #   Possible values are High Utilization, Low Utilization, Any ,High Utilization Forecast,
    #   Low Utilization Forecast
    #    (default to [ANY])
    # @option opts [Integer] :forecast_days Number of days used for utilization forecast analysis.
    #    (default to 30)
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to
    #   return in a paginated \"List\" call.
    #   For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    # @option opts [String] :sort_by The order in which resource statistics records are listed.
    #    (default to utilizationPercent)
    #   Allowed values are: utilizationPercent, usage, usageChangePercent, hostName, platformType
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeHostInsightResourceStatisticsAggregationCollection SummarizeHostInsightResourceStatisticsAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_host_insight_resource_statistics.rb.html) to see an example of how to use summarize_host_insight_resource_statistics API.
    def summarize_host_insight_resource_statistics(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_host_insight_resource_statistics.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_host_insight_resource_statistics." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_host_insight_resource_statistics." if resource_metric.nil?


      platform_type_allowable_values = %w[LINUX]
      if opts[:platform_type] && !opts[:platform_type].empty?
        opts[:platform_type].each do |val_to_check|
          unless platform_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "platform_type", must be one of LINUX.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Opsi::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Opsi::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[utilizationPercent usage usageChangePercent hostName platformType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of utilizationPercent, usage, usageChangePercent, hostName, platformType.'
      end

      path = '/hostInsights/resourceStatistics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceMetric] = resource_metric
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:platformType] = OCI::ApiClient.build_collection_params(opts[:platform_type], :multi) if opts[:platform_type] && !opts[:platform_type].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:percentile] = opts[:percentile] if opts[:percentile]
      query_params[:insightBy] = opts[:insight_by] if opts[:insight_by]
      query_params[:forecastDays] = opts[:forecast_days] if opts[:forecast_days]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_host_insight_resource_statistics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SummarizeHostInsightResourceStatisticsAggregationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # A cumulative distribution function is used to rank the usage data points per host within the specified time period.
    # For each host, the minimum data point with a ranking > the percentile value is included in the summation.
    # Linear regression functions are used to calculate the usage change percentage.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] resource_metric Filter by host resource metric.
    #   Supported values are CPU, MEMORY, and LOGICAL_MEMORY.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Array<String>] :platform_type Filter by one or more platform types.
    #   Possible value is LINUX.
    #    (default to [])
    #   Allowed values are: LINUX
    # @option opts [Array<String>] :id Optional list of host insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :percentile Percentile values of daily usage to be used for computing the aggregate resource usage.
    #    (default to 90)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeHostInsightResourceUsageAggregation SummarizeHostInsightResourceUsageAggregation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_host_insight_resource_usage.rb.html) to see an example of how to use summarize_host_insight_resource_usage API.
    def summarize_host_insight_resource_usage(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_host_insight_resource_usage.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_host_insight_resource_usage." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_host_insight_resource_usage." if resource_metric.nil?


      platform_type_allowable_values = %w[LINUX]
      if opts[:platform_type] && !opts[:platform_type].empty?
        opts[:platform_type].each do |val_to_check|
          unless platform_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "platform_type", must be one of LINUX.'
          end
        end
      end

      path = '/hostInsights/resourceUsageSummary'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceMetric] = resource_metric
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:platformType] = OCI::ApiClient.build_collection_params(opts[:platform_type], :multi) if opts[:platform_type] && !opts[:platform_type].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:percentile] = opts[:percentile] if opts[:percentile]
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_host_insight_resource_usage') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SummarizeHostInsightResourceUsageAggregation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns response with time series data (endTimestamp, usage, capacity) for the time period specified.
    # The maximum time range for analysis is 2 years, hence this is intentionally not paginated.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] resource_metric Filter by host resource metric.
    #   Supported values are CPU, MEMORY, and LOGICAL_MEMORY.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Array<String>] :platform_type Filter by one or more platform types.
    #   Possible value is LINUX.
    #    (default to [])
    #   Allowed values are: LINUX
    # @option opts [Array<String>] :id Optional list of host insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    # @option opts [String] :sort_by Sorts using end timestamp, usage or capacity
    #    (default to endTimestamp)
    #   Allowed values are: endTimestamp, usage, capacity
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeHostInsightResourceUsageTrendAggregationCollection SummarizeHostInsightResourceUsageTrendAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_host_insight_resource_usage_trend.rb.html) to see an example of how to use summarize_host_insight_resource_usage_trend API.
    def summarize_host_insight_resource_usage_trend(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_host_insight_resource_usage_trend.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_host_insight_resource_usage_trend." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_host_insight_resource_usage_trend." if resource_metric.nil?


      platform_type_allowable_values = %w[LINUX]
      if opts[:platform_type] && !opts[:platform_type].empty?
        opts[:platform_type].each do |val_to_check|
          unless platform_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "platform_type", must be one of LINUX.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Opsi::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Opsi::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[endTimestamp usage capacity].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of endTimestamp, usage, capacity.'
      end

      path = '/hostInsights/resourceUsageTrend'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceMetric] = resource_metric
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:platformType] = OCI::ApiClient.build_collection_params(opts[:platform_type], :multi) if opts[:platform_type] && !opts[:platform_type].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_host_insight_resource_usage_trend') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SummarizeHostInsightResourceUsageTrendAggregationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets resources with current utilization (high and low) and projected utilization (high and low) for a resource type over specified time period.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] resource_metric Filter by host resource metric.
    #   Supported values are CPU, MEMORY, and LOGICAL_MEMORY.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Array<String>] :platform_type Filter by one or more platform types.
    #   Possible value is LINUX.
    #    (default to [])
    #   Allowed values are: LINUX
    # @option opts [Array<String>] :id Optional list of host insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [Integer] :forecast_days Number of days used for utilization forecast analysis.
    #    (default to 30)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeHostInsightResourceUtilizationInsightAggregation SummarizeHostInsightResourceUtilizationInsightAggregation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_host_insight_resource_utilization_insight.rb.html) to see an example of how to use summarize_host_insight_resource_utilization_insight API.
    def summarize_host_insight_resource_utilization_insight(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_host_insight_resource_utilization_insight.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_host_insight_resource_utilization_insight." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_host_insight_resource_utilization_insight." if resource_metric.nil?


      platform_type_allowable_values = %w[LINUX]
      if opts[:platform_type] && !opts[:platform_type].empty?
        opts[:platform_type].each do |val_to_check|
          unless platform_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "platform_type", must be one of LINUX.'
          end
        end
      end

      path = '/hostInsights/resourceUtilizationInsight'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceMetric] = resource_metric
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:platformType] = OCI::ApiClient.build_collection_params(opts[:platform_type], :multi) if opts[:platform_type] && !opts[:platform_type].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:forecastDays] = opts[:forecast_days] if opts[:forecast_days]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_host_insight_resource_utilization_insight') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SummarizeHostInsightResourceUtilizationInsightAggregation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Query SQL Warehouse to get the performance insights for SQLs taking greater than X% database time for a given time period across the given databases or database types.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :database_type Filter by one or more database type.
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #    (default to [])
    # @option opts [Array<String>] :id Optional list of database insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [Array<String>] :host_name Filter by one or more hostname.
    #    (default to [])
    # @option opts [Float] :database_time_pct_greater_than Filter sqls by percentage of db time.
    #    (default to 1)
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlInsightAggregationCollection SqlInsightAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_sql_insights.rb.html) to see an example of how to use summarize_sql_insights API.
    def summarize_sql_insights(compartment_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_sql_insights.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_sql_insights." if compartment_id.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D EXTERNAL-PDB EXTERNAL-NONCDB]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.'
          end
        end
      end

      path = '/databaseInsights/sqlInsights'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:databaseType] = OCI::ApiClient.build_collection_params(opts[:database_type], :multi) if opts[:database_type] && !opts[:database_type].empty?
      query_params[:databaseId] = OCI::ApiClient.build_collection_params(opts[:database_id], :multi) if opts[:database_id] && !opts[:database_id].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:hostName] = OCI::ApiClient.build_collection_params(opts[:host_name], :multi) if opts[:host_name] && !opts[:host_name].empty?
      query_params[:databaseTimePctGreaterThan] = opts[:database_time_pct_greater_than] if opts[:database_time_pct_greater_than]
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_sql_insights') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SqlInsightAggregationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Query SQL Warehouse to get the performance insights on the execution plans for a given SQL for a given time period.
    # Either databaseId or id must be specified.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] sql_identifier Unique SQL_ID for a SQL Statement.
    #   Example: `6rgjh9bjmy2s7`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :database_id Optional [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #
    # @option opts [String] :id [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database insight resource.
    #
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlPlanInsightAggregationCollection SqlPlanInsightAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_sql_plan_insights.rb.html) to see an example of how to use summarize_sql_plan_insights API.
    def summarize_sql_plan_insights(compartment_id, sql_identifier, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_sql_plan_insights.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_sql_plan_insights." if compartment_id.nil?
      raise "Missing the required parameter 'sql_identifier' when calling summarize_sql_plan_insights." if sql_identifier.nil?

      path = '/databaseInsights/sqlPlanInsights'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:sqlIdentifier] = sql_identifier
      query_params[:databaseId] = opts[:database_id] if opts[:database_id]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_sql_plan_insights') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SqlPlanInsightAggregationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Query SQL Warehouse to summarize the response time distribution of query executions for a given SQL for a given time period.
    # Either databaseId or id must be specified.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] sql_identifier Unique SQL_ID for a SQL Statement.
    #   Example: `6rgjh9bjmy2s7`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :database_id Optional [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #
    # @option opts [String] :id [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database insight resource.
    #
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlResponseTimeDistributionAggregationCollection SqlResponseTimeDistributionAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_sql_response_time_distributions.rb.html) to see an example of how to use summarize_sql_response_time_distributions API.
    def summarize_sql_response_time_distributions(compartment_id, sql_identifier, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_sql_response_time_distributions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_sql_response_time_distributions." if compartment_id.nil?
      raise "Missing the required parameter 'sql_identifier' when calling summarize_sql_response_time_distributions." if sql_identifier.nil?

      path = '/databaseInsights/sqlResponseTimeDistributions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:sqlIdentifier] = sql_identifier
      query_params[:databaseId] = opts[:database_id] if opts[:database_id]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_sql_response_time_distributions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SqlResponseTimeDistributionAggregationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Query SQL Warehouse to get the performance statistics for SQLs taking greater than X% database time for a given time period across the given databases or database types.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :database_type Filter by one or more database type.
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #    (default to [])
    # @option opts [Array<String>] :id Optional list of database insight resource [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [Array<String>] :host_name Filter by one or more hostname.
    #    (default to [])
    # @option opts [Float] :database_time_pct_greater_than Filter sqls by percentage of db time.
    #    (default to 1)
    # @option opts [Array<String>] :sql_identifier One or more unique SQL_IDs for a SQL Statement.
    #   Example: `6rgjh9bjmy2s7`
    #    (default to [])
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to
    #   return in a paginated \"List\" call.
    #   For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #   Example: `50`
    #    (default to 50)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`).
    #
    # @option opts [String] :sort_by The field to use when sorting SQL statistics.
    #   Example: databaseTimeInSec
    #    (default to databaseTimeInSec)
    #   Allowed values are: databaseTimeInSec, executionsPerHour, executionsCount, cpuTimeInSec, ioTimeInSec, inefficientWaitTimeInSec, responseTimeInSec, planCount, variability, averageActiveSessions, databaseTimePct, inefficiencyInPct, changeInCpuTimeInPct, changeInIoTimeInPct, changeInInefficientWaitTimeInPct, changeInResponseTimeInPct, changeInAverageActiveSessionsInPct, changeInExecutionsPerHourInPct, changeInInefficiencyInPct
    # @option opts [Array<String>] :category Filter sqls by one or more performance categories.
    #    (default to [])
    #   Allowed values are: DEGRADING, VARIANT, INEFFICIENT, CHANGING_PLANS, IMPROVING, DEGRADING_VARIANT, DEGRADING_INEFFICIENT, DEGRADING_CHANGING_PLANS, DEGRADING_INCREASING_IO, DEGRADING_INCREASING_CPU, DEGRADING_INCREASING_INEFFICIENT_WAIT, DEGRADING_CHANGING_PLANS_AND_INCREASING_IO, DEGRADING_CHANGING_PLANS_AND_INCREASING_CPU, DEGRADING_CHANGING_PLANS_AND_INCREASING_INEFFICIENT_WAIT, VARIANT_INEFFICIENT, VARIANT_CHANGING_PLANS, VARIANT_INCREASING_IO, VARIANT_INCREASING_CPU, VARIANT_INCREASING_INEFFICIENT_WAIT, VARIANT_CHANGING_PLANS_AND_INCREASING_IO, VARIANT_CHANGING_PLANS_AND_INCREASING_CPU, VARIANT_CHANGING_PLANS_AND_INCREASING_INEFFICIENT_WAIT, INEFFICIENT_CHANGING_PLANS, INEFFICIENT_INCREASING_INEFFICIENT_WAIT, INEFFICIENT_CHANGING_PLANS_AND_INCREASING_INEFFICIENT_WAIT
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlStatisticAggregationCollection SqlStatisticAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_sql_statistics.rb.html) to see an example of how to use summarize_sql_statistics API.
    def summarize_sql_statistics(compartment_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_sql_statistics.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_sql_statistics." if compartment_id.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D EXTERNAL-PDB EXTERNAL-NONCDB]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D, EXTERNAL-PDB, EXTERNAL-NONCDB.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Opsi::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Opsi::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[databaseTimeInSec executionsPerHour executionsCount cpuTimeInSec ioTimeInSec inefficientWaitTimeInSec responseTimeInSec planCount variability averageActiveSessions databaseTimePct inefficiencyInPct changeInCpuTimeInPct changeInIoTimeInPct changeInInefficientWaitTimeInPct changeInResponseTimeInPct changeInAverageActiveSessionsInPct changeInExecutionsPerHourInPct changeInInefficiencyInPct].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of databaseTimeInSec, executionsPerHour, executionsCount, cpuTimeInSec, ioTimeInSec, inefficientWaitTimeInSec, responseTimeInSec, planCount, variability, averageActiveSessions, databaseTimePct, inefficiencyInPct, changeInCpuTimeInPct, changeInIoTimeInPct, changeInInefficientWaitTimeInPct, changeInResponseTimeInPct, changeInAverageActiveSessionsInPct, changeInExecutionsPerHourInPct, changeInInefficiencyInPct.'
      end


      category_allowable_values = %w[DEGRADING VARIANT INEFFICIENT CHANGING_PLANS IMPROVING DEGRADING_VARIANT DEGRADING_INEFFICIENT DEGRADING_CHANGING_PLANS DEGRADING_INCREASING_IO DEGRADING_INCREASING_CPU DEGRADING_INCREASING_INEFFICIENT_WAIT DEGRADING_CHANGING_PLANS_AND_INCREASING_IO DEGRADING_CHANGING_PLANS_AND_INCREASING_CPU DEGRADING_CHANGING_PLANS_AND_INCREASING_INEFFICIENT_WAIT VARIANT_INEFFICIENT VARIANT_CHANGING_PLANS VARIANT_INCREASING_IO VARIANT_INCREASING_CPU VARIANT_INCREASING_INEFFICIENT_WAIT VARIANT_CHANGING_PLANS_AND_INCREASING_IO VARIANT_CHANGING_PLANS_AND_INCREASING_CPU VARIANT_CHANGING_PLANS_AND_INCREASING_INEFFICIENT_WAIT INEFFICIENT_CHANGING_PLANS INEFFICIENT_INCREASING_INEFFICIENT_WAIT INEFFICIENT_CHANGING_PLANS_AND_INCREASING_INEFFICIENT_WAIT]
      if opts[:category] && !opts[:category].empty?
        opts[:category].each do |val_to_check|
          unless category_allowable_values.include?(val_to_check)
            raise 'Invalid value for "category", must be one of DEGRADING, VARIANT, INEFFICIENT, CHANGING_PLANS, IMPROVING, DEGRADING_VARIANT, DEGRADING_INEFFICIENT, DEGRADING_CHANGING_PLANS, DEGRADING_INCREASING_IO, DEGRADING_INCREASING_CPU, DEGRADING_INCREASING_INEFFICIENT_WAIT, DEGRADING_CHANGING_PLANS_AND_INCREASING_IO, DEGRADING_CHANGING_PLANS_AND_INCREASING_CPU, DEGRADING_CHANGING_PLANS_AND_INCREASING_INEFFICIENT_WAIT, VARIANT_INEFFICIENT, VARIANT_CHANGING_PLANS, VARIANT_INCREASING_IO, VARIANT_INCREASING_CPU, VARIANT_INCREASING_INEFFICIENT_WAIT, VARIANT_CHANGING_PLANS_AND_INCREASING_IO, VARIANT_CHANGING_PLANS_AND_INCREASING_CPU, VARIANT_CHANGING_PLANS_AND_INCREASING_INEFFICIENT_WAIT, INEFFICIENT_CHANGING_PLANS, INEFFICIENT_INCREASING_INEFFICIENT_WAIT, INEFFICIENT_CHANGING_PLANS_AND_INCREASING_INEFFICIENT_WAIT.'
          end
        end
      end

      path = '/databaseInsights/sqlStatistics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:databaseType] = OCI::ApiClient.build_collection_params(opts[:database_type], :multi) if opts[:database_type] && !opts[:database_type].empty?
      query_params[:databaseId] = OCI::ApiClient.build_collection_params(opts[:database_id], :multi) if opts[:database_id] && !opts[:database_id].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:hostName] = OCI::ApiClient.build_collection_params(opts[:host_name], :multi) if opts[:host_name] && !opts[:host_name].empty?
      query_params[:databaseTimePctGreaterThan] = opts[:database_time_pct_greater_than] if opts[:database_time_pct_greater_than]
      query_params[:sqlIdentifier] = OCI::ApiClient.build_collection_params(opts[:sql_identifier], :multi) if opts[:sql_identifier] && !opts[:sql_identifier].empty?
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:category] = OCI::ApiClient.build_collection_params(opts[:category], :multi) if opts[:category] && !opts[:category].empty?
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_sql_statistics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SqlStatisticAggregationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Query SQL Warehouse to get the performance statistics time series for a given SQL across given databases for a given time period.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] sql_identifier Unique SQL_ID for a SQL Statement.
    #   Example: `6rgjh9bjmy2s7`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #    (default to [])
    # @option opts [Array<String>] :id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database insight resource.
    #    (default to [])
    # @option opts [Array<String>] :host_name Filter by one or more hostname.
    #    (default to [])
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @option opts [Array<String>] :defined_tag_equals A list of tag filters to apply.  Only resources with a defined tag matching the value will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_equals A list of tag filters to apply.  Only resources with a freeform tag matching the value will be returned.
    #   The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    #   Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :defined_tag_exists A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be returned.
    #   Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    #   or \"{namespace}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    #   Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @option opts [Array<String>] :freeform_tag_exists A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist the value will be returned.
    #   The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    #   Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    #   Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlStatisticsTimeSeriesAggregationCollection SqlStatisticsTimeSeriesAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_sql_statistics_time_series.rb.html) to see an example of how to use summarize_sql_statistics_time_series API.
    def summarize_sql_statistics_time_series(compartment_id, sql_identifier, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_sql_statistics_time_series.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_sql_statistics_time_series." if compartment_id.nil?
      raise "Missing the required parameter 'sql_identifier' when calling summarize_sql_statistics_time_series." if sql_identifier.nil?

      path = '/databaseInsights/sqlStatisticsTimeSeries'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:sqlIdentifier] = sql_identifier
      query_params[:databaseId] = OCI::ApiClient.build_collection_params(opts[:database_id], :multi) if opts[:database_id] && !opts[:database_id].empty?
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:hostName] = OCI::ApiClient.build_collection_params(opts[:host_name], :multi) if opts[:host_name] && !opts[:host_name].empty?
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:definedTagEquals] = OCI::ApiClient.build_collection_params(opts[:defined_tag_equals], :multi) if opts[:defined_tag_equals] && !opts[:defined_tag_equals].empty?
      query_params[:freeformTagEquals] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_equals], :multi) if opts[:freeform_tag_equals] && !opts[:freeform_tag_equals].empty?
      query_params[:definedTagExists] = OCI::ApiClient.build_collection_params(opts[:defined_tag_exists], :multi) if opts[:defined_tag_exists] && !opts[:defined_tag_exists].empty?
      query_params[:freeformTagExists] = OCI::ApiClient.build_collection_params(opts[:freeform_tag_exists], :multi) if opts[:freeform_tag_exists] && !opts[:freeform_tag_exists].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_sql_statistics_time_series') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SqlStatisticsTimeSeriesAggregationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Query SQL Warehouse to get the performance statistics time series for a given SQL by execution plans for a given time period.
    # Either databaseId or id must be specified.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] sql_identifier Unique SQL_ID for a SQL Statement.
    #   Example: `6rgjh9bjmy2s7`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :database_id Optional [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the associated DBaaS entity.
    #
    # @option opts [String] :id [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database insight resource.
    #
    # @option opts [String] :analysis_time_interval Specify time period in ISO 8601 format with respect to current time.
    #   Default is last 30 days represented by P30D.
    #   If timeInterval is specified, then timeIntervalStart and timeIntervalEnd will be ignored.
    #   Examples  P90D (last 90 days), P4W (last 4 weeks), P2M (last 2 months), P1Y (last 12 months), . Maximum value allowed is 25 months prior to current time (P25M).
    #    (default to P30D)
    # @option opts [DateTime] :time_interval_start Analysis start time in UTC in ISO 8601 format(inclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   The minimum allowed value is 2 years prior to the current day.
    #   timeIntervalStart and timeIntervalEnd parameters are used together.
    #   If analysisTimeInterval is specified, this parameter is ignored.
    #
    # @option opts [DateTime] :time_interval_end Analysis end time in UTC in ISO 8601 format(exclusive).
    #   Example 2019-10-30T00:00:00Z (yyyy-MM-ddThh:mm:ssZ).
    #   timeIntervalStart and timeIntervalEnd are used together.
    #   If timeIntervalEnd is not specified, current time is used as timeIntervalEnd.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlStatisticsTimeSeriesByPlanAggregationCollection SqlStatisticsTimeSeriesByPlanAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_sql_statistics_time_series_by_plan.rb.html) to see an example of how to use summarize_sql_statistics_time_series_by_plan API.
    def summarize_sql_statistics_time_series_by_plan(compartment_id, sql_identifier, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_sql_statistics_time_series_by_plan.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_sql_statistics_time_series_by_plan." if compartment_id.nil?
      raise "Missing the required parameter 'sql_identifier' when calling summarize_sql_statistics_time_series_by_plan." if sql_identifier.nil?

      path = '/databaseInsights/sqlStatisticsTimeSeriesByPlan'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:sqlIdentifier] = sql_identifier
      query_params[:databaseId] = opts[:database_id] if opts[:database_id]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:analysisTimeInterval] = opts[:analysis_time_interval] if opts[:analysis_time_interval]
      query_params[:timeIntervalStart] = opts[:time_interval_start] if opts[:time_interval_start]
      query_params[:timeIntervalEnd] = opts[:time_interval_end] if opts[:time_interval_end]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#summarize_sql_statistics_time_series_by_plan') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Opsi::Models::SqlStatisticsTimeSeriesByPlanAggregationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates configuration of a database insight.
    # @param [String] database_insight_id Unique database insight identifier
    # @param [OCI::Opsi::Models::UpdateDatabaseInsightDetails] update_database_insight_details The configuration to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/update_database_insight.rb.html) to see an example of how to use update_database_insight API.
    def update_database_insight(database_insight_id, update_database_insight_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#update_database_insight.' if logger

      raise "Missing the required parameter 'database_insight_id' when calling update_database_insight." if database_insight_id.nil?
      raise "Missing the required parameter 'update_database_insight_details' when calling update_database_insight." if update_database_insight_details.nil?
      raise "Parameter value for 'database_insight_id' must not be blank" if OCI::Internal::Util.blank_string?(database_insight_id)

      path = '/databaseInsights/{databaseInsightId}'.sub('{databaseInsightId}', database_insight_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_database_insight_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#update_database_insight') do
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


    # Updates configuration of an Operations Insights Enterprise Manager bridge.
    # @param [String] enterprise_manager_bridge_id Unique Enterprise Manager bridge identifier
    # @param [OCI::Opsi::Models::UpdateEnterpriseManagerBridgeDetails] update_enterprise_manager_bridge_details The configuration to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/update_enterprise_manager_bridge.rb.html) to see an example of how to use update_enterprise_manager_bridge API.
    def update_enterprise_manager_bridge(enterprise_manager_bridge_id, update_enterprise_manager_bridge_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#update_enterprise_manager_bridge.' if logger

      raise "Missing the required parameter 'enterprise_manager_bridge_id' when calling update_enterprise_manager_bridge." if enterprise_manager_bridge_id.nil?
      raise "Missing the required parameter 'update_enterprise_manager_bridge_details' when calling update_enterprise_manager_bridge." if update_enterprise_manager_bridge_details.nil?
      raise "Parameter value for 'enterprise_manager_bridge_id' must not be blank" if OCI::Internal::Util.blank_string?(enterprise_manager_bridge_id)

      path = '/enterpriseManagerBridges/{enterpriseManagerBridgeId}'.sub('{enterpriseManagerBridgeId}', enterprise_manager_bridge_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_enterprise_manager_bridge_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#update_enterprise_manager_bridge') do
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


    # Updates configuration of a host insight.
    # @param [String] host_insight_id Unique host insight identifier
    # @param [OCI::Opsi::Models::UpdateHostInsightDetails] update_host_insight_details The configuration to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/update_host_insight.rb.html) to see an example of how to use update_host_insight API.
    def update_host_insight(host_insight_id, update_host_insight_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#update_host_insight.' if logger

      raise "Missing the required parameter 'host_insight_id' when calling update_host_insight." if host_insight_id.nil?
      raise "Missing the required parameter 'update_host_insight_details' when calling update_host_insight." if update_host_insight_details.nil?
      raise "Parameter value for 'host_insight_id' must not be blank" if OCI::Internal::Util.blank_string?(host_insight_id)

      path = '/hostInsights/{hostInsightId}'.sub('{hostInsightId}', host_insight_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_host_insight_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OperationsInsightsClient#update_host_insight') do
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
