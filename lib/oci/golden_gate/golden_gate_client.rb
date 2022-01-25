# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Oracle Cloud Infrastructure GoldenGate APIs to perform data replication operations.
  class GoldenGate::GoldenGateClient
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


    # Creates a new GoldenGateClient.
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
        @endpoint = endpoint + '/20200407'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "GoldenGateClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://goldengate.{region}.oci.{secondLevelDomain}') + '/20200407'
      logger.info "GoldenGateClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Cancels a Deployment Backup creation process.
    # @param [String] deployment_backup_id A unique DeploymentBackup identifier.
    #
    # @param [OCI::GoldenGate::Models::CancelDeploymentBackupDetails] cancel_deployment_backup_details A placeholder for any additional metadata to describe the deployment backup cancel.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried, in case of a timeout or server error, without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request is rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/cancel_deployment_backup.rb.html) to see an example of how to use cancel_deployment_backup API.
    def cancel_deployment_backup(deployment_backup_id, cancel_deployment_backup_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#cancel_deployment_backup.' if logger

      raise "Missing the required parameter 'deployment_backup_id' when calling cancel_deployment_backup." if deployment_backup_id.nil?
      raise "Missing the required parameter 'cancel_deployment_backup_details' when calling cancel_deployment_backup." if cancel_deployment_backup_details.nil?
      raise "Parameter value for 'deployment_backup_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_backup_id)

      path = '/deploymentBackups/{deploymentBackupId}/actions/cancel'.sub('{deploymentBackupId}', deployment_backup_id.to_s)
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

      post_body = @api_client.object_to_http_body(cancel_deployment_backup_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#cancel_deployment_backup') do
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


    # Moves the DatabaseRegistration into a different compartment within the same tenancy. When provided, If-Match is checked against ETag values of the resource.  For information about moving resources between compartments, see [Moving Resources Between Compartments](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] database_registration_id A unique DatabaseRegistration identifier.
    #
    # @param [OCI::GoldenGate::Models::ChangeDatabaseRegistrationCompartmentDetails] change_database_registration_compartment_details Properties to change the compartment of a DatabaseRegistration.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried, in case of a timeout or server error, without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request is rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/change_database_registration_compartment.rb.html) to see an example of how to use change_database_registration_compartment API.
    def change_database_registration_compartment(database_registration_id, change_database_registration_compartment_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#change_database_registration_compartment.' if logger

      raise "Missing the required parameter 'database_registration_id' when calling change_database_registration_compartment." if database_registration_id.nil?
      raise "Missing the required parameter 'change_database_registration_compartment_details' when calling change_database_registration_compartment." if change_database_registration_compartment_details.nil?
      raise "Parameter value for 'database_registration_id' must not be blank" if OCI::Internal::Util.blank_string?(database_registration_id)

      path = '/databaseRegistrations/{databaseRegistrationId}/actions/changeCompartment'.sub('{databaseRegistrationId}', database_registration_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_database_registration_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#change_database_registration_compartment') do
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


    # Moves a DeploymentBackup into a different compartment within the same tenancy.  When provided, If-Match is checked against ETag values of the resource.  For information about moving resources between compartments, see [Moving Resources Between Compartments](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] deployment_backup_id A unique DeploymentBackup identifier.
    #
    # @param [OCI::GoldenGate::Models::ChangeDeploymentBackupCompartmentDetails] change_deployment_backup_compartment_details Properties to change the compartment of a DeploymentBackup.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried, in case of a timeout or server error, without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request is rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/change_deployment_backup_compartment.rb.html) to see an example of how to use change_deployment_backup_compartment API.
    def change_deployment_backup_compartment(deployment_backup_id, change_deployment_backup_compartment_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#change_deployment_backup_compartment.' if logger

      raise "Missing the required parameter 'deployment_backup_id' when calling change_deployment_backup_compartment." if deployment_backup_id.nil?
      raise "Missing the required parameter 'change_deployment_backup_compartment_details' when calling change_deployment_backup_compartment." if change_deployment_backup_compartment_details.nil?
      raise "Parameter value for 'deployment_backup_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_backup_id)

      path = '/deploymentBackups/{deploymentBackupId}/actions/changeCompartment'.sub('{deploymentBackupId}', deployment_backup_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_deployment_backup_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#change_deployment_backup_compartment') do
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


    # Moves the Deployment into a different compartment within the same tenancy.  When provided, If-Match is checked against ETag values of the resource.  For information about moving resources between compartments, see [Moving Resources Between Compartments](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] deployment_id A unique Deployment identifier.
    #
    # @param [OCI::GoldenGate::Models::ChangeDeploymentCompartmentDetails] change_deployment_compartment_details Properties to change the compartment of a Deployment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried, in case of a timeout or server error, without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request is rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/change_deployment_compartment.rb.html) to see an example of how to use change_deployment_compartment API.
    def change_deployment_compartment(deployment_id, change_deployment_compartment_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#change_deployment_compartment.' if logger

      raise "Missing the required parameter 'deployment_id' when calling change_deployment_compartment." if deployment_id.nil?
      raise "Missing the required parameter 'change_deployment_compartment_details' when calling change_deployment_compartment." if change_deployment_compartment_details.nil?
      raise "Parameter value for 'deployment_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_id)

      path = '/deployments/{deploymentId}/actions/changeCompartment'.sub('{deploymentId}', deployment_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_deployment_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#change_deployment_compartment') do
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


    # Creates a new DatabaseRegistration.
    #
    # @param [OCI::GoldenGate::Models::CreateDatabaseRegistrationDetails] create_database_registration_details Specification of the DatabaseRegistration to create.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried, in case of a timeout or server error, without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request is rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type {OCI::GoldenGate::Models::DatabaseRegistration DatabaseRegistration}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/create_database_registration.rb.html) to see an example of how to use create_database_registration API.
    def create_database_registration(create_database_registration_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#create_database_registration.' if logger

      raise "Missing the required parameter 'create_database_registration_details' when calling create_database_registration." if create_database_registration_details.nil?

      path = '/databaseRegistrations'
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

      post_body = @api_client.object_to_http_body(create_database_registration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#create_database_registration') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::GoldenGate::Models::DatabaseRegistration'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new Deployment.
    #
    # @param [OCI::GoldenGate::Models::CreateDeploymentDetails] create_deployment_details Specifications to create the Deployment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried, in case of a timeout or server error, without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request is rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type {OCI::GoldenGate::Models::Deployment Deployment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/create_deployment.rb.html) to see an example of how to use create_deployment API.
    def create_deployment(create_deployment_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#create_deployment.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#create_deployment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::GoldenGate::Models::Deployment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new DeploymentBackup.
    # @param [OCI::GoldenGate::Models::CreateDeploymentBackupDetails] create_deployment_backup_details Specification of the DeploymentBackup to create.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried, in case of a timeout or server error, without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request is rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/create_deployment_backup.rb.html) to see an example of how to use create_deployment_backup API.
    def create_deployment_backup(create_deployment_backup_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#create_deployment_backup.' if logger

      raise "Missing the required parameter 'create_deployment_backup_details' when calling create_deployment_backup." if create_deployment_backup_details.nil?

      path = '/deploymentBackups'
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

      post_body = @api_client.object_to_http_body(create_deployment_backup_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#create_deployment_backup') do
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


    # Deletes a DatabaseRegistration.
    #
    # @param [String] database_registration_id A unique DatabaseRegistration identifier.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/delete_database_registration.rb.html) to see an example of how to use delete_database_registration API.
    def delete_database_registration(database_registration_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#delete_database_registration.' if logger

      raise "Missing the required parameter 'database_registration_id' when calling delete_database_registration." if database_registration_id.nil?
      raise "Parameter value for 'database_registration_id' must not be blank" if OCI::Internal::Util.blank_string?(database_registration_id)

      path = '/databaseRegistrations/{databaseRegistrationId}'.sub('{databaseRegistrationId}', database_registration_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#delete_database_registration') do
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


    # Deletes the Deployment.
    #
    # @param [String] deployment_id A unique Deployment identifier.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/delete_deployment.rb.html) to see an example of how to use delete_deployment API.
    def delete_deployment(deployment_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#delete_deployment.' if logger

      raise "Missing the required parameter 'deployment_id' when calling delete_deployment." if deployment_id.nil?
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#delete_deployment') do
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


    # Deletes a DeploymentBackup.
    #
    # @param [String] deployment_backup_id A unique DeploymentBackup identifier.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/delete_deployment_backup.rb.html) to see an example of how to use delete_deployment_backup API.
    def delete_deployment_backup(deployment_backup_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#delete_deployment_backup.' if logger

      raise "Missing the required parameter 'deployment_backup_id' when calling delete_deployment_backup." if deployment_backup_id.nil?
      raise "Parameter value for 'deployment_backup_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_backup_id)

      path = '/deploymentBackups/{deploymentBackupId}'.sub('{deploymentBackupId}', deployment_backup_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#delete_deployment_backup') do
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


    # Retrieves a DatabaseRegistration.
    #
    # @param [String] database_registration_id A unique DatabaseRegistration identifier.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type {OCI::GoldenGate::Models::DatabaseRegistration DatabaseRegistration}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/get_database_registration.rb.html) to see an example of how to use get_database_registration API.
    def get_database_registration(database_registration_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#get_database_registration.' if logger

      raise "Missing the required parameter 'database_registration_id' when calling get_database_registration." if database_registration_id.nil?
      raise "Parameter value for 'database_registration_id' must not be blank" if OCI::Internal::Util.blank_string?(database_registration_id)

      path = '/databaseRegistrations/{databaseRegistrationId}'.sub('{databaseRegistrationId}', database_registration_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#get_database_registration') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::GoldenGate::Models::DatabaseRegistration'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves a deployment.
    #
    # @param [String] deployment_id A unique Deployment identifier.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type {OCI::GoldenGate::Models::Deployment Deployment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/get_deployment.rb.html) to see an example of how to use get_deployment API.
    def get_deployment(deployment_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#get_deployment.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#get_deployment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::GoldenGate::Models::Deployment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves a DeploymentBackup.
    #
    # @param [String] deployment_backup_id A unique DeploymentBackup identifier.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type {OCI::GoldenGate::Models::DeploymentBackup DeploymentBackup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/get_deployment_backup.rb.html) to see an example of how to use get_deployment_backup API.
    def get_deployment_backup(deployment_backup_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#get_deployment_backup.' if logger

      raise "Missing the required parameter 'deployment_backup_id' when calling get_deployment_backup." if deployment_backup_id.nil?
      raise "Parameter value for 'deployment_backup_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_backup_id)

      path = '/deploymentBackups/{deploymentBackupId}'.sub('{deploymentBackupId}', deployment_backup_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#get_deployment_backup') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::GoldenGate::Models::DeploymentBackup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves a deployment upgrade.
    #
    # @param [String] deployment_upgrade_id A unique Deployment Upgrade identifier.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type {OCI::GoldenGate::Models::DeploymentUpgrade DeploymentUpgrade}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/get_deployment_upgrade.rb.html) to see an example of how to use get_deployment_upgrade API.
    def get_deployment_upgrade(deployment_upgrade_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#get_deployment_upgrade.' if logger

      raise "Missing the required parameter 'deployment_upgrade_id' when calling get_deployment_upgrade." if deployment_upgrade_id.nil?
      raise "Parameter value for 'deployment_upgrade_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_upgrade_id)

      path = '/deploymentUpgrades/{deploymentUpgradeId}'.sub('{deploymentUpgradeId}', deployment_upgrade_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#get_deployment_upgrade') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::GoldenGate::Models::DeploymentUpgrade'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve the WorkRequest identified by the given OCID.
    #
    # @param [String] work_request_id The ID of the asynchronous request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type {OCI::GoldenGate::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::GoldenGate::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the DatabaseRegistrations in the compartment.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state A filter to return only the resources that match the 'lifecycleState' given.
    #
    # @option opts [String] :display_name A filter to return only the resources that match the entire 'displayName' given.
    #
    # @option opts [Integer] :limit The maximum number of items to return.
    #    (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    #
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #    (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. Default order for 'timeCreated' is descending.  Default order for 'displayName' is ascending. If no value is specified timeCreated is the default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type {OCI::GoldenGate::Models::DatabaseRegistrationCollection DatabaseRegistrationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/list_database_registrations.rb.html) to see an example of how to use list_database_registrations API.
    def list_database_registrations(compartment_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#list_database_registrations.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_database_registrations." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::GoldenGate::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::GoldenGate::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::GoldenGate::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::GoldenGate::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/databaseRegistrations'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#list_database_registrations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::GoldenGate::Models::DatabaseRegistrationCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the Backups in a compartment.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :deployment_id The ID of the deployment in which to list resources.
    #
    # @option opts [String] :lifecycle_state A filter to return only the resources that match the 'lifecycleState' given.
    #
    # @option opts [String] :display_name A filter to return only the resources that match the entire 'displayName' given.
    #
    # @option opts [Integer] :limit The maximum number of items to return.
    #    (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    #
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #    (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. Default order for 'timeCreated' is descending.  Default order for 'displayName' is ascending. If no value is specified timeCreated is the default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type {OCI::GoldenGate::Models::DeploymentBackupCollection DeploymentBackupCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/list_deployment_backups.rb.html) to see an example of how to use list_deployment_backups API.
    def list_deployment_backups(compartment_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#list_deployment_backups.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_deployment_backups." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::GoldenGate::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::GoldenGate::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::GoldenGate::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::GoldenGate::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/deploymentBackups'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:deploymentId] = opts[:deployment_id] if opts[:deployment_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#list_deployment_backups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::GoldenGate::Models::DeploymentBackupCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the Deployment Upgrades in a compartment.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :deployment_id The ID of the deployment in which to list resources.
    #
    # @option opts [String] :lifecycle_state A filter to return only the resources that match the 'lifecycleState' given.
    #
    # @option opts [String] :display_name A filter to return only the resources that match the entire 'displayName' given.
    #
    # @option opts [Integer] :limit The maximum number of items to return.
    #    (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    #
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #    (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. Default order for 'timeCreated' is descending.  Default order for 'displayName' is ascending. If no value is specified timeCreated is the default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type {OCI::GoldenGate::Models::DeploymentUpgradeCollection DeploymentUpgradeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/list_deployment_upgrades.rb.html) to see an example of how to use list_deployment_upgrades API.
    def list_deployment_upgrades(compartment_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#list_deployment_upgrades.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_deployment_upgrades." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::GoldenGate::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::GoldenGate::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::GoldenGate::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::GoldenGate::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/deploymentUpgrades'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:deploymentId] = opts[:deployment_id] if opts[:deployment_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#list_deployment_upgrades') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::GoldenGate::Models::DeploymentUpgradeCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the Deployments in a compartment.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state A filter to return only the resources that match the 'lifecycleState' given.
    #
    # @option opts [String] :lifecycle_sub_state A filter to return only the resources that match the 'lifecycleSubState' given.
    #
    # @option opts [String] :display_name A filter to return only the resources that match the entire 'displayName' given.
    #
    # @option opts [String] :fqdn A filter to return only the resources that match the 'fqdn' given.
    #
    # @option opts [Integer] :limit The maximum number of items to return.
    #    (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    #
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'.
    #    (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order can be provided. Default order for 'timeCreated' is descending.  Default order for 'displayName' is ascending. If no value is specified timeCreated is the default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type {OCI::GoldenGate::Models::DeploymentCollection DeploymentCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/list_deployments.rb.html) to see an example of how to use list_deployments API.
    def list_deployments(compartment_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#list_deployments.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_deployments." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::GoldenGate::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::GoldenGate::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:lifecycle_sub_state] && !OCI::GoldenGate::Models::LIFECYCLE_SUB_STATE_ENUM.include?(opts[:lifecycle_sub_state])
        raise 'Invalid value for "lifecycle_sub_state", must be one of the values in OCI::GoldenGate::Models::LIFECYCLE_SUB_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::GoldenGate::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::GoldenGate::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/deployments'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:lifecycleSubState] = opts[:lifecycle_sub_state] if opts[:lifecycle_sub_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:fqdn] = opts[:fqdn] if opts[:fqdn]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#list_deployments') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::GoldenGate::Models::DeploymentCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists work request errors.
    #
    # @param [String] work_request_id The ID of the asynchronous request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of items to return.
    #    (default to 10)
    # @return [Response] A Response object with data of type Array<{OCI::GoldenGate::Models::WorkRequestError WorkRequestError}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#list_work_request_errors.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::GoldenGate::Models::WorkRequestError>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists work request logs.
    #
    # @param [String] work_request_id The ID of the asynchronous request.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of items to return.
    #    (default to 10)
    # @return [Response] A Response object with data of type Array<{OCI::GoldenGate::Models::WorkRequestLogEntry WorkRequestLogEntry}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#list_work_request_logs.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::GoldenGate::Models::WorkRequestLogEntry>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the work requests in the compartment.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :resource_id The ID of the resource in which to list resources.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    #
    # @option opts [Integer] :limit The maximum number of items to return.
    #    (default to 10)
    # @return [Response] A Response object with data of type Array<{OCI::GoldenGate::Models::WorkRequest WorkRequest}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation GoldenGateClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceId] = opts[:resource_id] if opts[:resource_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::GoldenGate::Models::WorkRequest>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Restores a Deployment from a Deployment Backup created from the same Deployment.
    # @param [String] deployment_backup_id A unique DeploymentBackup identifier.
    #
    # @param [OCI::GoldenGate::Models::RestoreDeploymentDetails] restore_deployment_details A placeholder for any additional metadata to describe the deployment restore.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried, in case of a timeout or server error, without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request is rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/restore_deployment.rb.html) to see an example of how to use restore_deployment API.
    def restore_deployment(deployment_backup_id, restore_deployment_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#restore_deployment.' if logger

      raise "Missing the required parameter 'deployment_backup_id' when calling restore_deployment." if deployment_backup_id.nil?
      raise "Missing the required parameter 'restore_deployment_details' when calling restore_deployment." if restore_deployment_details.nil?
      raise "Parameter value for 'deployment_backup_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_backup_id)

      path = '/deploymentBackups/{deploymentBackupId}/actions/restore'.sub('{deploymentBackupId}', deployment_backup_id.to_s)
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

      post_body = @api_client.object_to_http_body(restore_deployment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#restore_deployment') do
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


    # Starts a Deployment. When provided, If-Match is checked against ETag values of the resource.
    #
    # @param [String] deployment_id A unique Deployment identifier.
    #
    # @param [OCI::GoldenGate::Models::StartDeploymentDetails] start_deployment_details A placeholder for any additional metadata to describe the deployment start.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried, in case of a timeout or server error, without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request is rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/start_deployment.rb.html) to see an example of how to use start_deployment API.
    def start_deployment(deployment_id, start_deployment_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#start_deployment.' if logger

      raise "Missing the required parameter 'deployment_id' when calling start_deployment." if deployment_id.nil?
      raise "Missing the required parameter 'start_deployment_details' when calling start_deployment." if start_deployment_details.nil?
      raise "Parameter value for 'deployment_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_id)

      path = '/deployments/{deploymentId}/actions/start'.sub('{deploymentId}', deployment_id.to_s)
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

      post_body = @api_client.object_to_http_body(start_deployment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#start_deployment') do
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


    # Stops a Deployment. When provided, If-Match is checked against ETag values of the resource.
    #
    # @param [String] deployment_id A unique Deployment identifier.
    #
    # @param [OCI::GoldenGate::Models::StopDeploymentDetails] stop_deployment_details A placeholder for any additional metadata to describe the deployment stop.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried, in case of a timeout or server error, without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request is rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/stop_deployment.rb.html) to see an example of how to use stop_deployment API.
    def stop_deployment(deployment_id, stop_deployment_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#stop_deployment.' if logger

      raise "Missing the required parameter 'deployment_id' when calling stop_deployment." if deployment_id.nil?
      raise "Missing the required parameter 'stop_deployment_details' when calling stop_deployment." if stop_deployment_details.nil?
      raise "Parameter value for 'deployment_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_id)

      path = '/deployments/{deploymentId}/actions/stop'.sub('{deploymentId}', deployment_id.to_s)
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

      post_body = @api_client.object_to_http_body(stop_deployment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#stop_deployment') do
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


    # Updates the DatabaseRegistration.
    #
    # @param [String] database_registration_id A unique DatabaseRegistration identifier.
    #
    # @param [OCI::GoldenGate::Models::UpdateDatabaseRegistrationDetails] update_database_registration_details The new DatabaseRegistration specifications to apply.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/update_database_registration.rb.html) to see an example of how to use update_database_registration API.
    def update_database_registration(database_registration_id, update_database_registration_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#update_database_registration.' if logger

      raise "Missing the required parameter 'database_registration_id' when calling update_database_registration." if database_registration_id.nil?
      raise "Missing the required parameter 'update_database_registration_details' when calling update_database_registration." if update_database_registration_details.nil?
      raise "Parameter value for 'database_registration_id' must not be blank" if OCI::Internal::Util.blank_string?(database_registration_id)

      path = '/databaseRegistrations/{databaseRegistrationId}'.sub('{databaseRegistrationId}', database_registration_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_database_registration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#update_database_registration') do
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


    # Modifies a Deployment.
    #
    # @param [String] deployment_id A unique Deployment identifier.
    #
    # @param [OCI::GoldenGate::Models::UpdateDeploymentDetails] update_deployment_details The information to be updated.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/update_deployment.rb.html) to see an example of how to use update_deployment API.
    def update_deployment(deployment_id, update_deployment_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#update_deployment.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#update_deployment') do
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


    # Modifies a Deployment Backup.
    #
    # @param [String] deployment_backup_id A unique DeploymentBackup identifier.
    #
    # @param [OCI::GoldenGate::Models::UpdateDeploymentBackupDetails] update_deployment_backup_details The information to be updated.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @return [Response] A Response object with data of type {OCI::GoldenGate::Models::DeploymentBackup DeploymentBackup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/update_deployment_backup.rb.html) to see an example of how to use update_deployment_backup API.
    def update_deployment_backup(deployment_backup_id, update_deployment_backup_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#update_deployment_backup.' if logger

      raise "Missing the required parameter 'deployment_backup_id' when calling update_deployment_backup." if deployment_backup_id.nil?
      raise "Missing the required parameter 'update_deployment_backup_details' when calling update_deployment_backup." if update_deployment_backup_details.nil?
      raise "Parameter value for 'deployment_backup_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_backup_id)

      path = '/deploymentBackups/{deploymentBackupId}'.sub('{deploymentBackupId}', deployment_backup_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_deployment_backup_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#update_deployment_backup') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::GoldenGate::Models::DeploymentBackup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Upgrade a Deployment. When provided, If-Match is checked against ETag values of the resource.
    #
    # @param [String] deployment_id A unique Deployment identifier.
    #
    # @param [OCI::GoldenGate::Models::UpgradeDeploymentDetails] upgrade_deployment_details A placeholder for any additional metadata to describe the deployment upgrade.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match` parameter to the value of the etag from a previous GET or POST response for that resource.  The resource is updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried, in case of a timeout or server error, without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations. For example, if a resource has been deleted and purged from the system, then a retry of the original creation request is rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/goldengate/upgrade_deployment.rb.html) to see an example of how to use upgrade_deployment API.
    def upgrade_deployment(deployment_id, upgrade_deployment_details, opts = {})
      logger.debug 'Calling operation GoldenGateClient#upgrade_deployment.' if logger

      raise "Missing the required parameter 'deployment_id' when calling upgrade_deployment." if deployment_id.nil?
      raise "Missing the required parameter 'upgrade_deployment_details' when calling upgrade_deployment." if upgrade_deployment_details.nil?
      raise "Parameter value for 'deployment_id' must not be blank" if OCI::Internal::Util.blank_string?(deployment_id)

      path = '/deployments/{deploymentId}/actions/upgrade'.sub('{deploymentId}', deployment_id.to_s)
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

      post_body = @api_client.object_to_http_body(upgrade_deployment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'GoldenGateClient#upgrade_deployment') do
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

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)

      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
