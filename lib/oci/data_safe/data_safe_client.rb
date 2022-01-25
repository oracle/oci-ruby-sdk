# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # APIs for using Oracle Data Safe.
  class DataSafe::DataSafeClient
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


    # Creates a new DataSafeClient.
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
        @endpoint = endpoint + '/20181201'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "DataSafeClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://datasafe.{region}.oci.{secondLevelDomain}') + '/20181201'
      logger.info "DataSafeClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Reactivates a previously deactivated Data Safe target database.
    #
    # @param [OCI::DataSafe::Models::ActivateTargetDatabaseDetails] activate_target_database_details The details used to reactivate a target database in Data Safe.
    # @param [String] target_database_id The OCID of the Data Safe target database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/activate_target_database.rb.html) to see an example of how to use activate_target_database API.
    def activate_target_database(activate_target_database_details, target_database_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#activate_target_database.' if logger

      raise "Missing the required parameter 'activate_target_database_details' when calling activate_target_database." if activate_target_database_details.nil?
      raise "Missing the required parameter 'target_database_id' when calling activate_target_database." if target_database_id.nil?
      raise "Parameter value for 'target_database_id' must not be blank" if OCI::Internal::Util.blank_string?(target_database_id)

      path = '/targetDatabases/{targetDatabaseId}/actions/activate'.sub('{targetDatabaseId}', target_database_id.to_s)
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

      post_body = @api_client.object_to_http_body(activate_target_database_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#activate_target_database') do
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


    # Moves the Data Safe private endpoint and its dependent resources to the specified compartment.
    # @param [String] data_safe_private_endpoint_id The OCID of the private endpoint.
    # @param [OCI::DataSafe::Models::ChangeDataSafePrivateEndpointCompartmentDetails] change_data_safe_private_endpoint_compartment_details The details used to change the compartment of a Data Safe private endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_data_safe_private_endpoint_compartment.rb.html) to see an example of how to use change_data_safe_private_endpoint_compartment API.
    def change_data_safe_private_endpoint_compartment(data_safe_private_endpoint_id, change_data_safe_private_endpoint_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_data_safe_private_endpoint_compartment.' if logger

      raise "Missing the required parameter 'data_safe_private_endpoint_id' when calling change_data_safe_private_endpoint_compartment." if data_safe_private_endpoint_id.nil?
      raise "Missing the required parameter 'change_data_safe_private_endpoint_compartment_details' when calling change_data_safe_private_endpoint_compartment." if change_data_safe_private_endpoint_compartment_details.nil?
      raise "Parameter value for 'data_safe_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(data_safe_private_endpoint_id)

      path = '/dataSafePrivateEndpoints/{dataSafePrivateEndpointId}/actions/changeCompartment'.sub('{dataSafePrivateEndpointId}', data_safe_private_endpoint_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_data_safe_private_endpoint_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_data_safe_private_endpoint_compartment') do
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


    # Moves the specified on-premises connector into a different compartment.
    # @param [String] on_prem_connector_id The OCID of the on-premises connector.
    # @param [OCI::DataSafe::Models::ChangeOnPremConnectorCompartmentDetails] change_on_prem_connector_compartment_details The details used to change the compartment of an on-premises connector.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_on_prem_connector_compartment.rb.html) to see an example of how to use change_on_prem_connector_compartment API.
    def change_on_prem_connector_compartment(on_prem_connector_id, change_on_prem_connector_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_on_prem_connector_compartment.' if logger

      raise "Missing the required parameter 'on_prem_connector_id' when calling change_on_prem_connector_compartment." if on_prem_connector_id.nil?
      raise "Missing the required parameter 'change_on_prem_connector_compartment_details' when calling change_on_prem_connector_compartment." if change_on_prem_connector_compartment_details.nil?
      raise "Parameter value for 'on_prem_connector_id' must not be blank" if OCI::Internal::Util.blank_string?(on_prem_connector_id)

      path = '/onPremConnectors/{onPremConnectorId}/actions/changeCompartment'.sub('{onPremConnectorId}', on_prem_connector_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_on_prem_connector_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_on_prem_connector_compartment') do
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


    # Moves the specified saved security assessment or future scheduled assessments into a different compartment.
    #
    # To start, call first the operation ListSecurityAssessments with filters \"type = save_schedule\". This returns the scheduleAssessmentId. Then, call this changeCompartment with the scheduleAssessmentId.
    #
    # The existing saved security assessments created due to the schedule are not moved. However, all new saves will be associated with the new compartment.
    #
    # @param [String] security_assessment_id The OCID of the security assessment.
    # @param [OCI::DataSafe::Models::ChangeSecurityAssessmentCompartmentDetails] change_security_assessment_compartment_details The details used to change the compartment of a security assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_security_assessment_compartment.rb.html) to see an example of how to use change_security_assessment_compartment API.
    def change_security_assessment_compartment(security_assessment_id, change_security_assessment_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_security_assessment_compartment.' if logger

      raise "Missing the required parameter 'security_assessment_id' when calling change_security_assessment_compartment." if security_assessment_id.nil?
      raise "Missing the required parameter 'change_security_assessment_compartment_details' when calling change_security_assessment_compartment." if change_security_assessment_compartment_details.nil?
      raise "Parameter value for 'security_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(security_assessment_id)

      path = '/securityAssessments/{securityAssessmentId}/actions/changeCompartment'.sub('{securityAssessmentId}', security_assessment_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_security_assessment_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_security_assessment_compartment') do
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


    # Moves the Data Safe target database to the specified compartment.
    # @param [String] target_database_id The OCID of the Data Safe target database.
    # @param [OCI::DataSafe::Models::ChangeTargetDatabaseCompartmentDetails] change_target_database_compartment_details Details of the move compartment request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_target_database_compartment.rb.html) to see an example of how to use change_target_database_compartment API.
    def change_target_database_compartment(target_database_id, change_target_database_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_target_database_compartment.' if logger

      raise "Missing the required parameter 'target_database_id' when calling change_target_database_compartment." if target_database_id.nil?
      raise "Missing the required parameter 'change_target_database_compartment_details' when calling change_target_database_compartment." if change_target_database_compartment_details.nil?
      raise "Parameter value for 'target_database_id' must not be blank" if OCI::Internal::Util.blank_string?(target_database_id)

      path = '/targetDatabases/{targetDatabaseId}/actions/changeCompartment'.sub('{targetDatabaseId}', target_database_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_target_database_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_target_database_compartment') do
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


    # Moves the specified saved user assessment or future scheduled assessments into a different compartment.
    # To start storing scheduled user assessments on a different compartment, first call the operation ListUserAssessments with
    # the filters \"type = save_schedule\". That call returns the scheduleAssessmentId. Then call
    # ChangeUserAssessmentCompartment with the scheduleAssessmentId. The existing saved user assessments created per the schedule
    # are not be moved. However, all new saves will be associated with the new compartment.
    #
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [OCI::DataSafe::Models::ChangeUserAssessmentCompartmentDetails] change_user_assessment_compartment_details The details used to change the compartment of a user assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_user_assessment_compartment.rb.html) to see an example of how to use change_user_assessment_compartment API.
    def change_user_assessment_compartment(user_assessment_id, change_user_assessment_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_user_assessment_compartment.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling change_user_assessment_compartment." if user_assessment_id.nil?
      raise "Missing the required parameter 'change_user_assessment_compartment_details' when calling change_user_assessment_compartment." if change_user_assessment_compartment_details.nil?
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)

      path = '/userAssessments/{userAssessmentId}/actions/changeCompartment'.sub('{userAssessmentId}', user_assessment_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_user_assessment_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_user_assessment_compartment') do
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


    # Compares two security assessments. For this comparison, a security assessment can be a saved assessment, a latest assessment, or a baseline assessment.
    # For example, you can compare saved assessment or a latest assessment against a baseline.
    #
    # @param [String] security_assessment_id The OCID of the security assessment.
    # @param [OCI::DataSafe::Models::CompareSecurityAssessmentDetails] compare_security_assessment_details Details of the security assessment comparison.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/compare_security_assessment.rb.html) to see an example of how to use compare_security_assessment API.
    def compare_security_assessment(security_assessment_id, compare_security_assessment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#compare_security_assessment.' if logger

      raise "Missing the required parameter 'security_assessment_id' when calling compare_security_assessment." if security_assessment_id.nil?
      raise "Missing the required parameter 'compare_security_assessment_details' when calling compare_security_assessment." if compare_security_assessment_details.nil?
      raise "Parameter value for 'security_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(security_assessment_id)

      path = '/securityAssessments/{securityAssessmentId}/actions/compare'.sub('{securityAssessmentId}', security_assessment_id.to_s)
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

      post_body = @api_client.object_to_http_body(compare_security_assessment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#compare_security_assessment') do
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


    # Compares two user assessments. For this comparison, a user assessment can be a saved, a latest assessment, or a baseline.
    # As an example, it can be used to compare a user assessment saved or a latest assessment with a baseline.
    #
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [OCI::DataSafe::Models::CompareUserAssessmentDetails] compare_user_assessment_details Details of the user assessment comparison.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/compare_user_assessment.rb.html) to see an example of how to use compare_user_assessment API.
    def compare_user_assessment(user_assessment_id, compare_user_assessment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#compare_user_assessment.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling compare_user_assessment." if user_assessment_id.nil?
      raise "Missing the required parameter 'compare_user_assessment_details' when calling compare_user_assessment." if compare_user_assessment_details.nil?
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)

      path = '/userAssessments/{userAssessmentId}/actions/compare'.sub('{userAssessmentId}', user_assessment_id.to_s)
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

      post_body = @api_client.object_to_http_body(compare_user_assessment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#compare_user_assessment') do
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


    # Creates a new Data Safe private endpoint.
    #
    # @param [OCI::DataSafe::Models::CreateDataSafePrivateEndpointDetails] create_data_safe_private_endpoint_details Details to create a new private endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::DataSafePrivateEndpoint DataSafePrivateEndpoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_data_safe_private_endpoint.rb.html) to see an example of how to use create_data_safe_private_endpoint API.
    def create_data_safe_private_endpoint(create_data_safe_private_endpoint_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_data_safe_private_endpoint.' if logger

      raise "Missing the required parameter 'create_data_safe_private_endpoint_details' when calling create_data_safe_private_endpoint." if create_data_safe_private_endpoint_details.nil?

      path = '/dataSafePrivateEndpoints'
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

      post_body = @api_client.object_to_http_body(create_data_safe_private_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_data_safe_private_endpoint') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::DataSafePrivateEndpoint'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new on-premises connector.
    #
    # @param [OCI::DataSafe::Models::CreateOnPremConnectorDetails] create_on_prem_connector_details The details used to create a new on-premises connector.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::OnPremConnector OnPremConnector}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_on_prem_connector.rb.html) to see an example of how to use create_on_prem_connector API.
    def create_on_prem_connector(create_on_prem_connector_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_on_prem_connector.' if logger

      raise "Missing the required parameter 'create_on_prem_connector_details' when calling create_on_prem_connector." if create_on_prem_connector_details.nil?

      path = '/onPremConnectors'
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

      post_body = @api_client.object_to_http_body(create_on_prem_connector_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_on_prem_connector') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::OnPremConnector'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new saved security assessment for one or multiple targets in a compartment. When this operation is performed,
    # it will save the latest assessments in the specified compartment. If a schedule is passed, it will persist the latest assessments,
    # at the defined date and time, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # @param [OCI::DataSafe::Models::CreateSecurityAssessmentDetails] create_security_assessment_details The details used to create a new saved security assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::SecurityAssessment SecurityAssessment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_security_assessment.rb.html) to see an example of how to use create_security_assessment API.
    def create_security_assessment(create_security_assessment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_security_assessment.' if logger

      raise "Missing the required parameter 'create_security_assessment_details' when calling create_security_assessment." if create_security_assessment_details.nil?

      path = '/securityAssessments'
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

      post_body = @api_client.object_to_http_body(create_security_assessment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_security_assessment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::SecurityAssessment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Registers the specified database with Data Safe and creates a Data Safe target database in the Data Safe Console.
    #
    # @param [OCI::DataSafe::Models::CreateTargetDatabaseDetails] create_target_database_details Details of the target database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::TargetDatabase TargetDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_target_database.rb.html) to see an example of how to use create_target_database API.
    def create_target_database(create_target_database_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_target_database.' if logger

      raise "Missing the required parameter 'create_target_database_details' when calling create_target_database." if create_target_database_details.nil?

      path = '/targetDatabases'
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

      post_body = @api_client.object_to_http_body(create_target_database_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_target_database') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::TargetDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new saved user assessment for one or multiple targets in a compartment. It saves the latest assessments in the
    # specified compartment. If a scheduled is passed in, this operation persists the latest assessments that exist at the defined
    # date and time, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # @param [OCI::DataSafe::Models::CreateUserAssessmentDetails] create_user_assessment_details The details used to create a new saved user assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::UserAssessment UserAssessment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_user_assessment.rb.html) to see an example of how to use create_user_assessment API.
    def create_user_assessment(create_user_assessment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_user_assessment.' if logger

      raise "Missing the required parameter 'create_user_assessment_details' when calling create_user_assessment." if create_user_assessment_details.nil?

      path = '/userAssessments'
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

      post_body = @api_client.object_to_http_body(create_user_assessment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_user_assessment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::UserAssessment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deactivates a target database in Data Safe.
    #
    # @param [String] target_database_id The OCID of the Data Safe target database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/deactivate_target_database.rb.html) to see an example of how to use deactivate_target_database API.
    def deactivate_target_database(target_database_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#deactivate_target_database.' if logger

      raise "Missing the required parameter 'target_database_id' when calling deactivate_target_database." if target_database_id.nil?
      raise "Parameter value for 'target_database_id' must not be blank" if OCI::Internal::Util.blank_string?(target_database_id)

      path = '/targetDatabases/{targetDatabaseId}/actions/deactivate'.sub('{targetDatabaseId}', target_database_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#deactivate_target_database') do
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


    # Deletes the specified Data Safe private endpoint.
    # @param [String] data_safe_private_endpoint_id The OCID of the private endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_data_safe_private_endpoint.rb.html) to see an example of how to use delete_data_safe_private_endpoint API.
    def delete_data_safe_private_endpoint(data_safe_private_endpoint_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_data_safe_private_endpoint.' if logger

      raise "Missing the required parameter 'data_safe_private_endpoint_id' when calling delete_data_safe_private_endpoint." if data_safe_private_endpoint_id.nil?
      raise "Parameter value for 'data_safe_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(data_safe_private_endpoint_id)

      path = '/dataSafePrivateEndpoints/{dataSafePrivateEndpointId}'.sub('{dataSafePrivateEndpointId}', data_safe_private_endpoint_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_data_safe_private_endpoint') do
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


    # Deletes the specified on-premises connector.
    # @param [String] on_prem_connector_id The OCID of the on-premises connector.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_on_prem_connector.rb.html) to see an example of how to use delete_on_prem_connector API.
    def delete_on_prem_connector(on_prem_connector_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_on_prem_connector.' if logger

      raise "Missing the required parameter 'on_prem_connector_id' when calling delete_on_prem_connector." if on_prem_connector_id.nil?
      raise "Parameter value for 'on_prem_connector_id' must not be blank" if OCI::Internal::Util.blank_string?(on_prem_connector_id)

      path = '/onPremConnectors/{onPremConnectorId}'.sub('{onPremConnectorId}', on_prem_connector_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_on_prem_connector') do
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


    # Deletes the specified saved security assessment or schedule. To delete a security assessment schedule,
    # first call the operation ListSecurityAssessments with filters \"type = save_schedule\".
    # That operation returns the scheduleAssessmentId. Then, call DeleteSecurityAssessment with the scheduleAssessmentId.
    # If the assessment being deleted is the baseline for that compartment, then it will impact all baselines in the compartment.
    #
    # @param [String] security_assessment_id The OCID of the security assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_security_assessment.rb.html) to see an example of how to use delete_security_assessment API.
    def delete_security_assessment(security_assessment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_security_assessment.' if logger

      raise "Missing the required parameter 'security_assessment_id' when calling delete_security_assessment." if security_assessment_id.nil?
      raise "Parameter value for 'security_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(security_assessment_id)

      path = '/securityAssessments/{securityAssessmentId}'.sub('{securityAssessmentId}', security_assessment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_security_assessment') do
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


    # Deregisters the specified database from Data Safe and removes the target database from the Data Safe Console.
    # @param [String] target_database_id The OCID of the Data Safe target database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_target_database.rb.html) to see an example of how to use delete_target_database API.
    def delete_target_database(target_database_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_target_database.' if logger

      raise "Missing the required parameter 'target_database_id' when calling delete_target_database." if target_database_id.nil?
      raise "Parameter value for 'target_database_id' must not be blank" if OCI::Internal::Util.blank_string?(target_database_id)

      path = '/targetDatabases/{targetDatabaseId}'.sub('{targetDatabaseId}', target_database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_target_database') do
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


    # Deletes the specified saved user assessment or schedule. To delete a user assessment schedule, first call the operation
    # ListUserAssessments with filters \"type = save_schedule\".
    # That call returns the scheduleAssessmentId. Then call DeleteUserAssessment with the scheduleAssessmentId.
    # If the assessment being deleted is the baseline for that compartment, then it will impact all baselines in the compartment.
    #
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_user_assessment.rb.html) to see an example of how to use delete_user_assessment API.
    def delete_user_assessment(user_assessment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_user_assessment.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling delete_user_assessment." if user_assessment_id.nil?
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)

      path = '/userAssessments/{userAssessmentId}'.sub('{userAssessmentId}', user_assessment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_user_assessment') do
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


    # Downloads the privilege script to grant/revoke required roles from the Data Safe account on the target database.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/download_privilege_script.rb.html) to see an example of how to use download_privilege_script API.
    def download_privilege_script(opts = {}, &block)
      logger.debug 'Calling operation DataSafeClient#download_privilege_script.' if logger


      path = '/actions/downloadPrivilegeScript'
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#download_privilege_script') do
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


    # Downloads the report of the specified security assessment. To download the security assessment report, it needs to be generated first.
    # Please use GenerateSecurityAssessmentReport to generate a downloadable report in the preferred format (PDF, XLS).
    #
    # @param [String] security_assessment_id The OCID of the security assessment.
    # @param [OCI::DataSafe::Models::DownloadSecurityAssessmentReportDetails] download_security_assessment_report_details Details of the report.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/download_security_assessment_report.rb.html) to see an example of how to use download_security_assessment_report API.
    def download_security_assessment_report(security_assessment_id, download_security_assessment_report_details, opts = {}, &block)
      logger.debug 'Calling operation DataSafeClient#download_security_assessment_report.' if logger

      raise "Missing the required parameter 'security_assessment_id' when calling download_security_assessment_report." if security_assessment_id.nil?
      raise "Missing the required parameter 'download_security_assessment_report_details' when calling download_security_assessment_report." if download_security_assessment_report_details.nil?
      raise "Parameter value for 'security_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(security_assessment_id)

      path = '/securityAssessments/{securityAssessmentId}/actions/downloadReport'.sub('{securityAssessmentId}', security_assessment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/json'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(download_security_assessment_report_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#download_security_assessment_report') do
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


    # Downloads the report of the specified user assessment. To download the user assessment report, it needs to be generated first.
    # Please use GenerateUserAssessmentReport to generate a downloadable report in the preferred format (PDF, XLS).
    #
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [OCI::DataSafe::Models::DownloadUserAssessmentReportDetails] download_user_assessment_report_details Details of the report.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/download_user_assessment_report.rb.html) to see an example of how to use download_user_assessment_report API.
    def download_user_assessment_report(user_assessment_id, download_user_assessment_report_details, opts = {}, &block)
      logger.debug 'Calling operation DataSafeClient#download_user_assessment_report.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling download_user_assessment_report." if user_assessment_id.nil?
      raise "Missing the required parameter 'download_user_assessment_report_details' when calling download_user_assessment_report." if download_user_assessment_report_details.nil?
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)

      path = '/userAssessments/{userAssessmentId}/actions/downloadReport'.sub('{userAssessmentId}', user_assessment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/json'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(download_user_assessment_report_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#download_user_assessment_report') do
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


    # Enables Data Safe in the tenancy and region.
    #
    # @param [OCI::DataSafe::Models::EnableDataSafeConfigurationDetails] enable_data_safe_configuration_details The details used to enable Data Safe.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id A filter to return only resources that match the specified compartment OCID.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/enable_data_safe_configuration.rb.html) to see an example of how to use enable_data_safe_configuration API.
    def enable_data_safe_configuration(enable_data_safe_configuration_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#enable_data_safe_configuration.' if logger

      raise "Missing the required parameter 'enable_data_safe_configuration_details' when calling enable_data_safe_configuration." if enable_data_safe_configuration_details.nil?

      path = '/configuration'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(enable_data_safe_configuration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#enable_data_safe_configuration') do
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


    # Creates and downloads the configuration of the specified on-premises connector.
    #
    # @param [OCI::DataSafe::Models::GenerateOnPremConnectorConfigurationDetails] generate_on_prem_connector_configuration_details The details used to create and download on-premises connector's configuration.
    # @param [String] on_prem_connector_id The OCID of the on-premises connector.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/generate_on_prem_connector_configuration.rb.html) to see an example of how to use generate_on_prem_connector_configuration API.
    def generate_on_prem_connector_configuration(generate_on_prem_connector_configuration_details, on_prem_connector_id, opts = {}, &block)
      logger.debug 'Calling operation DataSafeClient#generate_on_prem_connector_configuration.' if logger

      raise "Missing the required parameter 'generate_on_prem_connector_configuration_details' when calling generate_on_prem_connector_configuration." if generate_on_prem_connector_configuration_details.nil?
      raise "Missing the required parameter 'on_prem_connector_id' when calling generate_on_prem_connector_configuration." if on_prem_connector_id.nil?
      raise "Parameter value for 'on_prem_connector_id' must not be blank" if OCI::Internal::Util.blank_string?(on_prem_connector_id)

      path = '/onPremConnectors/{onPremConnectorId}/actions/generateConfiguration'.sub('{onPremConnectorId}', on_prem_connector_id.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(generate_on_prem_connector_configuration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#generate_on_prem_connector_configuration') do
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


    # Generates the report of the specified security assessment. You can get the report in PDF or XLS format.
    # After generating the report, use DownloadSecurityAssessmentReport to download it in the preferred format.
    #
    # @param [String] security_assessment_id The OCID of the security assessment.
    # @param [OCI::DataSafe::Models::GenerateSecurityAssessmentReportDetails] generate_security_assessment_report_details Details of the report.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/generate_security_assessment_report.rb.html) to see an example of how to use generate_security_assessment_report API.
    def generate_security_assessment_report(security_assessment_id, generate_security_assessment_report_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#generate_security_assessment_report.' if logger

      raise "Missing the required parameter 'security_assessment_id' when calling generate_security_assessment_report." if security_assessment_id.nil?
      raise "Missing the required parameter 'generate_security_assessment_report_details' when calling generate_security_assessment_report." if generate_security_assessment_report_details.nil?
      raise "Parameter value for 'security_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(security_assessment_id)

      path = '/securityAssessments/{securityAssessmentId}/actions/generateReport'.sub('{securityAssessmentId}', security_assessment_id.to_s)
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

      post_body = @api_client.object_to_http_body(generate_security_assessment_report_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#generate_security_assessment_report') do
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


    # Generates the report of the specified user assessment. The report is available in PDF or XLS format.
    # After generating the report, use DownloadUserAssessmentReport to download it in the preferred format.
    #
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [OCI::DataSafe::Models::GenerateUserAssessmentReportDetails] generate_user_assessment_report_details Details of the report.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/generate_user_assessment_report.rb.html) to see an example of how to use generate_user_assessment_report API.
    def generate_user_assessment_report(user_assessment_id, generate_user_assessment_report_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#generate_user_assessment_report.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling generate_user_assessment_report." if user_assessment_id.nil?
      raise "Missing the required parameter 'generate_user_assessment_report_details' when calling generate_user_assessment_report." if generate_user_assessment_report_details.nil?
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)

      path = '/userAssessments/{userAssessmentId}/actions/generateReport'.sub('{userAssessmentId}', user_assessment_id.to_s)
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

      post_body = @api_client.object_to_http_body(generate_user_assessment_report_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#generate_user_assessment_report') do
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


    # Gets the details of the Data Safe configuration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id A filter to return only resources that match the specified compartment OCID.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::DataSafeConfiguration DataSafeConfiguration}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_data_safe_configuration.rb.html) to see an example of how to use get_data_safe_configuration API.
    def get_data_safe_configuration(opts = {})
      logger.debug 'Calling operation DataSafeClient#get_data_safe_configuration.' if logger


      path = '/configuration'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_data_safe_configuration') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::DataSafeConfiguration'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the specified Data Safe private endpoint.
    # @param [String] data_safe_private_endpoint_id The OCID of the private endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::DataSafePrivateEndpoint DataSafePrivateEndpoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_data_safe_private_endpoint.rb.html) to see an example of how to use get_data_safe_private_endpoint API.
    def get_data_safe_private_endpoint(data_safe_private_endpoint_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_data_safe_private_endpoint.' if logger

      raise "Missing the required parameter 'data_safe_private_endpoint_id' when calling get_data_safe_private_endpoint." if data_safe_private_endpoint_id.nil?
      raise "Parameter value for 'data_safe_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(data_safe_private_endpoint_id)

      path = '/dataSafePrivateEndpoints/{dataSafePrivateEndpointId}'.sub('{dataSafePrivateEndpointId}', data_safe_private_endpoint_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_data_safe_private_endpoint') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::DataSafePrivateEndpoint'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the specified on-premises connector.
    # @param [String] on_prem_connector_id The OCID of the on-premises connector.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::OnPremConnector OnPremConnector}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_on_prem_connector.rb.html) to see an example of how to use get_on_prem_connector API.
    def get_on_prem_connector(on_prem_connector_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_on_prem_connector.' if logger

      raise "Missing the required parameter 'on_prem_connector_id' when calling get_on_prem_connector." if on_prem_connector_id.nil?
      raise "Parameter value for 'on_prem_connector_id' must not be blank" if OCI::Internal::Util.blank_string?(on_prem_connector_id)

      path = '/onPremConnectors/{onPremConnectorId}'.sub('{onPremConnectorId}', on_prem_connector_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_on_prem_connector') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::OnPremConnector'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the specified security assessment.
    # @param [String] security_assessment_id The OCID of the security assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::SecurityAssessment SecurityAssessment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_security_assessment.rb.html) to see an example of how to use get_security_assessment API.
    def get_security_assessment(security_assessment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_security_assessment.' if logger

      raise "Missing the required parameter 'security_assessment_id' when calling get_security_assessment." if security_assessment_id.nil?
      raise "Parameter value for 'security_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(security_assessment_id)

      path = '/securityAssessments/{securityAssessmentId}'.sub('{securityAssessmentId}', security_assessment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_security_assessment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::SecurityAssessment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the comparison report on the security assessments submitted for comparison.
    # @param [String] security_assessment_id The OCID of the security assessment.
    # @param [String] comparison_security_assessment_id The OCID of the baseline security assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::SecurityAssessmentComparison SecurityAssessmentComparison}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_security_assessment_comparison.rb.html) to see an example of how to use get_security_assessment_comparison API.
    def get_security_assessment_comparison(security_assessment_id, comparison_security_assessment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_security_assessment_comparison.' if logger

      raise "Missing the required parameter 'security_assessment_id' when calling get_security_assessment_comparison." if security_assessment_id.nil?
      raise "Missing the required parameter 'comparison_security_assessment_id' when calling get_security_assessment_comparison." if comparison_security_assessment_id.nil?
      raise "Parameter value for 'security_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(security_assessment_id)
      raise "Parameter value for 'comparison_security_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(comparison_security_assessment_id)

      path = '/securityAssessments/{securityAssessmentId}/comparison/{comparisonSecurityAssessmentId}'.sub('{securityAssessmentId}', security_assessment_id.to_s).sub('{comparisonSecurityAssessmentId}', comparison_security_assessment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_security_assessment_comparison') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::SecurityAssessmentComparison'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns the details of the specified Data Safe target database.
    #
    # @param [String] target_database_id The OCID of the Data Safe target database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::TargetDatabase TargetDatabase}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_target_database.rb.html) to see an example of how to use get_target_database API.
    def get_target_database(target_database_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_target_database.' if logger

      raise "Missing the required parameter 'target_database_id' when calling get_target_database." if target_database_id.nil?
      raise "Parameter value for 'target_database_id' must not be blank" if OCI::Internal::Util.blank_string?(target_database_id)

      path = '/targetDatabases/{targetDatabaseId}'.sub('{targetDatabaseId}', target_database_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_target_database') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::TargetDatabase'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a user assessment by identifier.
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::UserAssessment UserAssessment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_user_assessment.rb.html) to see an example of how to use get_user_assessment API.
    def get_user_assessment(user_assessment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_user_assessment.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling get_user_assessment." if user_assessment_id.nil?
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)

      path = '/userAssessments/{userAssessmentId}'.sub('{userAssessmentId}', user_assessment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_user_assessment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::UserAssessment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the comparison report for the user assessments provided.
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [String] comparison_user_assessment_id The OCID of the baseline user assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::UserAssessmentComparison UserAssessmentComparison}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_user_assessment_comparison.rb.html) to see an example of how to use get_user_assessment_comparison API.
    def get_user_assessment_comparison(user_assessment_id, comparison_user_assessment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_user_assessment_comparison.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling get_user_assessment_comparison." if user_assessment_id.nil?
      raise "Missing the required parameter 'comparison_user_assessment_id' when calling get_user_assessment_comparison." if comparison_user_assessment_id.nil?
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)
      raise "Parameter value for 'comparison_user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(comparison_user_assessment_id)

      path = '/userAssessments/{userAssessmentId}/comparison/{comparisonUserAssessmentId}'.sub('{userAssessmentId}', user_assessment_id.to_s).sub('{comparisonUserAssessmentId}', comparison_user_assessment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_user_assessment_comparison') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::UserAssessmentComparison'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the specified work request.
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of Data Safe private endpoints.
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the specified display name.
    #
    # @option opts [String] :vcn_id A filter to return only resources that match the specified VCN OCID.
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field used for sorting. Only one sorting order (sortOrder) can be specified.
    #   The default order for TIMECREATED is descending. The default order for DISPLAYNAME is ascending.
    #   The DISPLAYNAME sort order is case sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::DataSafePrivateEndpointSummary DataSafePrivateEndpointSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_data_safe_private_endpoints.rb.html) to see an example of how to use list_data_safe_private_endpoints API.
    def list_data_safe_private_endpoints(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_data_safe_private_endpoints.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_data_safe_private_endpoints." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      path = '/dataSafePrivateEndpoints'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_data_safe_private_endpoints') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::DataSafePrivateEndpointSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List all the findings from all the targets in the specified assessment.
    #
    # @param [String] security_assessment_id The OCID of the security assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :severity A filter to return only findings of a particular risk level.
    #   Allowed values are: HIGH, MEDIUM, LOW, EVALUATE, ADVISORY, PASS
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :finding_key Each finding has a key. This key is same for the finding across targets
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::FindingSummary FindingSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_findings.rb.html) to see an example of how to use list_findings API.
    def list_findings(security_assessment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_findings.' if logger

      raise "Missing the required parameter 'security_assessment_id' when calling list_findings." if security_assessment_id.nil?

      if opts[:severity] && !%w[HIGH MEDIUM LOW EVALUATE ADVISORY PASS].include?(opts[:severity])
        raise 'Invalid value for "severity", must be one of HIGH, MEDIUM, LOW, EVALUATE, ADVISORY, PASS.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end
      raise "Parameter value for 'security_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(security_assessment_id)

      path = '/securityAssessments/{securityAssessmentId}/findings'.sub('{securityAssessmentId}', security_assessment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:severity] = opts[:severity] if opts[:severity]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:findingKey] = opts[:finding_key] if opts[:finding_key]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_findings') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::FindingSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of grants for a particular user in the specified user assessment. A user grant contains details such as the
    # privilege name, type, category, and depth level. The depth level indicates how deep in the hierarchy of roles granted to
    # roles a privilege grant is. The userKey in this operation is a system-generated identifier. Perform the operation ListUsers
    # to get the userKey for a particular user.
    #
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [String] user_key The unique user key. This is a system-generated identifier. ListUsers gets the user key for a user.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :grant_key A filter to return only items that match the specified user grant key.
    # @option opts [String] :grant_name A filter to return only items that match the specified user grant name.
    # @option opts [String] :privilege_type A filter to return only items that match the specified privilege grant type.
    # @option opts [String] :privilege_category A filter to return only items that match the specified user privilege category.
    # @option opts [Integer] :depth_level A filter to return only items that match the specified user grant depth level.
    # @option opts [Integer] :depth_level_greater_than_or_equal_to A filter to return only items that are at a level greater than or equal to the specified user grant depth level.
    # @option opts [Integer] :depth_level_less_than A filter to return only items that are at a level less than the specified user grant depth level.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for grantName is ascending.
    #    (default to key)
    #   Allowed values are: grantName, grantType, privilegeCategory, depthLevel, key
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::GrantSummary GrantSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_grants.rb.html) to see an example of how to use list_grants API.
    def list_grants(user_assessment_id, user_key, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_grants.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling list_grants." if user_assessment_id.nil?
      raise "Missing the required parameter 'user_key' when calling list_grants." if user_key.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[grantName grantType privilegeCategory depthLevel key].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of grantName, grantType, privilegeCategory, depthLevel, key.'
      end
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)
      raise "Parameter value for 'user_key' must not be blank" if OCI::Internal::Util.blank_string?(user_key)

      path = '/userAssessments/{userAssessmentId}/users/{userKey}/grants'.sub('{userAssessmentId}', user_assessment_id.to_s).sub('{userKey}', user_key.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:grantKey] = opts[:grant_key] if opts[:grant_key]
      query_params[:grantName] = opts[:grant_name] if opts[:grant_name]
      query_params[:privilegeType] = opts[:privilege_type] if opts[:privilege_type]
      query_params[:privilegeCategory] = opts[:privilege_category] if opts[:privilege_category]
      query_params[:depthLevel] = opts[:depth_level] if opts[:depth_level]
      query_params[:depthLevelGreaterThanOrEqualTo] = opts[:depth_level_greater_than_or_equal_to] if opts[:depth_level_greater_than_or_equal_to]
      query_params[:depthLevelLessThan] = opts[:depth_level_less_than] if opts[:depth_level_less_than]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_grants') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::GrantSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of on-premises connectors.
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :on_prem_connector_id A filter to return only the on-premises connector that matches the specified id.
    # @option opts [String] :display_name A filter to return only resources that match the specified display name.
    #
    # @option opts [String] :on_prem_connector_lifecycle_state A filter to return only on-premises connector resources that match the specified lifecycle state.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field used for sorting. Only one sorting order (sortOrder) can be specified.
    #   The default order for TIMECREATED is descending. The default order for DISPLAYNAME is ascending.
    #   The DISPLAYNAME sort order is case sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::OnPremConnectorSummary OnPremConnectorSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_on_prem_connectors.rb.html) to see an example of how to use list_on_prem_connectors API.
    def list_on_prem_connectors(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_on_prem_connectors.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_on_prem_connectors." if compartment_id.nil?

      if opts[:on_prem_connector_lifecycle_state] && !OCI::DataSafe::Models::ON_PREM_CONNECTOR_LIFECYCLE_STATE_ENUM.include?(opts[:on_prem_connector_lifecycle_state])
        raise 'Invalid value for "on_prem_connector_lifecycle_state", must be one of the values in OCI::DataSafe::Models::ON_PREM_CONNECTOR_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      path = '/onPremConnectors'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:onPremConnectorId] = opts[:on_prem_connector_id] if opts[:on_prem_connector_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:onPremConnectorLifecycleState] = opts[:on_prem_connector_lifecycle_state] if opts[:on_prem_connector_lifecycle_state]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_on_prem_connectors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::OnPremConnectorSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of security assessments.
    #
    # The ListSecurityAssessments operation returns only the assessments in the specified `compartmentId`.
    # The list does not include any subcompartments of the compartmentId passed.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform ListSecurityAssessments on the
    # `compartmentId` passed and when it is set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ACCESSIBLE.
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :display_name A filter to return only resources that match the specified display name.
    #
    # @option opts [String] :type A filter to return only items that match the specified security assessment type.
    #   Allowed values are: LATEST, SAVED, SAVE_SCHEDULE, COMPARTMENT
    # @option opts [String] :schedule_assessment_id The OCID of the security assessment of type SAVE_SCHEDULE.
    # @option opts [BOOLEAN] :is_schedule_assessment A filter to return only security assessments of type save schedule.
    #    (default to false)
    # @option opts [String] :triggered_by A filter to return only security asessments that were created by either user or system.
    #   Allowed values are: USER, SYSTEM
    # @option opts [String] :target_id A filter to return only items that match the specified target.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [BOOLEAN] :is_baseline A filter to return only security assessments that are set as baseline. (default to false)
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order(sortOrder). The default order for timeCreated is descending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter to return only security assessments that were created after the specified date and time, as defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   Using TimeCreatedGreaterThanOrEqualToQueryParam parameter retrieves all assessments created after that date.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_created_less_than Search for items that were created before a specific date.
    #   Specifying this parameter corresponding `timeCreatedLessThan`
    #   parameter will retrieve all items created before the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle state.
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::SecurityAssessmentSummary SecurityAssessmentSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_security_assessments.rb.html) to see an example of how to use list_security_assessments API.
    def list_security_assessments(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_security_assessments.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_security_assessments." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:type] && !%w[LATEST SAVED SAVE_SCHEDULE COMPARTMENT].include?(opts[:type])
        raise 'Invalid value for "type", must be one of LATEST, SAVED, SAVE_SCHEDULE, COMPARTMENT.'
      end

      if opts[:triggered_by] && !%w[USER SYSTEM].include?(opts[:triggered_by])
        raise 'Invalid value for "triggered_by", must be one of USER, SYSTEM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::SECURITY_ASSESSMENT_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::SECURITY_ASSESSMENT_LIFECYCLE_STATE_ENUM.'
      end

      path = '/securityAssessments'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:type] = opts[:type] if opts[:type]
      query_params[:scheduleAssessmentId] = opts[:schedule_assessment_id] if opts[:schedule_assessment_id]
      query_params[:isScheduleAssessment] = opts[:is_schedule_assessment] if !opts[:is_schedule_assessment].nil?
      query_params[:triggeredBy] = opts[:triggered_by] if opts[:triggered_by]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:isBaseline] = opts[:is_baseline] if !opts[:is_baseline].nil?
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_security_assessments') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::SecurityAssessmentSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns the list of registered target databases in Data Safe.
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :target_database_id A filter to return the target database that matches the specified OCID.
    # @option opts [String] :display_name A filter to return only resources that match the specified display name.
    #
    # @option opts [String] :lifecycle_state A filter to return the target databases that matches the current state of the target database.
    # @option opts [String] :database_type A filter to return target databases that match the database type of the target database.
    # @option opts [String] :infrastructure_type A filter to return target databases that match the infrastructure type of the target database.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field used for sorting. Only one sorting order (sortOrder) can be specified.
    #   The default order for TIMECREATED is descending. The default order for DISPLAYNAME is ascending.
    #   The DISPLAYNAME sort order is case sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::TargetDatabaseSummary TargetDatabaseSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_target_databases.rb.html) to see an example of how to use list_target_databases API.
    def list_target_databases(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_target_databases.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_target_databases." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:database_type] && !OCI::DataSafe::Models::DATABASE_TYPE_ENUM.include?(opts[:database_type])
        raise 'Invalid value for "database_type", must be one of the values in OCI::DataSafe::Models::DATABASE_TYPE_ENUM.'
      end

      if opts[:infrastructure_type] && !OCI::DataSafe::Models::INFRASTRUCTURE_TYPE_ENUM.include?(opts[:infrastructure_type])
        raise 'Invalid value for "infrastructure_type", must be one of the values in OCI::DataSafe::Models::INFRASTRUCTURE_TYPE_ENUM.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      path = '/targetDatabases'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:targetDatabaseId] = opts[:target_database_id] if opts[:target_database_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:databaseType] = opts[:database_type] if opts[:database_type]
      query_params[:infrastructureType] = opts[:infrastructure_type] if opts[:infrastructure_type]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_target_databases') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::TargetDatabaseSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of aggregated user details from the specified user assessment. This provides information about the overall state
    # of database user security.  For example, the user details include how many users have the DBA role and how many users are in
    # the critical category. This data is especially useful content for dashboards or to support analytics.
    #
    # When you perform the ListUserAnalytics operation, if the parameter compartmentIdInSubtree is set to \"true,\" and if the
    # parameter accessLevel is set to ACCESSIBLE, then the operation returns compartments in which the requestor has INSPECT
    # permissions on at least one resource, directly or indirectly (in subcompartments). If the operation is performed at the
    # root compartment. If the requestor does not have access to at least one subcompartment of the compartment specified by
    # compartmentId, then \"Not Authorized\" is returned.
    #
    # The parameter compartmentIdInSubtree applies when you perform ListUserAnalytics on the compartmentId passed and when it is
    # set to true, the entire hierarchy of compartments can be returned.
    #
    # To use ListUserAnalytics to get a full list of all compartments and subcompartments in the tenancy from the root compartment,
    # set the parameter compartmentIdInSubtree to true and accessLevel to ACCESSIBLE.
    #
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :user_category A filter to return only items that match the specified user category.
    # @option opts [String] :user_key A filter to return only items that match the specified user key.
    # @option opts [String] :account_status A filter to return only items that match the specified account status.
    # @option opts [String] :authentication_type A filter to return only items that match the specified authentication type.
    # @option opts [String] :user_name A filter to return only items that match the specified user name.
    # @option opts [String] :target_id A filter to return only items that match the specified target.
    # @option opts [DateTime] :time_last_login_greater_than_or_equal_to A filter to return users whose last login time in the database is greater than or equal to the date and time specified, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_last_login_less_than A filter to return users whose last login time in the database is less than the date and time specified, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_user_created_greater_than_or_equal_to A filter to return users whose creation time in the database is greater than or equal to the date and time specified, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_user_created_less_than A filter to return users whose creation time in the database is less than the date and time specified, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_password_last_changed_greater_than_or_equal_to A filter to return users whose last password change in the database is greater than or equal to the date and time specified, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_password_last_changed_less_than A filter to return users whose last password change in the database is less than the date and time specified, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for userName is ascending.
    #    (default to userName)
    #   Allowed values are: userName, userCategory, accountStatus, timeLastLogin, targetId, timeUserCreated, authenticationType, timePasswordChanged
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::UserAggregation UserAggregation}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_user_analytics.rb.html) to see an example of how to use list_user_analytics API.
    def list_user_analytics(user_assessment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_user_analytics.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling list_user_analytics." if user_assessment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[userName userCategory accountStatus timeLastLogin targetId timeUserCreated authenticationType timePasswordChanged].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of userName, userCategory, accountStatus, timeLastLogin, targetId, timeUserCreated, authenticationType, timePasswordChanged.'
      end
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)

      path = '/userAssessments/{userAssessmentId}/userAnalytics'.sub('{userAssessmentId}', user_assessment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:userCategory] = opts[:user_category] if opts[:user_category]
      query_params[:userKey] = opts[:user_key] if opts[:user_key]
      query_params[:accountStatus] = opts[:account_status] if opts[:account_status]
      query_params[:authenticationType] = opts[:authentication_type] if opts[:authentication_type]
      query_params[:userName] = opts[:user_name] if opts[:user_name]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:timeLastLoginGreaterThanOrEqualTo] = opts[:time_last_login_greater_than_or_equal_to] if opts[:time_last_login_greater_than_or_equal_to]
      query_params[:timeLastLoginLessThan] = opts[:time_last_login_less_than] if opts[:time_last_login_less_than]
      query_params[:timeUserCreatedGreaterThanOrEqualTo] = opts[:time_user_created_greater_than_or_equal_to] if opts[:time_user_created_greater_than_or_equal_to]
      query_params[:timeUserCreatedLessThan] = opts[:time_user_created_less_than] if opts[:time_user_created_less_than]
      query_params[:timePasswordLastChangedGreaterThanOrEqualTo] = opts[:time_password_last_changed_greater_than_or_equal_to] if opts[:time_password_last_changed_greater_than_or_equal_to]
      query_params[:timePasswordLastChangedLessThan] = opts[:time_password_last_changed_less_than] if opts[:time_password_last_changed_less_than]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_user_analytics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::UserAggregation>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of user assessments.
    #
    # The ListUserAssessments operation returns only the assessments in the specified `compartmentId`.
    # The list does not include any subcompartments of the compartmentId passed.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform ListUserAssessments on the
    # `compartmentId` passed and when it is set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ACCESSIBLE.
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :display_name A filter to return only resources that match the specified display name.
    #
    # @option opts [String] :schedule_user_assessment_id The OCID of the user assessment of type SAVE_SCHEDULE.
    # @option opts [BOOLEAN] :is_schedule_assessment A filter to return only user assessments of type SAVE_SCHEDULE.
    #    (default to false)
    # @option opts [BOOLEAN] :is_baseline A filter to return only user assessments that are set as baseline. (default to false)
    # @option opts [String] :target_id A filter to return only items that match the specified target.
    # @option opts [String] :type A filter to return only items that match the specified assessment type.
    #   Allowed values are: LATEST, SAVED, COMPARTMENT, SAVE_SCHEDULE
    # @option opts [String] :triggered_by A filter to return user assessments that were created by either the system or by a user only.
    #   Allowed values are: USER, SYSTEM
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter to return only user assessments that were created after the specified date and time, as defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   Using timeCreatedGreaterThanOrEqualTo parameter retrieves all assessments created after that date.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_created_less_than Search for items that were created before a specific date.
    #   Specifying this parameter corresponding `timeCreatedLessThan`
    #   parameter will retrieve all items created before the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :lifecycle_state The current state of the user assessment.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for timeCreated is descending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::UserAssessmentSummary UserAssessmentSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_user_assessments.rb.html) to see an example of how to use list_user_assessments API.
    def list_user_assessments(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_user_assessments.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_user_assessments." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:type] && !%w[LATEST SAVED COMPARTMENT SAVE_SCHEDULE].include?(opts[:type])
        raise 'Invalid value for "type", must be one of LATEST, SAVED, COMPARTMENT, SAVE_SCHEDULE.'
      end

      if opts[:triggered_by] && !%w[USER SYSTEM].include?(opts[:triggered_by])
        raise 'Invalid value for "triggered_by", must be one of USER, SYSTEM.'
      end

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::USER_ASSESSMENT_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::USER_ASSESSMENT_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/userAssessments'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:scheduleUserAssessmentId] = opts[:schedule_user_assessment_id] if opts[:schedule_user_assessment_id]
      query_params[:isScheduleAssessment] = opts[:is_schedule_assessment] if !opts[:is_schedule_assessment].nil?
      query_params[:isBaseline] = opts[:is_baseline] if !opts[:is_baseline].nil?
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:type] = opts[:type] if opts[:type]
      query_params[:triggeredBy] = opts[:triggered_by] if opts[:triggered_by]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_user_assessments') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::UserAssessmentSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of users of the specified user assessment. The result contains the database user details for each user, such
    # as user type, account status, last login time, user creation time, authentication type, user profile, and the date and time
    # of the latest password change. It also contains the user category derived from these user details as well as privileges
    # granted to each user.
    #
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :user_category A filter to return only items that match the specified user category.
    # @option opts [String] :user_key A filter to return only items that match the specified user key.
    # @option opts [String] :account_status A filter to return only items that match the specified account status.
    # @option opts [String] :authentication_type A filter to return only items that match the specified authentication type.
    # @option opts [String] :user_name A filter to return only items that match the specified user name.
    # @option opts [String] :target_id A filter to return only items that match the specified target.
    # @option opts [DateTime] :time_last_login_greater_than_or_equal_to A filter to return users whose last login time in the database is greater than or equal to the date and time specified, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_last_login_less_than A filter to return users whose last login time in the database is less than the date and time specified, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_user_created_greater_than_or_equal_to A filter to return users whose creation time in the database is greater than or equal to the date and time specified, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_user_created_less_than A filter to return users whose creation time in the database is less than the date and time specified, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_password_last_changed_greater_than_or_equal_to A filter to return users whose last password change in the database is greater than or equal to the date and time specified, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_password_last_changed_less_than A filter to return users whose last password change in the database is less than the date and time specified, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for userName is ascending.
    #    (default to userName)
    #   Allowed values are: userName, userCategory, accountStatus, timeLastLogin, targetId, timeUserCreated, authenticationType, timePasswordChanged
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::UserSummary UserSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_users.rb.html) to see an example of how to use list_users API.
    def list_users(user_assessment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_users.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling list_users." if user_assessment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[userName userCategory accountStatus timeLastLogin targetId timeUserCreated authenticationType timePasswordChanged].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of userName, userCategory, accountStatus, timeLastLogin, targetId, timeUserCreated, authenticationType, timePasswordChanged.'
      end
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)

      path = '/userAssessments/{userAssessmentId}/users'.sub('{userAssessmentId}', user_assessment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:userCategory] = opts[:user_category] if opts[:user_category]
      query_params[:userKey] = opts[:user_key] if opts[:user_key]
      query_params[:accountStatus] = opts[:account_status] if opts[:account_status]
      query_params[:authenticationType] = opts[:authentication_type] if opts[:authentication_type]
      query_params[:userName] = opts[:user_name] if opts[:user_name]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:timeLastLoginGreaterThanOrEqualTo] = opts[:time_last_login_greater_than_or_equal_to] if opts[:time_last_login_greater_than_or_equal_to]
      query_params[:timeLastLoginLessThan] = opts[:time_last_login_less_than] if opts[:time_last_login_less_than]
      query_params[:timeUserCreatedGreaterThanOrEqualTo] = opts[:time_user_created_greater_than_or_equal_to] if opts[:time_user_created_greater_than_or_equal_to]
      query_params[:timeUserCreatedLessThan] = opts[:time_user_created_less_than] if opts[:time_user_created_less_than]
      query_params[:timePasswordLastChangedGreaterThanOrEqualTo] = opts[:time_password_last_changed_greater_than_or_equal_to] if opts[:time_password_last_changed_greater_than_or_equal_to]
      query_params[:timePasswordLastChangedLessThan] = opts[:time_password_last_changed_less_than] if opts[:time_password_last_changed_less_than]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_users') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::UserSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of errors for the specified work request.
    #
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::WorkRequestError WorkRequestError}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_work_request_errors.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::WorkRequestError>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of log entries for the specified work request.
    #
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::WorkRequestLogEntry WorkRequestLogEntry}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_work_request_logs.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::WorkRequestLogEntry>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of work requests.
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :operation_type A filter to return only work requests that match the specific operation type.
    # @option opts [String] :resource_id A filter to return only work requests that match the specified resource OCID.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::WorkRequestSummary WorkRequestSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:operationType] = opts[:operation_type] if opts[:operation_type]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::WorkRequestSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Runs a security assessment, refreshes the latest assessment, and saves it for future reference.
    # The assessment runs with a securityAssessmentId of type LATEST. Before you start, first call the ListSecurityAssessments operation with filter \"type = latest\" to get the security assessment id for the target's latest assessment.
    #
    # @param [String] security_assessment_id The OCID of the security assessment.
    # @param [OCI::DataSafe::Models::RunSecurityAssessmentDetails] run_security_assessment_details Details to create an on-demand saved security assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/refresh_security_assessment.rb.html) to see an example of how to use refresh_security_assessment API.
    def refresh_security_assessment(security_assessment_id, run_security_assessment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#refresh_security_assessment.' if logger

      raise "Missing the required parameter 'security_assessment_id' when calling refresh_security_assessment." if security_assessment_id.nil?
      raise "Missing the required parameter 'run_security_assessment_details' when calling refresh_security_assessment." if run_security_assessment_details.nil?
      raise "Parameter value for 'security_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(security_assessment_id)

      path = '/securityAssessments/{securityAssessmentId}/actions/refresh'.sub('{securityAssessmentId}', security_assessment_id.to_s)
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

      post_body = @api_client.object_to_http_body(run_security_assessment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#refresh_security_assessment') do
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


    # Refreshes the latest assessment and saves it for future reference. This operation runs with a userAssessmentId of type LATEST.
    # Before you start, first call the ListUserAssessments operation with filter \"type = latest\" to get the user assessment ID for
    # the target's latest assessment.
    #
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [OCI::DataSafe::Models::RunUserAssessmentDetails] run_user_assessment_details The details required to create an on-demand saved user assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/refresh_user_assessment.rb.html) to see an example of how to use refresh_user_assessment API.
    def refresh_user_assessment(user_assessment_id, run_user_assessment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#refresh_user_assessment.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling refresh_user_assessment." if user_assessment_id.nil?
      raise "Missing the required parameter 'run_user_assessment_details' when calling refresh_user_assessment." if run_user_assessment_details.nil?
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)

      path = '/userAssessments/{userAssessmentId}/actions/refresh'.sub('{userAssessmentId}', user_assessment_id.to_s)
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

      post_body = @api_client.object_to_http_body(run_user_assessment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#refresh_user_assessment') do
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


    # Sets the saved security assessment as the baseline in the compartment where the the specified assessment resides. The security assessment needs to be of type 'SAVED'.
    # @param [String] security_assessment_id The OCID of the security assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [OCI::DataSafe::Models::SecurityAssessmentBaseLineDetails] :base_line_details Details of security assessment that need to be updated while setting the baseline.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/set_security_assessment_baseline.rb.html) to see an example of how to use set_security_assessment_baseline API.
    def set_security_assessment_baseline(security_assessment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#set_security_assessment_baseline.' if logger

      raise "Missing the required parameter 'security_assessment_id' when calling set_security_assessment_baseline." if security_assessment_id.nil?
      raise "Parameter value for 'security_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(security_assessment_id)

      path = '/securityAssessments/{securityAssessmentId}/actions/setBaseline'.sub('{securityAssessmentId}', security_assessment_id.to_s)
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

      post_body = @api_client.object_to_http_body(opts[:base_line_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#set_security_assessment_baseline') do
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


    # Sets the saved user assessment as the baseline in the compartment where the specified assessment resides. The user assessment needs to be of type 'SAVED'.
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [OCI::DataSafe::Models::UserAssessmentBaseLineDetails] :base_line_details Details of user assessment that need to be updated while setting the baseline.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/set_user_assessment_baseline.rb.html) to see an example of how to use set_user_assessment_baseline API.
    def set_user_assessment_baseline(user_assessment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#set_user_assessment_baseline.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling set_user_assessment_baseline." if user_assessment_id.nil?
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)

      path = '/userAssessments/{userAssessmentId}/actions/setBaseline'.sub('{userAssessmentId}', user_assessment_id.to_s)
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

      post_body = @api_client.object_to_http_body(opts[:base_line_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#set_user_assessment_baseline') do
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


    # Removes the baseline setting for the saved security assessment. The saved security assessment is no longer considered a baseline.
    # Sets the if-match parameter to the value of the etag from a previous GET or POST response for that resource.
    #
    # @param [String] security_assessment_id The OCID of the security assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/unset_security_assessment_baseline.rb.html) to see an example of how to use unset_security_assessment_baseline API.
    def unset_security_assessment_baseline(security_assessment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#unset_security_assessment_baseline.' if logger

      raise "Missing the required parameter 'security_assessment_id' when calling unset_security_assessment_baseline." if security_assessment_id.nil?
      raise "Parameter value for 'security_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(security_assessment_id)

      path = '/securityAssessments/{securityAssessmentId}/actions/unsetBaseline'.sub('{securityAssessmentId}', security_assessment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#unset_security_assessment_baseline') do
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


    # Removes the baseline setting for the saved user assessment. The saved user assessment is no longer considered a baseline.
    # Sets the if-match parameter to the value of the etag from a previous GET or POST response for that resource.
    #
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/unset_user_assessment_baseline.rb.html) to see an example of how to use unset_user_assessment_baseline API.
    def unset_user_assessment_baseline(user_assessment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#unset_user_assessment_baseline.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling unset_user_assessment_baseline." if user_assessment_id.nil?
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)

      path = '/userAssessments/{userAssessmentId}/actions/unsetBaseline'.sub('{userAssessmentId}', user_assessment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#unset_user_assessment_baseline') do
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


    # Updates one or more attributes of the specified Data Safe private endpoint.
    # @param [String] data_safe_private_endpoint_id The OCID of the private endpoint.
    # @param [OCI::DataSafe::Models::UpdateDataSafePrivateEndpointDetails] update_data_safe_private_endpoint_details The details used to update a Data Safe private endpoint.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_data_safe_private_endpoint.rb.html) to see an example of how to use update_data_safe_private_endpoint API.
    def update_data_safe_private_endpoint(data_safe_private_endpoint_id, update_data_safe_private_endpoint_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_data_safe_private_endpoint.' if logger

      raise "Missing the required parameter 'data_safe_private_endpoint_id' when calling update_data_safe_private_endpoint." if data_safe_private_endpoint_id.nil?
      raise "Missing the required parameter 'update_data_safe_private_endpoint_details' when calling update_data_safe_private_endpoint." if update_data_safe_private_endpoint_details.nil?
      raise "Parameter value for 'data_safe_private_endpoint_id' must not be blank" if OCI::Internal::Util.blank_string?(data_safe_private_endpoint_id)

      path = '/dataSafePrivateEndpoints/{dataSafePrivateEndpointId}'.sub('{dataSafePrivateEndpointId}', data_safe_private_endpoint_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_data_safe_private_endpoint_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_data_safe_private_endpoint') do
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


    # Updates one or more attributes of the specified on-premises connector.
    # @param [String] on_prem_connector_id The OCID of the on-premises connector.
    # @param [OCI::DataSafe::Models::UpdateOnPremConnectorDetails] update_on_prem_connector_details The details used to update a on-premises connector.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_on_prem_connector.rb.html) to see an example of how to use update_on_prem_connector API.
    def update_on_prem_connector(on_prem_connector_id, update_on_prem_connector_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_on_prem_connector.' if logger

      raise "Missing the required parameter 'on_prem_connector_id' when calling update_on_prem_connector." if on_prem_connector_id.nil?
      raise "Missing the required parameter 'update_on_prem_connector_details' when calling update_on_prem_connector." if update_on_prem_connector_details.nil?
      raise "Parameter value for 'on_prem_connector_id' must not be blank" if OCI::Internal::Util.blank_string?(on_prem_connector_id)

      path = '/onPremConnectors/{onPremConnectorId}'.sub('{onPremConnectorId}', on_prem_connector_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_on_prem_connector_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_on_prem_connector') do
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


    # Updates the wallet for the specified on-premises connector to a new version.
    #
    # @param [OCI::DataSafe::Models::UpdateOnPremConnectorWalletDetails] update_on_prem_connector_wallet_details The details used to update an on-premises connector's wallet.
    # @param [String] on_prem_connector_id The OCID of the on-premises connector.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_on_prem_connector_wallet.rb.html) to see an example of how to use update_on_prem_connector_wallet API.
    def update_on_prem_connector_wallet(update_on_prem_connector_wallet_details, on_prem_connector_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_on_prem_connector_wallet.' if logger

      raise "Missing the required parameter 'update_on_prem_connector_wallet_details' when calling update_on_prem_connector_wallet." if update_on_prem_connector_wallet_details.nil?
      raise "Missing the required parameter 'on_prem_connector_id' when calling update_on_prem_connector_wallet." if on_prem_connector_id.nil?
      raise "Parameter value for 'on_prem_connector_id' must not be blank" if OCI::Internal::Util.blank_string?(on_prem_connector_id)

      path = '/onPremConnectors/{onPremConnectorId}/wallet'.sub('{onPremConnectorId}', on_prem_connector_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_on_prem_connector_wallet_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_on_prem_connector_wallet') do
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


    # Updates one or more attributes of the specified security assessment. This operation allows to update the security assessment displayName, description, or schedule.
    #
    # @param [String] security_assessment_id The OCID of the security assessment.
    # @param [OCI::DataSafe::Models::UpdateSecurityAssessmentDetails] update_security_assessment_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_security_assessment.rb.html) to see an example of how to use update_security_assessment API.
    def update_security_assessment(security_assessment_id, update_security_assessment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_security_assessment.' if logger

      raise "Missing the required parameter 'security_assessment_id' when calling update_security_assessment." if security_assessment_id.nil?
      raise "Missing the required parameter 'update_security_assessment_details' when calling update_security_assessment." if update_security_assessment_details.nil?
      raise "Parameter value for 'security_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(security_assessment_id)

      path = '/securityAssessments/{securityAssessmentId}'.sub('{securityAssessmentId}', security_assessment_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_security_assessment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_security_assessment') do
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


    # Updates one or more attributes of the specified Data Safe target database.
    # @param [String] target_database_id The OCID of the Data Safe target database.
    # @param [OCI::DataSafe::Models::UpdateTargetDatabaseDetails] update_target_database_details Details used to update the target database in Data Safe.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_target_database.rb.html) to see an example of how to use update_target_database API.
    def update_target_database(target_database_id, update_target_database_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_target_database.' if logger

      raise "Missing the required parameter 'target_database_id' when calling update_target_database." if target_database_id.nil?
      raise "Missing the required parameter 'update_target_database_details' when calling update_target_database." if update_target_database_details.nil?
      raise "Parameter value for 'target_database_id' must not be blank" if OCI::Internal::Util.blank_string?(target_database_id)

      path = '/targetDatabases/{targetDatabaseId}'.sub('{targetDatabaseId}', target_database_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_target_database_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_target_database') do
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


    # Updates one or more attributes of the specified user assessment. This operation allows to update the user assessment displayName, description, or schedule.
    #
    # @param [String] user_assessment_id The OCID of the user assessment.
    # @param [OCI::DataSafe::Models::UpdateUserAssessmentDetails] update_user_assessment_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_user_assessment.rb.html) to see an example of how to use update_user_assessment API.
    def update_user_assessment(user_assessment_id, update_user_assessment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_user_assessment.' if logger

      raise "Missing the required parameter 'user_assessment_id' when calling update_user_assessment." if user_assessment_id.nil?
      raise "Missing the required parameter 'update_user_assessment_details' when calling update_user_assessment." if update_user_assessment_details.nil?
      raise "Parameter value for 'user_assessment_id' must not be blank" if OCI::Internal::Util.blank_string?(user_assessment_id)

      path = '/userAssessments/{userAssessmentId}'.sub('{userAssessmentId}', user_assessment_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_user_assessment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_user_assessment') do
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
