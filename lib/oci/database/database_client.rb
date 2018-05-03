# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The API for the Database Service.
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

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines


    # Creates a new DatabaseClient.
    # If a config is not specified, then the global OCI.config will be used.
    #
    # A region must be specified in either the config or the region parameter. If specified
    # in both, then the region parameter will be used.
    #
    # @param [Config] config A Config object.
    # @param [String] region A region used to determine the service endpoint. This will usually
    #   correspond to a value in {OCI::Regions::REGION_ENUM}, but may be an arbitrary string.
    # @param [OCI::BaseSigner] signer A signer implementation which can be used by this client. If this is not provided then
    #   a signer will be constructed via the provided config. One use case of this parameter is instance principals authentication,
    #   so that the instance principals signer can be provided to the client
    # @param [OCI::ApiClientProxySettings] proxy_settings If your environment requires you to use a proxy server for outgoing HTTP requests
    #   the details for the proxy can be provided in this parameter
    # @param [OCI::Retry::RetryConfig] retry_config The retry configuration for this service client. This represents the default retry configuration to
    #   apply across all operations. This can be overridden on a per-operation basis. The default retry configuration value is `nil`, which means that an operation
    #   will not perform any retries
    def initialize(config: nil, region: nil, signer: nil, proxy_settings: nil, retry_config: nil)
      # If the signer is an InstancePrincipalsSecurityTokenSigner and no config was supplied (which is valid for instance principals)
      # then create a dummy config to pass to the ApiClient constructor. If customers wish to create a client which uses instance principals
      # and has config (either populated programmatically or loaded from a file), they must construct that config themselves and then
      # pass it to this constructor.
      #
      # If there is no signer (or the signer is not an instance principals signer) and no config was supplied, this is not valid
      # so try and load the config from the default file.
      config ||= OCI.config unless signer.is_a?(OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner)
      config ||= OCI::Config.new if signer.is_a?(OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner)
      config.validate unless signer.is_a?(OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner)

      if signer.nil?
        signer = OCI::Signer.new(
          config.user,
          config.fingerprint,
          config.tenancy,
          config.key_file,
          pass_phrase: config.pass_phrase,
          private_key_content: config.key_content
        )
      end

      @api_client = OCI::ApiClient.new(config, signer, proxy_settings: proxy_settings)
      @retry_config = retry_config

      region ||= config.region
      region ||= signer.region if signer.respond_to?(:region)
      self.region = region
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint(@region, :DatabaseClient) + '/20160918'
      logger.info "DatabaseClient endpoint set to '#{endpoint}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new backup in the specified database based on the request parameters you provide. If you previously used RMAN or dbcli to configure backups and then you switch to using the Console or the API for backups, a new backup configuration is created and associated with your database. This means that you can no longer rely on your previously configured unmanaged backups to work.
    #
    # @param [OCI::Database::Models::CreateBackupDetails] create_backup_details Request to create a new database backup.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::Backup Backup}
    def create_backup(create_backup_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_backup.' if logger

      raise "Missing the required parameter 'create_backup_details' when calling create_backup." if create_backup_details.nil?

      path = '/backups'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
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


    # Creates a new Data Guard association.  A Data Guard association represents the replication relationship between the
    # specified database and a peer database. For more information, see [Using Oracle Data Guard](https://docs.us-phoenix-1.oraclecloud.com/Content/Database/Tasks/usingdataguard.htm).
    #
    # All Oracle Cloud Infrastructure resources, including Data Guard associations, get an Oracle-assigned, unique ID
    # called an Oracle Cloud Identifier (OCID). When you create a resource, you can find its OCID in the response.
    # You can also retrieve a resource's OCID by using a List API operation on that resource type, or by viewing the
    # resource in the Console. For more information, see
    # [Resource Identifiers](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    #
    # @param [String] database_id The database [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::CreateDataGuardAssociationDetails] create_data_guard_association_details A request to create a Data Guard association.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DataGuardAssociation DataGuardAssociation}
    def create_data_guard_association(database_id, create_data_guard_association_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_data_guard_association.' if logger

      raise "Missing the required parameter 'database_id' when calling create_data_guard_association." if database_id.nil?
      raise "Missing the required parameter 'create_data_guard_association_details' when calling create_data_guard_association." if create_data_guard_association_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}/dataGuardAssociations'.sub('{databaseId}', database_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
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


    # Creates a new DB Home in the specified DB System based on the request parameters you provide.
    #
    # @param [OCI::Database::Models::CreateDbHomeWithDbSystemIdBase] create_db_home_with_db_system_id_details Request to create a new DB Home.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbHome DbHome}
    def create_db_home(create_db_home_with_db_system_id_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#create_db_home.' if logger

      raise "Missing the required parameter 'create_db_home_with_db_system_id_details' when calling create_db_home." if create_db_home_with_db_system_id_details.nil?

      path = '/dbHomes'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
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


    # Performs an action, such as one of the power actions (start, stop, softreset, or reset), on the specified DB Node.
    #
    # **start** - power on
    #
    # **stop** - power off
    #
    # **softreset** - ACPI shutdown and power on
    #
    # **reset** - power off and power on
    #
    # Note that the **stop** state has no effect on the resources you consume.
    # Billing continues for DB Nodes that you stop, and related resources continue
    # to apply against any relevant quotas. You must terminate the DB System
    # ({#terminate_db_system terminate_db_system})
    # to remove its resources from billing and quotas.
    #
    # @param [String] db_node_id The database node [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [String] action The action to perform on the DB Node.
    #   Allowed values are: STOP, START, SOFTRESET, RESET
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
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

      # Query Params
      query_params = {}
      query_params[:action] = action

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
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


    # Deletes a full backup. You cannot delete automatic backups using this API.
    # @param [String] backup_id The backup OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_backup(backup_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_backup.' if logger

      raise "Missing the required parameter 'backup_id' when calling delete_backup." if backup_id.nil?
      raise "Parameter value for 'backup_id' must not be blank" if OCI::Internal::Util.blank_string?(backup_id)

      path = '/backups/{backupId}'.sub('{backupId}', backup_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

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


    # Deletes a DB Home. The DB Home and its database data are local to the DB System and will be lost when it is deleted. Oracle recommends that you back up any data in the DB System prior to deleting it.
    #
    # @param [String] db_home_id The database home [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [BOOLEAN] :perform_final_backup Whether to perform a final backup of the database or not. Default is false. If you previously used RMAN or dbcli to configure backups and then you switch to using the Console or the API for backups, a new backup configuration is created and associated with your database. This means that you can no longer rely on your previously configured unmanaged backups to work.
    # @return [Response] A Response object with data of type nil
    def delete_db_home(db_home_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#delete_db_home.' if logger

      raise "Missing the required parameter 'db_home_id' when calling delete_db_home." if db_home_id.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)

      path = '/dbHomes/{dbHomeId}'.sub('{dbHomeId}', db_home_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:performFinalBackup] = opts[:perform_final_backup] if opts[:perform_final_backup]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

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


    # Performs a failover to transition the standby database identified by the `databaseId` parameter into the
    # specified Data Guard association's primary role after the existing primary database fails or becomes unreachable.
    #
    # A failover might result in data loss depending on the protection mode in effect at the time of the primary
    # database failure.
    #
    # @param [String] database_id The database [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [String] data_guard_association_id The Data Guard association's [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::FailoverDataGuardAssociationDetails] failover_data_guard_association_details A request to perform a failover, transitioning a standby database into a primary database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DataGuardAssociation DataGuardAssociation}
    def failover_data_guard_association(database_id, data_guard_association_id, failover_data_guard_association_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#failover_data_guard_association.' if logger

      raise "Missing the required parameter 'database_id' when calling failover_data_guard_association." if database_id.nil?
      raise "Missing the required parameter 'data_guard_association_id' when calling failover_data_guard_association." if data_guard_association_id.nil?
      raise "Missing the required parameter 'failover_data_guard_association_details' when calling failover_data_guard_association." if failover_data_guard_association_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)
      raise "Parameter value for 'data_guard_association_id' must not be blank" if OCI::Internal::Util.blank_string?(data_guard_association_id)

      path = '/databases/{databaseId}/dataGuardAssociations/{dataGuardAssociationId}/actions/failover'.sub('{databaseId}', database_id.to_s).sub('{dataGuardAssociationId}', data_guard_association_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

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
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about the specified backup.
    # @param [String] backup_id The backup OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::Backup Backup}
    def get_backup(backup_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_backup.' if logger

      raise "Missing the required parameter 'backup_id' when calling get_backup." if backup_id.nil?
      raise "Parameter value for 'backup_id' must not be blank" if OCI::Internal::Util.blank_string?(backup_id)

      path = '/backups/{backupId}'.sub('{backupId}', backup_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified Data Guard association's configuration information.
    #
    # @param [String] database_id The database [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [String] data_guard_association_id The Data Guard association's [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::DataGuardAssociation DataGuardAssociation}
    def get_data_guard_association(database_id, data_guard_association_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_data_guard_association.' if logger

      raise "Missing the required parameter 'database_id' when calling get_data_guard_association." if database_id.nil?
      raise "Missing the required parameter 'data_guard_association_id' when calling get_data_guard_association." if data_guard_association_id.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)
      raise "Parameter value for 'data_guard_association_id' must not be blank" if OCI::Internal::Util.blank_string?(data_guard_association_id)

      path = '/databases/{databaseId}/dataGuardAssociations/{dataGuardAssociationId}'.sub('{databaseId}', database_id.to_s).sub('{dataGuardAssociationId}', data_guard_association_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Gets information about a specific database.
    # @param [String] database_id The database [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::Database Database}
    def get_database(database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_database.' if logger

      raise "Missing the required parameter 'database_id' when calling get_database." if database_id.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}'.sub('{databaseId}', database_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Gets information about the specified database home.
    # @param [String] db_home_id The database home [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbHome DbHome}
    def get_db_home(db_home_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_home.' if logger

      raise "Missing the required parameter 'db_home_id' when calling get_db_home." if db_home_id.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)

      path = '/dbHomes/{dbHomeId}'.sub('{dbHomeId}', db_home_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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
    # @param [String] db_home_id The database home [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [String] patch_id The OCID of the patch.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::Patch Patch}
    def get_db_home_patch(db_home_id, patch_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_home_patch.' if logger

      raise "Missing the required parameter 'db_home_id' when calling get_db_home_patch." if db_home_id.nil?
      raise "Missing the required parameter 'patch_id' when calling get_db_home_patch." if patch_id.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)
      raise "Parameter value for 'patch_id' must not be blank" if OCI::Internal::Util.blank_string?(patch_id)

      path = '/dbHomes/{dbHomeId}/patches/{patchId}'.sub('{dbHomeId}', db_home_id.to_s).sub('{patchId}', patch_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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
    # @param [String] db_home_id The database home [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [String] patch_history_entry_id The OCID of the patch history entry.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::PatchHistoryEntry PatchHistoryEntry}
    def get_db_home_patch_history_entry(db_home_id, patch_history_entry_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_home_patch_history_entry.' if logger

      raise "Missing the required parameter 'db_home_id' when calling get_db_home_patch_history_entry." if db_home_id.nil?
      raise "Missing the required parameter 'patch_history_entry_id' when calling get_db_home_patch_history_entry." if patch_history_entry_id.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)
      raise "Parameter value for 'patch_history_entry_id' must not be blank" if OCI::Internal::Util.blank_string?(patch_history_entry_id)

      path = '/dbHomes/{dbHomeId}/patchHistoryEntries/{patchHistoryEntryId}'.sub('{dbHomeId}', db_home_id.to_s).sub('{patchHistoryEntryId}', patch_history_entry_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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
    # @param [String] db_node_id The database node [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbNode DbNode}
    def get_db_node(db_node_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_node.' if logger

      raise "Missing the required parameter 'db_node_id' when calling get_db_node." if db_node_id.nil?
      raise "Parameter value for 'db_node_id' must not be blank" if OCI::Internal::Util.blank_string?(db_node_id)

      path = '/dbNodes/{dbNodeId}'.sub('{dbNodeId}', db_node_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Gets information about the specified DB System.
    # @param [String] db_system_id The DB System [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbSystem DbSystem}
    def get_db_system(db_system_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_system.' if logger

      raise "Missing the required parameter 'db_system_id' when calling get_db_system." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}'.sub('{dbSystemId}', db_system_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Gets information about a specified patch package.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [String] patch_id The OCID of the patch.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::Patch Patch}
    def get_db_system_patch(db_system_id, patch_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_system_patch.' if logger

      raise "Missing the required parameter 'db_system_id' when calling get_db_system_patch." if db_system_id.nil?
      raise "Missing the required parameter 'patch_id' when calling get_db_system_patch." if patch_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)
      raise "Parameter value for 'patch_id' must not be blank" if OCI::Internal::Util.blank_string?(patch_id)

      path = '/dbSystems/{dbSystemId}/patches/{patchId}'.sub('{dbSystemId}', db_system_id.to_s).sub('{patchId}', patch_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Gets the patch history details for the specified patchHistoryEntryId.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [String] patch_history_entry_id The OCID of the patch history entry.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Database::Models::PatchHistoryEntry PatchHistoryEntry}
    def get_db_system_patch_history_entry(db_system_id, patch_history_entry_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#get_db_system_patch_history_entry.' if logger

      raise "Missing the required parameter 'db_system_id' when calling get_db_system_patch_history_entry." if db_system_id.nil?
      raise "Missing the required parameter 'patch_history_entry_id' when calling get_db_system_patch_history_entry." if patch_history_entry_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)
      raise "Parameter value for 'patch_history_entry_id' must not be blank" if OCI::Internal::Util.blank_string?(patch_history_entry_id)

      path = '/dbSystems/{dbSystemId}/patchHistoryEntries/{patchHistoryEntryId}'.sub('{dbSystemId}', db_system_id.to_s).sub('{patchHistoryEntryId}', patch_history_entry_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Launches a new DB System in the specified compartment and Availability Domain. You'll specify a single Oracle
    # Database Edition that applies to all the databases on that DB System. The selected edition cannot be changed.
    #
    # An initial database is created on the DB System based on the request parameters you provide and some default
    # options. For more information,
    # see [Default Options for the Initial Database](https://docs.us-phoenix-1.oraclecloud.com/Content/Database/Tasks/launchingDB.htm#Default_Options_for_the_Initial_Database).
    #
    # The DB System will include a command line interface (CLI) that you can use to create additional databases and
    # manage existing databases. For more information, see the
    # [Oracle Database CLI Reference](https://docs.us-phoenix-1.oraclecloud.com/Content/Database/References/odacli.htm#Oracle_Database_CLI_Reference).
    #
    # @param [OCI::Database::Models::LaunchDbSystemDetails] launch_db_system_details Request to launch a DB System.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbSystem DbSystem}
    def launch_db_system(launch_db_system_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#launch_db_system.' if logger

      raise "Missing the required parameter 'launch_db_system_details' when calling launch_db_system." if launch_db_system_details.nil?

      path = '/dbSystems'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
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


    # Gets a list of backups based on the databaseId or compartmentId specified. Either one of the query parameters must be provided.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :database_id The OCID of the database.
    # @option opts [String] :compartment_id The compartment OCID.
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::BackupSummary BackupSummary}>
    def list_backups(opts = {})
      logger.debug 'Calling operation DatabaseClient#list_backups.' if logger


      path = '/backups'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:databaseId] = opts[:database_id] if opts[:database_id]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Lists all Data Guard associations for the specified database.
    #
    # @param [String] database_id The database [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DataGuardAssociationSummary DataGuardAssociationSummary}>
    def list_data_guard_associations(database_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_data_guard_associations.' if logger

      raise "Missing the required parameter 'database_id' when calling list_data_guard_associations." if database_id.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}/dataGuardAssociations'.sub('{databaseId}', database_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Gets a list of the databases in the specified database home.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [String] db_home_id A database home [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DatabaseSummary DatabaseSummary}>
    def list_databases(compartment_id, db_home_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_databases.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_databases." if compartment_id.nil?
      raise "Missing the required parameter 'db_home_id' when calling list_databases." if db_home_id.nil?

      path = '/databases'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:dbHomeId] = db_home_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Gets history of the actions taken for patches for the specified database home.
    #
    # @param [String] db_home_id The database home [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::PatchHistoryEntrySummary PatchHistoryEntrySummary}>
    def list_db_home_patch_history_entries(db_home_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_home_patch_history_entries.' if logger

      raise "Missing the required parameter 'db_home_id' when calling list_db_home_patch_history_entries." if db_home_id.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)

      path = '/dbHomes/{dbHomeId}/patchHistoryEntries'.sub('{dbHomeId}', db_home_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Lists patches applicable to the requested database home.
    #
    # @param [String] db_home_id The database home [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::PatchSummary PatchSummary}>
    def list_db_home_patches(db_home_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_home_patches.' if logger

      raise "Missing the required parameter 'db_home_id' when calling list_db_home_patches." if db_home_id.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)

      path = '/dbHomes/{dbHomeId}/patches'.sub('{dbHomeId}', db_home_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Gets a list of database homes in the specified DB System and compartment. A database home is a directory where Oracle database software is installed.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [String] db_system_id The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the DB System.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DbHomeSummary DbHomeSummary}>
    def list_db_homes(compartment_id, db_system_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_homes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_db_homes." if compartment_id.nil?
      raise "Missing the required parameter 'db_system_id' when calling list_db_homes." if db_system_id.nil?

      path = '/dbHomes'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:dbSystemId] = db_system_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Gets a list of database nodes in the specified DB System and compartment. A database node is a server running database software.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [String] db_system_id The [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm) of the DB System.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DbNodeSummary DbNodeSummary}>
    def list_db_nodes(compartment_id, db_system_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_nodes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_db_nodes." if compartment_id.nil?
      raise "Missing the required parameter 'db_system_id' when calling list_db_nodes." if db_system_id.nil?

      path = '/dbNodes'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:dbSystemId] = db_system_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Gets the history of the patch actions performed on the specified DB System.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::PatchHistoryEntrySummary PatchHistoryEntrySummary}>
    def list_db_system_patch_history_entries(db_system_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_system_patch_history_entries.' if logger

      raise "Missing the required parameter 'db_system_id' when calling list_db_system_patch_history_entries." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/patchHistoryEntries'.sub('{dbSystemId}', db_system_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Lists the patches applicable to the requested DB System.
    #
    # @param [String] db_system_id The DB System [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::PatchSummary PatchSummary}>
    def list_db_system_patches(db_system_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_system_patches.' if logger

      raise "Missing the required parameter 'db_system_id' when calling list_db_system_patches." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}/patches'.sub('{dbSystemId}', db_system_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Gets a list of the shapes that can be used to launch a new DB System. The shape determines resources to allocate to the DB system - CPU cores and memory for VM shapes; CPU cores, memory and storage for non-VM (or bare metal) shapes.
    # @param [String] availability_domain The name of the Availability Domain.
    # @param [String] compartment_id The compartment [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The pagination token to continue listing from.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DbSystemShapeSummary DbSystemShapeSummary}>
    def list_db_system_shapes(availability_domain, compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_system_shapes.' if logger

      raise "Missing the required parameter 'availability_domain' when calling list_db_system_shapes." if availability_domain.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_db_system_shapes." if compartment_id.nil?

      path = '/dbSystemShapes'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:availabilityDomain] = availability_domain
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Gets a list of the DB Systems in the specified compartment. You can specify a backupId to list only the DB Systems that support creating a database using this backup in this compartment.
    #
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :backup_id The OCID of the backup. Specify a backupId to list only the DB Systems that support creating a database using this backup in this compartment.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DbSystemSummary DbSystemSummary}>
    def list_db_systems(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_systems.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_db_systems." if compartment_id.nil?

      path = '/dbSystems'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:backupId] = opts[:backup_id] if opts[:backup_id]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Gets a list of supported Oracle database versions.
    # @param [String] compartment_id The compartment [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return.
    # @option opts [String] :page The pagination token to continue listing from.
    # @option opts [String] :db_system_shape If provided, filters the results to the set of database versions which are supported for the given shape.
    # @option opts [String] :db_system_id The DB system OCID. If provided, filters the results to the set of database versions which are supported for the DB system.
    # @return [Response] A Response object with data of type Array<{OCI::Database::Models::DbVersionSummary DbVersionSummary}>
    def list_db_versions(compartment_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#list_db_versions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_db_versions." if compartment_id.nil?

      path = '/dbVersions'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:dbSystemShape] = opts[:db_system_shape] if opts[:db_system_shape]
      query_params[:dbSystemId] = opts[:db_system_id] if opts[:db_system_id]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

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


    # Reinstates the database identified by the `databaseId` parameter into the standby role in a Data Guard association.
    #
    # @param [String] database_id The database [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [String] data_guard_association_id The Data Guard association's [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::ReinstateDataGuardAssociationDetails] reinstate_data_guard_association_details A request to reinstate a database in a standby role.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DataGuardAssociation DataGuardAssociation}
    def reinstate_data_guard_association(database_id, data_guard_association_id, reinstate_data_guard_association_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#reinstate_data_guard_association.' if logger

      raise "Missing the required parameter 'database_id' when calling reinstate_data_guard_association." if database_id.nil?
      raise "Missing the required parameter 'data_guard_association_id' when calling reinstate_data_guard_association." if data_guard_association_id.nil?
      raise "Missing the required parameter 'reinstate_data_guard_association_details' when calling reinstate_data_guard_association." if reinstate_data_guard_association_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)
      raise "Parameter value for 'data_guard_association_id' must not be blank" if OCI::Internal::Util.blank_string?(data_guard_association_id)

      path = '/databases/{databaseId}/dataGuardAssociations/{dataGuardAssociationId}/actions/reinstate'.sub('{databaseId}', database_id.to_s).sub('{dataGuardAssociationId}', data_guard_association_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

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


    # Restore a Database based on the request parameters you provide.
    #
    # @param [String] database_id The database [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::RestoreDatabaseDetails] restore_database_details Request to perform database restore.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::Database Database}
    def restore_database(database_id, restore_database_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#restore_database.' if logger

      raise "Missing the required parameter 'database_id' when calling restore_database." if database_id.nil?
      raise "Missing the required parameter 'restore_database_details' when calling restore_database." if restore_database_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}/actions/restore'.sub('{databaseId}', database_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

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


    # Performs a switchover to transition the primary database of a Data Guard association into a standby role. The
    # standby database associated with the `dataGuardAssociationId` assumes the primary database role.
    #
    # A switchover guarantees no data loss.
    #
    # @param [String] database_id The database [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [String] data_guard_association_id The Data Guard association's [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::SwitchoverDataGuardAssociationDetails] switchover_data_guard_association_details Request to swtichover a primary to a standby.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DataGuardAssociation DataGuardAssociation}
    def switchover_data_guard_association(database_id, data_guard_association_id, switchover_data_guard_association_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#switchover_data_guard_association.' if logger

      raise "Missing the required parameter 'database_id' when calling switchover_data_guard_association." if database_id.nil?
      raise "Missing the required parameter 'data_guard_association_id' when calling switchover_data_guard_association." if data_guard_association_id.nil?
      raise "Missing the required parameter 'switchover_data_guard_association_details' when calling switchover_data_guard_association." if switchover_data_guard_association_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)
      raise "Parameter value for 'data_guard_association_id' must not be blank" if OCI::Internal::Util.blank_string?(data_guard_association_id)

      path = '/databases/{databaseId}/dataGuardAssociations/{dataGuardAssociationId}/actions/switchover'.sub('{databaseId}', database_id.to_s).sub('{dataGuardAssociationId}', data_guard_association_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

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


    # Terminates a DB System and permanently deletes it and any databases running on it, and any storage volumes attached to it. The database data is local to the DB System and will be lost when the system is terminated. Oracle recommends that you back up any data in the DB System prior to terminating it.
    # @param [String] db_system_id The DB System [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def terminate_db_system(db_system_id, opts = {})
      logger.debug 'Calling operation DatabaseClient#terminate_db_system.' if logger

      raise "Missing the required parameter 'db_system_id' when calling terminate_db_system." if db_system_id.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}'.sub('{dbSystemId}', db_system_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

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


    # Update a Database based on the request parameters you provide.
    #
    # @param [String] database_id The database [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDatabaseDetails] update_database_details Request to perform database update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::Database Database}
    def update_database(database_id, update_database_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_database.' if logger

      raise "Missing the required parameter 'database_id' when calling update_database." if database_id.nil?
      raise "Missing the required parameter 'update_database_details' when calling update_database." if update_database_details.nil?
      raise "Parameter value for 'database_id' must not be blank" if OCI::Internal::Util.blank_string?(database_id)

      path = '/databases/{databaseId}'.sub('{databaseId}', database_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

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


    # Patches the specified dbHome.
    # @param [String] db_home_id The database home [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDbHomeDetails] update_db_home_details Request to update the properties of a DB Home.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbHome DbHome}
    def update_db_home(db_home_id, update_db_home_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_db_home.' if logger

      raise "Missing the required parameter 'db_home_id' when calling update_db_home." if db_home_id.nil?
      raise "Missing the required parameter 'update_db_home_details' when calling update_db_home." if update_db_home_details.nil?
      raise "Parameter value for 'db_home_id' must not be blank" if OCI::Internal::Util.blank_string?(db_home_id)

      path = '/dbHomes/{dbHomeId}'.sub('{dbHomeId}', db_home_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

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


    # Updates the properties of a DB System, such as the CPU core count.
    # @param [String] db_system_id The DB System [OCID](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Database::Models::UpdateDbSystemDetails] update_db_system_details Request to update the properties of a DB System.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Database::Models::DbSystem DbSystem}
    def update_db_system(db_system_id, update_db_system_details, opts = {})
      logger.debug 'Calling operation DatabaseClient#update_db_system.' if logger

      raise "Missing the required parameter 'db_system_id' when calling update_db_system." if db_system_id.nil?
      raise "Missing the required parameter 'update_db_system_details' when calling update_db_system." if update_db_system_details.nil?
      raise "Parameter value for 'db_system_id' must not be blank" if OCI::Internal::Util.blank_string?(db_system_id)

      path = '/dbSystems/{dbSystemId}'.sub('{dbSystemId}', db_system_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

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

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)
      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
