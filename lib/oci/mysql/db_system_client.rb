# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The API for the MySQL Database Service
  class Mysql::DbSystemClient
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


    # Creates a new DbSystemClient.
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
        @endpoint = endpoint + '/20190415'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "DbSystemClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://mysql.{region}.ocp.{secondLevelDomain}') + '/20190415'
      logger.info "DbSystemClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # DEPRECATED -- please use HeatWave API instead.
    # Adds an Analytics Cluster to the DB System.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Mysql::Models::AddAnalyticsClusterDetails] add_analytics_cluster_details Request to add an Analytics Cluster.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::AnalyticsCluster AnalyticsCluster}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/add_analytics_cluster.rb.html) to see an example of how to use add_analytics_cluster API.
    def add_analytics_cluster(db_system_id, add_analytics_cluster_details, opts = {})
      logger.debug 'Calling operation DbSystemClient#add_analytics_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling add_analytics_cluster." if db_system_id.nil?
      raise "Missing the required parameter 'add_analytics_cluster_details' when calling add_analytics_cluster." if add_analytics_cluster_details.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/analyticsCluster/actions/add'.sub('{dbSystemId}', db_system_id.to_s)
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

      post_body = @api_client.object_to_http_body(add_analytics_cluster_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#add_analytics_cluster') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::AnalyticsCluster'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Adds a HeatWave cluster to the DB System.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Mysql::Models::AddHeatWaveClusterDetails] add_heat_wave_cluster_details Request to add a HeatWave cluster.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::HeatWaveCluster HeatWaveCluster}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/add_heat_wave_cluster.rb.html) to see an example of how to use add_heat_wave_cluster API.
    def add_heat_wave_cluster(db_system_id, add_heat_wave_cluster_details, opts = {})
      logger.debug 'Calling operation DbSystemClient#add_heat_wave_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling add_heat_wave_cluster." if db_system_id.nil?
      raise "Missing the required parameter 'add_heat_wave_cluster_details' when calling add_heat_wave_cluster." if add_heat_wave_cluster_details.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/heatWaveCluster/actions/add'.sub('{dbSystemId}', db_system_id.to_s)
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

      post_body = @api_client.object_to_http_body(add_heat_wave_cluster_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#add_heat_wave_cluster') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::HeatWaveCluster'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates and launches a DB System.
    #
    # @param [OCI::Mysql::Models::CreateDbSystemDetails] create_db_system_details Request to create a DB System.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::DbSystem DbSystem}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/create_db_system.rb.html) to see an example of how to use create_db_system API.
    def create_db_system(create_db_system_details, opts = {})
      logger.debug 'Calling operation DbSystemClient#create_db_system.' if logger

      raise "Missing the required parameter 'create_db_system_details' when calling create_db_system." if create_db_system_details.nil?

      path = '/dbSystems'
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

      post_body = @api_client.object_to_http_body(create_db_system_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#create_db_system') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::DbSystem'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # DEPRECATED -- please use HeatWave API instead.
    # Deletes the Analytics Cluster including terminating, detaching, removing, finalizing and
    # otherwise deleting all related resources.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/delete_analytics_cluster.rb.html) to see an example of how to use delete_analytics_cluster API.
    def delete_analytics_cluster(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#delete_analytics_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling delete_analytics_cluster." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/analyticsCluster'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#delete_analytics_cluster') do
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


    # Delete a DB System, including terminating, detaching,
    # removing, finalizing and otherwise deleting all related resources.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/delete_db_system.rb.html) to see an example of how to use delete_db_system API.
    def delete_db_system(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#delete_db_system.' if logger

      raise "Missing the required parameter 'db_system_id' when calling delete_db_system." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#delete_db_system') do
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


    # Deletes the HeatWave cluster including terminating, detaching, removing, finalizing and
    # otherwise deleting all related resources.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/delete_heat_wave_cluster.rb.html) to see an example of how to use delete_heat_wave_cluster API.
    def delete_heat_wave_cluster(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#delete_heat_wave_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling delete_heat_wave_cluster." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/heatWaveCluster'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#delete_heat_wave_cluster') do
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


    # DEPRECATED -- please use HeatWave API instead.
    # Sends a request to estimate the memory footprints of user tables when loaded to Analytics Cluster memory.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::AnalyticsClusterMemoryEstimate AnalyticsClusterMemoryEstimate}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/generate_analytics_cluster_memory_estimate.rb.html) to see an example of how to use generate_analytics_cluster_memory_estimate API.
    def generate_analytics_cluster_memory_estimate(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#generate_analytics_cluster_memory_estimate.' if logger

      raise "Missing the required parameter 'db_system_id' when calling generate_analytics_cluster_memory_estimate." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/analyticsClusterMemoryEstimate/actions/generate'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#generate_analytics_cluster_memory_estimate') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::AnalyticsClusterMemoryEstimate'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Sends a request to estimate the memory footprints of user tables when loaded to HeatWave cluster memory.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::HeatWaveClusterMemoryEstimate HeatWaveClusterMemoryEstimate}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/generate_heat_wave_cluster_memory_estimate.rb.html) to see an example of how to use generate_heat_wave_cluster_memory_estimate API.
    def generate_heat_wave_cluster_memory_estimate(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#generate_heat_wave_cluster_memory_estimate.' if logger

      raise "Missing the required parameter 'db_system_id' when calling generate_heat_wave_cluster_memory_estimate." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/heatWaveClusterMemoryEstimate/actions/generate'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#generate_heat_wave_cluster_memory_estimate') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::HeatWaveClusterMemoryEstimate'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # DEPRECATED -- please use HeatWave API instead.
    # Gets information about the Analytics Cluster.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :if_none_match For conditional requests. In the GET call for a resource, set the
    #   `If-None-Match` header to the value of the ETag from a previous GET (or
    #   POST or PUT) response for that resource. The server will return with
    #   either a 304 Not Modified response if the resource has not changed, or a
    #   200 OK response with the updated representation.
    #
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::AnalyticsCluster AnalyticsCluster}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/get_analytics_cluster.rb.html) to see an example of how to use get_analytics_cluster API.
    def get_analytics_cluster(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#get_analytics_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling get_analytics_cluster." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/analyticsCluster'.sub('{dbSystemId}', db_system_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#get_analytics_cluster') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::AnalyticsCluster'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # DEPRECATED -- please use HeatWave API instead.
    # Gets the most recent Analytics Cluster memory estimate that can be used to determine a suitable
    # Analytics Cluster size.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::AnalyticsClusterMemoryEstimate AnalyticsClusterMemoryEstimate}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/get_analytics_cluster_memory_estimate.rb.html) to see an example of how to use get_analytics_cluster_memory_estimate API.
    def get_analytics_cluster_memory_estimate(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#get_analytics_cluster_memory_estimate.' if logger

      raise "Missing the required parameter 'db_system_id' when calling get_analytics_cluster_memory_estimate." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/analyticsClusterMemoryEstimate'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#get_analytics_cluster_memory_estimate') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::AnalyticsClusterMemoryEstimate'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get information about the specified DB System.
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :if_none_match For conditional requests. In the GET call for a resource, set the
    #   `If-None-Match` header to the value of the ETag from a previous GET (or
    #   POST or PUT) response for that resource. The server will return with
    #   either a 304 Not Modified response if the resource has not changed, or a
    #   200 OK response with the updated representation.
    #
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::DbSystem DbSystem}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/get_db_system.rb.html) to see an example of how to use get_db_system API.
    def get_db_system(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#get_db_system.' if logger

      raise "Missing the required parameter 'db_system_id' when calling get_db_system." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}'.sub('{dbSystemId}', db_system_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#get_db_system') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::DbSystem'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the HeatWave cluster.
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :if_none_match For conditional requests. In the GET call for a resource, set the
    #   `If-None-Match` header to the value of the ETag from a previous GET (or
    #   POST or PUT) response for that resource. The server will return with
    #   either a 304 Not Modified response if the resource has not changed, or a
    #   200 OK response with the updated representation.
    #
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::HeatWaveCluster HeatWaveCluster}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/get_heat_wave_cluster.rb.html) to see an example of how to use get_heat_wave_cluster API.
    def get_heat_wave_cluster(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#get_heat_wave_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling get_heat_wave_cluster." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/heatWaveCluster'.sub('{dbSystemId}', db_system_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#get_heat_wave_cluster') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::HeatWaveCluster'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the most recent HeatWave cluster memory estimate that can be used to determine a suitable
    # HeatWave cluster size.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::HeatWaveClusterMemoryEstimate HeatWaveClusterMemoryEstimate}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/get_heat_wave_cluster_memory_estimate.rb.html) to see an example of how to use get_heat_wave_cluster_memory_estimate API.
    def get_heat_wave_cluster_memory_estimate(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#get_heat_wave_cluster_memory_estimate.' if logger

      raise "Missing the required parameter 'db_system_id' when calling get_heat_wave_cluster_memory_estimate." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/heatWaveClusterMemoryEstimate'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#get_heat_wave_cluster_memory_estimate') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::HeatWaveClusterMemoryEstimate'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get a list of DB Systems in the specified compartment.
    # The default sort order is by timeUpdated, descending.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [BOOLEAN] :is_analytics_cluster_attached DEPRECATED -- please use HeatWave API instead.
    #   If true, return only DB Systems with an Analytics Cluster attached, if false
    #   return only DB Systems with no Analytics Cluster attached. If not
    #   present, return all DB Systems.
    #    (default to false)
    # @option opts [BOOLEAN] :is_heat_wave_cluster_attached If true, return only DB Systems with a HeatWave cluster attached, if false
    #   return only DB Systems with no HeatWave cluster attached. If not
    #   present, return all DB Systems.
    #    (default to false)
    # @option opts [String] :db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @option opts [String] :display_name A filter to return only the resource matching the given display name exactly.
    # @option opts [String] :lifecycle_state DbSystem Lifecycle State (default to AVAILABLE)
    # @option opts [String] :configuration_id The requested Configuration instance.
    # @option opts [BOOLEAN] :is_up_to_date Filter instances if they are using the latest revision of the
    #   Configuration they are associated with.
    #    (default to false)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Time fields are default ordered as descending. Display name is default ordered as ascending.
    #    (default to timeCreated)
    #   Allowed values are: displayName, timeCreated
    # @option opts [String] :sort_order The sort order to use (ASC or DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return in a paginated list call. For information about pagination, see
    #   [List Pagination](https://docs.cloud.oracle.com/#API/Concepts/usingapi.htm#List_Pagination).
    #    (default to 100)
    # @option opts [String] :page The value of the `opc-next-page` or `opc-prev-page` response header from
    #   the previous list call. For information about pagination, see [List
    #   Pagination](https://docs.cloud.oracle.com/#API/Concepts/usingapi.htm#List_Pagination).
    #
    # @return [Response] A Response object with data of type Array<{OCI::Mysql::Models::DbSystemSummary DbSystemSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/list_db_systems.rb.html) to see an example of how to use list_db_systems API.
    def list_db_systems(compartment_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#list_db_systems.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_db_systems." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Mysql::Models::DbSystem::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Mysql::Models::DbSystem::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/dbSystems'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:isAnalyticsClusterAttached] = opts[:is_analytics_cluster_attached] if !opts[:is_analytics_cluster_attached].nil?
      query_params[:isHeatWaveClusterAttached] = opts[:is_heat_wave_cluster_attached] if !opts[:is_heat_wave_cluster_attached].nil?
      query_params[:dbSystemId] = opts[:db_system_id] if opts[:db_system_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:configurationId] = opts[:configuration_id] if opts[:configuration_id]
      query_params[:isUpToDate] = opts[:is_up_to_date] if !opts[:is_up_to_date].nil?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#list_db_systems') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Mysql::Models::DbSystemSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # DEPRECATED -- please use HeatWave API instead.
    # Restarts the Analytics Cluster.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/restart_analytics_cluster.rb.html) to see an example of how to use restart_analytics_cluster API.
    def restart_analytics_cluster(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#restart_analytics_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling restart_analytics_cluster." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/analyticsCluster/actions/restart'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#restart_analytics_cluster') do
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


    # Restarts the specified DB System.
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Mysql::Models::RestartDbSystemDetails] restart_db_system_details Optional parameters for the stop portion of the restart action.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/restart_db_system.rb.html) to see an example of how to use restart_db_system API.
    def restart_db_system(db_system_id, restart_db_system_details, opts = {})
      logger.debug 'Calling operation DbSystemClient#restart_db_system.' if logger

      raise "Missing the required parameter 'db_system_id' when calling restart_db_system." if db_system_id.nil?
      raise "Missing the required parameter 'restart_db_system_details' when calling restart_db_system." if restart_db_system_details.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/actions/restart'.sub('{dbSystemId}', db_system_id.to_s)
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

      post_body = @api_client.object_to_http_body(restart_db_system_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#restart_db_system') do
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


    # Restarts the HeatWave cluster.
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/restart_heat_wave_cluster.rb.html) to see an example of how to use restart_heat_wave_cluster API.
    def restart_heat_wave_cluster(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#restart_heat_wave_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling restart_heat_wave_cluster." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/heatWaveCluster/actions/restart'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#restart_heat_wave_cluster') do
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


    # DEPRECATED -- please use HeatWave API instead.
    # Starts the Analytics Cluster.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/start_analytics_cluster.rb.html) to see an example of how to use start_analytics_cluster API.
    def start_analytics_cluster(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#start_analytics_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling start_analytics_cluster." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/analyticsCluster/actions/start'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#start_analytics_cluster') do
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


    # Start the specified DB System.
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/start_db_system.rb.html) to see an example of how to use start_db_system API.
    def start_db_system(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#start_db_system.' if logger

      raise "Missing the required parameter 'db_system_id' when calling start_db_system." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/actions/start'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#start_db_system') do
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


    # Starts the HeatWave cluster.
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/start_heat_wave_cluster.rb.html) to see an example of how to use start_heat_wave_cluster API.
    def start_heat_wave_cluster(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#start_heat_wave_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling start_heat_wave_cluster." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/heatWaveCluster/actions/start'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#start_heat_wave_cluster') do
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


    # DEPRECATED -- please use HeatWave API instead.
    # Stops the Analytics Cluster.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/stop_analytics_cluster.rb.html) to see an example of how to use stop_analytics_cluster API.
    def stop_analytics_cluster(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#stop_analytics_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling stop_analytics_cluster." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/analyticsCluster/actions/stop'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#stop_analytics_cluster') do
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


    # Stops the specified DB System.
    #
    # A stopped DB System is not billed.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Mysql::Models::StopDbSystemDetails] stop_db_system_details Optional parameters for the stop action.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/stop_db_system.rb.html) to see an example of how to use stop_db_system API.
    def stop_db_system(db_system_id, stop_db_system_details, opts = {})
      logger.debug 'Calling operation DbSystemClient#stop_db_system.' if logger

      raise "Missing the required parameter 'db_system_id' when calling stop_db_system." if db_system_id.nil?
      raise "Missing the required parameter 'stop_db_system_details' when calling stop_db_system." if stop_db_system_details.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/actions/stop'.sub('{dbSystemId}', db_system_id.to_s)
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

      post_body = @api_client.object_to_http_body(stop_db_system_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#stop_db_system') do
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


    # Stops the HeatWave cluster.
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/stop_heat_wave_cluster.rb.html) to see an example of how to use stop_heat_wave_cluster API.
    def stop_heat_wave_cluster(db_system_id, opts = {})
      logger.debug 'Calling operation DbSystemClient#stop_heat_wave_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling stop_heat_wave_cluster." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/heatWaveCluster/actions/stop'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#stop_heat_wave_cluster') do
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


    # DEPRECATED -- please use HeatWave API instead.
    # Updates the Analytics Cluster.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Mysql::Models::UpdateAnalyticsClusterDetails] update_analytics_cluster_details Request to update an Analytics Cluster.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/update_analytics_cluster.rb.html) to see an example of how to use update_analytics_cluster API.
    def update_analytics_cluster(db_system_id, update_analytics_cluster_details, opts = {})
      logger.debug 'Calling operation DbSystemClient#update_analytics_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling update_analytics_cluster." if db_system_id.nil?
      raise "Missing the required parameter 'update_analytics_cluster_details' when calling update_analytics_cluster." if update_analytics_cluster_details.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/analyticsCluster'.sub('{dbSystemId}', db_system_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_analytics_cluster_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#update_analytics_cluster') do
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


    # Update the configuration of a DB System.
    #
    # Updating different fields in the DB System will have different results
    # on the uptime of the DB System. For example, changing the displayName of
    # a DB System will take effect immediately, but changing the shape of a
    # DB System is an asynchronous operation that involves provisioning new
    # Compute resources, pausing the DB System and migrating storage
    # before making the DB System available again.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Mysql::Models::UpdateDbSystemDetails] update_db_system_details Request to update a DB System.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/update_db_system.rb.html) to see an example of how to use update_db_system API.
    def update_db_system(db_system_id, update_db_system_details, opts = {})
      logger.debug 'Calling operation DbSystemClient#update_db_system.' if logger

      raise "Missing the required parameter 'db_system_id' when calling update_db_system." if db_system_id.nil?
      raise "Missing the required parameter 'update_db_system_details' when calling update_db_system." if update_db_system_details.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}'.sub('{dbSystemId}', db_system_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_db_system_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#update_db_system') do
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


    # Updates the HeatWave cluster.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Mysql::Models::UpdateHeatWaveClusterDetails] update_heat_wave_cluster_details Request to update a HeatWave cluster.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/update_heat_wave_cluster.rb.html) to see an example of how to use update_heat_wave_cluster API.
    def update_heat_wave_cluster(db_system_id, update_heat_wave_cluster_details, opts = {})
      logger.debug 'Calling operation DbSystemClient#update_heat_wave_cluster.' if logger

      raise "Missing the required parameter 'db_system_id' when calling update_heat_wave_cluster." if db_system_id.nil?
      raise "Missing the required parameter 'update_heat_wave_cluster_details' when calling update_heat_wave_cluster." if update_heat_wave_cluster_details.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/heatWaveCluster'.sub('{dbSystemId}', db_system_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_heat_wave_cluster_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbSystemClient#update_heat_wave_cluster') do
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
