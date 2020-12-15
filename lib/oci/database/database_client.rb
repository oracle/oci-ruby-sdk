# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The API for the Database Service. Use this API to manage resources such as databases and DB Systems. For more information, see [Overview of the Database Service](/iaas/Content/Database/Concepts/databaseoverview.htm).
  class Database::DatabaseClient
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


    # Creates a new DatabaseClient.
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
        @endpoint = endpoint + '/20160918'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "DatabaseClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://database.{region}.{secondLevelDomain}') + '/20160918'
      logger.info "DatabaseClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Activates the specified Exadata infrastructure resource. Applies to Exadata Cloud@Customer instances only.
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::ActivateExadataInfrastructureDetails] activate_exadata_infrastructure_details The activation details for the Exadata infrastructure.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::ExadataInfrastructure ExadataInfrastructure}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/activate_exadata_infrastructure.rb.html) to see an example of how to use activate_exadata_infrastructure API.
    def activate_exadata_infrastructure(exadata_infrastructure_id, activate_exadata_infrastructure_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#activate_exadata_infrastructure.' if logger

      raise "Missing the required parameter 'exadata_infrastructure_id' when calling activate_exadata_infrastructure." if exadata_infrastructure_id.nil?
      raise "Missing the required parameter 'activate_exadata_infrastructure_details' when calling activate_exadata_infrastructure." if activate_exadata_infrastructure_details.nil?
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}/actions/activate'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s)
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

      post_body = @api_client.object_to_http_body(activate_exadata_infrastructure_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#activate_exadata_infrastructure') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ExadataInfrastructure'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Initiates a data refresh for an Autonomous Database refreshable clone. Data is refreshed from the source database to the point of a specified timestamp.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::AutonomousDatabaseManualRefreshDetails] autonomous_database_manual_refresh_details Request details for manually refreshing an Autonomous Database refreshable clone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabase AutonomousDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/autonomous_database_manual_refresh.rb.html) to see an example of how to use autonomous_database_manual_refresh API.
    def autonomous_database_manual_refresh(autonomous_database_id, autonomous_database_manual_refresh_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#autonomous_database_manual_refresh.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling autonomous_database_manual_refresh." if autonomous_database_id.nil?
      raise "Missing the required parameter 'autonomous_database_manual_refresh_details' when calling autonomous_database_manual_refresh." if autonomous_database_manual_refresh_details.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/refresh'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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

      post_body = @api_client.object_to_http_body(autonomous_database_manual_refresh_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#autonomous_database_manual_refresh') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Move the Autonomous Container Database and its dependent resources to the specified compartment.
    # For more information about moving Autonomous Container Databases, see
    # [Moving Database Resources to a Different Compartment](https://docs.cloud.oracle.com/Content/Database/Concepts/databaseoverview.htm#moveRes).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move Autonomous Container Database to a different compartment
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/change_autonomous_container_database_compartment.rb.html) to see an example of how to use change_autonomous_container_database_compartment API.
    def change_autonomous_container_database_compartment(change_compartment_details, autonomous_container_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#change_autonomous_container_database_compartment.' if logger

      raise "Missing the required parameter 'change_compartment_details' when calling change_autonomous_container_database_compartment." if change_compartment_details.nil?
      raise "Missing the required parameter 'autonomous_container_database_id' when calling change_autonomous_container_database_compartment." if autonomous_container_database_id.nil?
      raise "Parameter value for 'autonomous_container_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_id)

      path = '/autonomousContainerDatabases/{autonomousContainerDatabaseId}/actions/changeCompartment'.sub('{autonomousContainerDatabaseId}', autonomous_container_database_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#change_autonomous_container_database_compartment') do
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


    # Move the Autonomous Database and its dependent resources to the specified compartment.
    # For more information about moving Autonomous Databases, see
    # [Moving Database Resources to a Different Compartment](https://docs.cloud.oracle.com/Content/Database/Concepts/databaseoverview.htm#moveRes).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move Autonomous Database to a different compartment
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/change_autonomous_database_compartment.rb.html) to see an example of how to use change_autonomous_database_compartment API.
    def change_autonomous_database_compartment(change_compartment_details, autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#change_autonomous_database_compartment.' if logger

      raise "Missing the required parameter 'change_compartment_details' when calling change_autonomous_database_compartment." if change_compartment_details.nil?
      raise "Missing the required parameter 'autonomous_database_id' when calling change_autonomous_database_compartment." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/changeCompartment'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#change_autonomous_database_compartment') do
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


    # Moves the Autonomous Exadata Infrastructure resource and its dependent resources to the specified compartment.
    # For more information, see
    # [Moving Database Resources to a Different Compartment](https://docs.cloud.oracle.com/Content/Database/Concepts/databaseoverview.htm#moveRes).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move an Autonomous Exadata Infrastructure resource to a different compartment.
    # @param [String] autonomous_exadata_infrastructure_id The Autonomous Exadata Infrastructure  [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/change_autonomous_exadata_infrastructure_compartment.rb.html) to see an example of how to use change_autonomous_exadata_infrastructure_compartment API.
    def change_autonomous_exadata_infrastructure_compartment(change_compartment_details, autonomous_exadata_infrastructure_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#change_autonomous_exadata_infrastructure_compartment.' if logger

      raise "Missing the required parameter 'change_compartment_details' when calling change_autonomous_exadata_infrastructure_compartment." if change_compartment_details.nil?
      raise "Missing the required parameter 'autonomous_exadata_infrastructure_id' when calling change_autonomous_exadata_infrastructure_compartment." if autonomous_exadata_infrastructure_id.nil?
      raise "Parameter value for 'autonomous_exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_exadata_infrastructure_id)

      path = '/autonomousExadataInfrastructures/{autonomousExadataInfrastructureId}/actions/changeCompartment'.sub('{autonomousExadataInfrastructureId}', autonomous_exadata_infrastructure_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#change_autonomous_exadata_infrastructure_compartment') do
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


    # To move an Autonomous VM cluster and its dependent resources to another compartment, use the
    # {#change_autonomous_vm_cluster_compartment change_autonomous_vm_cluster_compartment} operation.
    #
    # @param [OCI::Database::Models::ChangeAutonomousVmClusterCompartmentDetails] change_autonomous_vm_cluster_compartment_details Request to move Autonomous VM cluster to a different compartment
    # @param [String] autonomous_vm_cluster_id The autonomous VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/change_autonomous_vm_cluster_compartment.rb.html) to see an example of how to use change_autonomous_vm_cluster_compartment API.
    def change_autonomous_vm_cluster_compartment(change_autonomous_vm_cluster_compartment_details, autonomous_vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#change_autonomous_vm_cluster_compartment.' if logger

      raise "Missing the required parameter 'change_autonomous_vm_cluster_compartment_details' when calling change_autonomous_vm_cluster_compartment." if change_autonomous_vm_cluster_compartment_details.nil?
      raise "Missing the required parameter 'autonomous_vm_cluster_id' when calling change_autonomous_vm_cluster_compartment." if autonomous_vm_cluster_id.nil?
      raise "Parameter value for 'autonomous_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_vm_cluster_id)

      path = '/autonomousVmClusters/{autonomousVmClusterId}/actions/changeCompartment'.sub('{autonomousVmClusterId}', autonomous_vm_cluster_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_autonomous_vm_cluster_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#change_autonomous_vm_cluster_compartment') do
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


    # Move the backup destination and its dependent resources to the specified compartment.
    # For more information, see
    # [Moving Database Resources to a Different Compartment](https://docs.cloud.oracle.com/Content/Database/Concepts/databaseoverview.htm#moveRes).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move backup destination to a different compartment.
    #
    # @param [String] backup_destination_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup destination.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/change_backup_destination_compartment.rb.html) to see an example of how to use change_backup_destination_compartment API.
    def change_backup_destination_compartment(change_compartment_details, backup_destination_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#change_backup_destination_compartment.' if logger

      raise "Missing the required parameter 'change_compartment_details' when calling change_backup_destination_compartment." if change_compartment_details.nil?
      raise "Missing the required parameter 'backup_destination_id' when calling change_backup_destination_compartment." if backup_destination_id.nil?
      raise "Parameter value for 'backup_destination_id' must not be blank" if OCI::Internal::Util.blank_string?(backup_destination_id)

      path = '/backupDestinations/{backupDestinationId}/actions/changeCompartment'.sub('{backupDestinationId}', backup_destination_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#change_backup_destination_compartment') do
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


    # Moves a cloud Exadata infrastructure resource and its dependent resources to another compartment. Applies to Exadata Cloud Service instances only. For more information about moving resources to a different compartment, see [Moving Database Resources to a Different Compartment](https://docs.cloud.oracle.com/Content/Database/Concepts/databaseoverview.htm#moveRes).
    #
    # @param [OCI::Database::Models::ChangeCloudExadataInfrastructureCompartmentDetails] change_cloud_exadata_infrastructure_compartment_details Request to move cloud Exadata infrastructure resource to a different compartment.
    # @param [String] cloud_exadata_infrastructure_id The cloud Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/change_cloud_exadata_infrastructure_compartment.rb.html) to see an example of how to use change_cloud_exadata_infrastructure_compartment API.
    def change_cloud_exadata_infrastructure_compartment(change_cloud_exadata_infrastructure_compartment_details, cloud_exadata_infrastructure_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#change_cloud_exadata_infrastructure_compartment.' if logger

      raise "Missing the required parameter 'change_cloud_exadata_infrastructure_compartment_details' when calling change_cloud_exadata_infrastructure_compartment." if change_cloud_exadata_infrastructure_compartment_details.nil?
      raise "Missing the required parameter 'cloud_exadata_infrastructure_id' when calling change_cloud_exadata_infrastructure_compartment." if cloud_exadata_infrastructure_id.nil?
      raise "Parameter value for 'cloud_exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_exadata_infrastructure_id)

      path = '/cloudExadataInfrastructures/{cloudExadataInfrastructureId}/actions/changeCompartment'.sub('{cloudExadataInfrastructureId}', cloud_exadata_infrastructure_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_cloud_exadata_infrastructure_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#change_cloud_exadata_infrastructure_compartment') do
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


    # Moves a cloud VM cluster and its dependent resources to another compartment. Applies to Exadata Cloud Service instances only.
    #
    # @param [OCI::Database::Models::ChangeCloudVmClusterCompartmentDetails] change_cloud_vm_cluster_compartment_details Request to move cloud VM cluster to a different compartment
    # @param [String] cloud_vm_cluster_id The cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/change_cloud_vm_cluster_compartment.rb.html) to see an example of how to use change_cloud_vm_cluster_compartment API.
    def change_cloud_vm_cluster_compartment(change_cloud_vm_cluster_compartment_details, cloud_vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#change_cloud_vm_cluster_compartment.' if logger

      raise "Missing the required parameter 'change_cloud_vm_cluster_compartment_details' when calling change_cloud_vm_cluster_compartment." if change_cloud_vm_cluster_compartment_details.nil?
      raise "Missing the required parameter 'cloud_vm_cluster_id' when calling change_cloud_vm_cluster_compartment." if cloud_vm_cluster_id.nil?
      raise "Parameter value for 'cloud_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_vm_cluster_id)

      path = '/cloudVmClusters/{cloudVmClusterId}/actions/changeCompartment'.sub('{cloudVmClusterId}', cloud_vm_cluster_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_cloud_vm_cluster_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#change_cloud_vm_cluster_compartment') do
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


    # Move the Database Software Image and its dependent resources to the specified compartment.
    # For more information about moving Databse Software Images, see
    # [Moving Database Resources to a Different Compartment](https://docs.cloud.oracle.com/Content/Database/Concepts/databaseoverview.htm#moveRes).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move Database Software Image to a different compartment
    # @param [String] database_software_image_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/change_database_software_image_compartment.rb.html) to see an example of how to use change_database_software_image_compartment API.
    def change_database_software_image_compartment(change_compartment_details, database_software_image_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#change_database_software_image_compartment.' if logger

      raise "Missing the required parameter 'change_compartment_details' when calling change_database_software_image_compartment." if change_compartment_details.nil?
      raise "Missing the required parameter 'database_software_image_id' when calling change_database_software_image_compartment." if database_software_image_id.nil?
      raise "Parameter value for 'database_software_image_id' must not be blank" if OCI::Internal::Util.blank_string?(database_software_image_id)

      path = '/databaseSoftwareImages/{databaseSoftwareImageId}/actions/changeCompartment'.sub('{databaseSoftwareImageId}', database_software_image_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#change_database_software_image_compartment') do
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


    # Moves the DB system and its dependent resources to the specified compartment.
    # For more information about moving DB systems, see
    # [Moving Database Resources to a Different Compartment](https://docs.cloud.oracle.com/Content/Database/Concepts/databaseoverview.htm#moveRes).
    #
    # @param [OCI::Database::Models::ChangeCompartmentDetails] change_compartment_details Request to move the DB system to a different compartment.
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/change_db_system_compartment.rb.html) to see an example of how to use change_db_system_compartment API.
    def change_db_system_compartment(change_compartment_details, db_system_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#change_db_system_compartment.' if logger

      raise "Missing the required parameter 'change_compartment_details' when calling change_db_system_compartment." if change_compartment_details.nil?
      raise "Missing the required parameter 'db_system_id' when calling change_db_system_compartment." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/actions/changeCompartment'.sub('{dbSystemId}', db_system_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#change_db_system_compartment') do
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


    # Moves an Exadata infrastructure resource and its dependent resources to another compartment. Applies to Exadata Cloud@Customer instances only.
    # To move an Exadata Cloud Service infrastructure resource to another compartment, use the  {#change_cloud_exadata_infrastructure_compartment change_cloud_exadata_infrastructure_compartment} operation.
    #
    # @param [OCI::Database::Models::ChangeExadataInfrastructureCompartmentDetails] change_exadata_infrastructure_compartment_details Request to move Exadata infrastructure to a different compartment
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/change_exadata_infrastructure_compartment.rb.html) to see an example of how to use change_exadata_infrastructure_compartment API.
    def change_exadata_infrastructure_compartment(change_exadata_infrastructure_compartment_details, exadata_infrastructure_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#change_exadata_infrastructure_compartment.' if logger

      raise "Missing the required parameter 'change_exadata_infrastructure_compartment_details' when calling change_exadata_infrastructure_compartment." if change_exadata_infrastructure_compartment_details.nil?
      raise "Missing the required parameter 'exadata_infrastructure_id' when calling change_exadata_infrastructure_compartment." if exadata_infrastructure_id.nil?
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}/actions/changeCompartment'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_exadata_infrastructure_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#change_exadata_infrastructure_compartment') do
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


    # Move the key store resource to the specified compartment.
    # For more information about moving key stores, see
    # [Moving Database Resources to a Different Compartment](https://docs.cloud.oracle.com/Content/Database/Concepts/databaseoverview.htm#moveRes).
    #
    # @param [OCI::Database::Models::ChangeKeyStoreCompartmentDetails] change_key_store_compartment_details Request to move key store to a different compartment
    #
    # @param [String] key_store_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the key store.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/change_key_store_compartment.rb.html) to see an example of how to use change_key_store_compartment API.
    def change_key_store_compartment(change_key_store_compartment_details, key_store_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#change_key_store_compartment.' if logger

      raise "Missing the required parameter 'change_key_store_compartment_details' when calling change_key_store_compartment." if change_key_store_compartment_details.nil?
      raise "Missing the required parameter 'key_store_id' when calling change_key_store_compartment." if key_store_id.nil?
      raise "Parameter value for 'key_store_id' must not be blank" if OCI::Internal::Util.blank_string?(key_store_id)

      path = '/keyStores/{keyStoreId}/actions/changeCompartment'.sub('{keyStoreId}', key_store_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_key_store_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#change_key_store_compartment') do
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


    # Moves a VM cluster and its dependent resources to another compartment. Applies to Exadata Cloud@Customer instances only.
    # To move a cloud VM cluster in an Exadata Cloud Service instance to another compartment, use the {#change_cloud_vm_cluster_compartment change_cloud_vm_cluster_compartment} operation.
    #
    # @param [OCI::Database::Models::ChangeVmClusterCompartmentDetails] change_vm_cluster_compartment_details Request to move the Exadata Cloud@Customer VM cluster to a different compartment.
    # @param [String] vm_cluster_id The VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/change_vm_cluster_compartment.rb.html) to see an example of how to use change_vm_cluster_compartment API.
    def change_vm_cluster_compartment(change_vm_cluster_compartment_details, vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#change_vm_cluster_compartment.' if logger

      raise "Missing the required parameter 'change_vm_cluster_compartment_details' when calling change_vm_cluster_compartment." if change_vm_cluster_compartment_details.nil?
      raise "Missing the required parameter 'vm_cluster_id' when calling change_vm_cluster_compartment." if vm_cluster_id.nil?
      raise "Parameter value for 'vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(vm_cluster_id)

      path = '/vmClusters/{vmClusterId}/actions/changeCompartment'.sub('{vmClusterId}', vm_cluster_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_vm_cluster_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#change_vm_cluster_compartment') do
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


    # Changes the status of the standalone backup resource to `ACTIVE` after the backup is created from the on-premises database and placed in Oracle Cloud Infrastructure Object Storage.
    #
    # **Note:** This API is used by an Oracle Cloud Infrastructure Python script that is packaged with the Oracle Cloud Infrastructure CLI. Oracle recommends that you use the script instead using the API directly. See [Migrating an On-Premises Database to Oracle Cloud Infrastructure by Creating a Backup in the Cloud](https://docs.cloud.oracle.com/Content/Database/Tasks/mig-onprembackup.htm) for more information.
    #
    # @param [String] backup_id The backup [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::CompleteExternalBackupJobDetails] complete_external_backup_job_details Updates the status of the backup resource.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::ExternalBackupJob ExternalBackupJob}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/complete_external_backup_job.rb.html) to see an example of how to use complete_external_backup_job API.
    def complete_external_backup_job(backup_id, complete_external_backup_job_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#complete_external_backup_job.' if logger

      raise "Missing the required parameter 'backup_id' when calling complete_external_backup_job." if backup_id.nil?
      raise "Missing the required parameter 'complete_external_backup_job_details' when calling complete_external_backup_job." if complete_external_backup_job_details.nil?
      raise "Parameter value for 'backup_id' must not be blank" if OCI::Internal::Util.blank_string?(backup_id)

      path = '/externalBackupJobs/{backupId}/actions/complete'.sub('{backupId}', backup_id.to_s)
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
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(complete_external_backup_job_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#complete_external_backup_job') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ExternalBackupJob'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates an Autonomous Container Database in the specified Autonomous Exadata Infrastructure.
    #
    # @param [OCI::Database::Models::CreateAutonomousContainerDatabaseDetails] create_autonomous_container_database_details Request to create an Autonomous Container Database in a specified Autonomous Exadata Infrastructure.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousContainerDatabase AutonomousContainerDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_autonomous_container_database.rb.html) to see an example of how to use create_autonomous_container_database API.
    def create_autonomous_container_database(create_autonomous_container_database_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_autonomous_container_database.' if logger

      raise "Missing the required parameter 'create_autonomous_container_database_details' when calling create_autonomous_container_database." if create_autonomous_container_database_details.nil?

      path = '/autonomousContainerDatabases'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_autonomous_container_database_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_autonomous_container_database') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousContainerDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new Autonomous Database.
    #
    # @param [OCI::Database::Models::CreateAutonomousDatabaseBase] create_autonomous_database_details Request to create a new Autonomous Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabase AutonomousDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_autonomous_database.rb.html) to see an example of how to use create_autonomous_database API.
    def create_autonomous_database(create_autonomous_database_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_autonomous_database.' if logger

      raise "Missing the required parameter 'create_autonomous_database_details' when calling create_autonomous_database." if create_autonomous_database_details.nil?

      path = '/autonomousDatabases'
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

      post_body = @api_client.object_to_http_body(create_autonomous_database_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_autonomous_database') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new Autonomous Database backup for the specified database based on the provided request parameters.
    #
    # @param [OCI::Database::Models::CreateAutonomousDatabaseBackupDetails] create_autonomous_database_backup_details Request to create a new Autonomous Database backup.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabaseBackup AutonomousDatabaseBackup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_autonomous_database_backup.rb.html) to see an example of how to use create_autonomous_database_backup API.
    def create_autonomous_database_backup(create_autonomous_database_backup_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_autonomous_database_backup.' if logger

      raise "Missing the required parameter 'create_autonomous_database_backup_details' when calling create_autonomous_database_backup." if create_autonomous_database_backup_details.nil?

      path = '/autonomousDatabaseBackups'
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

      post_body = @api_client.object_to_http_body(create_autonomous_database_backup_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_autonomous_database_backup') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabaseBackup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates an Autonomous VM cluster for Exadata Cloud@Customer.
    #
    # @param [OCI::Database::Models::CreateAutonomousVmClusterDetails] create_autonomous_vm_cluster_details Request to create an Autonomous VM cluster.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousVmCluster AutonomousVmCluster}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_autonomous_vm_cluster.rb.html) to see an example of how to use create_autonomous_vm_cluster API.
    def create_autonomous_vm_cluster(create_autonomous_vm_cluster_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_autonomous_vm_cluster.' if logger

      raise "Missing the required parameter 'create_autonomous_vm_cluster_details' when calling create_autonomous_vm_cluster." if create_autonomous_vm_cluster_details.nil?

      path = '/autonomousVmClusters'
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

      post_body = @api_client.object_to_http_body(create_autonomous_vm_cluster_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_autonomous_vm_cluster') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousVmCluster'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new backup in the specified database based on the request parameters you provide. If you previously used RMAN or dbcli to configure backups and then you switch to using the Console or the API for backups, a new backup configuration is created and associated with your database. This means that you can no longer rely on your previously configured unmanaged backups to work.
    #
    # @param [OCI::Database::Models::CreateBackupDetails] create_backup_details Request to create a new database backup.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::Backup Backup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_backup.rb.html) to see an example of how to use create_backup API.
    def create_backup(create_backup_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_backup.' if logger

      raise "Missing the required parameter 'create_backup_details' when calling create_backup." if create_backup_details.nil?

      path = '/backups'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_backup_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_backup') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::Backup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a backup destination in an Exadata Cloud@Customer system.
    #
    # @param [OCI::Database::Models::CreateBackupDestinationDetails] create_backup_destination_details Request to create a new backup destination.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::BackupDestination BackupDestination}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_backup_destination.rb.html) to see an example of how to use create_backup_destination API.
    def create_backup_destination(create_backup_destination_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_backup_destination.' if logger

      raise "Missing the required parameter 'create_backup_destination_details' when calling create_backup_destination." if create_backup_destination_details.nil?

      path = '/backupDestinations'
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

      post_body = @api_client.object_to_http_body(create_backup_destination_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_backup_destination') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::BackupDestination'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a cloud Exadata infrastructure resource. This resource is used to create an [Exadata Cloud Service](https://docs.cloud.oracle.com/Content/Database/Concepts/exaoverview.htm) instance.
    #
    # @param [OCI::Database::Models::CreateCloudExadataInfrastructureDetails] create_cloud_exadata_infrastructure_details Request to create a cloud Exadata infrastructure resource in an [Exadata Cloud Service](https://docs.cloud.oracle.com/Content/Database/Concepts/exaoverview.htm) instance.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::CloudExadataInfrastructure CloudExadataInfrastructure}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_cloud_exadata_infrastructure.rb.html) to see an example of how to use create_cloud_exadata_infrastructure API.
    def create_cloud_exadata_infrastructure(create_cloud_exadata_infrastructure_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_cloud_exadata_infrastructure.' if logger

      raise "Missing the required parameter 'create_cloud_exadata_infrastructure_details' when calling create_cloud_exadata_infrastructure." if create_cloud_exadata_infrastructure_details.nil?

      path = '/cloudExadataInfrastructures'
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

      post_body = @api_client.object_to_http_body(create_cloud_exadata_infrastructure_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_cloud_exadata_infrastructure') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::CloudExadataInfrastructure'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a cloud VM cluster.
    #
    # @param [OCI::Database::Models::CreateCloudVmClusterDetails] create_cloud_vm_cluster_details Request to create a cloud VM cluster. Applies to Exadata Cloud Service instances only. See [The New Exadata Cloud Service Resource Model](https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/exaflexsystem.htm#exaflexsystem_topic-resource_model) for information on this resource type.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::CloudVmCluster CloudVmCluster}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_cloud_vm_cluster.rb.html) to see an example of how to use create_cloud_vm_cluster API.
    def create_cloud_vm_cluster(create_cloud_vm_cluster_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_cloud_vm_cluster.' if logger

      raise "Missing the required parameter 'create_cloud_vm_cluster_details' when calling create_cloud_vm_cluster." if create_cloud_vm_cluster_details.nil?

      path = '/cloudVmClusters'
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

      post_body = @api_client.object_to_http_body(create_cloud_vm_cluster_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_cloud_vm_cluster') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::CloudVmCluster'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new console connection to the specified database node.
    # After the console connection has been created and is available,
    # you connect to the console using SSH.
    #
    # @param [OCI::Database::Models::CreateConsoleConnectionDetails] create_console_connection_details Request object for creating an CreateConsoleConnection
    # @param [String] db_node_id The database node [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::ConsoleConnection ConsoleConnection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_console_connection.rb.html) to see an example of how to use create_console_connection API.
    def create_console_connection(create_console_connection_details, db_node_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_console_connection.' if logger

      raise "Missing the required parameter 'create_console_connection_details' when calling create_console_connection." if create_console_connection_details.nil?
      raise "Missing the required parameter 'db_node_id' when calling create_console_connection." if db_node_id.nil?
      raise "Parameter value for 'db_node_id' must not be blank" if OCI::Internal::Util.blank_string?(db_node_id)

      path = '/dbNodes/{dbNodeId}/consoleConnections'.sub('{dbNodeId}', db_node_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_console_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_console_connection') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ConsoleConnection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new Data Guard association.  A Data Guard association represents the replication relationship between the
    # specified database and a peer database. For more information, see [Using Oracle Data Guard](https://docs.cloud.oracle.com/Content/Database/Tasks/usingdataguard.htm).
    #
    # All Oracle Cloud Infrastructure resources, including Data Guard associations, get an Oracle-assigned, unique ID
    # called an Oracle Cloud Identifier (OCID). When you create a resource, you can find its OCID in the response.
    # You can also retrieve a resource's OCID by using a List API operation on that resource type, or by viewing the
    # resource in the Console. For more information, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::CreateDataGuardAssociationDetails] create_data_guard_association_details A request to create a Data Guard association.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DataGuardAssociation DataGuardAssociation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_data_guard_association.rb.html) to see an example of how to use create_data_guard_association API.
    def create_data_guard_association(database_id, create_data_guard_association_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_data_guard_association.' if logger

      raise "Missing the required parameter 'database_id' when calling create_data_guard_association." if database_id.nil?
      raise "Missing the required parameter 'create_data_guard_association_details' when calling create_data_guard_association." if create_data_guard_association_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}/dataGuardAssociations'.sub('{databaseId}', database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_data_guard_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_data_guard_association') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DataGuardAssociation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new database in the specified Database Home. If the database version is provided, it must match the version of the Database Home. Applies to Exadata and Exadata Cloud@Customer systems.
    #
    # @param [OCI::Database::Models::CreateDatabaseBase] create_new_database_details Request to create a new database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::Database Database}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_database.rb.html) to see an example of how to use create_database API.
    def create_database(create_new_database_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_database.' if logger

      raise "Missing the required parameter 'create_new_database_details' when calling create_database." if create_new_database_details.nil?

      path = '/databases'
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

      post_body = @api_client.object_to_http_body(create_new_database_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_database') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::Database'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # create database software image in the specified compartment.
    #
    # @param [OCI::Database::Models::CreateDatabaseSoftwareImageDetails] create_database_software_image_details Request to create database software image.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DatabaseSoftwareImage DatabaseSoftwareImage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_database_software_image.rb.html) to see an example of how to use create_database_software_image API.
    def create_database_software_image(create_database_software_image_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_database_software_image.' if logger

      raise "Missing the required parameter 'create_database_software_image_details' when calling create_database_software_image." if create_database_software_image_details.nil?

      path = '/databaseSoftwareImages'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_database_software_image_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_database_software_image') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DatabaseSoftwareImage'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new Database Home in the specified database system based on the request parameters you provide. Applies to bare metal DB systems, Exadata systems, and Exadata Cloud@Customer systems.
    #
    # @param [OCI::Database::Models::CreateDbHomeBase] create_db_home_with_db_system_id_details Request to create a new Database Home.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbHome DbHome}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_db_home.rb.html) to see an example of how to use create_db_home API.
    def create_db_home(create_db_home_with_db_system_id_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_db_home.' if logger

      raise "Missing the required parameter 'create_db_home_with_db_system_id_details' when calling create_db_home." if create_db_home_with_db_system_id_details.nil?

      path = '/dbHomes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_db_home_with_db_system_id_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_db_home') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DbHome'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates an Exadata infrastructure resource. Applies to Exadata Cloud@Customer instances only.
    # To create an Exadata Cloud Service infrastructure resource, use the  {#create_cloud_exadata_infrastructure create_cloud_exadata_infrastructure} operation.
    #
    # @param [OCI::Database::Models::CreateExadataInfrastructureDetails] create_exadata_infrastructure_details Request to create Exadata Cloud@Customer infrastructure.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::ExadataInfrastructure ExadataInfrastructure}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_exadata_infrastructure.rb.html) to see an example of how to use create_exadata_infrastructure API.
    def create_exadata_infrastructure(create_exadata_infrastructure_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_exadata_infrastructure.' if logger

      raise "Missing the required parameter 'create_exadata_infrastructure_details' when calling create_exadata_infrastructure." if create_exadata_infrastructure_details.nil?

      path = '/exadataInfrastructures'
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

      post_body = @api_client.object_to_http_body(create_exadata_infrastructure_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_exadata_infrastructure') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ExadataInfrastructure'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new backup resource and returns the information the caller needs to back up an on-premises Oracle Database to Oracle Cloud Infrastructure.
    #
    # **Note:** This API is used by an Oracle Cloud Infrastructure Python script that is packaged with the Oracle Cloud Infrastructure CLI. Oracle recommends that you use the script instead using the API directly. See [Migrating an On-Premises Database to Oracle Cloud Infrastructure by Creating a Backup in the Cloud](https://docs.cloud.oracle.com/Content/Database/Tasks/mig-onprembackup.htm) for more information.
    #
    # @param [OCI::Database::Models::CreateExternalBackupJobDetails] create_external_backup_job_details Request to create a cloud backup resource for a database running outside the cloud.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::ExternalBackupJob ExternalBackupJob}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_external_backup_job.rb.html) to see an example of how to use create_external_backup_job API.
    def create_external_backup_job(create_external_backup_job_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_external_backup_job.' if logger

      raise "Missing the required parameter 'create_external_backup_job_details' when calling create_external_backup_job." if create_external_backup_job_details.nil?

      path = '/externalBackupJobs'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_external_backup_job_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_external_backup_job') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ExternalBackupJob'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a Key Store.
    #
    # @param [OCI::Database::Models::CreateKeyStoreDetails] create_key_store_details Request to create a new key store.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::KeyStore KeyStore}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_key_store.rb.html) to see an example of how to use create_key_store API.
    def create_key_store(create_key_store_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_key_store.' if logger

      raise "Missing the required parameter 'create_key_store_details' when calling create_key_store." if create_key_store_details.nil?

      path = '/keyStores'
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

      post_body = @api_client.object_to_http_body(create_key_store_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_key_store') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::KeyStore'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates an Exadata Cloud@Customer VM cluster.
    #
    # @param [OCI::Database::Models::CreateVmClusterDetails] create_vm_cluster_details Request to create a VM cluster. Applies to Exadata Cloud@Customer instances only.
    #   See {#create_cloud_vm_cluster_details create_cloud_vm_cluster_details} for details on creating a cloud VM cluster in an Exadata Cloud Service instance.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::VmCluster VmCluster}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_vm_cluster.rb.html) to see an example of how to use create_vm_cluster API.
    def create_vm_cluster(create_vm_cluster_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_vm_cluster.' if logger

      raise "Missing the required parameter 'create_vm_cluster_details' when calling create_vm_cluster." if create_vm_cluster_details.nil?

      path = '/vmClusters'
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

      post_body = @api_client.object_to_http_body(create_vm_cluster_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_vm_cluster') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::VmCluster'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates the VM cluster network. Applies to Exadata Cloud@Customer instances only.
    # To create a cloud VM cluster in an Exadata Cloud Service instance, use the {#create_cloud_vm_cluster create_cloud_vm_cluster} operation.
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::VmClusterNetworkDetails] vm_cluster_network_details Request to create the Cloud@Customer VM cluster network.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::VmClusterNetwork VmClusterNetwork}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/create_vm_cluster_network.rb.html) to see an example of how to use create_vm_cluster_network API.
    def create_vm_cluster_network(exadata_infrastructure_id, vm_cluster_network_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_vm_cluster_network.' if logger

      raise "Missing the required parameter 'exadata_infrastructure_id' when calling create_vm_cluster_network." if exadata_infrastructure_id.nil?
      raise "Missing the required parameter 'vm_cluster_network_details' when calling create_vm_cluster_network." if vm_cluster_network_details.nil?
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}/vmClusterNetworks'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s)
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

      post_body = @api_client.object_to_http_body(vm_cluster_network_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#create_vm_cluster_network') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::VmClusterNetwork'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Performs one of the following power actions on the specified DB node:
    # - start - power on
    # - stop - power off
    # - softreset - ACPI shutdown and power on
    # - reset - power off and power on
    #
    # **Note:** Stopping a node affects billing differently, depending on the type of DB system:
    # *Bare metal and Exadata systems* - The _stop_ state has no effect on the resources you consume.
    # Billing continues for DB nodes that you stop, and related resources continue
    # to apply against any relevant quotas. You must terminate the DB system
    # ({#terminate_db_system terminate_db_system})
    # to remove its resources from billing and quotas.
    # *Virtual machine DB systems* - Stopping a node stops billing for all OCPUs associated with that node, and billing resumes when you restart the node.
    #
    # @param [String] db_node_id The database node [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] action The action to perform on the DB Node.
    #   Allowed values are: STOP, START, SOFTRESET, RESET
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbNode DbNode}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/db_node_action.rb.html) to see an example of how to use db_node_action API.
    def db_node_action(db_node_id, action, opts = {})
      logger.debug 'Calling operation DatabaseClient#db_node_action.' if logger

      raise "Missing the required parameter 'db_node_id' when calling db_node_action." if db_node_id.nil?
      raise "Missing the required parameter 'action' when calling db_node_action." if action.nil?
      unless %w[STOP START SOFTRESET RESET].include?(action)
        raise "Invalid value for 'action', must be one of STOP, START, SOFTRESET, RESET."
      end
      raise "Parameter value for 'db_node_id' must not be blank" if OCI::Internal::Util.blank_string?(db_node_id)

      path = '/dbNodes/{dbNodeId}'.sub('{dbNodeId}', db_node_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:action] = action

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#db_node_action') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DbNode'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the specified Autonomous Database.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_autonomous_database.rb.html) to see an example of how to use delete_autonomous_database API.
    def delete_autonomous_database(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_autonomous_database.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling delete_autonomous_database." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_autonomous_database') do
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


    # Deletes the specified Autonomous VM cluster in an Exadata Cloud@Customer system.
    #
    # @param [String] autonomous_vm_cluster_id The autonomous VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_autonomous_vm_cluster.rb.html) to see an example of how to use delete_autonomous_vm_cluster API.
    def delete_autonomous_vm_cluster(autonomous_vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_autonomous_vm_cluster.' if logger

      raise "Missing the required parameter 'autonomous_vm_cluster_id' when calling delete_autonomous_vm_cluster." if autonomous_vm_cluster_id.nil?
      raise "Parameter value for 'autonomous_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_vm_cluster_id)

      path = '/autonomousVmClusters/{autonomousVmClusterId}'.sub('{autonomousVmClusterId}', autonomous_vm_cluster_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_autonomous_vm_cluster') do
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


    # Deletes a full backup. You cannot delete automatic backups using this API.
    # @param [String] backup_id The backup [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_backup.rb.html) to see an example of how to use delete_backup API.
    def delete_backup(backup_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_backup.' if logger

      raise "Missing the required parameter 'backup_id' when calling delete_backup." if backup_id.nil?
      raise "Parameter value for 'backup_id' must not be blank" if OCI::Internal::Util.blank_string?(backup_id)

      path = '/backups/{backupId}'.sub('{backupId}', backup_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_backup') do
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


    # Deletes a backup destination in an Exadata Cloud@Customer system.
    #
    # @param [String] backup_destination_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup destination.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_backup_destination.rb.html) to see an example of how to use delete_backup_destination API.
    def delete_backup_destination(backup_destination_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_backup_destination.' if logger

      raise "Missing the required parameter 'backup_destination_id' when calling delete_backup_destination." if backup_destination_id.nil?
      raise "Parameter value for 'backup_destination_id' must not be blank" if OCI::Internal::Util.blank_string?(backup_destination_id)

      path = '/backupDestinations/{backupDestinationId}'.sub('{backupDestinationId}', backup_destination_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_backup_destination') do
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


    # Deletes the cloud Exadata infrastructure resource. Applies to Exadata Cloud Service instances only.
    #
    # @param [String] cloud_exadata_infrastructure_id The cloud Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [BOOLEAN] :is_delete_vm_clusters If `true`, forces the deletion the specified cloud Exadata infrastructure resource as well as all associated VM clusters. If `false`, the cloud Exadata infrastructure resource can be deleted only if it has no associated VM clusters. Default value is `false`.
    #    (default to false)
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_cloud_exadata_infrastructure.rb.html) to see an example of how to use delete_cloud_exadata_infrastructure API.
    def delete_cloud_exadata_infrastructure(cloud_exadata_infrastructure_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_cloud_exadata_infrastructure.' if logger

      raise "Missing the required parameter 'cloud_exadata_infrastructure_id' when calling delete_cloud_exadata_infrastructure." if cloud_exadata_infrastructure_id.nil?
      raise "Parameter value for 'cloud_exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_exadata_infrastructure_id)

      path = '/cloudExadataInfrastructures/{cloudExadataInfrastructureId}'.sub('{cloudExadataInfrastructureId}', cloud_exadata_infrastructure_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isDeleteVmClusters] = opts[:is_delete_vm_clusters] if !opts[:is_delete_vm_clusters].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_cloud_exadata_infrastructure') do
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


    # Deletes the specified cloud VM cluster. Applies to Exadata Cloud Service instances only.
    #
    # @param [String] cloud_vm_cluster_id The cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_cloud_vm_cluster.rb.html) to see an example of how to use delete_cloud_vm_cluster API.
    def delete_cloud_vm_cluster(cloud_vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_cloud_vm_cluster.' if logger

      raise "Missing the required parameter 'cloud_vm_cluster_id' when calling delete_cloud_vm_cluster." if cloud_vm_cluster_id.nil?
      raise "Parameter value for 'cloud_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_vm_cluster_id)

      path = '/cloudVmClusters/{cloudVmClusterId}'.sub('{cloudVmClusterId}', cloud_vm_cluster_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_cloud_vm_cluster') do
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


    # Deletes the specified database node console connection.
    # @param [String] db_node_id The database node [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] console_connection_id The OCID of the console connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_console_connection.rb.html) to see an example of how to use delete_console_connection API.
    def delete_console_connection(db_node_id, console_connection_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_console_connection.' if logger

      raise "Missing the required parameter 'db_node_id' when calling delete_console_connection." if db_node_id.nil?
      raise "Missing the required parameter 'console_connection_id' when calling delete_console_connection." if console_connection_id.nil?
      raise "Parameter value for 'db_node_id' must not be blank" if OCI::Internal::Util.blank_string?(db_node_id)
      raise "Parameter value for 'console_connection_id' must not be blank" if OCI::Internal::Util.blank_string?(console_connection_id)

      path = '/dbNodes/{dbNodeId}/consoleConnections/{consoleConnectionId}'.sub('{dbNodeId}', db_node_id.to_s).sub('{consoleConnectionId}', console_connection_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_console_connection') do
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


    # Deletes the specified database. Applies only to Exadata systems.
    #
    # The data in this database is local to the Exadata system and will be lost when the database is deleted. Oracle recommends that you back up any data in the Exadata system prior to deleting it. You can use the `performFinalBackup` parameter to have the Exadata system database backed up before it is deleted.
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [BOOLEAN] :perform_final_backup Whether to perform a final backup of the database or not. Default is false.
    #
    #   If you previously used RMAN or dbcli to configure backups and then you switch to using the Console or the API for backups, a new backup configuration is created and associated with your database. This means that you can no longer rely on your previously configured unmanaged backups to work.
    #
    #   This parameter is used in multiple APIs. Refer to the API description for details on how the operation uses it.
    #    (default to false)
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_database.rb.html) to see an example of how to use delete_database API.
    def delete_database(database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_database.' if logger

      raise "Missing the required parameter 'database_id' when calling delete_database." if database_id.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}'.sub('{databaseId}', database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:performFinalBackup] = opts[:perform_final_backup] if !opts[:perform_final_backup].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_database') do
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


    # Delete a database software image
    # @param [String] database_software_image_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_database_software_image.rb.html) to see an example of how to use delete_database_software_image API.
    def delete_database_software_image(database_software_image_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_database_software_image.' if logger

      raise "Missing the required parameter 'database_software_image_id' when calling delete_database_software_image." if database_software_image_id.nil?
      raise "Parameter value for 'database_software_image_id' must not be blank" if OCI::Internal::Util.blank_string?(database_software_image_id)

      path = '/databaseSoftwareImages/{databaseSoftwareImageId}'.sub('{databaseSoftwareImageId}', database_software_image_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_database_software_image') do
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


    # Deletes a Database Home. Applies to bare metal DB systems, Exadata Cloud Service, and Exadata Cloud@Customer systems.
    #
    # Oracle recommends that you use the `performFinalBackup` parameter to back up any data on a bare metal DB system before you delete a Database Home. On an Exadata Cloud@Customer system or an Exadata Cloud Service system, you can delete a Database Home only when there are no databases in it and therefore you cannot use the `performFinalBackup` parameter to back up data.
    #
    # @param [String] db_home_id The Database Home [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [BOOLEAN] :perform_final_backup Whether to perform a final backup of the database or not. Default is false.
    #
    #   If you previously used RMAN or dbcli to configure backups and then you switch to using the Console or the API for backups, a new backup configuration is created and associated with your database. This means that you can no longer rely on your previously configured unmanaged backups to work.
    #
    #   This parameter is used in multiple APIs. Refer to the API description for details on how the operation uses it.
    #    (default to false)
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_db_home.rb.html) to see an example of how to use delete_db_home API.
    def delete_db_home(db_home_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_db_home.' if logger

      raise "Missing the required parameter 'db_home_id' when calling delete_db_home." if db_home_id.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)

      path = '/dbHomes/{dbHomeId}'.sub('{dbHomeId}', db_home_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:performFinalBackup] = opts[:perform_final_backup] if !opts[:perform_final_backup].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_db_home') do
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


    # Deletes the Exadata Cloud@Customer infrastructure.
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_exadata_infrastructure.rb.html) to see an example of how to use delete_exadata_infrastructure API.
    def delete_exadata_infrastructure(exadata_infrastructure_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_exadata_infrastructure.' if logger

      raise "Missing the required parameter 'exadata_infrastructure_id' when calling delete_exadata_infrastructure." if exadata_infrastructure_id.nil?
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_exadata_infrastructure') do
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


    # Deletes a key store.
    #
    # @param [String] key_store_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the key store.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_key_store.rb.html) to see an example of how to use delete_key_store API.
    def delete_key_store(key_store_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_key_store.' if logger

      raise "Missing the required parameter 'key_store_id' when calling delete_key_store." if key_store_id.nil?
      raise "Parameter value for 'key_store_id' must not be blank" if OCI::Internal::Util.blank_string?(key_store_id)

      path = '/keyStores/{keyStoreId}'.sub('{keyStoreId}', key_store_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_key_store') do
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


    # Deletes the specified VM cluster. Applies to Exadata Cloud@Customer instances only.
    #
    # @param [String] vm_cluster_id The VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_vm_cluster.rb.html) to see an example of how to use delete_vm_cluster API.
    def delete_vm_cluster(vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_vm_cluster.' if logger

      raise "Missing the required parameter 'vm_cluster_id' when calling delete_vm_cluster." if vm_cluster_id.nil?
      raise "Parameter value for 'vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(vm_cluster_id)

      path = '/vmClusters/{vmClusterId}'.sub('{vmClusterId}', vm_cluster_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_vm_cluster') do
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


    # Deletes the specified VM cluster network. Applies to Exadata Cloud@Customer instances only.
    # To delete a cloud VM cluster in an Exadata Cloud Service instance, use the {#delete_cloud_vm_cluster delete_cloud_vm_cluster} operation.
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] vm_cluster_network_id The VM cluster network [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/delete_vm_cluster_network.rb.html) to see an example of how to use delete_vm_cluster_network API.
    def delete_vm_cluster_network(exadata_infrastructure_id, vm_cluster_network_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_vm_cluster_network.' if logger

      raise "Missing the required parameter 'exadata_infrastructure_id' when calling delete_vm_cluster_network." if exadata_infrastructure_id.nil?
      raise "Missing the required parameter 'vm_cluster_network_id' when calling delete_vm_cluster_network." if vm_cluster_network_id.nil?
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)
      raise "Parameter value for 'vm_cluster_network_id' must not be blank" if OCI::Internal::Util.blank_string?(vm_cluster_network_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}/vmClusterNetworks/{vmClusterNetworkId}'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s).sub('{vmClusterNetworkId}', vm_cluster_network_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#delete_vm_cluster_network') do
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


    # Asynchronously deregisters this Autonomous Database with Data Safe.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [OCI::Database::Models::DeregisterAutonomousDatabaseDataSafeDetails] :deregister_autonomous_database_data_safe_details Details for deregistering an Autonomous Database with Data Safe.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/deregister_autonomous_database_data_safe.rb.html) to see an example of how to use deregister_autonomous_database_data_safe API.
    def deregister_autonomous_database_data_safe(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#deregister_autonomous_database_data_safe.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling deregister_autonomous_database_data_safe." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/deregisterDataSafe'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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

      post_body = @api_client.object_to_http_body(opts[:deregister_autonomous_database_data_safe_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#deregister_autonomous_database_data_safe') do
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


    # Disables Operations Insights for the Autonomous Database resource.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/disable_autonomous_database_operations_insights.rb.html) to see an example of how to use disable_autonomous_database_operations_insights API.
    def disable_autonomous_database_operations_insights(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#disable_autonomous_database_operations_insights.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling disable_autonomous_database_operations_insights." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/disableOperationsInsights'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#disable_autonomous_database_operations_insights') do
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


    # Downloads the configuration file for the specified Exadata Cloud@Customer infrastructure.
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/download_exadata_infrastructure_config_file.rb.html) to see an example of how to use download_exadata_infrastructure_config_file API.
    def download_exadata_infrastructure_config_file(exadata_infrastructure_id, opts = {}, &block)
      logger.debug 'Calling operation DatabaseClient#download_exadata_infrastructure_config_file.' if logger

      raise "Missing the required parameter 'exadata_infrastructure_id' when calling download_exadata_infrastructure_config_file." if exadata_infrastructure_id.nil?
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}/actions/downloadConfigFile'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#download_exadata_infrastructure_config_file') do
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


    # Downloads the configuration file for the specified VM cluster network. Applies to Exadata Cloud@Customer instances only.
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] vm_cluster_network_id The VM cluster network [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/download_vm_cluster_network_config_file.rb.html) to see an example of how to use download_vm_cluster_network_config_file API.
    def download_vm_cluster_network_config_file(exadata_infrastructure_id, vm_cluster_network_id, opts = {}, &block)
      logger.debug 'Calling operation DatabaseClient#download_vm_cluster_network_config_file.' if logger

      raise "Missing the required parameter 'exadata_infrastructure_id' when calling download_vm_cluster_network_config_file." if exadata_infrastructure_id.nil?
      raise "Missing the required parameter 'vm_cluster_network_id' when calling download_vm_cluster_network_config_file." if vm_cluster_network_id.nil?
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)
      raise "Parameter value for 'vm_cluster_network_id' must not be blank" if OCI::Internal::Util.blank_string?(vm_cluster_network_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}/vmClusterNetworks/{vmClusterNetworkId}/actions/downloadConfigFile'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s).sub('{vmClusterNetworkId}', vm_cluster_network_id.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#download_vm_cluster_network_config_file') do
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


    # Enables the specified Autonomous Database with Operations Insights.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/enable_autonomous_database_operations_insights.rb.html) to see an example of how to use enable_autonomous_database_operations_insights API.
    def enable_autonomous_database_operations_insights(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#enable_autonomous_database_operations_insights.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling enable_autonomous_database_operations_insights." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/enableOperationsInsights'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#enable_autonomous_database_operations_insights') do
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


    # Initiates a failover the specified Autonomous Database to a standby.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabase AutonomousDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/fail_over_autonomous_database.rb.html) to see an example of how to use fail_over_autonomous_database API.
    def fail_over_autonomous_database(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#fail_over_autonomous_database.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling fail_over_autonomous_database." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/failover'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#fail_over_autonomous_database') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Fails over the standby Autonomous Container Database identified by the autonomousContainerDatabaseId parameter to the primary Autonomous Container Database after the existing primary Autonomous Container Database fails or becomes unreachable.
    #
    # A failover can result in data loss, depending on the protection mode in effect at the time the primary Autonomous Container Database fails.
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] autonomous_container_database_dataguard_association_id The Autonomous Container Database-Autonomous Data Guard association [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation AutonomousContainerDatabaseDataguardAssociation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/failover_autonomous_container_database_dataguard_association.rb.html) to see an example of how to use failover_autonomous_container_database_dataguard_association API.
    def failover_autonomous_container_database_dataguard_association(autonomous_container_database_id, autonomous_container_database_dataguard_association_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#failover_autonomous_container_database_dataguard_association.' if logger

      raise "Missing the required parameter 'autonomous_container_database_id' when calling failover_autonomous_container_database_dataguard_association." if autonomous_container_database_id.nil?
      raise "Missing the required parameter 'autonomous_container_database_dataguard_association_id' when calling failover_autonomous_container_database_dataguard_association." if autonomous_container_database_dataguard_association_id.nil?
      raise "Parameter value for 'autonomous_container_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_id)
      raise "Parameter value for 'autonomous_container_database_dataguard_association_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_dataguard_association_id)

      path = '/autonomousContainerDatabases/{autonomousContainerDatabaseId}/autonomousContainerDatabaseDataguardAssociations/{autonomousContainerDatabaseDataguardAssociationId}/actions/failover'.sub('{autonomousContainerDatabaseId}', autonomous_container_database_id.to_s).sub('{autonomousContainerDatabaseDataguardAssociationId}', autonomous_container_database_dataguard_association_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#failover_autonomous_container_database_dataguard_association') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Performs a failover to transition the standby database identified by the `databaseId` parameter into the
    # specified Data Guard association's primary role after the existing primary database fails or becomes unreachable.
    #
    # A failover might result in data loss depending on the protection mode in effect at the time of the primary
    # database failure.
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] data_guard_association_id The Data Guard association's [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::FailoverDataGuardAssociationDetails] failover_data_guard_association_details A request to perform a failover, transitioning a standby database into a primary database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DataGuardAssociation DataGuardAssociation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/failover_data_guard_association.rb.html) to see an example of how to use failover_data_guard_association API.
    def failover_data_guard_association(database_id, data_guard_association_id, failover_data_guard_association_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#failover_data_guard_association.' if logger

      raise "Missing the required parameter 'database_id' when calling failover_data_guard_association." if database_id.nil?
      raise "Missing the required parameter 'data_guard_association_id' when calling failover_data_guard_association." if data_guard_association_id.nil?
      raise "Missing the required parameter 'failover_data_guard_association_details' when calling failover_data_guard_association." if failover_data_guard_association_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)
      raise "Parameter value for 'data_guard_association_id' must not be blank" if OCI::Internal::Util.blank_string?(data_guard_association_id)

      path = '/databases/{databaseId}/dataGuardAssociations/{dataGuardAssociationId}/actions/failover'.sub('{databaseId}', database_id.to_s).sub('{dataGuardAssociationId}', data_guard_association_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(failover_data_guard_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#failover_data_guard_association') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DataGuardAssociation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates and downloads a wallet for the specified Autonomous Database.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::GenerateAutonomousDatabaseWalletDetails] generate_autonomous_database_wallet_details Request to create a new Autonomous Database wallet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/generate_autonomous_database_wallet.rb.html) to see an example of how to use generate_autonomous_database_wallet API.
    def generate_autonomous_database_wallet(autonomous_database_id, generate_autonomous_database_wallet_details, opts = {}, &block)
      logger.debug 'Calling operation DatabaseClient#generate_autonomous_database_wallet.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling generate_autonomous_database_wallet." if autonomous_database_id.nil?
      raise "Missing the required parameter 'generate_autonomous_database_wallet_details' when calling generate_autonomous_database_wallet." if generate_autonomous_database_wallet_details.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/generateWallet'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(generate_autonomous_database_wallet_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#generate_autonomous_database_wallet') do
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


    # Generates a recommended Cloud@Customer VM cluster network configuration.
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::GenerateRecommendedNetworkDetails] generate_recommended_network_details Request to generate a recommended Cloud@Customer VM cluster network configuration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::VmClusterNetworkDetails VmClusterNetworkDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/generate_recommended_vm_cluster_network.rb.html) to see an example of how to use generate_recommended_vm_cluster_network API.
    def generate_recommended_vm_cluster_network(exadata_infrastructure_id, generate_recommended_network_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#generate_recommended_vm_cluster_network.' if logger

      raise "Missing the required parameter 'exadata_infrastructure_id' when calling generate_recommended_vm_cluster_network." if exadata_infrastructure_id.nil?
      raise "Missing the required parameter 'generate_recommended_network_details' when calling generate_recommended_vm_cluster_network." if generate_recommended_network_details.nil?
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}/vmClusterNetworks/actions/generateRecommendedNetwork'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s)
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

      post_body = @api_client.object_to_http_body(generate_recommended_network_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#generate_recommended_vm_cluster_network') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::VmClusterNetworkDetails'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about the specified Autonomous Container Database.
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousContainerDatabase AutonomousContainerDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_autonomous_container_database.rb.html) to see an example of how to use get_autonomous_container_database API.
    def get_autonomous_container_database(autonomous_container_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_autonomous_container_database.' if logger

      raise "Missing the required parameter 'autonomous_container_database_id' when calling get_autonomous_container_database." if autonomous_container_database_id.nil?
      raise "Parameter value for 'autonomous_container_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_id)

      path = '/autonomousContainerDatabases/{autonomousContainerDatabaseId}'.sub('{autonomousContainerDatabaseId}', autonomous_container_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_autonomous_container_database') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousContainerDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets an Autonomous Container Database enabled with Autonomous Data Guard associated with the specified Autonomous Container Database.
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] autonomous_container_database_dataguard_association_id The Autonomous Container Database-Autonomous Data Guard association [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation AutonomousContainerDatabaseDataguardAssociation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_autonomous_container_database_dataguard_association.rb.html) to see an example of how to use get_autonomous_container_database_dataguard_association API.
    def get_autonomous_container_database_dataguard_association(autonomous_container_database_id, autonomous_container_database_dataguard_association_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_autonomous_container_database_dataguard_association.' if logger

      raise "Missing the required parameter 'autonomous_container_database_id' when calling get_autonomous_container_database_dataguard_association." if autonomous_container_database_id.nil?
      raise "Missing the required parameter 'autonomous_container_database_dataguard_association_id' when calling get_autonomous_container_database_dataguard_association." if autonomous_container_database_dataguard_association_id.nil?
      raise "Parameter value for 'autonomous_container_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_id)
      raise "Parameter value for 'autonomous_container_database_dataguard_association_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_dataguard_association_id)

      path = '/autonomousContainerDatabases/{autonomousContainerDatabaseId}/autonomousContainerDatabaseDataguardAssociations/{autonomousContainerDatabaseDataguardAssociationId}'.sub('{autonomousContainerDatabaseId}', autonomous_container_database_id.to_s).sub('{autonomousContainerDatabaseDataguardAssociationId}', autonomous_container_database_dataguard_association_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_autonomous_container_database_dataguard_association') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the specified Autonomous Database.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabase AutonomousDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_autonomous_database.rb.html) to see an example of how to use get_autonomous_database API.
    def get_autonomous_database(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_autonomous_database.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling get_autonomous_database." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_autonomous_database') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified Autonomous Database backup.
    # @param [String] autonomous_database_backup_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Autonomous Database backup.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabaseBackup AutonomousDatabaseBackup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_autonomous_database_backup.rb.html) to see an example of how to use get_autonomous_database_backup API.
    def get_autonomous_database_backup(autonomous_database_backup_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_autonomous_database_backup.' if logger

      raise "Missing the required parameter 'autonomous_database_backup_id' when calling get_autonomous_database_backup." if autonomous_database_backup_id.nil?
      raise "Parameter value for 'autonomous_database_backup_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_backup_id)

      path = '/autonomousDatabaseBackups/{autonomousDatabaseBackupId}'.sub('{autonomousDatabaseBackupId}', autonomous_database_backup_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_autonomous_database_backup') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabaseBackup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets an Autonomous Data Guard-enabled database associated with the specified Autonomous Database.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] autonomous_database_dataguard_association_id The Autonomous Container Database-Autonomous Data Guard association [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabaseDataguardAssociation AutonomousDatabaseDataguardAssociation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_autonomous_database_dataguard_association.rb.html) to see an example of how to use get_autonomous_database_dataguard_association API.
    def get_autonomous_database_dataguard_association(autonomous_database_id, autonomous_database_dataguard_association_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_autonomous_database_dataguard_association.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling get_autonomous_database_dataguard_association." if autonomous_database_id.nil?
      raise "Missing the required parameter 'autonomous_database_dataguard_association_id' when calling get_autonomous_database_dataguard_association." if autonomous_database_dataguard_association_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)
      raise "Parameter value for 'autonomous_database_dataguard_association_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_dataguard_association_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/autonomousDatabaseDataguardAssociations/{autonomousDatabaseDataguardAssociationId}'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s).sub('{autonomousDatabaseDataguardAssociationId}', autonomous_database_dataguard_association_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_autonomous_database_dataguard_association') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabaseDataguardAssociation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the Autonomous Database regional wallet details.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabaseWallet AutonomousDatabaseWallet}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_autonomous_database_regional_wallet.rb.html) to see an example of how to use get_autonomous_database_regional_wallet API.
    def get_autonomous_database_regional_wallet(opts = {})
      logger.debug 'Calling operation DatabaseClient#get_autonomous_database_regional_wallet.' if logger


      path = '/autonomousDatabases/wallet'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_autonomous_database_regional_wallet') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabaseWallet'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the wallet details for the specified Autonomous Database.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabaseWallet AutonomousDatabaseWallet}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_autonomous_database_wallet.rb.html) to see an example of how to use get_autonomous_database_wallet API.
    def get_autonomous_database_wallet(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_autonomous_database_wallet.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling get_autonomous_database_wallet." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/wallet'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_autonomous_database_wallet') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabaseWallet'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about the specified Autonomous Exadata Infrastructure resource.
    # @param [String] autonomous_exadata_infrastructure_id The Autonomous Exadata Infrastructure  [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousExadataInfrastructure AutonomousExadataInfrastructure}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_autonomous_exadata_infrastructure.rb.html) to see an example of how to use get_autonomous_exadata_infrastructure API.
    def get_autonomous_exadata_infrastructure(autonomous_exadata_infrastructure_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_autonomous_exadata_infrastructure.' if logger

      raise "Missing the required parameter 'autonomous_exadata_infrastructure_id' when calling get_autonomous_exadata_infrastructure." if autonomous_exadata_infrastructure_id.nil?
      raise "Parameter value for 'autonomous_exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_exadata_infrastructure_id)

      path = '/autonomousExadataInfrastructures/{autonomousExadataInfrastructureId}'.sub('{autonomousExadataInfrastructureId}', autonomous_exadata_infrastructure_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_autonomous_exadata_infrastructure') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousExadataInfrastructure'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about a specific autonomous patch.
    # @param [String] autonomous_patch_id The autonomous patch [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousPatch AutonomousPatch}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_autonomous_patch.rb.html) to see an example of how to use get_autonomous_patch API.
    def get_autonomous_patch(autonomous_patch_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_autonomous_patch.' if logger

      raise "Missing the required parameter 'autonomous_patch_id' when calling get_autonomous_patch." if autonomous_patch_id.nil?
      raise "Parameter value for 'autonomous_patch_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_patch_id)

      path = '/autonomousPatches/{autonomousPatchId}'.sub('{autonomousPatchId}', autonomous_patch_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_autonomous_patch') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousPatch'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified Autonomous VM cluster for an Exadata Cloud@Customer system.
    # @param [String] autonomous_vm_cluster_id The autonomous VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousVmCluster AutonomousVmCluster}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_autonomous_vm_cluster.rb.html) to see an example of how to use get_autonomous_vm_cluster API.
    def get_autonomous_vm_cluster(autonomous_vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_autonomous_vm_cluster.' if logger

      raise "Missing the required parameter 'autonomous_vm_cluster_id' when calling get_autonomous_vm_cluster." if autonomous_vm_cluster_id.nil?
      raise "Parameter value for 'autonomous_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_vm_cluster_id)

      path = '/autonomousVmClusters/{autonomousVmClusterId}'.sub('{autonomousVmClusterId}', autonomous_vm_cluster_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_autonomous_vm_cluster') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousVmCluster'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about the specified backup.
    # @param [String] backup_id The backup [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::Backup Backup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_backup.rb.html) to see an example of how to use get_backup API.
    def get_backup(backup_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_backup.' if logger

      raise "Missing the required parameter 'backup_id' when calling get_backup." if backup_id.nil?
      raise "Parameter value for 'backup_id' must not be blank" if OCI::Internal::Util.blank_string?(backup_id)

      path = '/backups/{backupId}'.sub('{backupId}', backup_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_backup') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::Backup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified backup destination in an Exadata Cloud@Customer system.
    #
    # @param [String] backup_destination_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup destination.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::BackupDestination BackupDestination}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_backup_destination.rb.html) to see an example of how to use get_backup_destination API.
    def get_backup_destination(backup_destination_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_backup_destination.' if logger

      raise "Missing the required parameter 'backup_destination_id' when calling get_backup_destination." if backup_destination_id.nil?
      raise "Parameter value for 'backup_destination_id' must not be blank" if OCI::Internal::Util.blank_string?(backup_destination_id)

      path = '/backupDestinations/{backupDestinationId}'.sub('{backupDestinationId}', backup_destination_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_backup_destination') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::BackupDestination'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified cloud Exadata infrastructure resource. Applies to Exadata Cloud Service instances only.
    #
    # @param [String] cloud_exadata_infrastructure_id The cloud Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::CloudExadataInfrastructure CloudExadataInfrastructure}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_cloud_exadata_infrastructure.rb.html) to see an example of how to use get_cloud_exadata_infrastructure API.
    def get_cloud_exadata_infrastructure(cloud_exadata_infrastructure_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_cloud_exadata_infrastructure.' if logger

      raise "Missing the required parameter 'cloud_exadata_infrastructure_id' when calling get_cloud_exadata_infrastructure." if cloud_exadata_infrastructure_id.nil?
      raise "Parameter value for 'cloud_exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_exadata_infrastructure_id)

      path = '/cloudExadataInfrastructures/{cloudExadataInfrastructureId}'.sub('{cloudExadataInfrastructureId}', cloud_exadata_infrastructure_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_cloud_exadata_infrastructure') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::CloudExadataInfrastructure'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified cloud VM cluster. Applies to Exadata Cloud Service instances only.
    #
    # @param [String] cloud_vm_cluster_id The cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::CloudVmCluster CloudVmCluster}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_cloud_vm_cluster.rb.html) to see an example of how to use get_cloud_vm_cluster API.
    def get_cloud_vm_cluster(cloud_vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_cloud_vm_cluster.' if logger

      raise "Missing the required parameter 'cloud_vm_cluster_id' when calling get_cloud_vm_cluster." if cloud_vm_cluster_id.nil?
      raise "Parameter value for 'cloud_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_vm_cluster_id)

      path = '/cloudVmClusters/{cloudVmClusterId}'.sub('{cloudVmClusterId}', cloud_vm_cluster_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_cloud_vm_cluster') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::CloudVmCluster'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the IORM configuration for the specified cloud VM cluster in an Exadata Cloud Service instance.
    # If you have not specified an IORM configuration, the default configuration is returned.
    #
    # @param [String] cloud_vm_cluster_id The cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::ExadataIormConfig ExadataIormConfig}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_cloud_vm_cluster_iorm_config.rb.html) to see an example of how to use get_cloud_vm_cluster_iorm_config API.
    def get_cloud_vm_cluster_iorm_config(cloud_vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_cloud_vm_cluster_iorm_config.' if logger

      raise "Missing the required parameter 'cloud_vm_cluster_id' when calling get_cloud_vm_cluster_iorm_config." if cloud_vm_cluster_id.nil?
      raise "Parameter value for 'cloud_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_vm_cluster_id)

      path = '/cloudVmClusters/{cloudVmClusterId}/CloudVmClusterIormConfig'.sub('{cloudVmClusterId}', cloud_vm_cluster_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_cloud_vm_cluster_iorm_config') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ExadataIormConfig'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about a specified maintenance update package for a cloud VM cluster. Applies to Exadata Cloud Service instances only.
    #
    # @param [String] cloud_vm_cluster_id The cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] update_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the maintenance update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::Update Update}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_cloud_vm_cluster_update.rb.html) to see an example of how to use get_cloud_vm_cluster_update API.
    def get_cloud_vm_cluster_update(cloud_vm_cluster_id, update_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_cloud_vm_cluster_update.' if logger

      raise "Missing the required parameter 'cloud_vm_cluster_id' when calling get_cloud_vm_cluster_update." if cloud_vm_cluster_id.nil?
      raise "Missing the required parameter 'update_id' when calling get_cloud_vm_cluster_update." if update_id.nil?
      raise "Parameter value for 'cloud_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_vm_cluster_id)
      raise "Parameter value for 'update_id' must not be blank" if OCI::Internal::Util.blank_string?(update_id)

      path = '/cloudVmClusters/{cloudVmClusterId}/updates/{updateId}'.sub('{cloudVmClusterId}', cloud_vm_cluster_id.to_s).sub('{updateId}', update_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_cloud_vm_cluster_update') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::Update'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the maintenance update history details for the specified update history entry. Applies to Exadata Cloud Service instances only.
    #
    # @param [String] cloud_vm_cluster_id The cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] update_history_entry_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the maintenance update history entry.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::UpdateHistoryEntry UpdateHistoryEntry}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_cloud_vm_cluster_update_history_entry.rb.html) to see an example of how to use get_cloud_vm_cluster_update_history_entry API.
    def get_cloud_vm_cluster_update_history_entry(cloud_vm_cluster_id, update_history_entry_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_cloud_vm_cluster_update_history_entry.' if logger

      raise "Missing the required parameter 'cloud_vm_cluster_id' when calling get_cloud_vm_cluster_update_history_entry." if cloud_vm_cluster_id.nil?
      raise "Missing the required parameter 'update_history_entry_id' when calling get_cloud_vm_cluster_update_history_entry." if update_history_entry_id.nil?
      raise "Parameter value for 'cloud_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_vm_cluster_id)
      raise "Parameter value for 'update_history_entry_id' must not be blank" if OCI::Internal::Util.blank_string?(update_history_entry_id)

      path = '/cloudVmClusters/{cloudVmClusterId}/updateHistoryEntries/{updateHistoryEntryId}'.sub('{cloudVmClusterId}', cloud_vm_cluster_id.to_s).sub('{updateHistoryEntryId}', update_history_entry_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_cloud_vm_cluster_update_history_entry') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::UpdateHistoryEntry'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified database node console connection's information.
    # @param [String] db_node_id The database node [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] console_connection_id The OCID of the console connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::ConsoleConnection ConsoleConnection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_console_connection.rb.html) to see an example of how to use get_console_connection API.
    def get_console_connection(db_node_id, console_connection_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_console_connection.' if logger

      raise "Missing the required parameter 'db_node_id' when calling get_console_connection." if db_node_id.nil?
      raise "Missing the required parameter 'console_connection_id' when calling get_console_connection." if console_connection_id.nil?
      raise "Parameter value for 'db_node_id' must not be blank" if OCI::Internal::Util.blank_string?(db_node_id)
      raise "Parameter value for 'console_connection_id' must not be blank" if OCI::Internal::Util.blank_string?(console_connection_id)

      path = '/dbNodes/{dbNodeId}/consoleConnections/{consoleConnectionId}'.sub('{dbNodeId}', db_node_id.to_s).sub('{consoleConnectionId}', console_connection_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_console_connection') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ConsoleConnection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified Data Guard association's configuration information.
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] data_guard_association_id The Data Guard association's [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::DataGuardAssociation DataGuardAssociation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_data_guard_association.rb.html) to see an example of how to use get_data_guard_association API.
    def get_data_guard_association(database_id, data_guard_association_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_data_guard_association.' if logger

      raise "Missing the required parameter 'database_id' when calling get_data_guard_association." if database_id.nil?
      raise "Missing the required parameter 'data_guard_association_id' when calling get_data_guard_association." if data_guard_association_id.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)
      raise "Parameter value for 'data_guard_association_id' must not be blank" if OCI::Internal::Util.blank_string?(data_guard_association_id)

      path = '/databases/{databaseId}/dataGuardAssociations/{dataGuardAssociationId}'.sub('{databaseId}', database_id.to_s).sub('{dataGuardAssociationId}', data_guard_association_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_data_guard_association') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DataGuardAssociation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about the specified database.
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::Database Database}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_database.rb.html) to see an example of how to use get_database API.
    def get_database(database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_database.' if logger

      raise "Missing the required parameter 'database_id' when calling get_database." if database_id.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}'.sub('{databaseId}', database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_database') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::Database'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about the specified database software image.
    # @param [String] database_software_image_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::DatabaseSoftwareImage DatabaseSoftwareImage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_database_software_image.rb.html) to see an example of how to use get_database_software_image API.
    def get_database_software_image(database_software_image_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_database_software_image.' if logger

      raise "Missing the required parameter 'database_software_image_id' when calling get_database_software_image." if database_software_image_id.nil?
      raise "Parameter value for 'database_software_image_id' must not be blank" if OCI::Internal::Util.blank_string?(database_software_image_id)

      path = '/databaseSoftwareImages/{databaseSoftwareImageId}'.sub('{databaseSoftwareImageId}', database_software_image_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_database_software_image') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DatabaseSoftwareImage'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # gets the upgrade history for a specified database.
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] upgrade_history_entry_id The database upgrade History [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DatabaseUpgradeHistoryEntry DatabaseUpgradeHistoryEntry}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_database_upgrade_history_entry.rb.html) to see an example of how to use get_database_upgrade_history_entry API.
    def get_database_upgrade_history_entry(database_id, upgrade_history_entry_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_database_upgrade_history_entry.' if logger

      raise "Missing the required parameter 'database_id' when calling get_database_upgrade_history_entry." if database_id.nil?
      raise "Missing the required parameter 'upgrade_history_entry_id' when calling get_database_upgrade_history_entry." if upgrade_history_entry_id.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)
      raise "Parameter value for 'upgrade_history_entry_id' must not be blank" if OCI::Internal::Util.blank_string?(upgrade_history_entry_id)

      path = '/databases/{databaseId}/upgradeHistoryEntries/{upgradeHistoryEntryId}'.sub('{databaseId}', database_id.to_s).sub('{upgradeHistoryEntryId}', upgrade_history_entry_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_database_upgrade_history_entry') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DatabaseUpgradeHistoryEntry'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about the specified Database Home.
    # @param [String] db_home_id The Database Home [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbHome DbHome}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_db_home.rb.html) to see an example of how to use get_db_home API.
    def get_db_home(db_home_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_home.' if logger

      raise "Missing the required parameter 'db_home_id' when calling get_db_home." if db_home_id.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)

      path = '/dbHomes/{dbHomeId}'.sub('{dbHomeId}', db_home_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_db_home') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DbHome'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about a specified patch package.
    #
    # @param [String] db_home_id The Database Home [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] patch_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the patch.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::Patch Patch}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_db_home_patch.rb.html) to see an example of how to use get_db_home_patch API.
    def get_db_home_patch(db_home_id, patch_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_home_patch.' if logger

      raise "Missing the required parameter 'db_home_id' when calling get_db_home_patch." if db_home_id.nil?
      raise "Missing the required parameter 'patch_id' when calling get_db_home_patch." if patch_id.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)
      raise "Parameter value for 'patch_id' must not be blank" if OCI::Internal::Util.blank_string?(patch_id)

      path = '/dbHomes/{dbHomeId}/patches/{patchId}'.sub('{dbHomeId}', db_home_id.to_s).sub('{patchId}', patch_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_db_home_patch') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::Patch'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the patch history details for the specified patchHistoryEntryId
    #
    # @param [String] db_home_id The Database Home [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] patch_history_entry_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the patch history entry.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::PatchHistoryEntry PatchHistoryEntry}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_db_home_patch_history_entry.rb.html) to see an example of how to use get_db_home_patch_history_entry API.
    def get_db_home_patch_history_entry(db_home_id, patch_history_entry_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_home_patch_history_entry.' if logger

      raise "Missing the required parameter 'db_home_id' when calling get_db_home_patch_history_entry." if db_home_id.nil?
      raise "Missing the required parameter 'patch_history_entry_id' when calling get_db_home_patch_history_entry." if patch_history_entry_id.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)
      raise "Parameter value for 'patch_history_entry_id' must not be blank" if OCI::Internal::Util.blank_string?(patch_history_entry_id)

      path = '/dbHomes/{dbHomeId}/patchHistoryEntries/{patchHistoryEntryId}'.sub('{dbHomeId}', db_home_id.to_s).sub('{patchHistoryEntryId}', patch_history_entry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_db_home_patch_history_entry') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::PatchHistoryEntry'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about the specified database node.
    # @param [String] db_node_id The database node [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbNode DbNode}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_db_node.rb.html) to see an example of how to use get_db_node API.
    def get_db_node(db_node_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_node.' if logger

      raise "Missing the required parameter 'db_node_id' when calling get_db_node." if db_node_id.nil?
      raise "Parameter value for 'db_node_id' must not be blank" if OCI::Internal::Util.blank_string?(db_node_id)

      path = '/dbNodes/{dbNodeId}'.sub('{dbNodeId}', db_node_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_db_node') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DbNode'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about the specified DB system.
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbSystem DbSystem}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_db_system.rb.html) to see an example of how to use get_db_system API.
    def get_db_system(db_system_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_system.' if logger

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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_db_system') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DbSystem'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information the specified patch.
    #
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] patch_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the patch.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::Patch Patch}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_db_system_patch.rb.html) to see an example of how to use get_db_system_patch API.
    def get_db_system_patch(db_system_id, patch_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_system_patch.' if logger

      raise "Missing the required parameter 'db_system_id' when calling get_db_system_patch." if db_system_id.nil?
      raise "Missing the required parameter 'patch_id' when calling get_db_system_patch." if patch_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)
      raise "Parameter value for 'patch_id' must not be blank" if OCI::Internal::Util.blank_string?(patch_id)

      path = '/dbSystems/{dbSystemId}/patches/{patchId}'.sub('{dbSystemId}', db_system_id.to_s).sub('{patchId}', patch_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_db_system_patch') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::Patch'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the details of the specified patch operation on the specified DB system.
    #
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] patch_history_entry_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the patch history entry.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::PatchHistoryEntry PatchHistoryEntry}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_db_system_patch_history_entry.rb.html) to see an example of how to use get_db_system_patch_history_entry API.
    def get_db_system_patch_history_entry(db_system_id, patch_history_entry_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_system_patch_history_entry.' if logger

      raise "Missing the required parameter 'db_system_id' when calling get_db_system_patch_history_entry." if db_system_id.nil?
      raise "Missing the required parameter 'patch_history_entry_id' when calling get_db_system_patch_history_entry." if patch_history_entry_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)
      raise "Parameter value for 'patch_history_entry_id' must not be blank" if OCI::Internal::Util.blank_string?(patch_history_entry_id)

      path = '/dbSystems/{dbSystemId}/patchHistoryEntries/{patchHistoryEntryId}'.sub('{dbSystemId}', db_system_id.to_s).sub('{patchHistoryEntryId}', patch_history_entry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_db_system_patch_history_entry') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::PatchHistoryEntry'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified Exadata infrastructure. Applies to Exadata Cloud@Customer instances only.
    # To get information on an Exadata Cloud Service infrastructure resource, use the  {#get_cloud_exadata_infrastructure get_cloud_exadata_infrastructure} operation.
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::ExadataInfrastructure ExadataInfrastructure}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_exadata_infrastructure.rb.html) to see an example of how to use get_exadata_infrastructure API.
    def get_exadata_infrastructure(exadata_infrastructure_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_exadata_infrastructure.' if logger

      raise "Missing the required parameter 'exadata_infrastructure_id' when calling get_exadata_infrastructure." if exadata_infrastructure_id.nil?
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_exadata_infrastructure') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ExadataInfrastructure'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets details of the available and consumed OCPUs for the specified Autonomous Exadata Infrastructure resource.
    #
    # @param [String] autonomous_exadata_infrastructure_id The Autonomous Exadata Infrastructure  [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::OCPUs OCPUs}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_exadata_infrastructure_ocpus.rb.html) to see an example of how to use get_exadata_infrastructure_ocpus API.
    def get_exadata_infrastructure_ocpus(autonomous_exadata_infrastructure_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_exadata_infrastructure_ocpus.' if logger

      raise "Missing the required parameter 'autonomous_exadata_infrastructure_id' when calling get_exadata_infrastructure_ocpus." if autonomous_exadata_infrastructure_id.nil?
      raise "Parameter value for 'autonomous_exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_exadata_infrastructure_id)

      path = '/autonomousExadataInfrastructures/{autonomousExadataInfrastructureId}/ocpus'.sub('{autonomousExadataInfrastructureId}', autonomous_exadata_infrastructure_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_exadata_infrastructure_ocpus') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::OCPUs'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the IORM configuration settings for the specified cloud Exadata system.
    # All Exadata service instances have default IORM settings.
    #
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::ExadataIormConfig ExadataIormConfig}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_exadata_iorm_config.rb.html) to see an example of how to use get_exadata_iorm_config API.
    def get_exadata_iorm_config(db_system_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_exadata_iorm_config.' if logger

      raise "Missing the required parameter 'db_system_id' when calling get_exadata_iorm_config." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/ExadataIormConfig'.sub('{dbSystemId}', db_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_exadata_iorm_config') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ExadataIormConfig'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about the specified external backup job.
    #
    # **Note:** This API is used by an Oracle Cloud Infrastructure Python script that is packaged with the Oracle Cloud Infrastructure CLI. Oracle recommends that you use the script instead using the API directly. See [Migrating an On-Premises Database to Oracle Cloud Infrastructure by Creating a Backup in the Cloud](https://docs.cloud.oracle.com/Content/Database/Tasks/mig-onprembackup.htm) for more information.
    #
    # @param [String] backup_id The backup [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::ExternalBackupJob ExternalBackupJob}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_external_backup_job.rb.html) to see an example of how to use get_external_backup_job API.
    def get_external_backup_job(backup_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_external_backup_job.' if logger

      raise "Missing the required parameter 'backup_id' when calling get_external_backup_job." if backup_id.nil?
      raise "Parameter value for 'backup_id' must not be blank" if OCI::Internal::Util.blank_string?(backup_id)

      path = '/externalBackupJobs/{backupId}'.sub('{backupId}', backup_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_external_backup_job') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ExternalBackupJob'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified key store.
    #
    # @param [String] key_store_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the key store.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::KeyStore KeyStore}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_key_store.rb.html) to see an example of how to use get_key_store API.
    def get_key_store(key_store_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_key_store.' if logger

      raise "Missing the required parameter 'key_store_id' when calling get_key_store." if key_store_id.nil?
      raise "Parameter value for 'key_store_id' must not be blank" if OCI::Internal::Util.blank_string?(key_store_id)

      path = '/keyStores/{keyStoreId}'.sub('{keyStoreId}', key_store_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_key_store') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::KeyStore'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about the specified maintenance run.
    # @param [String] maintenance_run_id The maintenance run OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::MaintenanceRun MaintenanceRun}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_maintenance_run.rb.html) to see an example of how to use get_maintenance_run API.
    def get_maintenance_run(maintenance_run_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_maintenance_run.' if logger

      raise "Missing the required parameter 'maintenance_run_id' when calling get_maintenance_run." if maintenance_run_id.nil?
      raise "Parameter value for 'maintenance_run_id' must not be blank" if OCI::Internal::Util.blank_string?(maintenance_run_id)

      path = '/maintenanceRuns/{maintenanceRunId}'.sub('{maintenanceRunId}', maintenance_run_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_maintenance_run') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::MaintenanceRun'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the VM cluster. Applies to Exadata Cloud@Customer instances only.
    #
    # @param [String] vm_cluster_id The VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::VmCluster VmCluster}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_vm_cluster.rb.html) to see an example of how to use get_vm_cluster API.
    def get_vm_cluster(vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_vm_cluster.' if logger

      raise "Missing the required parameter 'vm_cluster_id' when calling get_vm_cluster." if vm_cluster_id.nil?
      raise "Parameter value for 'vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(vm_cluster_id)

      path = '/vmClusters/{vmClusterId}'.sub('{vmClusterId}', vm_cluster_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_vm_cluster') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::VmCluster'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified VM cluster network. Applies to Exadata Cloud@Customer instances only.
    # To get information about a cloud VM cluster in an Exadata Cloud Service instance, use the {#get_cloud_vm_cluster get_cloud_vm_cluster} operation.
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] vm_cluster_network_id The VM cluster network [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::VmClusterNetwork VmClusterNetwork}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_vm_cluster_network.rb.html) to see an example of how to use get_vm_cluster_network API.
    def get_vm_cluster_network(exadata_infrastructure_id, vm_cluster_network_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_vm_cluster_network.' if logger

      raise "Missing the required parameter 'exadata_infrastructure_id' when calling get_vm_cluster_network." if exadata_infrastructure_id.nil?
      raise "Missing the required parameter 'vm_cluster_network_id' when calling get_vm_cluster_network." if vm_cluster_network_id.nil?
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)
      raise "Parameter value for 'vm_cluster_network_id' must not be blank" if OCI::Internal::Util.blank_string?(vm_cluster_network_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}/vmClusterNetworks/{vmClusterNetworkId}'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s).sub('{vmClusterNetworkId}', vm_cluster_network_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_vm_cluster_network') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::VmClusterNetwork'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about a specified patch package.
    #
    # @param [String] vm_cluster_id The VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] patch_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the patch.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::Patch Patch}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_vm_cluster_patch.rb.html) to see an example of how to use get_vm_cluster_patch API.
    def get_vm_cluster_patch(vm_cluster_id, patch_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_vm_cluster_patch.' if logger

      raise "Missing the required parameter 'vm_cluster_id' when calling get_vm_cluster_patch." if vm_cluster_id.nil?
      raise "Missing the required parameter 'patch_id' when calling get_vm_cluster_patch." if patch_id.nil?
      raise "Parameter value for 'vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(vm_cluster_id)
      raise "Parameter value for 'patch_id' must not be blank" if OCI::Internal::Util.blank_string?(patch_id)

      path = '/vmClusters/{vmClusterId}/patches/{patchId}'.sub('{vmClusterId}', vm_cluster_id.to_s).sub('{patchId}', patch_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_vm_cluster_patch') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::Patch'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the patch history details for the specified patch history entry.
    #
    # @param [String] vm_cluster_id The VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] patch_history_entry_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the patch history entry.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::PatchHistoryEntry PatchHistoryEntry}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/get_vm_cluster_patch_history_entry.rb.html) to see an example of how to use get_vm_cluster_patch_history_entry API.
    def get_vm_cluster_patch_history_entry(vm_cluster_id, patch_history_entry_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_vm_cluster_patch_history_entry.' if logger

      raise "Missing the required parameter 'vm_cluster_id' when calling get_vm_cluster_patch_history_entry." if vm_cluster_id.nil?
      raise "Missing the required parameter 'patch_history_entry_id' when calling get_vm_cluster_patch_history_entry." if patch_history_entry_id.nil?
      raise "Parameter value for 'vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(vm_cluster_id)
      raise "Parameter value for 'patch_history_entry_id' must not be blank" if OCI::Internal::Util.blank_string?(patch_history_entry_id)

      path = '/vmClusters/{vmClusterId}/patchHistoryEntries/{patchHistoryEntryId}'.sub('{vmClusterId}', vm_cluster_id.to_s).sub('{patchHistoryEntryId}', patch_history_entry_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#get_vm_cluster_patch_history_entry') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::PatchHistoryEntry'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new Autonomous Exadata Infrastructure in the specified compartment and availability domain.
    #
    # @param [OCI::Database::Models::LaunchAutonomousExadataInfrastructureDetails] launch_autonomous_exadata_infrastructure_details Request to create an Autonomous Exadata Infrastructure resource.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousExadataInfrastructure AutonomousExadataInfrastructure}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/launch_autonomous_exadata_infrastructure.rb.html) to see an example of how to use launch_autonomous_exadata_infrastructure API.
    def launch_autonomous_exadata_infrastructure(launch_autonomous_exadata_infrastructure_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#launch_autonomous_exadata_infrastructure.' if logger

      raise "Missing the required parameter 'launch_autonomous_exadata_infrastructure_details' when calling launch_autonomous_exadata_infrastructure." if launch_autonomous_exadata_infrastructure_details.nil?

      path = '/autonomousExadataInfrastructures'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(launch_autonomous_exadata_infrastructure_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#launch_autonomous_exadata_infrastructure') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousExadataInfrastructure'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new DB system in the specified compartment and availability domain. The Oracle
    # Database edition that you specify applies to all the databases on that DB system. The selected edition cannot be changed.
    #
    # An initial database is created on the DB system based on the request parameters you provide and some default
    # options. For detailed information about default options, see the following:
    #
    # - [Bare metal and virtual machine DB system default options](https://docs.cloud.oracle.com/Content/Database/Tasks/creatingDBsystem.htm#DefaultOptionsfortheInitialDatabase)
    # - [Exadata DB system default options](https://docs.cloud.oracle.com/Content/Database/Tasks/exacreatingDBsystem.htm#DefaultOptionsfortheInitialDatabase)
    #
    # @param [OCI::Database::Models::LaunchDbSystemBase] launch_db_system_details Request to launch a DB system.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbSystem DbSystem}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/launch_db_system.rb.html) to see an example of how to use launch_db_system API.
    def launch_db_system(launch_db_system_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#launch_db_system.' if logger

      raise "Missing the required parameter 'launch_db_system_details' when calling launch_db_system." if launch_db_system_details.nil?

      path = '/dbSystems'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(launch_db_system_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#launch_db_system') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DbSystem'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the Autonomous Container Databases with Autonomous Data Guard-enabled associated with the specified Autonomous Container Database.
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation AutonomousContainerDatabaseDataguardAssociation}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_autonomous_container_database_dataguard_associations.rb.html) to see an example of how to use list_autonomous_container_database_dataguard_associations API.
    def list_autonomous_container_database_dataguard_associations(autonomous_container_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_autonomous_container_database_dataguard_associations.' if logger

      raise "Missing the required parameter 'autonomous_container_database_id' when calling list_autonomous_container_database_dataguard_associations." if autonomous_container_database_id.nil?
      raise "Parameter value for 'autonomous_container_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_id)

      path = '/autonomousContainerDatabases/{autonomousContainerDatabaseId}/autonomousContainerDatabaseDataguardAssociations'.sub('{autonomousContainerDatabaseId}', autonomous_container_database_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_autonomous_container_database_dataguard_associations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the Autonomous Container Databases in the specified compartment.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :autonomous_exadata_infrastructure_id The Autonomous Exadata Infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @option opts [String] :autonomous_vm_cluster_id The Autonomous VM Cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @option opts [String] :infrastructure_type A filter to return only resources that match the given Infrastructure Type.
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #   **Note:** If you do not include the availability domain filter, the resources are grouped by availability domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :availability_domain A filter to return only resources that match the given availability domain exactly.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :service_level_agreement_type A filter to return only resources that match the given service-level agreement type exactly.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::AutonomousContainerDatabaseSummary AutonomousContainerDatabaseSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_autonomous_container_databases.rb.html) to see an example of how to use list_autonomous_container_databases API.
    def list_autonomous_container_databases(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_autonomous_container_databases.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_autonomous_container_databases." if compartment_id.nil?

      if opts[:infrastructure_type] && !OCI::Database::Models::AutonomousContainerDatabaseSummary::INFRASTRUCTURE_TYPE_ENUM.include?(opts[:infrastructure_type])
        raise 'Invalid value for "infrastructure_type", must be one of the values in OCI::Database::Models::AutonomousContainerDatabaseSummary::INFRASTRUCTURE_TYPE_ENUM.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::AutonomousContainerDatabaseSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::AutonomousContainerDatabaseSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/autonomousContainerDatabases'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:autonomousExadataInfrastructureId] = opts[:autonomous_exadata_infrastructure_id] if opts[:autonomous_exadata_infrastructure_id]
      query_params[:autonomousVmClusterId] = opts[:autonomous_vm_cluster_id] if opts[:autonomous_vm_cluster_id]
      query_params[:infrastructureType] = opts[:infrastructure_type] if opts[:infrastructure_type]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:serviceLevelAgreementType] = opts[:service_level_agreement_type] if opts[:service_level_agreement_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_autonomous_container_databases') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::AutonomousContainerDatabaseSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of Autonomous Database backups based on either the `autonomousDatabaseId` or `compartmentId` specified as a query parameter.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @option opts [String] :compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #   **Note:** If you do not include the availability domain filter, the resources are grouped by availability domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::AutonomousDatabaseBackupSummary AutonomousDatabaseBackupSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_autonomous_database_backups.rb.html) to see an example of how to use list_autonomous_database_backups API.
    def list_autonomous_database_backups(opts = {})
      logger.debug 'Calling operation DatabaseClient#list_autonomous_database_backups.' if logger


      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::AutonomousDatabaseBackupSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::AutonomousDatabaseBackupSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/autonomousDatabaseBackups'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:autonomousDatabaseId] = opts[:autonomous_database_id] if opts[:autonomous_database_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_autonomous_database_backups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::AutonomousDatabaseBackupSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the Autonomous Database clones for the specified Autonomous Database.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #   **Note:** If you do not include the availability domain filter, the resources are grouped by availability domain, then sorted.
    #    (default to NONE)
    #   Allowed values are: NONE, TIMECREATED, DISPLAYNAME
    # @option opts [String] :clone_type A filter to return only resources that match the given clone type exactly.
    #   Allowed values are: REFRESHABLE_CLONE
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::AutonomousDatabaseSummary AutonomousDatabaseSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_autonomous_database_clones.rb.html) to see an example of how to use list_autonomous_database_clones API.
    def list_autonomous_database_clones(compartment_id, autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_autonomous_database_clones.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_autonomous_database_clones." if compartment_id.nil?
      raise "Missing the required parameter 'autonomous_database_id' when calling list_autonomous_database_clones." if autonomous_database_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::AutonomousDatabaseSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::AutonomousDatabaseSummary::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[NONE TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NONE, TIMECREATED, DISPLAYNAME.'
      end

      if opts[:clone_type] && !%w[REFRESHABLE_CLONE].include?(opts[:clone_type])
        raise 'Invalid value for "clone_type", must be one of REFRESHABLE_CLONE.'
      end
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/clones'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:cloneType] = opts[:clone_type] if opts[:clone_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_autonomous_database_clones') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::AutonomousDatabaseSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the Autonomous Data Guard-enabled databases associated with the specified Autonomous Database.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::AutonomousDatabaseDataguardAssociation AutonomousDatabaseDataguardAssociation}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_autonomous_database_dataguard_associations.rb.html) to see an example of how to use list_autonomous_database_dataguard_associations API.
    def list_autonomous_database_dataguard_associations(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_autonomous_database_dataguard_associations.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling list_autonomous_database_dataguard_associations." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/autonomousDatabaseDataguardAssociations'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_autonomous_database_dataguard_associations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::AutonomousDatabaseDataguardAssociation>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of Autonomous Databases based on the query parameters specified.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #   **Note:** If you do not include the availability domain filter, the resources are grouped by availability domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :infrastructure_type A filter to return only resources that match the given Infrastructure Type.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :db_workload A filter to return only autonomous database resources that match the specified workload type.
    # @option opts [String] :db_version A filter to return only autonomous database resources that match the specified dbVersion.
    # @option opts [BOOLEAN] :is_free_tier Filter on the value of the resource's 'isFreeTier' property. A value of `true` returns only Always Free resources.
    #   A value of `false` excludes Always Free resources from the returned results. Omitting this parameter returns both Always Free and paid resources.
    #
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [BOOLEAN] :is_refreshable_clone Filter on the value of the resource's 'isRefreshableClone' property. A value of `true` returns only refreshable clones.
    #   A value of `false` excludes refreshable clones from the returned results. Omitting this parameter returns both refreshable clones and databases that are not refreshable clones.
    #
    # @option opts [BOOLEAN] :is_data_guard_enabled A filter to return only resources that have Data Guard enabled.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::AutonomousDatabaseSummary AutonomousDatabaseSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_autonomous_databases.rb.html) to see an example of how to use list_autonomous_databases API.
    def list_autonomous_databases(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_autonomous_databases.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_autonomous_databases." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:infrastructure_type] && !OCI::Database::Models::AutonomousDatabaseSummary::INFRASTRUCTURE_TYPE_ENUM.include?(opts[:infrastructure_type])
        raise 'Invalid value for "infrastructure_type", must be one of the values in OCI::Database::Models::AutonomousDatabaseSummary::INFRASTRUCTURE_TYPE_ENUM.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::AutonomousDatabaseSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::AutonomousDatabaseSummary::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:db_workload] && !OCI::Database::Models::AutonomousDatabaseSummary::DB_WORKLOAD_ENUM.include?(opts[:db_workload])
        raise 'Invalid value for "db_workload", must be one of the values in OCI::Database::Models::AutonomousDatabaseSummary::DB_WORKLOAD_ENUM.'
      end

      path = '/autonomousDatabases'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:autonomousContainerDatabaseId] = opts[:autonomous_container_database_id] if opts[:autonomous_container_database_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:infrastructureType] = opts[:infrastructure_type] if opts[:infrastructure_type]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:dbWorkload] = opts[:db_workload] if opts[:db_workload]
      query_params[:dbVersion] = opts[:db_version] if opts[:db_version]
      query_params[:isFreeTier] = opts[:is_free_tier] if !opts[:is_free_tier].nil?
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:isRefreshableClone] = opts[:is_refreshable_clone] if !opts[:is_refreshable_clone].nil?
      query_params[:isDataGuardEnabled] = opts[:is_data_guard_enabled] if !opts[:is_data_guard_enabled].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_autonomous_databases') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::AutonomousDatabaseSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of supported Autonomous Database versions. Note that preview version software is only available for
    # databases with [shared Exadata infrastructure](https://docs.cloud.oracle.com/Content/Database/Concepts/adboverview.htm#AEI).
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for DBWORKLOAD is ascending.
    #
    #   **Note:** If you do not include the availability domain filter, the resources are grouped by availability domain, then sorted.
    #
    #   Allowed values are: DBWORKLOAD
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::AutonomousDbPreviewVersionSummary AutonomousDbPreviewVersionSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_autonomous_db_preview_versions.rb.html) to see an example of how to use list_autonomous_db_preview_versions API.
    def list_autonomous_db_preview_versions(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_autonomous_db_preview_versions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_autonomous_db_preview_versions." if compartment_id.nil?

      if opts[:sort_by] && !%w[DBWORKLOAD].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of DBWORKLOAD.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/autonomousDbPreviewVersions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_autonomous_db_preview_versions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::AutonomousDbPreviewVersionSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of supported Autonomous Database versions.
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :db_workload A filter to return only autonomous database resources that match the specified workload type.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::AutonomousDbVersionSummary AutonomousDbVersionSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_autonomous_db_versions.rb.html) to see an example of how to use list_autonomous_db_versions API.
    def list_autonomous_db_versions(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_autonomous_db_versions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_autonomous_db_versions." if compartment_id.nil?

      if opts[:db_workload] && !OCI::Database::Models::AutonomousDatabaseSummary::DB_WORKLOAD_ENUM.include?(opts[:db_workload])
        raise 'Invalid value for "db_workload", must be one of the values in OCI::Database::Models::AutonomousDatabaseSummary::DB_WORKLOAD_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/autonomousDbVersions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:dbWorkload] = opts[:db_workload] if opts[:db_workload]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_autonomous_db_versions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::AutonomousDbVersionSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the shapes that can be used to launch a new Autonomous Exadata Infrastructure resource. The shape determines resources to allocate (CPU cores, memory and storage).
    # @param [String] availability_domain The name of the Availability Domain.
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::AutonomousExadataInfrastructureShapeSummary AutonomousExadataInfrastructureShapeSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_autonomous_exadata_infrastructure_shapes.rb.html) to see an example of how to use list_autonomous_exadata_infrastructure_shapes API.
    def list_autonomous_exadata_infrastructure_shapes(availability_domain, compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_autonomous_exadata_infrastructure_shapes.' if logger

      raise "Missing the required parameter 'availability_domain' when calling list_autonomous_exadata_infrastructure_shapes." if availability_domain.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_autonomous_exadata_infrastructure_shapes." if compartment_id.nil?

      path = '/autonomousExadataInfrastructureShapes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:availabilityDomain] = availability_domain
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_autonomous_exadata_infrastructure_shapes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::AutonomousExadataInfrastructureShapeSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the Autonomous Exadata Infrastructures in the specified compartment.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #     **Note:** If you do not include the availability domain filter, the resources are grouped by availability domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :availability_domain A filter to return only resources that match the given availability domain exactly.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::AutonomousExadataInfrastructureSummary AutonomousExadataInfrastructureSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_autonomous_exadata_infrastructures.rb.html) to see an example of how to use list_autonomous_exadata_infrastructures API.
    def list_autonomous_exadata_infrastructures(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_autonomous_exadata_infrastructures.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_autonomous_exadata_infrastructures." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::AutonomousExadataInfrastructureSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::AutonomousExadataInfrastructureSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/autonomousExadataInfrastructures'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_autonomous_exadata_infrastructures') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::AutonomousExadataInfrastructureSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of Exadata Cloud@Customer Autonomous VM clusters in the specified compartment.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :exadata_infrastructure_id If provided, filters the results for the given Exadata Infrastructure. (default to default)
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::AutonomousVmClusterSummary AutonomousVmClusterSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_autonomous_vm_clusters.rb.html) to see an example of how to use list_autonomous_vm_clusters API.
    def list_autonomous_vm_clusters(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_autonomous_vm_clusters.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_autonomous_vm_clusters." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::AutonomousVmClusterSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::AutonomousVmClusterSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/autonomousVmClusters'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:exadataInfrastructureId] = opts[:exadata_infrastructure_id] if opts[:exadata_infrastructure_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_autonomous_vm_clusters') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::AutonomousVmClusterSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of backup destinations in the specified compartment.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :type A filter to return only resources that match the given type of the Backup Destination.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::BackupDestinationSummary BackupDestinationSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_backup_destination.rb.html) to see an example of how to use list_backup_destination API.
    def list_backup_destination(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_backup_destination.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_backup_destination." if compartment_id.nil?

      path = '/backupDestinations'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:type] = opts[:type] if opts[:type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_backup_destination') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::BackupDestinationSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of backups based on the `databaseId` or `compartmentId` specified. Either one of these query parameters must be provided.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :database_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the database.
    # @option opts [String] :compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::BackupSummary BackupSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_backups.rb.html) to see an example of how to use list_backups API.
    def list_backups(opts = {})
      logger.debug 'Calling operation DatabaseClient#list_backups.' if logger


      path = '/backups'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:databaseId] = opts[:database_id] if opts[:database_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_backups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::BackupSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the cloud Exadata infrastructure resources in the specified compartment. Applies to Exadata Cloud Service instances only.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::CloudExadataInfrastructureSummary CloudExadataInfrastructureSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_cloud_exadata_infrastructures.rb.html) to see an example of how to use list_cloud_exadata_infrastructures API.
    def list_cloud_exadata_infrastructures(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_cloud_exadata_infrastructures.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_cloud_exadata_infrastructures." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::CloudExadataInfrastructureSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::CloudExadataInfrastructureSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/cloudExadataInfrastructures'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_cloud_exadata_infrastructures') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::CloudExadataInfrastructureSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the history of the maintenance update actions performed on the specified cloud VM cluster. Applies to Exadata Cloud Service instances only.
    #
    # @param [String] cloud_vm_cluster_id The cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :update_type A filter to return only resources that match the given update type exactly.
    #   Allowed values are: GI_UPGRADE, GI_PATCH
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::UpdateHistoryEntrySummary UpdateHistoryEntrySummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_cloud_vm_cluster_update_history_entries.rb.html) to see an example of how to use list_cloud_vm_cluster_update_history_entries API.
    def list_cloud_vm_cluster_update_history_entries(cloud_vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_cloud_vm_cluster_update_history_entries.' if logger

      raise "Missing the required parameter 'cloud_vm_cluster_id' when calling list_cloud_vm_cluster_update_history_entries." if cloud_vm_cluster_id.nil?

      if opts[:update_type] && !%w[GI_UPGRADE GI_PATCH].include?(opts[:update_type])
        raise 'Invalid value for "update_type", must be one of GI_UPGRADE, GI_PATCH.'
      end
      raise "Parameter value for 'cloud_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_vm_cluster_id)

      path = '/cloudVmClusters/{cloudVmClusterId}/updateHistoryEntries'.sub('{cloudVmClusterId}', cloud_vm_cluster_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:updateType] = opts[:update_type] if opts[:update_type]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_cloud_vm_cluster_update_history_entries') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::UpdateHistoryEntrySummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the maintenance updates that can be applied to the specified cloud VM cluster. Applies to Exadata Cloud Service instances only.
    #
    # @param [String] cloud_vm_cluster_id The cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :update_type A filter to return only resources that match the given update type exactly.
    #   Allowed values are: GI_UPGRADE, GI_PATCH
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::UpdateSummary UpdateSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_cloud_vm_cluster_updates.rb.html) to see an example of how to use list_cloud_vm_cluster_updates API.
    def list_cloud_vm_cluster_updates(cloud_vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_cloud_vm_cluster_updates.' if logger

      raise "Missing the required parameter 'cloud_vm_cluster_id' when calling list_cloud_vm_cluster_updates." if cloud_vm_cluster_id.nil?

      if opts[:update_type] && !%w[GI_UPGRADE GI_PATCH].include?(opts[:update_type])
        raise 'Invalid value for "update_type", must be one of GI_UPGRADE, GI_PATCH.'
      end
      raise "Parameter value for 'cloud_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_vm_cluster_id)

      path = '/cloudVmClusters/{cloudVmClusterId}/updates'.sub('{cloudVmClusterId}', cloud_vm_cluster_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:updateType] = opts[:update_type] if opts[:update_type]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_cloud_vm_cluster_updates') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::UpdateSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the cloud VM clusters in the specified compartment. Applies to Exadata Cloud Service instances only.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :cloud_exadata_infrastructure_id If provided, filters the results for the specified cloud Exadata infrastructure.
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only cloud VM clusters that match the given lifecycle state exactly.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::CloudVmClusterSummary CloudVmClusterSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_cloud_vm_clusters.rb.html) to see an example of how to use list_cloud_vm_clusters API.
    def list_cloud_vm_clusters(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_cloud_vm_clusters.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_cloud_vm_clusters." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::CloudVmClusterSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::CloudVmClusterSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/cloudVmClusters'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:cloudExadataInfrastructureId] = opts[:cloud_exadata_infrastructure_id] if opts[:cloud_exadata_infrastructure_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_cloud_vm_clusters') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::CloudVmClusterSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Lists the console connections for the specified database node.
    #
    # @param [String] db_node_id The database node [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::ConsoleConnectionSummary ConsoleConnectionSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_console_connections.rb.html) to see an example of how to use list_console_connections API.
    def list_console_connections(db_node_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_console_connections.' if logger

      raise "Missing the required parameter 'db_node_id' when calling list_console_connections." if db_node_id.nil?
      raise "Parameter value for 'db_node_id' must not be blank" if OCI::Internal::Util.blank_string?(db_node_id)

      path = '/dbNodes/{dbNodeId}/consoleConnections'.sub('{dbNodeId}', db_node_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_console_connections') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::ConsoleConnectionSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the patches applicable to the requested container database.
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::AutonomousPatchSummary AutonomousPatchSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_container_database_patches.rb.html) to see an example of how to use list_container_database_patches API.
    def list_container_database_patches(autonomous_container_database_id, compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_container_database_patches.' if logger

      raise "Missing the required parameter 'autonomous_container_database_id' when calling list_container_database_patches." if autonomous_container_database_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_container_database_patches." if compartment_id.nil?
      raise "Parameter value for 'autonomous_container_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_id)

      path = '/autonomousContainerDatabases/{autonomousContainerDatabaseId}/patches'.sub('{autonomousContainerDatabaseId}', autonomous_container_database_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_container_database_patches') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::AutonomousPatchSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists all Data Guard associations for the specified database.
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DataGuardAssociationSummary DataGuardAssociationSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_data_guard_associations.rb.html) to see an example of how to use list_data_guard_associations API.
    def list_data_guard_associations(database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_data_guard_associations.' if logger

      raise "Missing the required parameter 'database_id' when calling list_data_guard_associations." if database_id.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}/dataGuardAssociations'.sub('{databaseId}', database_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_data_guard_associations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::DataGuardAssociationSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the database software images in the specified compartment.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :image_type A filter to return only resources that match the given image type exactly.
    # @option opts [String] :image_shape_family A filter to return only resources that match the given image shape family exactly.
    # @option opts [BOOLEAN] :is_upgrade_supported If provided, filters the results to the set of database versions which are supported for Upgrade.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DatabaseSoftwareImageSummary DatabaseSoftwareImageSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_database_software_images.rb.html) to see an example of how to use list_database_software_images API.
    def list_database_software_images(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_database_software_images.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_database_software_images." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::DatabaseSoftwareImageSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::DatabaseSoftwareImageSummary::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:image_type] && !OCI::Database::Models::DatabaseSoftwareImageSummary::IMAGE_TYPE_ENUM.include?(opts[:image_type])
        raise 'Invalid value for "image_type", must be one of the values in OCI::Database::Models::DatabaseSoftwareImageSummary::IMAGE_TYPE_ENUM.'
      end

      if opts[:image_shape_family] && !OCI::Database::Models::DatabaseSoftwareImageSummary::IMAGE_SHAPE_FAMILY_ENUM.include?(opts[:image_shape_family])
        raise 'Invalid value for "image_shape_family", must be one of the values in OCI::Database::Models::DatabaseSoftwareImageSummary::IMAGE_SHAPE_FAMILY_ENUM.'
      end

      path = '/databaseSoftwareImages'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:imageType] = opts[:image_type] if opts[:image_type]
      query_params[:imageShapeFamily] = opts[:image_shape_family] if opts[:image_shape_family]
      query_params[:isUpgradeSupported] = opts[:is_upgrade_supported] if !opts[:is_upgrade_supported].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_database_software_images') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::DatabaseSoftwareImageSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # gets the upgrade history for a specified database.
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :upgrade_action A filter to return only upgradeHistoryEntries that match the specified Upgrade Action.
    # @option opts [String] :lifecycle_state A filter to return only upgradeHistoryEntries that match the given lifecycle state exactly.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is ascending.
    #    (default to TIMESTARTED)
    #   Allowed values are: TIMESTARTED
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DatabaseUpgradeHistoryEntrySummary DatabaseUpgradeHistoryEntrySummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_database_upgrade_history_entries.rb.html) to see an example of how to use list_database_upgrade_history_entries API.
    def list_database_upgrade_history_entries(database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_database_upgrade_history_entries.' if logger

      raise "Missing the required parameter 'database_id' when calling list_database_upgrade_history_entries." if database_id.nil?

      if opts[:upgrade_action] && !OCI::Database::Models::DatabaseUpgradeHistoryEntrySummary::ACTION_ENUM.include?(opts[:upgrade_action])
        raise 'Invalid value for "upgrade_action", must be one of the values in OCI::Database::Models::DatabaseUpgradeHistoryEntrySummary::ACTION_ENUM.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::DatabaseUpgradeHistoryEntrySummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::DatabaseUpgradeHistoryEntrySummary::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[TIMESTARTED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMESTARTED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}/upgradeHistoryEntries'.sub('{databaseId}', database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:upgradeAction] = opts[:upgrade_action] if opts[:upgrade_action]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_database_upgrade_history_entries') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::DatabaseUpgradeHistoryEntrySummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the databases in the specified Database Home.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :db_home_id A Database Home [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @option opts [String] :system_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Exadata DB system that you want to filter the database results by. Applies only to Exadata DB systems.
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DBNAME is ascending. The DBNAME sort order is case sensitive.
    #   Allowed values are: DBNAME, TIMECREATED
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :db_name A filter to return only resources that match the entire database name given. The match is not case sensitive.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DatabaseSummary DatabaseSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_databases.rb.html) to see an example of how to use list_databases API.
    def list_databases(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_databases.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_databases." if compartment_id.nil?

      if opts[:sort_by] && !%w[DBNAME TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of DBNAME, TIMECREATED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::DatabaseSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::DatabaseSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/databases'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:dbHomeId] = opts[:db_home_id] if opts[:db_home_id]
      query_params[:systemId] = opts[:system_id] if opts[:system_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:dbName] = opts[:db_name] if opts[:db_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_databases') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::DatabaseSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the history of patch operations on the specified Database Home.
    #
    # @param [String] db_home_id The Database Home [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::PatchHistoryEntrySummary PatchHistoryEntrySummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_db_home_patch_history_entries.rb.html) to see an example of how to use list_db_home_patch_history_entries API.
    def list_db_home_patch_history_entries(db_home_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_home_patch_history_entries.' if logger

      raise "Missing the required parameter 'db_home_id' when calling list_db_home_patch_history_entries." if db_home_id.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)

      path = '/dbHomes/{dbHomeId}/patchHistoryEntries'.sub('{dbHomeId}', db_home_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_db_home_patch_history_entries') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::PatchHistoryEntrySummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists patches applicable to the requested Database Home.
    #
    # @param [String] db_home_id The Database Home [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::PatchSummary PatchSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_db_home_patches.rb.html) to see an example of how to use list_db_home_patches API.
    def list_db_home_patches(db_home_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_home_patches.' if logger

      raise "Missing the required parameter 'db_home_id' when calling list_db_home_patches." if db_home_id.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)

      path = '/dbHomes/{dbHomeId}/patches'.sub('{dbHomeId}', db_home_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_db_home_patches') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::PatchSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the Database Homes in the specified DB system and compartment. A Database Home is a directory where Oracle Database software is installed.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm). If provided, filters the results to the set of database versions which are supported for the DB system.
    # @option opts [String] :vm_cluster_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VM cluster.
    # @option opts [String] :backup_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup. Specify a backupId to list only the DB systems or DB homes that support creating a database using this backup in this compartment.
    # @option opts [String] :db_version A filter to return only DB Homes that match the specified dbVersion. (default to NONE)
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DbHomeSummary DbHomeSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_db_homes.rb.html) to see an example of how to use list_db_homes API.
    def list_db_homes(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_homes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_db_homes." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::DbHomeSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::DbHomeSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/dbHomes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:dbSystemId] = opts[:db_system_id] if opts[:db_system_id]
      query_params[:vmClusterId] = opts[:vm_cluster_id] if opts[:vm_cluster_id]
      query_params[:backupId] = opts[:backup_id] if opts[:backup_id]
      query_params[:dbVersion] = opts[:db_version] if opts[:db_version]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_db_homes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::DbHomeSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the database nodes in the specified DB system and compartment. A database node is a server running database software.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm). If provided, filters the results to the set of database versions which are supported for the DB system.
    # @option opts [String] :vm_cluster_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VM cluster.
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_by Sort by TIMECREATED.  Default order for TIMECREATED is descending.
    #   Allowed values are: TIMECREATED
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DbNodeSummary DbNodeSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_db_nodes.rb.html) to see an example of how to use list_db_nodes API.
    def list_db_nodes(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_nodes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_db_nodes." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::DbNodeSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::DbNodeSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/dbNodes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:dbSystemId] = opts[:db_system_id] if opts[:db_system_id]
      query_params[:vmClusterId] = opts[:vm_cluster_id] if opts[:vm_cluster_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_db_nodes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::DbNodeSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the history of the patch actions performed on the specified DB system.
    #
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::PatchHistoryEntrySummary PatchHistoryEntrySummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_db_system_patch_history_entries.rb.html) to see an example of how to use list_db_system_patch_history_entries API.
    def list_db_system_patch_history_entries(db_system_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_system_patch_history_entries.' if logger

      raise "Missing the required parameter 'db_system_id' when calling list_db_system_patch_history_entries." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/patchHistoryEntries'.sub('{dbSystemId}', db_system_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_db_system_patch_history_entries') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::PatchHistoryEntrySummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the patches applicable to the specified DB system.
    #
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::PatchSummary PatchSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_db_system_patches.rb.html) to see an example of how to use list_db_system_patches API.
    def list_db_system_patches(db_system_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_system_patches.' if logger

      raise "Missing the required parameter 'db_system_id' when calling list_db_system_patches." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/patches'.sub('{dbSystemId}', db_system_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_db_system_patches') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::PatchSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the shapes that can be used to launch a new DB system. The shape determines resources to allocate to the DB system - CPU cores and memory for VM shapes; CPU cores, memory and storage for non-VM (or bare metal) shapes.
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :availability_domain The name of the Availability Domain.
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DbSystemShapeSummary DbSystemShapeSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_db_system_shapes.rb.html) to see an example of how to use list_db_system_shapes API.
    def list_db_system_shapes(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_system_shapes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_db_system_shapes." if compartment_id.nil?

      path = '/dbSystemShapes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_db_system_shapes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::DbSystemShapeSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the DB systems in the specified compartment. You can specify a `backupId` to list only the DB systems that support creating a database using this backup in this compartment.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :backup_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup. Specify a backupId to list only the DB systems or DB homes that support creating a database using this backup in this compartment.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #   **Note:** If you do not include the availability domain filter, the resources are grouped by availability domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :availability_domain A filter to return only resources that match the given availability domain exactly.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DbSystemSummary DbSystemSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_db_systems.rb.html) to see an example of how to use list_db_systems API.
    def list_db_systems(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_systems.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_db_systems." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::DbSystemSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::DbSystemSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/dbSystems'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:backupId] = opts[:backup_id] if opts[:backup_id]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_db_systems') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::DbSystemSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of supported Oracle Database versions.
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :db_system_shape If provided, filters the results to the set of database versions which are supported for the given shape.
    # @option opts [String] :db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm). If provided, filters the results to the set of database versions which are supported for the DB system.
    # @option opts [String] :storage_management The DB system storage management option. Used to list database versions available for that storage manager. Valid values are:
    #   * ASM - Automatic storage management
    #   * LVM - Logical volume management
    #
    # @option opts [BOOLEAN] :is_upgrade_supported If provided, filters the results to the set of database versions which are supported for Upgrade.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DbVersionSummary DbVersionSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_db_versions.rb.html) to see an example of how to use list_db_versions API.
    def list_db_versions(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_versions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_db_versions." if compartment_id.nil?

      if opts[:storage_management] && !OCI::Database::Models::DbSystemOptions::STORAGE_MANAGEMENT_ENUM.include?(opts[:storage_management])
        raise 'Invalid value for "storage_management", must be one of the values in OCI::Database::Models::DbSystemOptions::STORAGE_MANAGEMENT_ENUM.'
      end

      path = '/dbVersions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:dbSystemShape] = opts[:db_system_shape] if opts[:db_system_shape]
      query_params[:dbSystemId] = opts[:db_system_id] if opts[:db_system_id]
      query_params[:storageManagement] = opts[:storage_management] if opts[:storage_management]
      query_params[:isUpgradeSupported] = opts[:is_upgrade_supported] if !opts[:is_upgrade_supported].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_db_versions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::DbVersionSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the Exadata infrastructure resources in the specified compartment. Applies to Exadata Cloud@Customer instances only.
    # To list the Exadata Cloud Service infrastructure resources in a compartment, use the  {#list_cloud_exadata_infrastructures list_cloud_exadata_infrastructures} operation.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::ExadataInfrastructureSummary ExadataInfrastructureSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_exadata_infrastructures.rb.html) to see an example of how to use list_exadata_infrastructures API.
    def list_exadata_infrastructures(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_exadata_infrastructures.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_exadata_infrastructures." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::ExadataInfrastructureSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::ExadataInfrastructureSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/exadataInfrastructures'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_exadata_infrastructures') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::ExadataInfrastructureSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the flex components that can be used to launch a new DB system. The flex component determines resources to allocate to the DB system - Database Servers and Storage Servers.
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name A filter to return only resources that match the entire name given. The match is not case sensitive.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for NAME is ascending. The NAME sort order is case sensitive.
    #
    #   Allowed values are: NAME
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type {OCI::Database::Models::FlexComponentCollection FlexComponentCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_flex_components.rb.html) to see an example of how to use list_flex_components API.
    def list_flex_components(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_flex_components.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_flex_components." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[NAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of NAME.'
      end

      path = '/dbSystemShapes/flexComponents'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_flex_components') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::FlexComponentCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of supported GI versions for the Exadata Cloud@Customer VM cluster.
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :shape If provided, filters the results for the given shape. (default to default)
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::GiVersionSummary GiVersionSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_gi_versions.rb.html) to see an example of how to use list_gi_versions API.
    def list_gi_versions(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_gi_versions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_gi_versions." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/giVersions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:shape] = opts[:shape] if opts[:shape]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_gi_versions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::GiVersionSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of key stores in the specified compartment.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::KeyStoreSummary KeyStoreSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_key_stores.rb.html) to see an example of how to use list_key_stores API.
    def list_key_stores(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_key_stores.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_key_stores." if compartment_id.nil?

      path = '/keyStores'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_key_stores') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::KeyStoreSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the maintenance runs in the specified compartment.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :target_resource_id The target resource ID.
    # @option opts [String] :target_resource_type The type of the target resource.
    # @option opts [String] :maintenance_type The maintenance type.
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIME_SCHEDULED and TIME_ENDED is descending. Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #   **Note:** If you do not include the availability domain filter, the resources are grouped by availability domain, then sorted.
    #
    #   Allowed values are: TIME_SCHEDULED, TIME_ENDED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :availability_domain A filter to return only resources that match the given availability domain exactly.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::MaintenanceRunSummary MaintenanceRunSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_maintenance_runs.rb.html) to see an example of how to use list_maintenance_runs API.
    def list_maintenance_runs(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_maintenance_runs.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_maintenance_runs." if compartment_id.nil?

      if opts[:target_resource_type] && !OCI::Database::Models::MaintenanceRunSummary::TARGET_RESOURCE_TYPE_ENUM.include?(opts[:target_resource_type])
        raise 'Invalid value for "target_resource_type", must be one of the values in OCI::Database::Models::MaintenanceRunSummary::TARGET_RESOURCE_TYPE_ENUM.'
      end

      if opts[:maintenance_type] && !OCI::Database::Models::MaintenanceRunSummary::MAINTENANCE_TYPE_ENUM.include?(opts[:maintenance_type])
        raise 'Invalid value for "maintenance_type", must be one of the values in OCI::Database::Models::MaintenanceRunSummary::MAINTENANCE_TYPE_ENUM.'
      end

      if opts[:sort_by] && !%w[TIME_SCHEDULED TIME_ENDED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIME_SCHEDULED, TIME_ENDED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::MaintenanceRunSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::MaintenanceRunSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/maintenanceRuns'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:targetResourceId] = opts[:target_resource_id] if opts[:target_resource_id]
      query_params[:targetResourceType] = opts[:target_resource_type] if opts[:target_resource_type]
      query_params[:maintenanceType] = opts[:maintenance_type] if opts[:maintenance_type]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_maintenance_runs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::MaintenanceRunSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the VM cluster networks in the specified compartment. Applies to Exadata Cloud@Customer instances only.
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::VmClusterNetworkSummary VmClusterNetworkSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_vm_cluster_networks.rb.html) to see an example of how to use list_vm_cluster_networks API.
    def list_vm_cluster_networks(exadata_infrastructure_id, compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_vm_cluster_networks.' if logger

      raise "Missing the required parameter 'exadata_infrastructure_id' when calling list_vm_cluster_networks." if exadata_infrastructure_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_vm_cluster_networks." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::VmClusterNetworkSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::VmClusterNetworkSummary::LIFECYCLE_STATE_ENUM.'
      end
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}/vmClusterNetworks'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_vm_cluster_networks') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::VmClusterNetworkSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the history of the patch actions performed on the specified VM cluster in an Exadata Cloud@Customer system.
    #
    # @param [String] vm_cluster_id The VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::PatchHistoryEntrySummary PatchHistoryEntrySummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_vm_cluster_patch_history_entries.rb.html) to see an example of how to use list_vm_cluster_patch_history_entries API.
    def list_vm_cluster_patch_history_entries(vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_vm_cluster_patch_history_entries.' if logger

      raise "Missing the required parameter 'vm_cluster_id' when calling list_vm_cluster_patch_history_entries." if vm_cluster_id.nil?
      raise "Parameter value for 'vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(vm_cluster_id)

      path = '/vmClusters/{vmClusterId}/patchHistoryEntries'.sub('{vmClusterId}', vm_cluster_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_vm_cluster_patch_history_entries') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::PatchHistoryEntrySummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the patches applicable to the specified VM cluster in an Exadata Cloud@Customer system.
    #
    # @param [String] vm_cluster_id The VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::PatchSummary PatchSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_vm_cluster_patches.rb.html) to see an example of how to use list_vm_cluster_patches API.
    def list_vm_cluster_patches(vm_cluster_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_vm_cluster_patches.' if logger

      raise "Missing the required parameter 'vm_cluster_id' when calling list_vm_cluster_patches." if vm_cluster_id.nil?
      raise "Parameter value for 'vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(vm_cluster_id)

      path = '/vmClusters/{vmClusterId}/patches'.sub('{vmClusterId}', vm_cluster_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_vm_cluster_patches') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::PatchSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the VM clusters in the specified compartment. Applies to Exadata Cloud@Customer instances only.
    # To list the cloud VM clusters in an Exadata Cloud Service instance, use the {#list_cloud_vm_clusters list_cloud_vm_clusters} operation.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :exadata_infrastructure_id If provided, filters the results for the given Exadata Infrastructure. (default to default)
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 10)
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`).  Default order for TIMECREATED is descending.  Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state exactly.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given. The match is not case sensitive.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::VmClusterSummary VmClusterSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/list_vm_clusters.rb.html) to see an example of how to use list_vm_clusters API.
    def list_vm_clusters(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_vm_clusters.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_vm_clusters." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Database::Models::VmClusterSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Database::Models::VmClusterSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/vmClusters'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:exadataInfrastructureId] = opts[:exadata_infrastructure_id] if opts[:exadata_infrastructure_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#list_vm_clusters') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Database::Models::VmClusterSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Migrates the Exadata DB system to the cloud Exadata infrastructure model. All related resources will be migrated.
    #
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::ExadataDbSystemMigration ExadataDbSystemMigration}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/migrate_exadata_db_system_resource_model.rb.html) to see an example of how to use migrate_exadata_db_system_resource_model API.
    def migrate_exadata_db_system_resource_model(db_system_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#migrate_exadata_db_system_resource_model.' if logger

      raise "Missing the required parameter 'db_system_id' when calling migrate_exadata_db_system_resource_model." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/actions/migration'.sub('{dbSystemId}', db_system_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#migrate_exadata_db_system_resource_model') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ExadataDbSystemMigration'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Changes encryption key management from customer-managed, using the [Vault service](https://docs.cloud.oracle.com/iaas/Content/KeyManagement/Concepts/keyoverview.htm), to Oracle-managed.
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::MigrateVaultKeyDetails] migrate_vault_key_details Request to change the source of the encryption key for the database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::Database Database}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/migrate_vault_key.rb.html) to see an example of how to use migrate_vault_key API.
    def migrate_vault_key(database_id, migrate_vault_key_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#migrate_vault_key.' if logger

      raise "Missing the required parameter 'database_id' when calling migrate_vault_key." if database_id.nil?
      raise "Missing the required parameter 'migrate_vault_key_details' when calling migrate_vault_key." if migrate_vault_key_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}/actions/migrateKey'.sub('{databaseId}', database_id.to_s)
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

      post_body = @api_client.object_to_http_body(migrate_vault_key_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#migrate_vault_key') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::Database'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Asynchronously registers this Autonomous Database with Data Safe.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [OCI::Database::Models::RegisterAutonomousDatabaseDataSafeDetails] :register_autonomous_database_data_safe_details Request to register an Autonomous Database with Data Safe.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/register_autonomous_database_data_safe.rb.html) to see an example of how to use register_autonomous_database_data_safe API.
    def register_autonomous_database_data_safe(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#register_autonomous_database_data_safe.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling register_autonomous_database_data_safe." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/registerDataSafe'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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

      post_body = @api_client.object_to_http_body(opts[:register_autonomous_database_data_safe_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#register_autonomous_database_data_safe') do
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


    # Reinstates a disabled standby Autonomous Container Database, identified by the autonomousContainerDatabaseId parameter, to an active standby Autonomous Container Database.
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] autonomous_container_database_dataguard_association_id The Autonomous Container Database-Autonomous Data Guard association [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation AutonomousContainerDatabaseDataguardAssociation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/reinstate_autonomous_container_database_dataguard_association.rb.html) to see an example of how to use reinstate_autonomous_container_database_dataguard_association API.
    def reinstate_autonomous_container_database_dataguard_association(autonomous_container_database_id, autonomous_container_database_dataguard_association_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#reinstate_autonomous_container_database_dataguard_association.' if logger

      raise "Missing the required parameter 'autonomous_container_database_id' when calling reinstate_autonomous_container_database_dataguard_association." if autonomous_container_database_id.nil?
      raise "Missing the required parameter 'autonomous_container_database_dataguard_association_id' when calling reinstate_autonomous_container_database_dataguard_association." if autonomous_container_database_dataguard_association_id.nil?
      raise "Parameter value for 'autonomous_container_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_id)
      raise "Parameter value for 'autonomous_container_database_dataguard_association_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_dataguard_association_id)

      path = '/autonomousContainerDatabases/{autonomousContainerDatabaseId}/autonomousContainerDatabaseDataguardAssociations/{autonomousContainerDatabaseDataguardAssociationId}/actions/reinstate'.sub('{autonomousContainerDatabaseId}', autonomous_container_database_id.to_s).sub('{autonomousContainerDatabaseDataguardAssociationId}', autonomous_container_database_dataguard_association_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#reinstate_autonomous_container_database_dataguard_association') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Reinstates the database identified by the `databaseId` parameter into the standby role in a Data Guard association.
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] data_guard_association_id The Data Guard association's [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::ReinstateDataGuardAssociationDetails] reinstate_data_guard_association_details A request to reinstate a database in a standby role.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DataGuardAssociation DataGuardAssociation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/reinstate_data_guard_association.rb.html) to see an example of how to use reinstate_data_guard_association API.
    def reinstate_data_guard_association(database_id, data_guard_association_id, reinstate_data_guard_association_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#reinstate_data_guard_association.' if logger

      raise "Missing the required parameter 'database_id' when calling reinstate_data_guard_association." if database_id.nil?
      raise "Missing the required parameter 'data_guard_association_id' when calling reinstate_data_guard_association." if data_guard_association_id.nil?
      raise "Missing the required parameter 'reinstate_data_guard_association_details' when calling reinstate_data_guard_association." if reinstate_data_guard_association_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)
      raise "Parameter value for 'data_guard_association_id' must not be blank" if OCI::Internal::Util.blank_string?(data_guard_association_id)

      path = '/databases/{databaseId}/dataGuardAssociations/{dataGuardAssociationId}/actions/reinstate'.sub('{databaseId}', database_id.to_s).sub('{dataGuardAssociationId}', data_guard_association_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(reinstate_data_guard_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#reinstate_data_guard_association') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DataGuardAssociation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Rolling restarts the specified Autonomous Container Database.
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousContainerDatabase AutonomousContainerDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/restart_autonomous_container_database.rb.html) to see an example of how to use restart_autonomous_container_database API.
    def restart_autonomous_container_database(autonomous_container_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#restart_autonomous_container_database.' if logger

      raise "Missing the required parameter 'autonomous_container_database_id' when calling restart_autonomous_container_database." if autonomous_container_database_id.nil?
      raise "Parameter value for 'autonomous_container_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_id)

      path = '/autonomousContainerDatabases/{autonomousContainerDatabaseId}/actions/restart'.sub('{autonomousContainerDatabaseId}', autonomous_container_database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#restart_autonomous_container_database') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousContainerDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Restarts the specified Autonomous Database.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabase AutonomousDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/restart_autonomous_database.rb.html) to see an example of how to use restart_autonomous_database API.
    def restart_autonomous_database(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#restart_autonomous_database.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling restart_autonomous_database." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/restart'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#restart_autonomous_database') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Restores an Autonomous Database based on the provided request parameters.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::RestoreAutonomousDatabaseDetails] restore_autonomous_database_details Request to perform an Autonomous Database restore.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabase AutonomousDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/restore_autonomous_database.rb.html) to see an example of how to use restore_autonomous_database API.
    def restore_autonomous_database(autonomous_database_id, restore_autonomous_database_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#restore_autonomous_database.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling restore_autonomous_database." if autonomous_database_id.nil?
      raise "Missing the required parameter 'restore_autonomous_database_details' when calling restore_autonomous_database." if restore_autonomous_database_details.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/restore'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(restore_autonomous_database_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#restore_autonomous_database') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Restore a Database based on the request parameters you provide.
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::RestoreDatabaseDetails] restore_database_details Request to perform database restore.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::Database Database}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/restore_database.rb.html) to see an example of how to use restore_database API.
    def restore_database(database_id, restore_database_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#restore_database.' if logger

      raise "Missing the required parameter 'database_id' when calling restore_database." if database_id.nil?
      raise "Missing the required parameter 'restore_database_details' when calling restore_database." if restore_database_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}/actions/restore'.sub('{databaseId}', database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(restore_database_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#restore_database') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::Database'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new version of an existing [Vault service](https://docs.cloud.oracle.com/iaas/Content/KeyManagement/Concepts/keyoverview.htm) key.
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousContainerDatabase AutonomousContainerDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/rotate_autonomous_container_database_encryption_key.rb.html) to see an example of how to use rotate_autonomous_container_database_encryption_key API.
    def rotate_autonomous_container_database_encryption_key(autonomous_container_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#rotate_autonomous_container_database_encryption_key.' if logger

      raise "Missing the required parameter 'autonomous_container_database_id' when calling rotate_autonomous_container_database_encryption_key." if autonomous_container_database_id.nil?
      raise "Parameter value for 'autonomous_container_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_id)

      path = '/autonomousContainerDatabases/{autonomousContainerDatabaseId}/actions/rotateKey'.sub('{autonomousContainerDatabaseId}', autonomous_container_database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#rotate_autonomous_container_database_encryption_key') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousContainerDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Rotate existing AutonomousDatabase [Vault service](https://docs.cloud.oracle.com/iaas/Content/KeyManagement/Concepts/keyoverview.htm) key.
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabase AutonomousDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/rotate_autonomous_database_encryption_key.rb.html) to see an example of how to use rotate_autonomous_database_encryption_key API.
    def rotate_autonomous_database_encryption_key(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#rotate_autonomous_database_encryption_key.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling rotate_autonomous_database_encryption_key." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/rotateKey'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#rotate_autonomous_database_encryption_key') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Rotates Oracle REST Data Services (ORDS) certs for an Autonomous Exadata Infrastructure resource.
    #
    # @param [String] autonomous_exadata_infrastructure_id The Autonomous Exadata Infrastructure  [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/rotate_ords_certs.rb.html) to see an example of how to use rotate_ords_certs API.
    def rotate_ords_certs(autonomous_exadata_infrastructure_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#rotate_ords_certs.' if logger

      raise "Missing the required parameter 'autonomous_exadata_infrastructure_id' when calling rotate_ords_certs." if autonomous_exadata_infrastructure_id.nil?
      raise "Parameter value for 'autonomous_exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_exadata_infrastructure_id)

      path = '/autonomousExadataInfrastructures/{autonomousExadataInfrastructureId}/actions/rotateOrdsCerts'.sub('{autonomousExadataInfrastructureId}', autonomous_exadata_infrastructure_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#rotate_ords_certs') do
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


    # Rotates SSL certs for an Autonomous Exadata Infrastructure resource.
    #
    # @param [String] autonomous_exadata_infrastructure_id The Autonomous Exadata Infrastructure  [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/rotate_ssl_certs.rb.html) to see an example of how to use rotate_ssl_certs API.
    def rotate_ssl_certs(autonomous_exadata_infrastructure_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#rotate_ssl_certs.' if logger

      raise "Missing the required parameter 'autonomous_exadata_infrastructure_id' when calling rotate_ssl_certs." if autonomous_exadata_infrastructure_id.nil?
      raise "Parameter value for 'autonomous_exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_exadata_infrastructure_id)

      path = '/autonomousExadataInfrastructures/{autonomousExadataInfrastructureId}/actions/rotateSslCerts'.sub('{autonomousExadataInfrastructureId}', autonomous_exadata_infrastructure_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#rotate_ssl_certs') do
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


    # Creates a new version of an existing [Vault service](https://docs.cloud.oracle.com/iaas/Content/KeyManagement/Concepts/keyoverview.htm) key.
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::Database Database}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/rotate_vault_key.rb.html) to see an example of how to use rotate_vault_key API.
    def rotate_vault_key(database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#rotate_vault_key.' if logger

      raise "Missing the required parameter 'database_id' when calling rotate_vault_key." if database_id.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}/actions/rotateKey'.sub('{databaseId}', database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#rotate_vault_key') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::Database'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Starts the specified Autonomous Database.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabase AutonomousDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/start_autonomous_database.rb.html) to see an example of how to use start_autonomous_database API.
    def start_autonomous_database(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#start_autonomous_database.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling start_autonomous_database." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/start'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#start_autonomous_database') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Stops the specified Autonomous Database.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabase AutonomousDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/stop_autonomous_database.rb.html) to see an example of how to use stop_autonomous_database API.
    def stop_autonomous_database(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#stop_autonomous_database.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling stop_autonomous_database." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/stop'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#stop_autonomous_database') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Switches over the primary Autonomous Container Database of an Autonomous Data Guard peer association to standby role. The standby Autonomous Container Database associated with autonomousContainerDatabaseDataguardAssociationId assumes the primary Autonomous Container Database role.
    #
    # A switchover incurs no data loss.
    #
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] autonomous_container_database_dataguard_association_id The Autonomous Container Database-Autonomous Data Guard association [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation AutonomousContainerDatabaseDataguardAssociation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/switchover_autonomous_container_database_dataguard_association.rb.html) to see an example of how to use switchover_autonomous_container_database_dataguard_association API.
    def switchover_autonomous_container_database_dataguard_association(autonomous_container_database_id, autonomous_container_database_dataguard_association_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#switchover_autonomous_container_database_dataguard_association.' if logger

      raise "Missing the required parameter 'autonomous_container_database_id' when calling switchover_autonomous_container_database_dataguard_association." if autonomous_container_database_id.nil?
      raise "Missing the required parameter 'autonomous_container_database_dataguard_association_id' when calling switchover_autonomous_container_database_dataguard_association." if autonomous_container_database_dataguard_association_id.nil?
      raise "Parameter value for 'autonomous_container_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_id)
      raise "Parameter value for 'autonomous_container_database_dataguard_association_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_dataguard_association_id)

      path = '/autonomousContainerDatabases/{autonomousContainerDatabaseId}/autonomousContainerDatabaseDataguardAssociations/{autonomousContainerDatabaseDataguardAssociationId}/actions/switchover'.sub('{autonomousContainerDatabaseId}', autonomous_container_database_id.to_s).sub('{autonomousContainerDatabaseDataguardAssociationId}', autonomous_container_database_dataguard_association_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#switchover_autonomous_container_database_dataguard_association') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousContainerDatabaseDataguardAssociation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Initiates a switchover of the specified Autonomous Database to the associated standby database. Applicable only to databases with Autonomous Data Guard enabled.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabase AutonomousDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/switchover_autonomous_database.rb.html) to see an example of how to use switchover_autonomous_database API.
    def switchover_autonomous_database(autonomous_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#switchover_autonomous_database.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling switchover_autonomous_database." if autonomous_database_id.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/actions/switchover'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#switchover_autonomous_database') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Performs a switchover to transition the primary database of a Data Guard association into a standby role. The
    # standby database associated with the `dataGuardAssociationId` assumes the primary database role.
    #
    # A switchover guarantees no data loss.
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] data_guard_association_id The Data Guard association's [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::SwitchoverDataGuardAssociationDetails] switchover_data_guard_association_details Request to swtichover a primary to a standby.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DataGuardAssociation DataGuardAssociation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/switchover_data_guard_association.rb.html) to see an example of how to use switchover_data_guard_association API.
    def switchover_data_guard_association(database_id, data_guard_association_id, switchover_data_guard_association_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#switchover_data_guard_association.' if logger

      raise "Missing the required parameter 'database_id' when calling switchover_data_guard_association." if database_id.nil?
      raise "Missing the required parameter 'data_guard_association_id' when calling switchover_data_guard_association." if data_guard_association_id.nil?
      raise "Missing the required parameter 'switchover_data_guard_association_details' when calling switchover_data_guard_association." if switchover_data_guard_association_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)
      raise "Parameter value for 'data_guard_association_id' must not be blank" if OCI::Internal::Util.blank_string?(data_guard_association_id)

      path = '/databases/{databaseId}/dataGuardAssociations/{dataGuardAssociationId}/actions/switchover'.sub('{databaseId}', database_id.to_s).sub('{dataGuardAssociationId}', data_guard_association_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(switchover_data_guard_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#switchover_data_guard_association') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DataGuardAssociation'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Terminates an Autonomous Container Database, which permanently deletes the container database and any databases within the container database. The database data is local to the Autonomous Exadata Infrastructure and will be lost when the container database is terminated. Oracle recommends that you back up any data in the Autonomous Container Database prior to terminating it.
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/terminate_autonomous_container_database.rb.html) to see an example of how to use terminate_autonomous_container_database API.
    def terminate_autonomous_container_database(autonomous_container_database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#terminate_autonomous_container_database.' if logger

      raise "Missing the required parameter 'autonomous_container_database_id' when calling terminate_autonomous_container_database." if autonomous_container_database_id.nil?
      raise "Parameter value for 'autonomous_container_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_id)

      path = '/autonomousContainerDatabases/{autonomousContainerDatabaseId}'.sub('{autonomousContainerDatabaseId}', autonomous_container_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#terminate_autonomous_container_database') do
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


    # Terminates an Autonomous Exadata Infrastructure, which permanently deletes the infrastructure resource and any container databases and databases contained in the resource. The database data is local to the Autonomous Exadata Infrastructure and will be lost when the system is terminated. Oracle recommends that you back up any data in the Autonomous Exadata Infrastructure prior to terminating it.
    # @param [String] autonomous_exadata_infrastructure_id The Autonomous Exadata Infrastructure  [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/terminate_autonomous_exadata_infrastructure.rb.html) to see an example of how to use terminate_autonomous_exadata_infrastructure API.
    def terminate_autonomous_exadata_infrastructure(autonomous_exadata_infrastructure_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#terminate_autonomous_exadata_infrastructure.' if logger

      raise "Missing the required parameter 'autonomous_exadata_infrastructure_id' when calling terminate_autonomous_exadata_infrastructure." if autonomous_exadata_infrastructure_id.nil?
      raise "Parameter value for 'autonomous_exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_exadata_infrastructure_id)

      path = '/autonomousExadataInfrastructures/{autonomousExadataInfrastructureId}'.sub('{autonomousExadataInfrastructureId}', autonomous_exadata_infrastructure_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#terminate_autonomous_exadata_infrastructure') do
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


    # Terminates a DB system and permanently deletes it and any databases running on it, and any storage volumes attached to it. The database data is local to the DB system and will be lost when the system is terminated. Oracle recommends that you back up any data in the DB system prior to terminating it.
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/terminate_db_system.rb.html) to see an example of how to use terminate_db_system API.
    def terminate_db_system(db_system_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#terminate_db_system.' if logger

      raise "Missing the required parameter 'db_system_id' when calling terminate_db_system." if db_system_id.nil?
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#terminate_db_system') do
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


    # Updates the properties of an Autonomous Container Database, such as the OCPU core count and storage size.
    # @param [String] autonomous_container_database_id The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateAutonomousContainerDatabaseDetails] update_autonomous_container_database_details Request to update the properties of an Autonomous Container Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousContainerDatabase AutonomousContainerDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_autonomous_container_database.rb.html) to see an example of how to use update_autonomous_container_database API.
    def update_autonomous_container_database(autonomous_container_database_id, update_autonomous_container_database_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_autonomous_container_database.' if logger

      raise "Missing the required parameter 'autonomous_container_database_id' when calling update_autonomous_container_database." if autonomous_container_database_id.nil?
      raise "Missing the required parameter 'update_autonomous_container_database_details' when calling update_autonomous_container_database." if update_autonomous_container_database_details.nil?
      raise "Parameter value for 'autonomous_container_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_container_database_id)

      path = '/autonomousContainerDatabases/{autonomousContainerDatabaseId}'.sub('{autonomousContainerDatabaseId}', autonomous_container_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_autonomous_container_database_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_autonomous_container_database') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousContainerDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates one or more attributes of the specified Autonomous Database. See the UpdateAutonomousDatabaseDetails resource for a full list of attributes that can be updated.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateAutonomousDatabaseDetails] update_autonomous_database_details Request to update the properties of an Autonomous Database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousDatabase AutonomousDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_autonomous_database.rb.html) to see an example of how to use update_autonomous_database API.
    def update_autonomous_database(autonomous_database_id, update_autonomous_database_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_autonomous_database.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling update_autonomous_database." if autonomous_database_id.nil?
      raise "Missing the required parameter 'update_autonomous_database_details' when calling update_autonomous_database." if update_autonomous_database_details.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_autonomous_database_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_autonomous_database') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the Autonomous Database regional wallet.
    #
    # @param [OCI::Database::Models::UpdateAutonomousDatabaseWalletDetails] update_autonomous_database_wallet_details Request to update the properties of Autonomous Database regional wallet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_autonomous_database_regional_wallet.rb.html) to see an example of how to use update_autonomous_database_regional_wallet API.
    def update_autonomous_database_regional_wallet(update_autonomous_database_wallet_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_autonomous_database_regional_wallet.' if logger

      raise "Missing the required parameter 'update_autonomous_database_wallet_details' when calling update_autonomous_database_regional_wallet." if update_autonomous_database_wallet_details.nil?

      path = '/autonomousDatabases/wallet'
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

      post_body = @api_client.object_to_http_body(update_autonomous_database_wallet_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_autonomous_database_regional_wallet') do
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


    # Updates the wallet for the specified Autonomous Database.
    #
    # @param [String] autonomous_database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateAutonomousDatabaseWalletDetails] update_autonomous_database_wallet_details Request to update the properties of an Autonomous Database wallet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_autonomous_database_wallet.rb.html) to see an example of how to use update_autonomous_database_wallet API.
    def update_autonomous_database_wallet(autonomous_database_id, update_autonomous_database_wallet_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_autonomous_database_wallet.' if logger

      raise "Missing the required parameter 'autonomous_database_id' when calling update_autonomous_database_wallet." if autonomous_database_id.nil?
      raise "Missing the required parameter 'update_autonomous_database_wallet_details' when calling update_autonomous_database_wallet." if update_autonomous_database_wallet_details.nil?
      raise "Parameter value for 'autonomous_database_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_database_id)

      path = '/autonomousDatabases/{autonomousDatabaseId}/wallet'.sub('{autonomousDatabaseId}', autonomous_database_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_autonomous_database_wallet_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_autonomous_database_wallet') do
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


    # Updates the properties of an Autonomous Exadata Infrastructure, such as the CPU core count.
    # @param [String] autonomous_exadata_infrastructure_id The Autonomous Exadata Infrastructure  [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateAutonomousExadataInfrastructureDetails] update_autonomous_exadata_infrastructures_details Request to update the properties of a Autonomous Exadata Infrastructure.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousExadataInfrastructure AutonomousExadataInfrastructure}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_autonomous_exadata_infrastructure.rb.html) to see an example of how to use update_autonomous_exadata_infrastructure API.
    def update_autonomous_exadata_infrastructure(autonomous_exadata_infrastructure_id, update_autonomous_exadata_infrastructures_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_autonomous_exadata_infrastructure.' if logger

      raise "Missing the required parameter 'autonomous_exadata_infrastructure_id' when calling update_autonomous_exadata_infrastructure." if autonomous_exadata_infrastructure_id.nil?
      raise "Missing the required parameter 'update_autonomous_exadata_infrastructures_details' when calling update_autonomous_exadata_infrastructure." if update_autonomous_exadata_infrastructures_details.nil?
      raise "Parameter value for 'autonomous_exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_exadata_infrastructure_id)

      path = '/autonomousExadataInfrastructures/{autonomousExadataInfrastructureId}'.sub('{autonomousExadataInfrastructureId}', autonomous_exadata_infrastructure_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_autonomous_exadata_infrastructures_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_autonomous_exadata_infrastructure') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousExadataInfrastructure'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified Autonomous VM cluster for the Exadata Cloud@Customer system.
    #
    # @param [String] autonomous_vm_cluster_id The autonomous VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateAutonomousVmClusterDetails] update_autonomous_vm_cluster_details Request to update the attributes of an Autonomous VM cluster.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::AutonomousVmCluster AutonomousVmCluster}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_autonomous_vm_cluster.rb.html) to see an example of how to use update_autonomous_vm_cluster API.
    def update_autonomous_vm_cluster(autonomous_vm_cluster_id, update_autonomous_vm_cluster_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_autonomous_vm_cluster.' if logger

      raise "Missing the required parameter 'autonomous_vm_cluster_id' when calling update_autonomous_vm_cluster." if autonomous_vm_cluster_id.nil?
      raise "Missing the required parameter 'update_autonomous_vm_cluster_details' when calling update_autonomous_vm_cluster." if update_autonomous_vm_cluster_details.nil?
      raise "Parameter value for 'autonomous_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(autonomous_vm_cluster_id)

      path = '/autonomousVmClusters/{autonomousVmClusterId}'.sub('{autonomousVmClusterId}', autonomous_vm_cluster_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_autonomous_vm_cluster_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_autonomous_vm_cluster') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::AutonomousVmCluster'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # If no database is associated with the backup destination:
    # - For a RECOVERY_APPLIANCE backup destination, updates the connection string and/or the list of VPC users.
    # - For an NFS backup destination, updates the NFS location.
    #
    # @param [String] backup_destination_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup destination.
    # @param [OCI::Database::Models::UpdateBackupDestinationDetails] update_backup_destination_details For a RECOVERY_APPLIANCE backup destination, request to update the connection string and/or the list of VPC users.
    #   For an NFS backup destination, request to update the NFS location.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::BackupDestination BackupDestination}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_backup_destination.rb.html) to see an example of how to use update_backup_destination API.
    def update_backup_destination(backup_destination_id, update_backup_destination_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_backup_destination.' if logger

      raise "Missing the required parameter 'backup_destination_id' when calling update_backup_destination." if backup_destination_id.nil?
      raise "Missing the required parameter 'update_backup_destination_details' when calling update_backup_destination." if update_backup_destination_details.nil?
      raise "Parameter value for 'backup_destination_id' must not be blank" if OCI::Internal::Util.blank_string?(backup_destination_id)

      path = '/backupDestinations/{backupDestinationId}'.sub('{backupDestinationId}', backup_destination_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_backup_destination_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_backup_destination') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::BackupDestination'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the Cloud Exadata infrastructure resource. Applies to Exadata Cloud Service instances only.
    #
    # @param [String] cloud_exadata_infrastructure_id The cloud Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateCloudExadataInfrastructureDetails] update_cloud_exadata_infrastructure_details Request to update the properties of an cloud Exadata infrastructure resource.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::CloudExadataInfrastructure CloudExadataInfrastructure}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_cloud_exadata_infrastructure.rb.html) to see an example of how to use update_cloud_exadata_infrastructure API.
    def update_cloud_exadata_infrastructure(cloud_exadata_infrastructure_id, update_cloud_exadata_infrastructure_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_cloud_exadata_infrastructure.' if logger

      raise "Missing the required parameter 'cloud_exadata_infrastructure_id' when calling update_cloud_exadata_infrastructure." if cloud_exadata_infrastructure_id.nil?
      raise "Missing the required parameter 'update_cloud_exadata_infrastructure_details' when calling update_cloud_exadata_infrastructure." if update_cloud_exadata_infrastructure_details.nil?
      raise "Parameter value for 'cloud_exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_exadata_infrastructure_id)

      path = '/cloudExadataInfrastructures/{cloudExadataInfrastructureId}'.sub('{cloudExadataInfrastructureId}', cloud_exadata_infrastructure_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_cloud_exadata_infrastructure_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_cloud_exadata_infrastructure') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::CloudExadataInfrastructure'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified cloud VM cluster. Applies to Exadata Cloud Service instances only.
    #
    # @param [String] cloud_vm_cluster_id The cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateCloudVmClusterDetails] update_cloud_vm_cluster_details Request to update the attributes of a cloud VM cluster.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::CloudVmCluster CloudVmCluster}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_cloud_vm_cluster.rb.html) to see an example of how to use update_cloud_vm_cluster API.
    def update_cloud_vm_cluster(cloud_vm_cluster_id, update_cloud_vm_cluster_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_cloud_vm_cluster.' if logger

      raise "Missing the required parameter 'cloud_vm_cluster_id' when calling update_cloud_vm_cluster." if cloud_vm_cluster_id.nil?
      raise "Missing the required parameter 'update_cloud_vm_cluster_details' when calling update_cloud_vm_cluster." if update_cloud_vm_cluster_details.nil?
      raise "Parameter value for 'cloud_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_vm_cluster_id)

      path = '/cloudVmClusters/{cloudVmClusterId}'.sub('{cloudVmClusterId}', cloud_vm_cluster_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_cloud_vm_cluster_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_cloud_vm_cluster') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::CloudVmCluster'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the IORM settings for the specified cloud VM cluster in an Exadata Cloud Service instance.
    #
    # @param [String] cloud_vm_cluster_id The cloud VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::ExadataIormConfigUpdateDetails] cloud_vm_cluster_iorm_config_update_details Request to perform database update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::ExadataIormConfig ExadataIormConfig}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_cloud_vm_cluster_iorm_config.rb.html) to see an example of how to use update_cloud_vm_cluster_iorm_config API.
    def update_cloud_vm_cluster_iorm_config(cloud_vm_cluster_id, cloud_vm_cluster_iorm_config_update_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_cloud_vm_cluster_iorm_config.' if logger

      raise "Missing the required parameter 'cloud_vm_cluster_id' when calling update_cloud_vm_cluster_iorm_config." if cloud_vm_cluster_id.nil?
      raise "Missing the required parameter 'cloud_vm_cluster_iorm_config_update_details' when calling update_cloud_vm_cluster_iorm_config." if cloud_vm_cluster_iorm_config_update_details.nil?
      raise "Parameter value for 'cloud_vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(cloud_vm_cluster_id)

      path = '/cloudVmClusters/{cloudVmClusterId}/CloudVmClusterIormConfig'.sub('{cloudVmClusterId}', cloud_vm_cluster_id.to_s)
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

      post_body = @api_client.object_to_http_body(cloud_vm_cluster_iorm_config_update_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_cloud_vm_cluster_iorm_config') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ExadataIormConfig'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Update the specified database based on the request parameters provided.
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDatabaseDetails] update_database_details Request to perform database update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::Database Database}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_database.rb.html) to see an example of how to use update_database API.
    def update_database(database_id, update_database_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_database.' if logger

      raise "Missing the required parameter 'database_id' when calling update_database." if database_id.nil?
      raise "Missing the required parameter 'update_database_details' when calling update_database." if update_database_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}'.sub('{databaseId}', database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_database_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_database') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::Database'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the properties of a Database Software Image, like Display Nmae
    # @param [String] database_software_image_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDatabaseSoftwareImageDetails] update_database_software_image_details Request to update the properties of a DB system.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DatabaseSoftwareImage DatabaseSoftwareImage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_database_software_image.rb.html) to see an example of how to use update_database_software_image API.
    def update_database_software_image(database_software_image_id, update_database_software_image_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_database_software_image.' if logger

      raise "Missing the required parameter 'database_software_image_id' when calling update_database_software_image." if database_software_image_id.nil?
      raise "Missing the required parameter 'update_database_software_image_details' when calling update_database_software_image." if update_database_software_image_details.nil?
      raise "Parameter value for 'database_software_image_id' must not be blank" if OCI::Internal::Util.blank_string?(database_software_image_id)

      path = '/databaseSoftwareImages/{databaseSoftwareImageId}'.sub('{databaseSoftwareImageId}', database_software_image_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_database_software_image_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_database_software_image') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DatabaseSoftwareImage'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Patches the specified Database Home.
    # @param [String] db_home_id The Database Home [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDbHomeDetails] update_db_home_details Request to update the properties of a Database Home.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbHome DbHome}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_db_home.rb.html) to see an example of how to use update_db_home API.
    def update_db_home(db_home_id, update_db_home_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_db_home.' if logger

      raise "Missing the required parameter 'db_home_id' when calling update_db_home." if db_home_id.nil?
      raise "Missing the required parameter 'update_db_home_details' when calling update_db_home." if update_db_home_details.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)

      path = '/dbHomes/{dbHomeId}'.sub('{dbHomeId}', db_home_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_db_home_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_db_home') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DbHome'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the properties of the specified DB system.
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDbSystemDetails] update_db_system_details Request to update the properties of a DB system.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbSystem DbSystem}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_db_system.rb.html) to see an example of how to use update_db_system API.
    def update_db_system(db_system_id, update_db_system_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_db_system.' if logger

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
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_db_system_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_db_system') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::DbSystem'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the Exadata infrastructure resource. Applies to Exadata Cloud@Customer instances only.
    # To update an Exadata Cloud Service infrastructure resource, use the  {#update_cloud_exadata_infrastructure update_cloud_exadata_infrastructure} operation.
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateExadataInfrastructureDetails] update_exadata_infrastructure_details Request to update the properties of an Exadata Cloud@Customer infrastructure.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::ExadataInfrastructure ExadataInfrastructure}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_exadata_infrastructure.rb.html) to see an example of how to use update_exadata_infrastructure API.
    def update_exadata_infrastructure(exadata_infrastructure_id, update_exadata_infrastructure_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_exadata_infrastructure.' if logger

      raise "Missing the required parameter 'exadata_infrastructure_id' when calling update_exadata_infrastructure." if exadata_infrastructure_id.nil?
      raise "Missing the required parameter 'update_exadata_infrastructure_details' when calling update_exadata_infrastructure." if update_exadata_infrastructure_details.nil?
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_exadata_infrastructure_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_exadata_infrastructure') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ExadataInfrastructure'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates IORM settings for the specified Exadata system.
    #
    # @param [String] db_system_id The DB system [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::ExadataIormConfigUpdateDetails] exadata_iorm_config_update_details Request to perform database update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::ExadataIormConfig ExadataIormConfig}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_exadata_iorm_config.rb.html) to see an example of how to use update_exadata_iorm_config API.
    def update_exadata_iorm_config(db_system_id, exadata_iorm_config_update_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_exadata_iorm_config.' if logger

      raise "Missing the required parameter 'db_system_id' when calling update_exadata_iorm_config." if db_system_id.nil?
      raise "Missing the required parameter 'exadata_iorm_config_update_details' when calling update_exadata_iorm_config." if exadata_iorm_config_update_details.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/ExadataIormConfig'.sub('{dbSystemId}', db_system_id.to_s)
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

      post_body = @api_client.object_to_http_body(exadata_iorm_config_update_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_exadata_iorm_config') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::ExadataIormConfig'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # If no database is associated with the key store, edit the key store.
    #
    # @param [String] key_store_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the key store.
    # @param [OCI::Database::Models::UpdateKeyStoreDetails] update_key_store_details Request to update the attributes of a key store.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::KeyStore KeyStore}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_key_store.rb.html) to see an example of how to use update_key_store API.
    def update_key_store(key_store_id, update_key_store_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_key_store.' if logger

      raise "Missing the required parameter 'key_store_id' when calling update_key_store." if key_store_id.nil?
      raise "Missing the required parameter 'update_key_store_details' when calling update_key_store." if update_key_store_details.nil?
      raise "Parameter value for 'key_store_id' must not be blank" if OCI::Internal::Util.blank_string?(key_store_id)

      path = '/keyStores/{keyStoreId}'.sub('{keyStoreId}', key_store_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_key_store_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_key_store') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::KeyStore'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the properties of a maintenance run, such as the state of a maintenance run.
    # @param [String] maintenance_run_id The maintenance run OCID.
    # @param [OCI::Database::Models::UpdateMaintenanceRunDetails] update_maintenance_run_details Request to update the properties of a maintenance run.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::MaintenanceRun MaintenanceRun}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_maintenance_run.rb.html) to see an example of how to use update_maintenance_run API.
    def update_maintenance_run(maintenance_run_id, update_maintenance_run_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_maintenance_run.' if logger

      raise "Missing the required parameter 'maintenance_run_id' when calling update_maintenance_run." if maintenance_run_id.nil?
      raise "Missing the required parameter 'update_maintenance_run_details' when calling update_maintenance_run." if update_maintenance_run_details.nil?
      raise "Parameter value for 'maintenance_run_id' must not be blank" if OCI::Internal::Util.blank_string?(maintenance_run_id)

      path = '/maintenanceRuns/{maintenanceRunId}'.sub('{maintenanceRunId}', maintenance_run_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_maintenance_run_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_maintenance_run') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::MaintenanceRun'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified VM cluster. Applies to Exadata Cloud@Customer instances only.
    #
    # @param [String] vm_cluster_id The VM cluster [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateVmClusterDetails] update_vm_cluster_details Request to update the attributes of a VM cluster.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::VmCluster VmCluster}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_vm_cluster.rb.html) to see an example of how to use update_vm_cluster API.
    def update_vm_cluster(vm_cluster_id, update_vm_cluster_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_vm_cluster.' if logger

      raise "Missing the required parameter 'vm_cluster_id' when calling update_vm_cluster." if vm_cluster_id.nil?
      raise "Missing the required parameter 'update_vm_cluster_details' when calling update_vm_cluster." if update_vm_cluster_details.nil?
      raise "Parameter value for 'vm_cluster_id' must not be blank" if OCI::Internal::Util.blank_string?(vm_cluster_id)

      path = '/vmClusters/{vmClusterId}'.sub('{vmClusterId}', vm_cluster_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_vm_cluster_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_vm_cluster') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::VmCluster'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified VM cluster network. Applies to Exadata Cloud@Customer instances only.
    # To update a cloud VM cluster in an Exadata Cloud Service instance, use the {#update_cloud_vm_cluster update_cloud_vm_cluster} operation.
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] vm_cluster_network_id The VM cluster network [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateVmClusterNetworkDetails] update_vm_cluster_network_details Request to update the properties of a VM cluster network.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::VmClusterNetwork VmClusterNetwork}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/update_vm_cluster_network.rb.html) to see an example of how to use update_vm_cluster_network API.
    def update_vm_cluster_network(exadata_infrastructure_id, vm_cluster_network_id, update_vm_cluster_network_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_vm_cluster_network.' if logger

      raise "Missing the required parameter 'exadata_infrastructure_id' when calling update_vm_cluster_network." if exadata_infrastructure_id.nil?
      raise "Missing the required parameter 'vm_cluster_network_id' when calling update_vm_cluster_network." if vm_cluster_network_id.nil?
      raise "Missing the required parameter 'update_vm_cluster_network_details' when calling update_vm_cluster_network." if update_vm_cluster_network_details.nil?
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)
      raise "Parameter value for 'vm_cluster_network_id' must not be blank" if OCI::Internal::Util.blank_string?(vm_cluster_network_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}/vmClusterNetworks/{vmClusterNetworkId}'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s).sub('{vmClusterNetworkId}', vm_cluster_network_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_vm_cluster_network_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#update_vm_cluster_network') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::VmClusterNetwork'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Upgrade the specified database.
    #
    # @param [String] database_id The database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpgradeDatabaseDetails] upgrade_database_details Request to perform database upgrade.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::Database Database}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/upgrade_database.rb.html) to see an example of how to use upgrade_database API.
    def upgrade_database(database_id, upgrade_database_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#upgrade_database.' if logger

      raise "Missing the required parameter 'database_id' when calling upgrade_database." if database_id.nil?
      raise "Missing the required parameter 'upgrade_database_details' when calling upgrade_database." if upgrade_database_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}/actions/upgrade'.sub('{databaseId}', database_id.to_s)
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

      post_body = @api_client.object_to_http_body(upgrade_database_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#upgrade_database') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::Database'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Validates the specified VM cluster network. Applies to Exadata Cloud@Customer instances only.
    #
    # @param [String] exadata_infrastructure_id The Exadata infrastructure [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [String] vm_cluster_network_id The VM cluster network [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::VmClusterNetwork VmClusterNetwork}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/database/validate_vm_cluster_network.rb.html) to see an example of how to use validate_vm_cluster_network API.
    def validate_vm_cluster_network(exadata_infrastructure_id, vm_cluster_network_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#validate_vm_cluster_network.' if logger

      raise "Missing the required parameter 'exadata_infrastructure_id' when calling validate_vm_cluster_network." if exadata_infrastructure_id.nil?
      raise "Missing the required parameter 'vm_cluster_network_id' when calling validate_vm_cluster_network." if vm_cluster_network_id.nil?
      raise "Parameter value for 'exadata_infrastructure_id' must not be blank" if OCI::Internal::Util.blank_string?(exadata_infrastructure_id)
      raise "Parameter value for 'vm_cluster_network_id' must not be blank" if OCI::Internal::Util.blank_string?(vm_cluster_network_id)

      path = '/exadataInfrastructures/{exadataInfrastructureId}/vmClusterNetworks/{vmClusterNetworkId}/actions/validate'.sub('{exadataInfrastructureId}', exadata_infrastructure_id.to_s).sub('{vmClusterNetworkId}', vm_cluster_network_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DatabaseClient#validate_vm_cluster_network') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Database::Models::VmClusterNetwork'
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
