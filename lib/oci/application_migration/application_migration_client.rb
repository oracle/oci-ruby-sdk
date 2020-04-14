# Copyright (c) 2016, 2020, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API for the Application Migration service. Use this API to migrate applications from Oracle Cloud Infrastructure - Classic to Oracle Cloud Infrastructure.
  class ApplicationMigration::ApplicationMigrationClient
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


    # Creates a new ApplicationMigrationClient.
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

      if endpoint
        @endpoint = endpoint + '/20191031'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "ApplicationMigrationClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://applicationmigration.{region}.oci.{secondLevelDomain}') + '/20191031'
      logger.info "ApplicationMigrationClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Cancels the specified work request
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous `GET` or `POST` response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def cancel_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#cancel_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling cancel_work_request." if work_request_id.nil?
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#cancel_work_request') do
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


    # Moves a Migration into a different compartment.
    # @param [String] migration_id The application OCID
    # @param [OCI::ApplicationMigration::Models::ChangeCompartmentDetails] change_migration_compartment_details The updated compartment details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous `GET` or `POST` response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of retrying the same action. Retry tokens expire after
    #   24 hours, but can be invalidated before then due to conflicting operations. For example,
    #   if a resource has been deleted and purged from the system, then a retry of the original
    #   creation request may be rejected.
    #
    # @return [Response] A Response object with data of type nil
    def change_migration_compartment(migration_id, change_migration_compartment_details, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#change_migration_compartment.' if logger

      raise "Missing the required parameter 'migration_id' when calling change_migration_compartment." if migration_id.nil?
      raise "Missing the required parameter 'change_migration_compartment_details' when calling change_migration_compartment." if change_migration_compartment_details.nil?
      raise "Parameter value for 'migration_id' must not be blank" if OCI::Internal::Util.blank_string?(migration_id)

      path = '/migrations/{migrationId}/actions/changeCompartment'.sub('{migrationId}', migration_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_migration_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#change_migration_compartment') do
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


    # Moves a Source into a different compartment.
    # @param [String] source_id The source OCID
    # @param [OCI::ApplicationMigration::Models::ChangeCompartmentDetails] change_source_compartment_details The updated compartment details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous `GET` or `POST` response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of retrying the same action. Retry tokens expire after
    #   24 hours, but can be invalidated before then due to conflicting operations. For example,
    #   if a resource has been deleted and purged from the system, then a retry of the original
    #   creation request may be rejected.
    #
    # @return [Response] A Response object with data of type nil
    def change_source_compartment(source_id, change_source_compartment_details, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#change_source_compartment.' if logger

      raise "Missing the required parameter 'source_id' when calling change_source_compartment." if source_id.nil?
      raise "Missing the required parameter 'change_source_compartment_details' when calling change_source_compartment." if change_source_compartment_details.nil?
      raise "Parameter value for 'source_id' must not be blank" if OCI::Internal::Util.blank_string?(source_id)

      path = '/sources/{sourceId}/actions/changeCompartment'.sub('{sourceId}', source_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_source_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#change_source_compartment') do
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


    # Creates an application migration in the specified compartment.
    # Specify the compartment using the compartment ID.
    #
    # @param [OCI::ApplicationMigration::Models::CreateMigrationDetails] create_migration_details The properties for creating a migration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of retrying the same action. Retry tokens expire after
    #   24 hours, but can be invalidated before then due to conflicting operations. For example,
    #   if a resource has been deleted and purged from the system, then a retry of the original
    #   creation request may be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::ApplicationMigration::Models::Migration Migration}
    def create_migration(create_migration_details, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#create_migration.' if logger

      raise "Missing the required parameter 'create_migration_details' when calling create_migration." if create_migration_details.nil?

      path = '/migrations'
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

      post_body = @api_client.object_to_http_body(create_migration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#create_migration') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApplicationMigration::Models::Migration'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a migration source in the specified compartment.
    # Specify the compartment using the compartment ID.
    #
    # @param [OCI::ApplicationMigration::Models::CreateSourceDetails] create_source_details The properties for creating a source.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of retrying the same action. Retry tokens expire after
    #   24 hours, but can be invalidated before then due to conflicting operations. For example,
    #   if a resource has been deleted and purged from the system, then a retry of the original
    #   creation request may be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::ApplicationMigration::Models::Source Source}
    def create_source(create_source_details, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#create_source.' if logger

      raise "Missing the required parameter 'create_source_details' when calling create_source." if create_source_details.nil?

      path = '/sources'
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

      post_body = @api_client.object_to_http_body(create_source_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#create_source') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApplicationMigration::Models::Source'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the specified Application object.
    # @param [String] migration_id The application OCID
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous `GET` or `POST` response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_migration(migration_id, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#delete_migration.' if logger

      raise "Missing the required parameter 'migration_id' when calling delete_migration." if migration_id.nil?
      raise "Parameter value for 'migration_id' must not be blank" if OCI::Internal::Util.blank_string?(migration_id)

      path = '/migrations/{migrationId}'.sub('{migrationId}', migration_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#delete_migration') do
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


    # Deletes the specified Source object.
    # @param [String] source_id The source OCID
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous `GET` or `POST` response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_source(source_id, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#delete_source.' if logger

      raise "Missing the required parameter 'source_id' when calling delete_source." if source_id.nil?
      raise "Parameter value for 'source_id' must not be blank" if OCI::Internal::Util.blank_string?(source_id)

      path = '/sources/{sourceId}'.sub('{sourceId}', source_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#delete_source') do
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


    # Gets an application migration using the ID.
    # @param [String] migration_id The application OCID
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApplicationMigration::Models::Migration Migration}
    def get_migration(migration_id, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#get_migration.' if logger

      raise "Missing the required parameter 'migration_id' when calling get_migration." if migration_id.nil?
      raise "Parameter value for 'migration_id' must not be blank" if OCI::Internal::Util.blank_string?(migration_id)

      path = '/migrations/{migrationId}'.sub('{migrationId}', migration_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#get_migration') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApplicationMigration::Models::Migration'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a migration source using the source ID.
    # @param [String] source_id The source OCID
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApplicationMigration::Models::Source Source}
    def get_source(source_id, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#get_source.' if logger

      raise "Missing the required parameter 'source_id' when calling get_source." if source_id.nil?
      raise "Parameter value for 'source_id' must not be blank" if OCI::Internal::Util.blank_string?(source_id)

      path = '/sources/{sourceId}'.sub('{sourceId}', source_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#get_source') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApplicationMigration::Models::Source'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of a work request.
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApplicationMigration::Models::WorkRequest WorkRequest}
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApplicationMigration::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of migrations in a given compartment.
    #
    # @param [String] compartment_id The compartment OCID on which to filter.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :id The OCID on which to query for an application.
    #
    # @option opts [Integer] :limit The number of items returned in a paginated `List` call. For information about pagination, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the preceding `List` call.
    #   For information about pagination, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order, either `ASC` (ascending) or `DESC` (descending).
    #    (default to ASC)
    # @option opts [String] :sort_by Specifies the field on which to sort.
    #   By default, `TIMECREATED` is ordered descending.
    #   By default, `DISPLAYNAME` is ordered ascending. Note that you can sort only on one field.
    #    (default to DISPLAYNAME)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :display_name Display name on which to query.
    # @option opts [String] :lifecycle_state The lifecycle state on which to filter.
    # @return [Response] A Response object with data of type Array<{OCI::ApplicationMigration::Models::MigrationSummary MigrationSummary}>
    def list_migrations(compartment_id, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#list_migrations.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_migrations." if compartment_id.nil?

      if opts[:sort_order] && !OCI::ApplicationMigration::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::ApplicationMigration::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:lifecycle_state] && !OCI::ApplicationMigration::Models::MIGRATION_LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::ApplicationMigration::Models::MIGRATION_LIFECYCLE_STATES_ENUM.'
      end

      path = '/migrations'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#list_migrations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ApplicationMigration::Models::MigrationSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of applications running in the source environment. This list is generated dynamically by interrogating the source and changes as applications are started or stopped in that environment.
    #
    # @param [String] source_id The source OCID
    # @param [String] compartment_id The compartment OCID on which to filter.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [Integer] :limit The number of items returned in a paginated `List` call. For information about pagination, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the preceding `List` call.
    #   For information about pagination, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order, either `ASC` (ascending) or `DESC` (descending).
    #    (default to ASC)
    # @option opts [String] :sort_by Specifies the field on which to sort.
    #   By default, `TIMECREATED` is ordered descending.
    #   By default, `DISPLAYNAME` is ordered ascending. Note that you can sort only on one field.
    #    (default to DISPLAYNAME)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :display_name Resource name on which to query.
    # @return [Response] A Response object with data of type Array<{OCI::ApplicationMigration::Models::SourceApplicationSummary SourceApplicationSummary}>
    def list_source_applications(source_id, compartment_id, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#list_source_applications.' if logger

      raise "Missing the required parameter 'source_id' when calling list_source_applications." if source_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_source_applications." if compartment_id.nil?

      if opts[:sort_order] && !OCI::ApplicationMigration::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::ApplicationMigration::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'source_id' must not be blank" if OCI::Internal::Util.blank_string?(source_id)

      path = '/sources/{sourceId}/applications'.sub('{sourceId}', source_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#list_source_applications') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ApplicationMigration::Models::SourceApplicationSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of migration sources in a specified compartment.
    #
    # @param [String] compartment_id The compartment OCID on which to filter.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :id The OCID on which to query for a source.
    #
    # @option opts [Integer] :limit The number of items returned in a paginated `List` call. For information about pagination, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the preceding `List` call.
    #   For information about pagination, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order, either `ASC` (ascending) or `DESC` (descending).
    #    (default to ASC)
    # @option opts [String] :sort_by Specifies the field on which to sort.
    #   By default, `TIMECREATED` is ordered descending.
    #   By default, `DISPLAYNAME` is ordered ascending. Note that you can sort only on one field.
    #    (default to DISPLAYNAME)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :display_name Display name on which to query.
    # @option opts [String] :lifecycle_state The lifecycle state on which to filter.
    # @return [Response] A Response object with data of type Array<{OCI::ApplicationMigration::Models::SourceSummary SourceSummary}>
    def list_sources(compartment_id, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#list_sources.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_sources." if compartment_id.nil?

      if opts[:sort_order] && !OCI::ApplicationMigration::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::ApplicationMigration::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:lifecycle_state] && !OCI::ApplicationMigration::Models::SOURCE_LIFECYCLE_STATES_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::ApplicationMigration::Models::SOURCE_LIFECYCLE_STATES_ENUM.'
      end

      path = '/sources'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#list_sources') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ApplicationMigration::Models::SourceSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the errors for a work request.
    #
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The number of items returned in a paginated `List` call. For information about pagination, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the preceding `List` call.
    #   For information about pagination, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order, either `ASC` (ascending) or `DESC` (descending).
    #    (default to ASC)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::ApplicationMigration::Models::WorkRequestError WorkRequestError}>
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?

      if opts[:sort_order] && !OCI::ApplicationMigration::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::ApplicationMigration::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ApplicationMigration::Models::WorkRequestError>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the logs for a work request.
    #
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The number of items returned in a paginated `List` call. For information about pagination, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the preceding `List` call.
    #   For information about pagination, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_order The sort order, either `ASC` (ascending) or `DESC` (descending).
    #    (default to ASC)
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::ApplicationMigration::Models::WorkRequestLogEntry WorkRequestLogEntry}>
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?

      if opts[:sort_order] && !OCI::ApplicationMigration::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::ApplicationMigration::Models::SORT_ORDERS_ENUM.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/logs'.sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ApplicationMigration::Models::WorkRequestLogEntry>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the work requests in a compartment or for a specified resource.
    #
    # @param [String] compartment_id The compartment OCID on which to filter.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :resource_id The OCID of the resource.
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [Integer] :limit The number of items returned in a paginated `List` call. For information about pagination, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the preceding `List` call.
    #   For information about pagination, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @return [Response] A Response object with data of type Array<{OCI::ApplicationMigration::Models::WorkRequestSummary WorkRequestSummary}>
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceId] = opts[:resource_id] if opts[:resource_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::ApplicationMigration::Models::WorkRequestSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Validates target configuration and migrates a PaaS application running in a Source environment into the customers Oracle Cloud Infrastructure tenancy. This an optional action and only required if automatic start of migration was not selected when creating the migration.
    #
    # @param [String] migration_id The application OCID
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    def migrate_application(migration_id, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#migrate_application.' if logger

      raise "Missing the required parameter 'migration_id' when calling migrate_application." if migration_id.nil?
      raise "Parameter value for 'migration_id' must not be blank" if OCI::Internal::Util.blank_string?(migration_id)

      path = '/migrations/{migrationId}/actions/migrate'.sub('{migrationId}', migration_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#migrate_application') do
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


    # Update the configuration for an application migration.
    # @param [String] migration_id The application OCID
    # @param [OCI::ApplicationMigration::Models::UpdateMigrationDetails] update_migration_details Updated configuration for the migration.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of retrying the same action. Retry tokens expire after
    #   24 hours, but can be invalidated before then due to conflicting operations. For example,
    #   if a resource has been deleted and purged from the system, then a retry of the original
    #   creation request may be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous `GET` or `POST` response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def update_migration(migration_id, update_migration_details, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#update_migration.' if logger

      raise "Missing the required parameter 'migration_id' when calling update_migration." if migration_id.nil?
      raise "Missing the required parameter 'update_migration_details' when calling update_migration." if update_migration_details.nil?
      raise "Parameter value for 'migration_id' must not be blank" if OCI::Internal::Util.blank_string?(migration_id)

      path = '/migrations/{migrationId}'.sub('{migrationId}', migration_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_migration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#update_migration') do
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


    # Update source details.
    # @param [String] source_id The source OCID
    # @param [OCI::ApplicationMigration::Models::UpdateSourceDetails] update_source_details Updated configuration for the source.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous `GET` or `POST` response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def update_source(source_id, update_source_details, opts = {})
      logger.debug 'Calling operation ApplicationMigrationClient#update_source.' if logger

      raise "Missing the required parameter 'source_id' when calling update_source." if source_id.nil?
      raise "Missing the required parameter 'update_source_details' when calling update_source." if update_source_details.nil?
      raise "Parameter value for 'source_id' must not be blank" if OCI::Internal::Util.blank_string?(source_id)

      path = '/sources/{sourceId}'.sub('{sourceId}', source_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_source_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApplicationMigrationClient#update_source') do
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
