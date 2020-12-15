# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
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


    # The sqlbucket endpoint takes in a JSON payload, persists it in Operations Insights ingest pipeline.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] database_id Required [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database.
    #
    # @param [OCI::Opsi::Models::IngestSqlBucketDetails] ingest_sql_bucket_details Collection of SQL bucket objects for a particular database.
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
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::IngestSqlBucketResponseDetails IngestSqlBucketResponseDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/ingest_sql_bucket.rb.html) to see an example of how to use ingest_sql_bucket API.
    def ingest_sql_bucket(compartment_id, database_id, ingest_sql_bucket_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#ingest_sql_bucket.' if logger

      raise "Missing the required parameter 'compartment_id' when calling ingest_sql_bucket." if compartment_id.nil?
      raise "Missing the required parameter 'database_id' when calling ingest_sql_bucket." if database_id.nil?
      raise "Missing the required parameter 'ingest_sql_bucket_details' when calling ingest_sql_bucket." if ingest_sql_bucket_details.nil?

      path = '/databaseInsights/actions/ingestSqlBucket'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:databaseId] = database_id

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
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] database_id Required [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database.
    #
    # @param [OCI::Opsi::Models::IngestSqlPlanLinesDetails] ingest_sql_plan_lines_details Collection of SQL plan line objects for a particular database.
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
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::IngestSqlPlanLinesResponseDetails IngestSqlPlanLinesResponseDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/ingest_sql_plan_lines.rb.html) to see an example of how to use ingest_sql_plan_lines API.
    def ingest_sql_plan_lines(compartment_id, database_id, ingest_sql_plan_lines_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#ingest_sql_plan_lines.' if logger

      raise "Missing the required parameter 'compartment_id' when calling ingest_sql_plan_lines." if compartment_id.nil?
      raise "Missing the required parameter 'database_id' when calling ingest_sql_plan_lines." if database_id.nil?
      raise "Missing the required parameter 'ingest_sql_plan_lines_details' when calling ingest_sql_plan_lines." if ingest_sql_plan_lines_details.nil?

      path = '/databaseInsights/actions/ingestSqlPlanLines'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:databaseId] = database_id

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
    # Disclaimer: SQL text being uploaded explicitly via APIs is not masked. Any sensitive literals contained in the sqlFullText column should be masked prior to ingestion.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] database_id Required [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database.
    #
    # @param [OCI::Opsi::Models::IngestSqlTextDetails] ingest_sql_text_details Collection of SQL text objects for a particular database.
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
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::IngestSqlTextResponseDetails IngestSqlTextResponseDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/ingest_sql_text.rb.html) to see an example of how to use ingest_sql_text API.
    def ingest_sql_text(compartment_id, database_id, ingest_sql_text_details, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#ingest_sql_text.' if logger

      raise "Missing the required parameter 'compartment_id' when calling ingest_sql_text." if compartment_id.nil?
      raise "Missing the required parameter 'database_id' when calling ingest_sql_text." if database_id.nil?
      raise "Missing the required parameter 'ingest_sql_text_details' when calling ingest_sql_text." if ingest_sql_text_details.nil?

      path = '/databaseInsights/actions/ingestSqlText'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:databaseId] = database_id

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


    # Lists database insight resources
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :database_type Filter by one or more database type.
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
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
    def list_database_insights(compartment_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_database_insights.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_database_insights." if compartment_id.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D.'
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
      query_params[:compartmentId] = compartment_id
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


    # Query SQL Warehouse to list the plan xml for a given SQL execution plan. This returns a SqlPlanCollection object, but is currently limited to a single plan.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] database_id Required [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database.
    #
    # @param [String] sql_identifier Unique SQL_ID for a SQL Statement.
    #   Example: `6rgjh9bjmy2s7`
    #
    # @param [Array<Integer>] plan_hash Unique plan hash for a SQL Plan of a particular SQL Statement.
    #   Example: `9820154385`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlPlanCollection SqlPlanCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/list_sql_plans.rb.html) to see an example of how to use list_sql_plans API.
    def list_sql_plans(compartment_id, database_id, sql_identifier, plan_hash, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#list_sql_plans.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_sql_plans." if compartment_id.nil?
      raise "Missing the required parameter 'database_id' when calling list_sql_plans." if database_id.nil?
      raise "Missing the required parameter 'sql_identifier' when calling list_sql_plans." if sql_identifier.nil?
      raise "Missing the required parameter 'plan_hash' when calling list_sql_plans." if plan_hash.nil?

      path = '/databaseInsights/sqlPlans'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:databaseId] = database_id
      query_params[:sqlIdentifier] = sql_identifier
      query_params[:planHash] = OCI::ApiClient.build_collection_params(plan_hash, :multi)
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
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #    (default to [])
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from
    #   the previous \"List\" call. For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
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
      query_params[:page] = opts[:page] if opts[:page]

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


    # Returns response with time series data (endTimestamp, capacity, baseCapacity) for the time period specified.
    # The maximum time range for analysis is 2 years, hence this is intentionally not paginated.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] resource_metric Filter by resource metric.
    #   Supported values are CPU and STORAGE.
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
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
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
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeDatabaseInsightResourceCapacityTrendAggregationCollection SummarizeDatabaseInsightResourceCapacityTrendAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_database_insight_resource_capacity_trend.rb.html) to see an example of how to use summarize_database_insight_resource_capacity_trend API.
    def summarize_database_insight_resource_capacity_trend(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_database_insight_resource_capacity_trend.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_database_insight_resource_capacity_trend." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_database_insight_resource_capacity_trend." if resource_metric.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D.'
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
      query_params[:utilizationLevel] = opts[:utilization_level] if opts[:utilization_level]
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
    #   Supported values are CPU and STORAGE.
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
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
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
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeDatabaseInsightResourceForecastTrendAggregation SummarizeDatabaseInsightResourceForecastTrendAggregation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_database_insight_resource_forecast_trend.rb.html) to see an example of how to use summarize_database_insight_resource_forecast_trend API.
    def summarize_database_insight_resource_forecast_trend(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_database_insight_resource_forecast_trend.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_database_insight_resource_forecast_trend." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_database_insight_resource_forecast_trend." if resource_metric.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D.'
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
      query_params[:statistic] = opts[:statistic] if opts[:statistic]
      query_params[:forecastDays] = opts[:forecast_days] if opts[:forecast_days]
      query_params[:forecastModel] = opts[:forecast_model] if opts[:forecast_model]
      query_params[:utilizationLevel] = opts[:utilization_level] if opts[:utilization_level]
      query_params[:confidence] = opts[:confidence] if opts[:confidence]
      query_params[:page] = opts[:page] if opts[:page]

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
    #   Supported values are CPU and STORAGE.
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
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
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
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact
    #   Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeDatabaseInsightResourceStatisticsAggregationCollection SummarizeDatabaseInsightResourceStatisticsAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_database_insight_resource_statistics.rb.html) to see an example of how to use summarize_database_insight_resource_statistics API.
    def summarize_database_insight_resource_statistics(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_database_insight_resource_statistics.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_database_insight_resource_statistics." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_database_insight_resource_statistics." if resource_metric.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D.'
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
      query_params[:percentile] = opts[:percentile] if opts[:percentile]
      query_params[:insightBy] = opts[:insight_by] if opts[:insight_by]
      query_params[:forecastDays] = opts[:forecast_days] if opts[:forecast_days]
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
    #   Supported values are CPU and STORAGE.
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
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
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
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeDatabaseInsightResourceUsageAggregation SummarizeDatabaseInsightResourceUsageAggregation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_database_insight_resource_usage.rb.html) to see an example of how to use summarize_database_insight_resource_usage API.
    def summarize_database_insight_resource_usage(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_database_insight_resource_usage.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_database_insight_resource_usage." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_database_insight_resource_usage." if resource_metric.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D.'
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
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:percentile] = opts[:percentile] if opts[:percentile]

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
    #   Supported values are CPU and STORAGE.
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
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
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
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeDatabaseInsightResourceUsageTrendAggregationCollection SummarizeDatabaseInsightResourceUsageTrendAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_database_insight_resource_usage_trend.rb.html) to see an example of how to use summarize_database_insight_resource_usage_trend API.
    def summarize_database_insight_resource_usage_trend(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_database_insight_resource_usage_trend.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_database_insight_resource_usage_trend." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_database_insight_resource_usage_trend." if resource_metric.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D.'
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
    #   Supported values are CPU and STORAGE.
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
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
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
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SummarizeDatabaseInsightResourceUtilizationInsightAggregation SummarizeDatabaseInsightResourceUtilizationInsightAggregation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_database_insight_resource_utilization_insight.rb.html) to see an example of how to use summarize_database_insight_resource_utilization_insight API.
    def summarize_database_insight_resource_utilization_insight(compartment_id, resource_metric, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_database_insight_resource_utilization_insight.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_database_insight_resource_utilization_insight." if compartment_id.nil?
      raise "Missing the required parameter 'resource_metric' when calling summarize_database_insight_resource_utilization_insight." if resource_metric.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D.'
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
      query_params[:forecastDays] = opts[:forecast_days] if opts[:forecast_days]
      query_params[:page] = opts[:page] if opts[:page]

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


    # Query SQL Warehouse to get the performance insights for SQLs taking greater than X% database time for a given time period across the given databases or database types.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :database_type Filter by one or more database type.
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
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
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlInsightAggregationCollection SqlInsightAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_sql_insights.rb.html) to see an example of how to use summarize_sql_insights API.
    def summarize_sql_insights(compartment_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_sql_insights.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_sql_insights." if compartment_id.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D.'
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
      query_params[:databaseTimePctGreaterThan] = opts[:database_time_pct_greater_than] if opts[:database_time_pct_greater_than]
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
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] database_id Required [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database.
    #
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
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlPlanInsightAggregationCollection SqlPlanInsightAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_sql_plan_insights.rb.html) to see an example of how to use summarize_sql_plan_insights API.
    def summarize_sql_plan_insights(compartment_id, database_id, sql_identifier, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_sql_plan_insights.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_sql_plan_insights." if compartment_id.nil?
      raise "Missing the required parameter 'database_id' when calling summarize_sql_plan_insights." if database_id.nil?
      raise "Missing the required parameter 'sql_identifier' when calling summarize_sql_plan_insights." if sql_identifier.nil?

      path = '/databaseInsights/sqlPlanInsights'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:databaseId] = database_id
      query_params[:sqlIdentifier] = sql_identifier
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
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] database_id Required [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database.
    #
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
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlResponseTimeDistributionAggregationCollection SqlResponseTimeDistributionAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_sql_response_time_distributions.rb.html) to see an example of how to use summarize_sql_response_time_distributions API.
    def summarize_sql_response_time_distributions(compartment_id, database_id, sql_identifier, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_sql_response_time_distributions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_sql_response_time_distributions." if compartment_id.nil?
      raise "Missing the required parameter 'database_id' when calling summarize_sql_response_time_distributions." if database_id.nil?
      raise "Missing the required parameter 'sql_identifier' when calling summarize_sql_response_time_distributions." if sql_identifier.nil?

      path = '/databaseInsights/sqlResponseTimeDistributions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:databaseId] = database_id
      query_params[:sqlIdentifier] = sql_identifier
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
    #   Possible values are ADW-S, ATP-S, ADW-D, ATP-D
    #    (default to [])
    #   Allowed values are: ADW-S, ATP-S, ADW-D, ATP-D
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
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
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlStatisticAggregationCollection SqlStatisticAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_sql_statistics.rb.html) to see an example of how to use summarize_sql_statistics API.
    def summarize_sql_statistics(compartment_id, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_sql_statistics.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_sql_statistics." if compartment_id.nil?


      database_type_allowable_values = %w[ADW-S ATP-S ADW-D ATP-D]
      if opts[:database_type] && !opts[:database_type].empty?
        opts[:database_type].each do |val_to_check|
          unless database_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "database_type", must be one of ADW-S, ATP-S, ADW-D, ATP-D.'
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
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] sql_identifier Unique SQL_ID for a SQL Statement.
    #   Example: `6rgjh9bjmy2s7`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :database_id Optional list of database [OCIDs](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
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
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] database_id Required [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the database.
    #
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
    # @return [Response] A Response object with data of type {OCI::Opsi::Models::SqlStatisticsTimeSeriesByPlanAggregationCollection SqlStatisticsTimeSeriesByPlanAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/opsi/summarize_sql_statistics_time_series_by_plan.rb.html) to see an example of how to use summarize_sql_statistics_time_series_by_plan API.
    def summarize_sql_statistics_time_series_by_plan(compartment_id, database_id, sql_identifier, opts = {})
      logger.debug 'Calling operation OperationsInsightsClient#summarize_sql_statistics_time_series_by_plan.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_sql_statistics_time_series_by_plan." if compartment_id.nil?
      raise "Missing the required parameter 'database_id' when calling summarize_sql_statistics_time_series_by_plan." if database_id.nil?
      raise "Missing the required parameter 'sql_identifier' when calling summarize_sql_statistics_time_series_by_plan." if sql_identifier.nil?

      path = '/databaseInsights/sqlStatisticsTimeSeriesByPlan'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:databaseId] = database_id
      query_params[:sqlIdentifier] = sql_identifier
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

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)

      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
