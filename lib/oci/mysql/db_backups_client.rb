# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The API for the MySQL Database Service
  class Mysql::DbBackupsClient
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


    # Creates a new DbBackupsClient.
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
      logger.info "DbBackupsClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://mysql.{region}.ocp.{secondLevelDomain}') + '/20190415'
      logger.info "DbBackupsClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Create a backup of a DB System.
    #
    # @param [OCI::Mysql::Models::CreateBackupDetails] create_backup_details Create a Backup of a DB System.
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
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::Backup Backup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/create_backup.rb.html) to see an example of how to use create_backup API.
    def create_backup(create_backup_details, opts = {})
      logger.debug 'Calling operation DbBackupsClient#create_backup.' if logger

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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_backup_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbBackupsClient#create_backup') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::Backup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Delete a Backup.
    #
    # @param [String] backup_id The OCID of the Backup
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/delete_backup.rb.html) to see an example of how to use delete_backup API.
    def delete_backup(backup_id, opts = {})
      logger.debug 'Calling operation DbBackupsClient#delete_backup.' if logger

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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbBackupsClient#delete_backup') do
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


    # Get information about the specified Backup
    # @param [String] backup_id The OCID of the Backup
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
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::Backup Backup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/get_backup.rb.html) to see an example of how to use get_backup API.
    def get_backup(backup_id, opts = {})
      logger.debug 'Calling operation DbBackupsClient#get_backup.' if logger

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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbBackupsClient#get_backup') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::Backup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get a list of DB System backups.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :backup_id Backup OCID
    # @option opts [String] :lifecycle_state Backup Lifecycle State (default to AVAILABLE)
    # @option opts [String] :db_system_id The DB System [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @option opts [String] :display_name A filter to return only the resource matching the given display name exactly.
    # @option opts [String] :creation_type Backup creationType
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Time fields are default ordered as descending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, displayName
    # @option opts [String] :sort_order The sort order to use (ASC or DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return in a paginated list call. For information about pagination, see
    #   [List Pagination](https://docs.cloud.oracle.com/#API/Concepts/usingapi.htm#List_Pagination).
    #    (default to 100)
    # @option opts [String] :page The value of the `opc-next-page` or `opc-prev-page` response header from
    #   the previous list call. For information about pagination, see [List
    #   Pagination](https://docs.cloud.oracle.com/#API/Concepts/usingapi.htm#List_Pagination).
    #
    # @return [Response] A Response object with data of type Array<{OCI::Mysql::Models::BackupSummary BackupSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/list_backups.rb.html) to see an example of how to use list_backups API.
    def list_backups(compartment_id, opts = {})
      logger.debug 'Calling operation DbBackupsClient#list_backups.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_backups." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Mysql::Models::Backup::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Mysql::Models::Backup::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:creation_type] && !OCI::Mysql::Models::Backup::CREATION_TYPE_ENUM.include?(opts[:creation_type])
        raise 'Invalid value for "creation_type", must be one of the values in OCI::Mysql::Models::Backup::CREATION_TYPE_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/backups'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:backupId] = opts[:backup_id] if opts[:backup_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:dbSystemId] = opts[:db_system_id] if opts[:db_system_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:creationType] = opts[:creation_type] if opts[:creation_type]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbBackupsClient#list_backups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Mysql::Models::BackupSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Update the metadata of a Backup. Metadata such as the displayName or description
    # @param [String] backup_id The OCID of the Backup
    # @param [OCI::Mysql::Models::UpdateBackupDetails] update_backup_details Request to update a Backup's metadata.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/mysql/update_backup.rb.html) to see an example of how to use update_backup API.
    def update_backup(backup_id, update_backup_details, opts = {})
      logger.debug 'Calling operation DbBackupsClient#update_backup.' if logger

      raise "Missing the required parameter 'backup_id' when calling update_backup." if backup_id.nil?
      raise "Missing the required parameter 'update_backup_details' when calling update_backup." if update_backup_details.nil?
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_backup_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DbBackupsClient#update_backup') do
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
