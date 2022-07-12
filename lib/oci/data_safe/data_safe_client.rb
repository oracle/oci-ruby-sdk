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


    # Adds columns to the specified masking policy from the associated sensitive data model. It
    # automatically pulls all the sensitive columns and their relationships from the sensitive
    # data model and uses this information to create columns in the masking policy. It also assigns
    # default masking formats to these columns based on the associated sensitive types.
    #
    # @param [String] masking_policy_id The OCID of the masking policy.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/add_masking_columns_from_sdm.rb.html) to see an example of how to use add_masking_columns_from_sdm API.
    def add_masking_columns_from_sdm(masking_policy_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#add_masking_columns_from_sdm.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling add_masking_columns_from_sdm." if masking_policy_id.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/actions/addMaskingColumnsFromSdm'.sub('{maskingPolicyId}', masking_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#add_masking_columns_from_sdm') do
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


    # Applies the results of a discovery job to the specified sensitive data model. Note that the plannedAction attribute
    # of discovery results is used for processing them. You should first use PatchDiscoveryJobResults to set the plannedAction
    # attribute of the discovery results you want to process. ApplyDiscoveryJobResults automatically reads the plannedAction
    # attribute and updates the sensitive data model to reflect the actions you planned.
    #
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [OCI::DataSafe::Models::ApplyDiscoveryJobResultsDetails] apply_discovery_job_results_details Details to apply the discovery results to a sensitive data model.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/apply_discovery_job_results.rb.html) to see an example of how to use apply_discovery_job_results API.
    def apply_discovery_job_results(sensitive_data_model_id, apply_discovery_job_results_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#apply_discovery_job_results.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling apply_discovery_job_results." if sensitive_data_model_id.nil?
      raise "Missing the required parameter 'apply_discovery_job_results_details' when calling apply_discovery_job_results." if apply_discovery_job_results_details.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)

      path = '/sensitiveDataModels/{sensitiveDataModelId}/sensitiveColumns/actions/applyDiscoveryJobResults'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s)
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

      post_body = @api_client.object_to_http_body(apply_discovery_job_results_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#apply_discovery_job_results') do
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


    # Calculates the volume of audit events available on the target database to be collected. Measurable up to the defined retention period of the audit target resource.
    # @param [String] audit_profile_id The OCID of the audit.
    # @param [OCI::DataSafe::Models::CalculateAuditVolumeAvailableDetails] calculate_audit_volume_available_details Details for the calculation of audit volume available on target database.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/calculate_audit_volume_available.rb.html) to see an example of how to use calculate_audit_volume_available API.
    def calculate_audit_volume_available(audit_profile_id, calculate_audit_volume_available_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#calculate_audit_volume_available.' if logger

      raise "Missing the required parameter 'audit_profile_id' when calling calculate_audit_volume_available." if audit_profile_id.nil?
      raise "Missing the required parameter 'calculate_audit_volume_available_details' when calling calculate_audit_volume_available." if calculate_audit_volume_available_details.nil?
      raise "Parameter value for 'audit_profile_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_profile_id)

      path = '/auditProfiles/{auditProfileId}/actions/calculateAuditVolumeAvailable'.sub('{auditProfileId}', audit_profile_id.to_s)
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

      post_body = @api_client.object_to_http_body(calculate_audit_volume_available_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#calculate_audit_volume_available') do
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


    # Calculates the volume of audit events collected by data safe.
    # @param [String] audit_profile_id The OCID of the audit.
    # @param [OCI::DataSafe::Models::CalculateAuditVolumeCollectedDetails] calculate_audit_volume_collected_details Details for the calculation of audit volume collected by data safe.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/calculate_audit_volume_collected.rb.html) to see an example of how to use calculate_audit_volume_collected API.
    def calculate_audit_volume_collected(audit_profile_id, calculate_audit_volume_collected_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#calculate_audit_volume_collected.' if logger

      raise "Missing the required parameter 'audit_profile_id' when calling calculate_audit_volume_collected." if audit_profile_id.nil?
      raise "Missing the required parameter 'calculate_audit_volume_collected_details' when calling calculate_audit_volume_collected." if calculate_audit_volume_collected_details.nil?
      raise "Parameter value for 'audit_profile_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_profile_id)

      path = '/auditProfiles/{auditProfileId}/actions/calculateAuditVolumeCollected'.sub('{auditProfileId}', audit_profile_id.to_s)
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

      post_body = @api_client.object_to_http_body(calculate_audit_volume_collected_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#calculate_audit_volume_collected') do
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


    # Cancel the given work request.
    #
    # @param [String] work_request_id The OCID of the work request.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/cancel_work_request.rb.html) to see an example of how to use cancel_work_request API.
    def cancel_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#cancel_work_request.' if logger

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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#cancel_work_request') do
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


    # Moves the specified alert into a different compartment.
    # @param [String] alert_id The OCID of alert.
    # @param [OCI::DataSafe::Models::ChangeAlertCompartmentDetails] change_alert_compartment_details The details used to change the compartment of an alert.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_alert_compartment.rb.html) to see an example of how to use change_alert_compartment API.
    def change_alert_compartment(alert_id, change_alert_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_alert_compartment.' if logger

      raise "Missing the required parameter 'alert_id' when calling change_alert_compartment." if alert_id.nil?
      raise "Missing the required parameter 'change_alert_compartment_details' when calling change_alert_compartment." if change_alert_compartment_details.nil?
      raise "Parameter value for 'alert_id' must not be blank" if OCI::Internal::Util.blank_string?(alert_id)

      path = '/alerts/{alertId}/actions/changeCompartment'.sub('{alertId}', alert_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_alert_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_alert_compartment') do
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


    # Moves the archive retreival to the specified compartment. When provided, if-Match is checked against ETag value of the resource.
    #
    # @param [String] audit_archive_retrieval_id OCID of the archive retrieval.
    # @param [OCI::DataSafe::Models::ChangeAuditArchiveRetrievalCompartmentDetails] change_audit_archive_retrieval_compartment_details The details used to change the compartment of a archive retrieval.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_audit_archive_retrieval_compartment.rb.html) to see an example of how to use change_audit_archive_retrieval_compartment API.
    def change_audit_archive_retrieval_compartment(audit_archive_retrieval_id, change_audit_archive_retrieval_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_audit_archive_retrieval_compartment.' if logger

      raise "Missing the required parameter 'audit_archive_retrieval_id' when calling change_audit_archive_retrieval_compartment." if audit_archive_retrieval_id.nil?
      raise "Missing the required parameter 'change_audit_archive_retrieval_compartment_details' when calling change_audit_archive_retrieval_compartment." if change_audit_archive_retrieval_compartment_details.nil?
      raise "Parameter value for 'audit_archive_retrieval_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_archive_retrieval_id)

      path = '/auditArchiveRetrievals/{auditArchiveRetrievalId}/actions/changeCompartment'.sub('{auditArchiveRetrievalId}', audit_archive_retrieval_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_audit_archive_retrieval_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_audit_archive_retrieval_compartment') do
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


    # Moves the specified audit policy and its dependent resources into a different compartment.
    # @param [String] audit_policy_id Unique audit policy identifier.
    # @param [OCI::DataSafe::Models::ChangeAuditPolicyCompartmentDetails] change_audit_policy_compartment_details Details for the compartment move.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_audit_policy_compartment.rb.html) to see an example of how to use change_audit_policy_compartment API.
    def change_audit_policy_compartment(audit_policy_id, change_audit_policy_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_audit_policy_compartment.' if logger

      raise "Missing the required parameter 'audit_policy_id' when calling change_audit_policy_compartment." if audit_policy_id.nil?
      raise "Missing the required parameter 'change_audit_policy_compartment_details' when calling change_audit_policy_compartment." if change_audit_policy_compartment_details.nil?
      raise "Parameter value for 'audit_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_policy_id)

      path = '/auditPolicies/{auditPolicyId}/actions/changeCompartment'.sub('{auditPolicyId}', audit_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_audit_policy_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_audit_policy_compartment') do
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


    # Moves the specified audit profile and its dependent resources into a different compartment.
    # @param [String] audit_profile_id The OCID of the audit.
    # @param [OCI::DataSafe::Models::ChangeAuditProfileCompartmentDetails] change_audit_profile_compartment_details Details for the compartment move.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_audit_profile_compartment.rb.html) to see an example of how to use change_audit_profile_compartment API.
    def change_audit_profile_compartment(audit_profile_id, change_audit_profile_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_audit_profile_compartment.' if logger

      raise "Missing the required parameter 'audit_profile_id' when calling change_audit_profile_compartment." if audit_profile_id.nil?
      raise "Missing the required parameter 'change_audit_profile_compartment_details' when calling change_audit_profile_compartment." if change_audit_profile_compartment_details.nil?
      raise "Parameter value for 'audit_profile_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_profile_id)

      path = '/auditProfiles/{auditProfileId}/actions/changeCompartment'.sub('{auditProfileId}', audit_profile_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_audit_profile_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_audit_profile_compartment') do
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


    # Moves the specified discovery job and its dependent resources into a different compartment.
    # @param [String] discovery_job_id The OCID of the discovery job.
    # @param [OCI::DataSafe::Models::ChangeDiscoveryJobCompartmentDetails] change_discovery_job_compartment_details The details used to change the compartment of a resource.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_discovery_job_compartment.rb.html) to see an example of how to use change_discovery_job_compartment API.
    def change_discovery_job_compartment(discovery_job_id, change_discovery_job_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_discovery_job_compartment.' if logger

      raise "Missing the required parameter 'discovery_job_id' when calling change_discovery_job_compartment." if discovery_job_id.nil?
      raise "Missing the required parameter 'change_discovery_job_compartment_details' when calling change_discovery_job_compartment." if change_discovery_job_compartment_details.nil?
      raise "Parameter value for 'discovery_job_id' must not be blank" if OCI::Internal::Util.blank_string?(discovery_job_id)

      path = '/discoveryJobs/{discoveryJobId}/actions/changeCompartment'.sub('{discoveryJobId}', discovery_job_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_discovery_job_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_discovery_job_compartment') do
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


    # Moves the specified library masking format into a different compartment.
    # @param [String] library_masking_format_id The OCID of the library masking format.
    # @param [OCI::DataSafe::Models::ChangeLibraryMaskingFormatCompartmentDetails] change_library_masking_format_compartment_details Details to change the compartment of a library masking format.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_library_masking_format_compartment.rb.html) to see an example of how to use change_library_masking_format_compartment API.
    def change_library_masking_format_compartment(library_masking_format_id, change_library_masking_format_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_library_masking_format_compartment.' if logger

      raise "Missing the required parameter 'library_masking_format_id' when calling change_library_masking_format_compartment." if library_masking_format_id.nil?
      raise "Missing the required parameter 'change_library_masking_format_compartment_details' when calling change_library_masking_format_compartment." if change_library_masking_format_compartment_details.nil?
      raise "Parameter value for 'library_masking_format_id' must not be blank" if OCI::Internal::Util.blank_string?(library_masking_format_id)

      path = '/libraryMaskingFormats/{libraryMaskingFormatId}/actions/changeCompartment'.sub('{libraryMaskingFormatId}', library_masking_format_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_library_masking_format_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_library_masking_format_compartment') do
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


    # Moves the specified masking policy and its dependent resources into a different compartment.
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [OCI::DataSafe::Models::ChangeMaskingPolicyCompartmentDetails] change_masking_policy_compartment_details Details to change the compartment of a masking policy.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_masking_policy_compartment.rb.html) to see an example of how to use change_masking_policy_compartment API.
    def change_masking_policy_compartment(masking_policy_id, change_masking_policy_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_masking_policy_compartment.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling change_masking_policy_compartment." if masking_policy_id.nil?
      raise "Missing the required parameter 'change_masking_policy_compartment_details' when calling change_masking_policy_compartment." if change_masking_policy_compartment_details.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/actions/changeCompartment'.sub('{maskingPolicyId}', masking_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_masking_policy_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_masking_policy_compartment') do
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


    # Moves a resource into a different compartment. When provided, If-Match is checked against ETag values of the resource.
    # @param [String] report_id Unique report identifier
    # @param [OCI::DataSafe::Models::ChangeReportCompartmentDetails] change_report_compartment_details Details for the different Report.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_report_compartment.rb.html) to see an example of how to use change_report_compartment API.
    def change_report_compartment(report_id, change_report_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_report_compartment.' if logger

      raise "Missing the required parameter 'report_id' when calling change_report_compartment." if report_id.nil?
      raise "Missing the required parameter 'change_report_compartment_details' when calling change_report_compartment." if change_report_compartment_details.nil?
      raise "Parameter value for 'report_id' must not be blank" if OCI::Internal::Util.blank_string?(report_id)

      path = '/reports/{reportId}/actions/changeCompartment'.sub('{reportId}', report_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_report_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_report_compartment') do
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


    # Moves a resource into a different compartment. When provided, If-Match is checked against ETag values of the resource.
    # @param [String] report_definition_id Unique report definition identifier
    # @param [OCI::DataSafe::Models::ChangeReportDefinitionCompartmentDetails] change_report_definition_compartment_details Details for the different ReportDefinition.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_report_definition_compartment.rb.html) to see an example of how to use change_report_definition_compartment API.
    def change_report_definition_compartment(report_definition_id, change_report_definition_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_report_definition_compartment.' if logger

      raise "Missing the required parameter 'report_definition_id' when calling change_report_definition_compartment." if report_definition_id.nil?
      raise "Missing the required parameter 'change_report_definition_compartment_details' when calling change_report_definition_compartment." if change_report_definition_compartment_details.nil?
      raise "Parameter value for 'report_definition_id' must not be blank" if OCI::Internal::Util.blank_string?(report_definition_id)

      path = '/reportDefinitions/{reportDefinitionId}/actions/changeCompartment'.sub('{reportDefinitionId}', report_definition_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_report_definition_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_report_definition_compartment') do
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


    # Change the online and offline months .
    # @param [String] audit_profile_id The OCID of the audit.
    # @param [OCI::DataSafe::Models::ChangeRetentionDetails] change_retention_details Details for the audit retention months to be modified.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_retention.rb.html) to see an example of how to use change_retention API.
    def change_retention(audit_profile_id, change_retention_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_retention.' if logger

      raise "Missing the required parameter 'audit_profile_id' when calling change_retention." if audit_profile_id.nil?
      raise "Missing the required parameter 'change_retention_details' when calling change_retention." if change_retention_details.nil?
      raise "Parameter value for 'audit_profile_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_profile_id)

      path = '/auditProfiles/{auditProfileId}/actions/changeRetention'.sub('{auditProfileId}', audit_profile_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_retention_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_retention') do
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


    # Moves the specified sensitive data model and its dependent resources into a different compartment.
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [OCI::DataSafe::Models::ChangeSensitiveDataModelCompartmentDetails] change_sensitive_data_model_compartment_details Details to change the compartment of a sensitive data model.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_sensitive_data_model_compartment.rb.html) to see an example of how to use change_sensitive_data_model_compartment API.
    def change_sensitive_data_model_compartment(sensitive_data_model_id, change_sensitive_data_model_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_sensitive_data_model_compartment.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling change_sensitive_data_model_compartment." if sensitive_data_model_id.nil?
      raise "Missing the required parameter 'change_sensitive_data_model_compartment_details' when calling change_sensitive_data_model_compartment." if change_sensitive_data_model_compartment_details.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)

      path = '/sensitiveDataModels/{sensitiveDataModelId}/actions/changeCompartment'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_sensitive_data_model_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_sensitive_data_model_compartment') do
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


    # Moves the specified sensitive type into a different compartment.
    # @param [String] sensitive_type_id The OCID of the sensitive type.
    # @param [OCI::DataSafe::Models::ChangeSensitiveTypeCompartmentDetails] change_sensitive_type_compartment_details Details to change the compartment of a sensitive type.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_sensitive_type_compartment.rb.html) to see an example of how to use change_sensitive_type_compartment API.
    def change_sensitive_type_compartment(sensitive_type_id, change_sensitive_type_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_sensitive_type_compartment.' if logger

      raise "Missing the required parameter 'sensitive_type_id' when calling change_sensitive_type_compartment." if sensitive_type_id.nil?
      raise "Missing the required parameter 'change_sensitive_type_compartment_details' when calling change_sensitive_type_compartment." if change_sensitive_type_compartment_details.nil?
      raise "Parameter value for 'sensitive_type_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_type_id)

      path = '/sensitiveTypes/{sensitiveTypeId}/actions/changeCompartment'.sub('{sensitiveTypeId}', sensitive_type_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_sensitive_type_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_sensitive_type_compartment') do
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


    # Moves the specified target-alert policy Association into a different compartment.
    # @param [String] target_alert_policy_association_id The OCID of the target-alert policy association.
    # @param [OCI::DataSafe::Models::ChangeTargetAlertPolicyAssociationCompartmentDetails] change_target_alert_policy_association_compartment_details The details used to change the compartment of a target-alert policy association.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/change_target_alert_policy_association_compartment.rb.html) to see an example of how to use change_target_alert_policy_association_compartment API.
    def change_target_alert_policy_association_compartment(target_alert_policy_association_id, change_target_alert_policy_association_compartment_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#change_target_alert_policy_association_compartment.' if logger

      raise "Missing the required parameter 'target_alert_policy_association_id' when calling change_target_alert_policy_association_compartment." if target_alert_policy_association_id.nil?
      raise "Missing the required parameter 'change_target_alert_policy_association_compartment_details' when calling change_target_alert_policy_association_compartment." if change_target_alert_policy_association_compartment_details.nil?
      raise "Parameter value for 'target_alert_policy_association_id' must not be blank" if OCI::Internal::Util.blank_string?(target_alert_policy_association_id)

      path = '/targetAlertPolicyAssociations/{targetAlertPolicyAssociationId}/actions/changeCompartment'.sub('{targetAlertPolicyAssociationId}', target_alert_policy_association_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_target_alert_policy_association_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#change_target_alert_policy_association_compartment') do
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


    # Creates a work request to retrieve archived audit data. This asynchronous process will usually take over an hour to complete.
    # Save the id from the response of this operation. Call GetAuditArchiveRetrieval operation after an hour, passing the id to know the status of
    # this operation.
    #
    # @param [OCI::DataSafe::Models::CreateAuditArchiveRetrievalDetails] create_audit_archive_retrieval_details Details for creating retrieving archived audit data.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AuditArchiveRetrieval AuditArchiveRetrieval}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_audit_archive_retrieval.rb.html) to see an example of how to use create_audit_archive_retrieval API.
    def create_audit_archive_retrieval(create_audit_archive_retrieval_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_audit_archive_retrieval.' if logger

      raise "Missing the required parameter 'create_audit_archive_retrieval_details' when calling create_audit_archive_retrieval." if create_audit_archive_retrieval_details.nil?

      path = '/auditArchiveRetrievals'
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

      post_body = @api_client.object_to_http_body(create_audit_archive_retrieval_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_audit_archive_retrieval') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AuditArchiveRetrieval'
        )
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


    # Performs incremental data discovery for the specified sensitive data model. It uses the target database associated
    # with the sensitive data model.
    # After performing data discovery, you can use ListDiscoveryJobResults to view the discovery results, PatchDiscoveryJobResults
    # to specify the action you want perform on these results, and then ApplyDiscoveryJobResults to process the results
    # and apply them to the sensitive data model.
    #
    # @param [OCI::DataSafe::Models::CreateDiscoveryJobDetails] create_discovery_job_details The details used to run an incremental data discovery job
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::DiscoveryJob DiscoveryJob}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_discovery_job.rb.html) to see an example of how to use create_discovery_job API.
    def create_discovery_job(create_discovery_job_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_discovery_job.' if logger

      raise "Missing the required parameter 'create_discovery_job_details' when calling create_discovery_job." if create_discovery_job_details.nil?

      path = '/discoveryJobs'
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

      post_body = @api_client.object_to_http_body(create_discovery_job_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_discovery_job') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::DiscoveryJob'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new library masking format. A masking format can have one or more
    # format entries. The combined output of all the format entries is used for masking.
    # It provides the flexibility to define a masking format that can generate different
    # parts of a data value separately and then combine them to get the final data value
    # for masking. Note that you cannot define masking condition in a library masking format.
    #
    # @param [OCI::DataSafe::Models::CreateLibraryMaskingFormatDetails] create_library_masking_format_details Details to create a new library masking format.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::LibraryMaskingFormat LibraryMaskingFormat}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_library_masking_format.rb.html) to see an example of how to use create_library_masking_format API.
    def create_library_masking_format(create_library_masking_format_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_library_masking_format.' if logger

      raise "Missing the required parameter 'create_library_masking_format_details' when calling create_library_masking_format." if create_library_masking_format_details.nil?

      path = '/libraryMaskingFormats'
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

      post_body = @api_client.object_to_http_body(create_library_masking_format_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_library_masking_format') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::LibraryMaskingFormat'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new masking column in the specified masking policy. Use this operation
    # to add parent columns only. It automatically adds the child columns from the
    # associated sensitive data model or target database. If you provide the
    # sensitiveTypeId attribute but not the maskingFormats attribute, it automatically
    # assigns the default masking format associated with the specified sensitive type.
    # Alternatively, if you provide the maskingFormats attribute, the specified masking
    # formats are assigned to the column.
    #
    # Using the maskingFormats attribute, you can assign one or more masking formats
    # to a column. You need to specify a condition as part of each masking format. It
    # enables you to do <a href=\"https://docs.oracle.com/en/cloud/paas/data-safe/udscs/conditional-masking.html\">conditional masking</a>
    # so that you can mask the column data values differently using different
    # masking conditions. A masking format can have one or more format entries. The
    # combined output of all the format entries is used for masking. It provides the
    # flexibility to define a masking format that can generate different parts of a data
    # value separately and then combine them to get the final data value for masking.
    #
    # You can use the maskingColumnGroup attribute to group the columns that you would
    # like to mask together. It enables you to do <a href=\"https://docs.oracle.com/en/cloud/paas/data-safe/udscs/group-masking1.html#GUID-755056B9-9540-48C0-9491-262A44A85037\">group or compound masking</a> that ensures that the
    # masked data across the columns in a group continue to retain the same logical relationship.
    #
    # @param [OCI::DataSafe::Models::CreateMaskingColumnDetails] create_masking_column_details Details to create a new masking column.
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_masking_column.rb.html) to see an example of how to use create_masking_column API.
    def create_masking_column(create_masking_column_details, masking_policy_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_masking_column.' if logger

      raise "Missing the required parameter 'create_masking_column_details' when calling create_masking_column." if create_masking_column_details.nil?
      raise "Missing the required parameter 'masking_policy_id' when calling create_masking_column." if masking_policy_id.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/maskingColumns'.sub('{maskingPolicyId}', masking_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_masking_column_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_masking_column') do
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


    # Creates a new masking policy and associates it with a sensitive data model or a reference target database.
    #
    # To use a sensitive data model as the source of masking columns, set the columnSource attribute to
    # SENSITIVE_DATA_MODEL and provide the sensitiveDataModelId attribute. After creating a masking policy,
    # you can use the AddMaskingColumnsFromSdm operation to automatically add all the columns from
    # the associated sensitive data model. In this case, the target database associated with the
    # sensitive data model is used for column and masking format validations.
    #
    # You can also create a masking policy without using a sensitive data model. In this case,
    # you need to associate your masking policy with a target database by setting the columnSource
    # attribute to TARGET and providing the targetId attribute. The specified target database
    # is used for column and masking format validations.
    #
    # After creating a masking policy, you can use the CreateMaskingColumn or PatchMaskingColumns
    # operation to manually add columns to the policy. You need to add the parent columns only,
    # and it automatically adds the child columns (in referential relationship with the parent columns)
    # from the associated sensitive data model or target database.
    #
    # @param [OCI::DataSafe::Models::CreateMaskingPolicyDetails] create_masking_policy_details Details to create a new masking policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::MaskingPolicy MaskingPolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_masking_policy.rb.html) to see an example of how to use create_masking_policy API.
    def create_masking_policy(create_masking_policy_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_masking_policy.' if logger

      raise "Missing the required parameter 'create_masking_policy_details' when calling create_masking_policy." if create_masking_policy_details.nil?

      path = '/maskingPolicies'
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

      post_body = @api_client.object_to_http_body(create_masking_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_masking_policy') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::MaskingPolicy'
        )
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


    # Creates a new report definition with parameters specified in the body. The report definition is stored in the specified compartment.
    #
    # @param [OCI::DataSafe::Models::CreateReportDefinitionDetails] create_report_definition_details Details for the new report definition.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::ReportDefinition ReportDefinition}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_report_definition.rb.html) to see an example of how to use create_report_definition API.
    def create_report_definition(create_report_definition_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_report_definition.' if logger

      raise "Missing the required parameter 'create_report_definition_details' when calling create_report_definition." if create_report_definition_details.nil?

      path = '/reportDefinitions'
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

      post_body = @api_client.object_to_http_body(create_report_definition_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_report_definition') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::ReportDefinition'
        )
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


    # Creates a new sensitive column in the specified sensitive data model.
    #
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [OCI::DataSafe::Models::CreateSensitiveColumnDetails] create_sensitive_column_details Details to create a new sensitive column.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_sensitive_column.rb.html) to see an example of how to use create_sensitive_column API.
    def create_sensitive_column(sensitive_data_model_id, create_sensitive_column_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_sensitive_column.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling create_sensitive_column." if sensitive_data_model_id.nil?
      raise "Missing the required parameter 'create_sensitive_column_details' when calling create_sensitive_column." if create_sensitive_column_details.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)

      path = '/sensitiveDataModels/{sensitiveDataModelId}/sensitiveColumns'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_sensitive_column_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_sensitive_column') do
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


    # Creates a new sensitive data model. If schemas and sensitive types are provided, it automatically runs data discovery
    # and adds the discovered columns to the sensitive data model. Otherwise, it creates an empty sensitive data model
    # that can be updated later.
    #
    # @param [OCI::DataSafe::Models::CreateSensitiveDataModelDetails] create_sensitive_data_model_details Details to create a new sensitive data model.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::SensitiveDataModel SensitiveDataModel}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_sensitive_data_model.rb.html) to see an example of how to use create_sensitive_data_model API.
    def create_sensitive_data_model(create_sensitive_data_model_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_sensitive_data_model.' if logger

      raise "Missing the required parameter 'create_sensitive_data_model_details' when calling create_sensitive_data_model." if create_sensitive_data_model_details.nil?

      path = '/sensitiveDataModels'
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

      post_body = @api_client.object_to_http_body(create_sensitive_data_model_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_sensitive_data_model') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::SensitiveDataModel'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new sensitive type, which can be a basic sensitive type with regular expressions or a sensitive category.
    # While sensitive types are used for data discovery, sensitive categories are used for logically grouping the related
    # or similar sensitive types.
    #
    # @param [OCI::DataSafe::Models::CreateSensitiveTypeDetails] create_sensitive_type_details Details to create a new sensitive type.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::SensitiveType SensitiveType}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_sensitive_type.rb.html) to see an example of how to use create_sensitive_type API.
    def create_sensitive_type(create_sensitive_type_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_sensitive_type.' if logger

      raise "Missing the required parameter 'create_sensitive_type_details' when calling create_sensitive_type." if create_sensitive_type_details.nil?

      path = '/sensitiveTypes'
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

      post_body = @api_client.object_to_http_body(create_sensitive_type_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_sensitive_type') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::SensitiveType'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new target-alert policy association to track a alert policy applied on target.
    #
    # @param [OCI::DataSafe::Models::CreateTargetAlertPolicyAssociationDetails] create_target_alert_policy_association_details The details used to create a new target-alert policy association.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::TargetAlertPolicyAssociation TargetAlertPolicyAssociation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/create_target_alert_policy_association.rb.html) to see an example of how to use create_target_alert_policy_association API.
    def create_target_alert_policy_association(create_target_alert_policy_association_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#create_target_alert_policy_association.' if logger

      raise "Missing the required parameter 'create_target_alert_policy_association_details' when calling create_target_alert_policy_association." if create_target_alert_policy_association_details.nil?

      path = '/targetAlertPolicyAssociations'
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

      post_body = @api_client.object_to_http_body(create_target_alert_policy_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#create_target_alert_policy_association') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::TargetAlertPolicyAssociation'
        )
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


    # To unload retrieved archive data, call the operation ListAuditArchiveRetrieval first.
    # This will return the auditArchiveRetrievalId. Then call this operation with auditArchiveRetrievalId.
    #
    # @param [String] audit_archive_retrieval_id OCID of the archive retrieval.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_audit_archive_retrieval.rb.html) to see an example of how to use delete_audit_archive_retrieval API.
    def delete_audit_archive_retrieval(audit_archive_retrieval_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_audit_archive_retrieval.' if logger

      raise "Missing the required parameter 'audit_archive_retrieval_id' when calling delete_audit_archive_retrieval." if audit_archive_retrieval_id.nil?
      raise "Parameter value for 'audit_archive_retrieval_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_archive_retrieval_id)

      path = '/auditArchiveRetrievals/{auditArchiveRetrievalId}'.sub('{auditArchiveRetrievalId}', audit_archive_retrieval_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_audit_archive_retrieval') do
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


    # Deletes the specified audit trail.
    # @param [String] audit_trail_id The OCID of the audit trail.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_audit_trail.rb.html) to see an example of how to use delete_audit_trail API.
    def delete_audit_trail(audit_trail_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_audit_trail.' if logger

      raise "Missing the required parameter 'audit_trail_id' when calling delete_audit_trail." if audit_trail_id.nil?
      raise "Parameter value for 'audit_trail_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_trail_id)

      path = '/auditTrails/{auditTrailId}'.sub('{auditTrailId}', audit_trail_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_audit_trail') do
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


    # Deletes the specified discovery job.
    # @param [String] discovery_job_id The OCID of the discovery job.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_discovery_job.rb.html) to see an example of how to use delete_discovery_job API.
    def delete_discovery_job(discovery_job_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_discovery_job.' if logger

      raise "Missing the required parameter 'discovery_job_id' when calling delete_discovery_job." if discovery_job_id.nil?
      raise "Parameter value for 'discovery_job_id' must not be blank" if OCI::Internal::Util.blank_string?(discovery_job_id)

      path = '/discoveryJobs/{discoveryJobId}'.sub('{discoveryJobId}', discovery_job_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_discovery_job') do
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


    # Deletes the specified discovery result.
    # @param [String] discovery_job_id The OCID of the discovery job.
    # @param [String] result_key The unique key that identifies the discovery result.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_discovery_job_result.rb.html) to see an example of how to use delete_discovery_job_result API.
    def delete_discovery_job_result(discovery_job_id, result_key, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_discovery_job_result.' if logger

      raise "Missing the required parameter 'discovery_job_id' when calling delete_discovery_job_result." if discovery_job_id.nil?
      raise "Missing the required parameter 'result_key' when calling delete_discovery_job_result." if result_key.nil?
      raise "Parameter value for 'discovery_job_id' must not be blank" if OCI::Internal::Util.blank_string?(discovery_job_id)
      raise "Parameter value for 'result_key' must not be blank" if OCI::Internal::Util.blank_string?(result_key)

      path = '/discoveryJobs/{discoveryJobId}/results/{resultKey}'.sub('{discoveryJobId}', discovery_job_id.to_s).sub('{resultKey}', result_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_discovery_job_result') do
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


    # Deletes the specified library masking format.
    # @param [String] library_masking_format_id The OCID of the library masking format.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_library_masking_format.rb.html) to see an example of how to use delete_library_masking_format API.
    def delete_library_masking_format(library_masking_format_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_library_masking_format.' if logger

      raise "Missing the required parameter 'library_masking_format_id' when calling delete_library_masking_format." if library_masking_format_id.nil?
      raise "Parameter value for 'library_masking_format_id' must not be blank" if OCI::Internal::Util.blank_string?(library_masking_format_id)

      path = '/libraryMaskingFormats/{libraryMaskingFormatId}'.sub('{libraryMaskingFormatId}', library_masking_format_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_library_masking_format') do
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


    # Deletes the specified masking column.
    # @param [String] masking_column_key The unique key that identifies the masking column. It's numeric and unique within a masking policy.
    # @param [String] masking_policy_id The OCID of the masking policy.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_masking_column.rb.html) to see an example of how to use delete_masking_column API.
    def delete_masking_column(masking_column_key, masking_policy_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_masking_column.' if logger

      raise "Missing the required parameter 'masking_column_key' when calling delete_masking_column." if masking_column_key.nil?
      raise "Missing the required parameter 'masking_policy_id' when calling delete_masking_column." if masking_policy_id.nil?
      raise "Parameter value for 'masking_column_key' must not be blank" if OCI::Internal::Util.blank_string?(masking_column_key)
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/maskingColumns/{maskingColumnKey}'.sub('{maskingColumnKey}', masking_column_key.to_s).sub('{maskingPolicyId}', masking_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_masking_column') do
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


    # Deletes the specified masking policy.
    # @param [String] masking_policy_id The OCID of the masking policy.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_masking_policy.rb.html) to see an example of how to use delete_masking_policy API.
    def delete_masking_policy(masking_policy_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_masking_policy.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling delete_masking_policy." if masking_policy_id.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}'.sub('{maskingPolicyId}', masking_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_masking_policy') do
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


    # Deletes the specified report definition. Only the user created report definition can be deleted. The seeded report definitions cannot be deleted.
    # @param [String] report_definition_id Unique report definition identifier
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_report_definition.rb.html) to see an example of how to use delete_report_definition API.
    def delete_report_definition(report_definition_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_report_definition.' if logger

      raise "Missing the required parameter 'report_definition_id' when calling delete_report_definition." if report_definition_id.nil?
      raise "Parameter value for 'report_definition_id' must not be blank" if OCI::Internal::Util.blank_string?(report_definition_id)

      path = '/reportDefinitions/{reportDefinitionId}'.sub('{reportDefinitionId}', report_definition_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_report_definition') do
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


    # Deletes the specified sensitive column.
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [String] sensitive_column_key The unique key that identifies the sensitive column. It's numeric and unique within a sensitive data model.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_sensitive_column.rb.html) to see an example of how to use delete_sensitive_column API.
    def delete_sensitive_column(sensitive_data_model_id, sensitive_column_key, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_sensitive_column.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling delete_sensitive_column." if sensitive_data_model_id.nil?
      raise "Missing the required parameter 'sensitive_column_key' when calling delete_sensitive_column." if sensitive_column_key.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)
      raise "Parameter value for 'sensitive_column_key' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_column_key)

      path = '/sensitiveDataModels/{sensitiveDataModelId}/sensitiveColumns/{sensitiveColumnKey}'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s).sub('{sensitiveColumnKey}', sensitive_column_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_sensitive_column') do
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


    # Deletes the specified sensitive data model.
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_sensitive_data_model.rb.html) to see an example of how to use delete_sensitive_data_model API.
    def delete_sensitive_data_model(sensitive_data_model_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_sensitive_data_model.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling delete_sensitive_data_model." if sensitive_data_model_id.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)

      path = '/sensitiveDataModels/{sensitiveDataModelId}'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_sensitive_data_model') do
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


    # Deletes the specified sensitive type.
    # @param [String] sensitive_type_id The OCID of the sensitive type.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_sensitive_type.rb.html) to see an example of how to use delete_sensitive_type API.
    def delete_sensitive_type(sensitive_type_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_sensitive_type.' if logger

      raise "Missing the required parameter 'sensitive_type_id' when calling delete_sensitive_type." if sensitive_type_id.nil?
      raise "Parameter value for 'sensitive_type_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_type_id)

      path = '/sensitiveTypes/{sensitiveTypeId}'.sub('{sensitiveTypeId}', sensitive_type_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_sensitive_type') do
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


    # Deletes the specified target-alert policy Association.
    # @param [String] target_alert_policy_association_id The OCID of the target-alert policy association.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/delete_target_alert_policy_association.rb.html) to see an example of how to use delete_target_alert_policy_association API.
    def delete_target_alert_policy_association(target_alert_policy_association_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#delete_target_alert_policy_association.' if logger

      raise "Missing the required parameter 'target_alert_policy_association_id' when calling delete_target_alert_policy_association." if target_alert_policy_association_id.nil?
      raise "Parameter value for 'target_alert_policy_association_id' must not be blank" if OCI::Internal::Util.blank_string?(target_alert_policy_association_id)

      path = '/targetAlertPolicyAssociations/{targetAlertPolicyAssociationId}'.sub('{targetAlertPolicyAssociationId}', target_alert_policy_association_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#delete_target_alert_policy_association') do
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


    # Updates the list of audit trails created under audit profile.The
    # operation can be used to create new audit trails for target database
    # when they become available for audit collection because of change of database version
    # or change of database unified mode or change of data base  edition or being deleted previously etc.
    #
    # @param [String] audit_profile_id The OCID of the audit.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/discover_audit_trails.rb.html) to see an example of how to use discover_audit_trails API.
    def discover_audit_trails(audit_profile_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#discover_audit_trails.' if logger

      raise "Missing the required parameter 'audit_profile_id' when calling discover_audit_trails." if audit_profile_id.nil?
      raise "Parameter value for 'audit_profile_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_profile_id)

      path = '/auditProfiles/{auditProfileId}/actions/discoverAuditTrails'.sub('{auditProfileId}', audit_profile_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#discover_audit_trails') do
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


    # Downloads an already-generated discovery report. Note that the GenerateDiscoveryReportForDownload operation is a
    # prerequisite for the DownloadDiscoveryReport operation. Use GenerateDiscoveryReportForDownload to generate a discovery
    # report file and then use DownloadDiscoveryReport to download the generated file. By default, it downloads report for
    # all the columns in a sensitive data model. Use the discoveryJobId attribute to download report for a specific discovery job.
    #
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [OCI::DataSafe::Models::DownloadDiscoveryReportDetails] download_discovery_report_details Details to download a discovery report.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/download_discovery_report.rb.html) to see an example of how to use download_discovery_report API.
    def download_discovery_report(sensitive_data_model_id, download_discovery_report_details, opts = {}, &block)
      logger.debug 'Calling operation DataSafeClient#download_discovery_report.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling download_discovery_report." if sensitive_data_model_id.nil?
      raise "Missing the required parameter 'download_discovery_report_details' when calling download_discovery_report." if download_discovery_report_details.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)

      path = '/sensitiveDataModels/{sensitiveDataModelId}/actions/downloadReport'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s)
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(download_discovery_report_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#download_discovery_report') do
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


    # Downloads the masking log generated by the last masking operation on a target database using the specified masking policy.
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [OCI::DataSafe::Models::DownloadMaskingLogDetails] download_masking_log_details Details to download masking log.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/download_masking_log.rb.html) to see an example of how to use download_masking_log API.
    def download_masking_log(masking_policy_id, download_masking_log_details, opts = {}, &block)
      logger.debug 'Calling operation DataSafeClient#download_masking_log.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling download_masking_log." if masking_policy_id.nil?
      raise "Missing the required parameter 'download_masking_log_details' when calling download_masking_log." if download_masking_log_details.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/actions/downloadLog'.sub('{maskingPolicyId}', masking_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(download_masking_log_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#download_masking_log') do
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


    # Downloads an already-generated file corresponding to the specified masking policy.
    # Note that the GenerateMaskingPolicyForDownload operation is a prerequisite for the
    # DownloadMaskingPolicy operation. Use GenerateMaskingPolicyForDownload to generate
    # a masking policy file and then use DownloadMaskingPolicy to download the generated file.
    #
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [OCI::DataSafe::Models::DownloadMaskingPolicyDetails] download_masking_policy_details Details to download a masking policy file.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/download_masking_policy.rb.html) to see an example of how to use download_masking_policy API.
    def download_masking_policy(masking_policy_id, download_masking_policy_details, opts = {}, &block)
      logger.debug 'Calling operation DataSafeClient#download_masking_policy.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling download_masking_policy." if masking_policy_id.nil?
      raise "Missing the required parameter 'download_masking_policy_details' when calling download_masking_policy." if download_masking_policy_details.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/actions/download'.sub('{maskingPolicyId}', masking_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(download_masking_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#download_masking_policy') do
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


    # Downloads an already-generated masking report. Note that the GenerateMaskingReportForDownload
    # operation is a prerequisite for the DownloadMaskingReport operation. Use GenerateMaskingReportForDownload
    # to generate a masking report file and then use DownloadMaskingReport to download the generated file.
    #
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [OCI::DataSafe::Models::DownloadMaskingReportDetails] download_masking_report_details Details to download a masking report.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/download_masking_report.rb.html) to see an example of how to use download_masking_report API.
    def download_masking_report(masking_policy_id, download_masking_report_details, opts = {}, &block)
      logger.debug 'Calling operation DataSafeClient#download_masking_report.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling download_masking_report." if masking_policy_id.nil?
      raise "Missing the required parameter 'download_masking_report_details' when calling download_masking_report." if download_masking_report_details.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/actions/downloadReport'.sub('{maskingPolicyId}', masking_policy_id.to_s)
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(download_masking_report_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#download_masking_report') do
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


    # Downloads an already-generated file corresponding to the specified sensitive data model. Note that the
    # GenerateSensitiveDataModelForDownload operation is a prerequisite for the DownloadSensitiveDataModel operation.
    # Use GenerateSensitiveDataModelForDownload to generate a data model file and then use DownloadSensitiveDataModel
    # to download the generated file.
    #
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [OCI::DataSafe::Models::DownloadSensitiveDataModelDetails] download_sensitive_data_model_details Details to download a sensitive data model file.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/download_sensitive_data_model.rb.html) to see an example of how to use download_sensitive_data_model API.
    def download_sensitive_data_model(sensitive_data_model_id, download_sensitive_data_model_details, opts = {}, &block)
      logger.debug 'Calling operation DataSafeClient#download_sensitive_data_model.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling download_sensitive_data_model." if sensitive_data_model_id.nil?
      raise "Missing the required parameter 'download_sensitive_data_model_details' when calling download_sensitive_data_model." if download_sensitive_data_model_details.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)

      path = '/sensitiveDataModels/{sensitiveDataModelId}/actions/download'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s)
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

      post_body = @api_client.object_to_http_body(download_sensitive_data_model_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#download_sensitive_data_model') do
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


    # Generates a downloadable discovery report. It's a prerequisite for the DownloadDiscoveryReport operation. Use this
    # endpoint to generate a discovery report file and then use DownloadDiscoveryReport to download the generated file.
    # By default, it generates report for all the columns in a sensitive data model. Use the discoveryJobId attribute
    # to generate report for a specific discovery job.
    #
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [OCI::DataSafe::Models::GenerateDiscoveryReportForDownloadDetails] generate_discovery_report_for_download_details Details to generate a downloadable discovery report.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/generate_discovery_report_for_download.rb.html) to see an example of how to use generate_discovery_report_for_download API.
    def generate_discovery_report_for_download(sensitive_data_model_id, generate_discovery_report_for_download_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#generate_discovery_report_for_download.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling generate_discovery_report_for_download." if sensitive_data_model_id.nil?
      raise "Missing the required parameter 'generate_discovery_report_for_download_details' when calling generate_discovery_report_for_download." if generate_discovery_report_for_download_details.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)

      path = '/sensitiveDataModels/{sensitiveDataModelId}/actions/generateReportForDownload'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s)
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

      post_body = @api_client.object_to_http_body(generate_discovery_report_for_download_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#generate_discovery_report_for_download') do
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


    # Generates a downloadable file corresponding to the specified masking policy. It's
    # a prerequisite for the DownloadMaskingPolicy operation. Use this endpoint to generate
    # a masking policy file and then use DownloadMaskingPolicy to download the generated file.
    # Note that file generation and download are serial operations. The download operation
    # can't be invoked while the generate operation is in progress.
    #
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [OCI::DataSafe::Models::GenerateMaskingPolicyForDownloadDetails] generate_masking_policy_for_download_details Details to generate a masking policy file.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/generate_masking_policy_for_download.rb.html) to see an example of how to use generate_masking_policy_for_download API.
    def generate_masking_policy_for_download(masking_policy_id, generate_masking_policy_for_download_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#generate_masking_policy_for_download.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling generate_masking_policy_for_download." if masking_policy_id.nil?
      raise "Missing the required parameter 'generate_masking_policy_for_download_details' when calling generate_masking_policy_for_download." if generate_masking_policy_for_download_details.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/actions/generatePolicyForDownload'.sub('{maskingPolicyId}', masking_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(generate_masking_policy_for_download_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#generate_masking_policy_for_download') do
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


    # Generates a downloadable masking report. It's a prerequisite for the
    # DownloadMaskingReport operation. Use this endpoint to generate a
    # masking report file and then use DownloadMaskingReport to download
    # the generated file.
    #
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [OCI::DataSafe::Models::GenerateMaskingReportForDownloadDetails] generate_masking_report_for_download_details Details to generate a downloadable masking report.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/generate_masking_report_for_download.rb.html) to see an example of how to use generate_masking_report_for_download API.
    def generate_masking_report_for_download(masking_policy_id, generate_masking_report_for_download_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#generate_masking_report_for_download.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling generate_masking_report_for_download." if masking_policy_id.nil?
      raise "Missing the required parameter 'generate_masking_report_for_download_details' when calling generate_masking_report_for_download." if generate_masking_report_for_download_details.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/actions/generateReportForDownload'.sub('{maskingPolicyId}', masking_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(generate_masking_report_for_download_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#generate_masking_report_for_download') do
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


    # Generates a PDF or XLS report based on parameters and report definition.
    # @param [String] report_definition_id Unique report definition identifier
    # @param [OCI::DataSafe::Models::GenerateReportDetails] generate_report_details Details for report generation. It contains details such as PDF/XLS and filter parameters like audit event time limits, number of rows and target databases etc
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
    # @option opts [String] :scim_query The scimQuery query parameter accepts filter expressions that use the syntax described in Section 3.2.2.2
    #   of the System for Cross-Domain Identity Management (SCIM) specification, which is available
    #   at [RFC3339](https://tools.ietf.org/html/draft-ietf-scim-api-12). In SCIM filtering expressions,
    #   text, date, and time values must be enclosed in quotation marks, with date and time values using ISO-8601 format.
    #   (Numeric and boolean values should not be quoted.)
    #
    #   **Example:** query=(dateGenerated ge '2021-12-18T01-00-26') and (ilmTarget eq 'dscs-target')
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/generate_report.rb.html) to see an example of how to use generate_report API.
    def generate_report(report_definition_id, generate_report_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#generate_report.' if logger

      raise "Missing the required parameter 'report_definition_id' when calling generate_report." if report_definition_id.nil?
      raise "Missing the required parameter 'generate_report_details' when calling generate_report." if generate_report_details.nil?
      raise "Parameter value for 'report_definition_id' must not be blank" if OCI::Internal::Util.blank_string?(report_definition_id)

      path = '/reportDefinitions/{reportDefinitionId}/actions/generateReport'.sub('{reportDefinitionId}', report_definition_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scimQuery] = opts[:scim_query] if opts[:scim_query]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(generate_report_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#generate_report') do
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


    # Generates a downloadable file corresponding to the specified sensitive data model. It's a prerequisite for the
    # DownloadSensitiveDataModel operation. Use this endpoint to generate a data model file and then use DownloadSensitiveDataModel
    # to download the generated file. Note that file generation and download are serial operations. The download operation
    # can't be invoked while the generate operation is in progress.
    #
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [OCI::DataSafe::Models::GenerateSensitiveDataModelForDownloadDetails] generate_sensitive_data_model_for_download_details Details to generate a sensitive data model file.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/generate_sensitive_data_model_for_download.rb.html) to see an example of how to use generate_sensitive_data_model_for_download API.
    def generate_sensitive_data_model_for_download(sensitive_data_model_id, generate_sensitive_data_model_for_download_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#generate_sensitive_data_model_for_download.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling generate_sensitive_data_model_for_download." if sensitive_data_model_id.nil?
      raise "Missing the required parameter 'generate_sensitive_data_model_for_download_details' when calling generate_sensitive_data_model_for_download." if generate_sensitive_data_model_for_download_details.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)

      path = '/sensitiveDataModels/{sensitiveDataModelId}/actions/generateDataModelForDownload'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s)
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

      post_body = @api_client.object_to_http_body(generate_sensitive_data_model_for_download_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#generate_sensitive_data_model_for_download') do
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


    # Gets the details of alert by its ID.
    # @param [String] alert_id The OCID of alert.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::Alert Alert}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_alert.rb.html) to see an example of how to use get_alert API.
    def get_alert(alert_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_alert.' if logger

      raise "Missing the required parameter 'alert_id' when calling get_alert." if alert_id.nil?
      raise "Parameter value for 'alert_id' must not be blank" if OCI::Internal::Util.blank_string?(alert_id)

      path = '/alerts/{alertId}'.sub('{alertId}', alert_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_alert') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::Alert'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of alert policy by its ID.
    # @param [String] alert_policy_id The OCID of the alert policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AlertPolicy AlertPolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_alert_policy.rb.html) to see an example of how to use get_alert_policy API.
    def get_alert_policy(alert_policy_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_alert_policy.' if logger

      raise "Missing the required parameter 'alert_policy_id' when calling get_alert_policy." if alert_policy_id.nil?
      raise "Parameter value for 'alert_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(alert_policy_id)

      path = '/alertPolicies/{alertPolicyId}'.sub('{alertPolicyId}', alert_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_alert_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AlertPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the specified archive retreival.
    # @param [String] audit_archive_retrieval_id OCID of the archive retrieval.
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
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AuditArchiveRetrieval AuditArchiveRetrieval}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_audit_archive_retrieval.rb.html) to see an example of how to use get_audit_archive_retrieval API.
    def get_audit_archive_retrieval(audit_archive_retrieval_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_audit_archive_retrieval.' if logger

      raise "Missing the required parameter 'audit_archive_retrieval_id' when calling get_audit_archive_retrieval." if audit_archive_retrieval_id.nil?
      raise "Parameter value for 'audit_archive_retrieval_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_archive_retrieval_id)

      path = '/auditArchiveRetrievals/{auditArchiveRetrievalId}'.sub('{auditArchiveRetrievalId}', audit_archive_retrieval_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_audit_archive_retrieval') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AuditArchiveRetrieval'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a audit policy by identifier.
    # @param [String] audit_policy_id Unique audit policy identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AuditPolicy AuditPolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_audit_policy.rb.html) to see an example of how to use get_audit_policy API.
    def get_audit_policy(audit_policy_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_audit_policy.' if logger

      raise "Missing the required parameter 'audit_policy_id' when calling get_audit_policy." if audit_policy_id.nil?
      raise "Parameter value for 'audit_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_policy_id)

      path = '/auditPolicies/{auditPolicyId}'.sub('{auditPolicyId}', audit_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_audit_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AuditPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of audit profile resource and associated audit trails of the audit profile.
    # @param [String] audit_profile_id The OCID of the audit.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AuditProfile AuditProfile}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_audit_profile.rb.html) to see an example of how to use get_audit_profile API.
    def get_audit_profile(audit_profile_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_audit_profile.' if logger

      raise "Missing the required parameter 'audit_profile_id' when calling get_audit_profile." if audit_profile_id.nil?
      raise "Parameter value for 'audit_profile_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_profile_id)

      path = '/auditProfiles/{auditProfileId}'.sub('{auditProfileId}', audit_profile_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_audit_profile') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AuditProfile'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of audit trail.
    # @param [String] audit_trail_id The OCID of the audit trail.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AuditTrail AuditTrail}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_audit_trail.rb.html) to see an example of how to use get_audit_trail API.
    def get_audit_trail(audit_trail_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_audit_trail.' if logger

      raise "Missing the required parameter 'audit_trail_id' when calling get_audit_trail." if audit_trail_id.nil?
      raise "Parameter value for 'audit_trail_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_trail_id)

      path = '/auditTrails/{auditTrailId}'.sub('{auditTrailId}', audit_trail_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_audit_trail') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AuditTrail'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of basic masking formats compatible with the supported data types.
    # The data types are grouped into the following categories -
    # Character - Includes CHAR, NCHAR, VARCHAR2, and NVARCHAR2
    # Numeric - Includes NUMBER, FLOAT, RAW, BINARY_FLOAT, and BINARY_DOUBLE
    # Date - Includes DATE and TIMESTAMP
    # LOB - Includes BLOB, CLOB, and NCLOB
    # All - Includes all the supported data types
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::CompatibleFormatsForDataTypes CompatibleFormatsForDataTypes}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_compatible_formats_for_data_types.rb.html) to see an example of how to use get_compatible_formats_for_data_types API.
    def get_compatible_formats_for_data_types(opts = {})
      logger.debug 'Calling operation DataSafeClient#get_compatible_formats_for_data_types.' if logger


      path = '/compatibleFormatsForDataTypes'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_compatible_formats_for_data_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::CompatibleFormatsForDataTypes'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of library masking formats compatible with the existing sensitive types.
    # For each sensitive type, it returns the assigned default masking format as well as
    # the other library masking formats that have the sensitiveTypeIds attribute containing
    # the OCID of the sensitive type.
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
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::CompatibleFormatsForSensitiveTypes CompatibleFormatsForSensitiveTypes}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_compatible_formats_for_sensitive_types.rb.html) to see an example of how to use get_compatible_formats_for_sensitive_types API.
    def get_compatible_formats_for_sensitive_types(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_compatible_formats_for_sensitive_types.' if logger

      raise "Missing the required parameter 'compartment_id' when calling get_compatible_formats_for_sensitive_types." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      path = '/compatibleFormatsForSensitiveTypes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_compatible_formats_for_sensitive_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::CompatibleFormatsForSensitiveTypes'
        )
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


    # Gets the details of the specified discovery job.
    # @param [String] discovery_job_id The OCID of the discovery job.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::DiscoveryJob DiscoveryJob}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_discovery_job.rb.html) to see an example of how to use get_discovery_job API.
    def get_discovery_job(discovery_job_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_discovery_job.' if logger

      raise "Missing the required parameter 'discovery_job_id' when calling get_discovery_job." if discovery_job_id.nil?
      raise "Parameter value for 'discovery_job_id' must not be blank" if OCI::Internal::Util.blank_string?(discovery_job_id)

      path = '/discoveryJobs/{discoveryJobId}'.sub('{discoveryJobId}', discovery_job_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_discovery_job') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::DiscoveryJob'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the specified discovery result.
    # @param [String] discovery_job_id The OCID of the discovery job.
    # @param [String] result_key The unique key that identifies the discovery result.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::DiscoveryJobResult DiscoveryJobResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_discovery_job_result.rb.html) to see an example of how to use get_discovery_job_result API.
    def get_discovery_job_result(discovery_job_id, result_key, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_discovery_job_result.' if logger

      raise "Missing the required parameter 'discovery_job_id' when calling get_discovery_job_result." if discovery_job_id.nil?
      raise "Missing the required parameter 'result_key' when calling get_discovery_job_result." if result_key.nil?
      raise "Parameter value for 'discovery_job_id' must not be blank" if OCI::Internal::Util.blank_string?(discovery_job_id)
      raise "Parameter value for 'result_key' must not be blank" if OCI::Internal::Util.blank_string?(result_key)

      path = '/discoveryJobs/{discoveryJobId}/results/{resultKey}'.sub('{discoveryJobId}', discovery_job_id.to_s).sub('{resultKey}', result_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_discovery_job_result') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::DiscoveryJobResult'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the specified library masking format.
    # @param [String] library_masking_format_id The OCID of the library masking format.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::LibraryMaskingFormat LibraryMaskingFormat}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_library_masking_format.rb.html) to see an example of how to use get_library_masking_format API.
    def get_library_masking_format(library_masking_format_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_library_masking_format.' if logger

      raise "Missing the required parameter 'library_masking_format_id' when calling get_library_masking_format." if library_masking_format_id.nil?
      raise "Parameter value for 'library_masking_format_id' must not be blank" if OCI::Internal::Util.blank_string?(library_masking_format_id)

      path = '/libraryMaskingFormats/{libraryMaskingFormatId}'.sub('{libraryMaskingFormatId}', library_masking_format_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_library_masking_format') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::LibraryMaskingFormat'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the specified masking column.
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [String] masking_column_key The unique key that identifies the masking column. It's numeric and unique within a masking policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::MaskingColumn MaskingColumn}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_masking_column.rb.html) to see an example of how to use get_masking_column API.
    def get_masking_column(masking_policy_id, masking_column_key, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_masking_column.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling get_masking_column." if masking_policy_id.nil?
      raise "Missing the required parameter 'masking_column_key' when calling get_masking_column." if masking_column_key.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)
      raise "Parameter value for 'masking_column_key' must not be blank" if OCI::Internal::Util.blank_string?(masking_column_key)

      path = '/maskingPolicies/{maskingPolicyId}/maskingColumns/{maskingColumnKey}'.sub('{maskingPolicyId}', masking_policy_id.to_s).sub('{maskingColumnKey}', masking_column_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_masking_column') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::MaskingColumn'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the specified masking policy.
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::MaskingPolicy MaskingPolicy}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_masking_policy.rb.html) to see an example of how to use get_masking_policy API.
    def get_masking_policy(masking_policy_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_masking_policy.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling get_masking_policy." if masking_policy_id.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}'.sub('{maskingPolicyId}', masking_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_masking_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::MaskingPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the specified masking report.
    # @param [String] masking_report_id The OCID of the masking report.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::MaskingReport MaskingReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_masking_report.rb.html) to see an example of how to use get_masking_report API.
    def get_masking_report(masking_report_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_masking_report.' if logger

      raise "Missing the required parameter 'masking_report_id' when calling get_masking_report." if masking_report_id.nil?
      raise "Parameter value for 'masking_report_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_report_id)

      path = '/maskingReports/{maskingReportId}'.sub('{maskingReportId}', masking_report_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_masking_report') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::MaskingReport'
        )
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


    # Gets a report by identifier
    # @param [String] report_id Unique report identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::Report Report}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_report.rb.html) to see an example of how to use get_report API.
    def get_report(report_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_report.' if logger

      raise "Missing the required parameter 'report_id' when calling get_report." if report_id.nil?
      raise "Parameter value for 'report_id' must not be blank" if OCI::Internal::Util.blank_string?(report_id)

      path = '/reports/{reportId}'.sub('{reportId}', report_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_report') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::Report'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Downloads the specified report in the form of PDF or XLXS.
    # @param [String] report_id Unique report identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_report_content.rb.html) to see an example of how to use get_report_content API.
    def get_report_content(report_id, opts = {}, &block)
      logger.debug 'Calling operation DataSafeClient#get_report_content.' if logger

      raise "Missing the required parameter 'report_id' when calling get_report_content." if report_id.nil?
      raise "Parameter value for 'report_id' must not be blank" if OCI::Internal::Util.blank_string?(report_id)

      path = '/reports/{reportId}/content'.sub('{reportId}', report_id.to_s)
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_report_content') do
        if !block.nil?
          @api_client.call_api(
            :GET,
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
              :GET,
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
                :GET,
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
            :GET,
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


    # Gets the details of report definition specified by the identifier
    # @param [String] report_definition_id Unique report definition identifier
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::ReportDefinition ReportDefinition}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_report_definition.rb.html) to see an example of how to use get_report_definition API.
    def get_report_definition(report_definition_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_report_definition.' if logger

      raise "Missing the required parameter 'report_definition_id' when calling get_report_definition." if report_definition_id.nil?
      raise "Parameter value for 'report_definition_id' must not be blank" if OCI::Internal::Util.blank_string?(report_definition_id)

      path = '/reportDefinitions/{reportDefinitionId}'.sub('{reportDefinitionId}', report_definition_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_report_definition') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::ReportDefinition'
        )
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


    # Gets the details of the specified sensitive column.
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [String] sensitive_column_key The unique key that identifies the sensitive column. It's numeric and unique within a sensitive data model.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::SensitiveColumn SensitiveColumn}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_sensitive_column.rb.html) to see an example of how to use get_sensitive_column API.
    def get_sensitive_column(sensitive_data_model_id, sensitive_column_key, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_sensitive_column.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling get_sensitive_column." if sensitive_data_model_id.nil?
      raise "Missing the required parameter 'sensitive_column_key' when calling get_sensitive_column." if sensitive_column_key.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)
      raise "Parameter value for 'sensitive_column_key' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_column_key)

      path = '/sensitiveDataModels/{sensitiveDataModelId}/sensitiveColumns/{sensitiveColumnKey}'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s).sub('{sensitiveColumnKey}', sensitive_column_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_sensitive_column') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::SensitiveColumn'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the specified sensitive data model.
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::SensitiveDataModel SensitiveDataModel}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_sensitive_data_model.rb.html) to see an example of how to use get_sensitive_data_model API.
    def get_sensitive_data_model(sensitive_data_model_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_sensitive_data_model.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling get_sensitive_data_model." if sensitive_data_model_id.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)

      path = '/sensitiveDataModels/{sensitiveDataModelId}'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_sensitive_data_model') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::SensitiveDataModel'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of the specified sensitive type.
    # @param [String] sensitive_type_id The OCID of the sensitive type.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::SensitiveType SensitiveType}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_sensitive_type.rb.html) to see an example of how to use get_sensitive_type API.
    def get_sensitive_type(sensitive_type_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_sensitive_type.' if logger

      raise "Missing the required parameter 'sensitive_type_id' when calling get_sensitive_type." if sensitive_type_id.nil?
      raise "Parameter value for 'sensitive_type_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_type_id)

      path = '/sensitiveTypes/{sensitiveTypeId}'.sub('{sensitiveTypeId}', sensitive_type_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_sensitive_type') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::SensitiveType'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of target-alert policy association by its ID.
    # @param [String] target_alert_policy_association_id The OCID of the target-alert policy association.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::TargetAlertPolicyAssociation TargetAlertPolicyAssociation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/get_target_alert_policy_association.rb.html) to see an example of how to use get_target_alert_policy_association API.
    def get_target_alert_policy_association(target_alert_policy_association_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#get_target_alert_policy_association.' if logger

      raise "Missing the required parameter 'target_alert_policy_association_id' when calling get_target_alert_policy_association." if target_alert_policy_association_id.nil?
      raise "Parameter value for 'target_alert_policy_association_id' must not be blank" if OCI::Internal::Util.blank_string?(target_alert_policy_association_id)

      path = '/targetAlertPolicyAssociations/{targetAlertPolicyAssociationId}'.sub('{targetAlertPolicyAssociationId}', target_alert_policy_association_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#get_target_alert_policy_association') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::TargetAlertPolicyAssociation'
        )
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


    # Returns aggregation details of alerts.
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the if-match parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [DateTime] :time_started An optional filter to return audit events whose creation time in the database is greater than and equal to the date-time specified,
    #   in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # @option opts [DateTime] :time_ended An optional filter to return audit events whose creation time in the database is less than and equal to the date-time specified,
    #   in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # @option opts [String] :query_time_zone Default time zone is UTC if no time zone provided. The date-time considerations of the resource will be in accordance with the specified time zone.
    #    (default to UTC)
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: displayName, timeCreated
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :scim_query The scimQuery query parameter accepts filter expressions that use the syntax described in Section 3.2.2.2
    #   of the System for Cross-Domain Identity Management (SCIM) specification, which is available
    #   at [RFC3339](https://tools.ietf.org/html/draft-ietf-scim-api-12). In SCIM filtering expressions,
    #   text, date, and time values must be enclosed in quotation marks, with date and time values using ISO-8601 format.
    #   (Numeric and boolean values should not be quoted.)
    #
    #   **Example:** query=(timeCreated ge '2021-06-04T01-00-26') and (targetNames eq 'target_1')
    #   Supported fields:
    #   severity
    #   status
    #   alertType
    #   targetIds
    #   targetNames
    #   operationTime
    #   lifecycleState
    #   displayName
    #   timeCreated
    #   timeUpdated
    #
    # @option opts [Array<String>] :summary_field Specifies a subset of summarized fields to be returned in the response.
    #   Allowed values are: alertType, targetIds, targetNames, alertSeverity, alertStatus, timeCreated, policyId, open, closed, critical, high, medium, low, alertcount
    # @option opts [Array<String>] :group_by A groupBy can only be used in combination with summaryField parameter.
    #   A groupBy value has to be a subset of the values mentioned in summaryField parameter.
    #
    #   Allowed values are: alertType, targetIds, targetNames, alertSeverity, alertStatus, timeCreated, policyId
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AlertAnalyticsCollection AlertAnalyticsCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_alert_analytics.rb.html) to see an example of how to use list_alert_analytics API.
    def list_alert_analytics(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_alert_analytics.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_alert_analytics." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end


      summary_field_allowable_values = %w[alertType targetIds targetNames alertSeverity alertStatus timeCreated policyId open closed critical high medium low alertcount]
      if opts[:summary_field] && !opts[:summary_field].empty?
        opts[:summary_field].each do |val_to_check|
          unless summary_field_allowable_values.include?(val_to_check)
            raise 'Invalid value for "summary_field", must be one of alertType, targetIds, targetNames, alertSeverity, alertStatus, timeCreated, policyId, open, closed, critical, high, medium, low, alertcount.'
          end
        end
      end


      group_by_allowable_values = %w[alertType targetIds targetNames alertSeverity alertStatus timeCreated policyId]
      if opts[:group_by] && !opts[:group_by].empty?
        opts[:group_by].each do |val_to_check|
          unless group_by_allowable_values.include?(val_to_check)
            raise 'Invalid value for "group_by", must be one of alertType, targetIds, targetNames, alertSeverity, alertStatus, timeCreated, policyId.'
          end
        end
      end

      path = '/alertAnalytics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:timeStarted] = opts[:time_started] if opts[:time_started]
      query_params[:timeEnded] = opts[:time_ended] if opts[:time_ended]
      query_params[:queryTimeZone] = opts[:query_time_zone] if opts[:query_time_zone]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:scimQuery] = opts[:scim_query] if opts[:scim_query]
      query_params[:summaryField] = OCI::ApiClient.build_collection_params(opts[:summary_field], :multi) if opts[:summary_field] && !opts[:summary_field].empty?
      query_params[:groupBy] = OCI::ApiClient.build_collection_params(opts[:group_by], :multi) if opts[:group_by] && !opts[:group_by].empty?

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_alert_analytics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AlertAnalyticsCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all alert policies.
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :alert_policy_id A filter to return policy by it's OCID.
    # @option opts [String] :type An optional filter to return only alert policies of a certain type.
    # @option opts [BOOLEAN] :is_user_defined An optional filter to return only alert policies that are user-defined or not. (default to false)
    # @option opts [String] :display_name A filter to return only resources that match the specified display name.
    #
    # @option opts [String] :lifecycle_state An optional filter to return only alert policies that have the given life-cycle state.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided.
    #    (default to timeCreated)
    #   Allowed values are: displayName, timeCreated
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter to return only the resources that were created after the specified date and time, as defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   Using TimeCreatedGreaterThanOrEqualToQueryParam parameter retrieves all resources created after that date.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_created_less_than Search for resources that were created before a specific date.
    #   Specifying this parameter corresponding `timeCreatedLessThan`
    #   parameter will retrieve all resources created before the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AlertPolicyCollection AlertPolicyCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_alert_policies.rb.html) to see an example of how to use list_alert_policies API.
    def list_alert_policies(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_alert_policies.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_alert_policies." if compartment_id.nil?

      if opts[:type] && !OCI::DataSafe::Models::ALERT_POLICY_TYPE_ENUM.include?(opts[:type])
        raise 'Invalid value for "type", must be one of the values in OCI::DataSafe::Models::ALERT_POLICY_TYPE_ENUM.'
      end

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::ALERT_POLICY_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::ALERT_POLICY_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      path = '/alertPolicies'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:alertPolicyId] = opts[:alert_policy_id] if opts[:alert_policy_id]
      query_params[:type] = opts[:type] if opts[:type]
      query_params[:isUserDefined] = opts[:is_user_defined] if !opts[:is_user_defined].nil?
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_alert_policies') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AlertPolicyCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the rules of the specified alert policy. The alert policy is said to be satisfied when all rules in the policy evaulate to true.
    # If there are three rules: rule1,rule2 and rule3, the policy is satisfied if rule1 AND rule2 AND rule3 is True.
    #
    # @param [String] alert_policy_id The OCID of the alert policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AlertPolicyRuleCollection AlertPolicyRuleCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_alert_policy_rules.rb.html) to see an example of how to use list_alert_policy_rules API.
    def list_alert_policy_rules(alert_policy_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_alert_policy_rules.' if logger

      raise "Missing the required parameter 'alert_policy_id' when calling list_alert_policy_rules." if alert_policy_id.nil?
      raise "Parameter value for 'alert_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(alert_policy_id)

      path = '/alertPolicies/{alertPolicyId}/rules'.sub('{alertPolicyId}', alert_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_alert_policy_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AlertPolicyRuleCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all alerts.
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :id A filter to return alert by it's OCID.
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: displayName, timeCreated
    # @option opts [String] :scim_query The scimQuery query parameter accepts filter expressions that use the syntax described in Section 3.2.2.2
    #   of the System for Cross-Domain Identity Management (SCIM) specification, which is available
    #   at [RFC3339](https://tools.ietf.org/html/draft-ietf-scim-api-12). In SCIM filtering expressions,
    #   text, date, and time values must be enclosed in quotation marks, with date and time values using ISO-8601 format.
    #   (Numeric and boolean values should not be quoted.)
    #
    #   **Example:** query=(timeCreated ge '2021-06-04T01-00-26') and (targetNames eq 'target_1')
    #   Supported fields:
    #   severity
    #   status
    #   alertType
    #   targetIds
    #   targetNames
    #   operationTime
    #   lifecycleState
    #   displayName
    #   timeCreated
    #   timeUpdated
    #
    # @option opts [Array<String>] :field Specifies a subset of fields to be returned in the response.
    #   Allowed values are: id, displayName, alertType, targetIds, targetNames, severity, status, operationTime, operation, operationStatus, timeCreated, timeUpdated, policyId, lifecycleState
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AlertCollection AlertCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_alerts.rb.html) to see an example of how to use list_alerts API.
    def list_alerts(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_alerts.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_alerts." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated.'
      end


      field_allowable_values = %w[id displayName alertType targetIds targetNames severity status operationTime operation operationStatus timeCreated timeUpdated policyId lifecycleState]
      if opts[:field] && !opts[:field].empty?
        opts[:field].each do |val_to_check|
          unless field_allowable_values.include?(val_to_check)
            raise 'Invalid value for "field", must be one of id, displayName, alertType, targetIds, targetNames, severity, status, operationTime, operation, operationStatus, timeCreated, timeUpdated, policyId, lifecycleState.'
          end
        end
      end

      path = '/alerts'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:scimQuery] = opts[:scim_query] if opts[:scim_query]
      query_params[:field] = OCI::ApiClient.build_collection_params(opts[:field], :multi) if opts[:field] && !opts[:field].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_alerts') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AlertCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns the list of audit archive retrieval.
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the specified display name.
    #
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :audit_archive_retrieval_id OCID of the archive retrieval.
    # @option opts [String] :target_id The OCID of the target associated with the archive retrieval.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :lifecycle_state A filter to return only resources that matches the specified lifecycle state.
    # @option opts [DateTime] :time_of_expiry The date time when retrieved archive data will be deleted from Data Safe and unloaded back into archival.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field used for sorting. Only one sorting order (sortOrder) can be specified.
    #   The default order for TIMECREATED is descending. The default order for DISPLAYNAME is ascending.
    #   The DISPLAYNAME sort order is case sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AuditArchiveRetrievalCollection AuditArchiveRetrievalCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_audit_archive_retrievals.rb.html) to see an example of how to use list_audit_archive_retrievals API.
    def list_audit_archive_retrievals(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_audit_archive_retrievals.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_audit_archive_retrievals." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::AUDIT_ARCHIVE_RETRIEVAL_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::AUDIT_ARCHIVE_RETRIEVAL_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      path = '/auditArchiveRetrievals'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:auditArchiveRetrievalId] = opts[:audit_archive_retrieval_id] if opts[:audit_archive_retrieval_id]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeOfExpiry] = opts[:time_of_expiry] if opts[:time_of_expiry]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_audit_archive_retrievals') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AuditArchiveRetrievalCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # By default ListAuditEventAnalytics operation will return all of the summary columns. To filter desired summary columns, specify
    # it in the `summaryOf` query parameter.
    #
    # **Example:** /ListAuditEventAnalytics?summaryField=targetName&summaryField=userName&summaryField=clientHostName&summaryField
    #              &summaryField=dmls&summaryField=privilege_changes&summaryField=ddls&summaryField=login_failure&summaryField=login_success
    #              &summaryField=eventcount&q=(operationTime ge '2021-06-13T23:49:14')&groupBy=targetName
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
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
    # @option opts [Integer] :limit For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :page It is usually retrieved from a previous \"List\" call. For details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :scim_query The scimQuery query parameter accepts filter expressions that use the syntax described in Section 3.2.2.2
    #   of the System for Cross-Domain Identity Management (SCIM) specification, which is available
    #   at [RFC3339](https://tools.ietf.org/html/draft-ietf-scim-api-12). In SCIM filtering expressions,
    #   text, date, and time values must be enclosed in quotation marks, with date and time values using ISO-8601 format.
    #   (Numeric and boolean values should not be quoted.)
    #
    #   **Example:** query=(operationTime ge '2021-06-04T01-00-26') and (eventName eq 'LOGON')
    #
    # @option opts [Array<String>] :summary_field Specifies a subset of summarized fields to be returned in the response.
    #   Allowed values are: auditEventTime, dbUserName, targetId, targetName, targetClass, objectType, clientHostname, clientProgram, clientId, auditType, eventName, allRecord, auditSettingsChange, dbSchemaChange, entitlementChange, loginFailure, loginSuccess, allViolations, realmViolations, ruleViolations, dvconfigActivities, ddls, dmls, privilegeChanges, auditSettingsEnables, auditSettingsDisables, selects, creates, alters, drops, grants, revokes
    # @option opts [DateTime] :time_started An optional filter to return audit events whose creation time in the database is greater than and equal to the date-time specified,
    #   in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # @option opts [DateTime] :time_ended An optional filter to return audit events whose creation time in the database is less than and equal to the date-time specified,
    #   in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # @option opts [String] :query_time_zone Default time zone is UTC if no time zone provided. The date-time considerations of the resource will be in accordance with the specified time zone.
    #    (default to UTC)
    # @option opts [Array<String>] :group_by A groupBy can only be used in combination with summaryField parameter.
    #   A groupBy value has to be a subset of the values mentioned in summaryField parameter.
    #
    #   Allowed values are: auditEventTime, dbUserName, targetId, targetName, targetClass, objectType, clientHostname, clientProgram, clientId, auditType, eventName
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request might be rejected.
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by If this query parameter is specified, the result is ordered based on this query parameter value.
    #   Allowed values are: targetId, targetClass, targetName, objectType, dbUserName, eventName, auditEventTime, clientHostname, clientProgram, clientId, auditType
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AuditEventAnalyticsCollection AuditEventAnalyticsCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_audit_event_analytics.rb.html) to see an example of how to use list_audit_event_analytics API.
    def list_audit_event_analytics(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_audit_event_analytics.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_audit_event_analytics." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end


      summary_field_allowable_values = %w[auditEventTime dbUserName targetId targetName targetClass objectType clientHostname clientProgram clientId auditType eventName allRecord auditSettingsChange dbSchemaChange entitlementChange loginFailure loginSuccess allViolations realmViolations ruleViolations dvconfigActivities ddls dmls privilegeChanges auditSettingsEnables auditSettingsDisables selects creates alters drops grants revokes]
      if opts[:summary_field] && !opts[:summary_field].empty?
        opts[:summary_field].each do |val_to_check|
          unless summary_field_allowable_values.include?(val_to_check)
            raise 'Invalid value for "summary_field", must be one of auditEventTime, dbUserName, targetId, targetName, targetClass, objectType, clientHostname, clientProgram, clientId, auditType, eventName, allRecord, auditSettingsChange, dbSchemaChange, entitlementChange, loginFailure, loginSuccess, allViolations, realmViolations, ruleViolations, dvconfigActivities, ddls, dmls, privilegeChanges, auditSettingsEnables, auditSettingsDisables, selects, creates, alters, drops, grants, revokes.'
          end
        end
      end


      group_by_allowable_values = %w[auditEventTime dbUserName targetId targetName targetClass objectType clientHostname clientProgram clientId auditType eventName]
      if opts[:group_by] && !opts[:group_by].empty?
        opts[:group_by].each do |val_to_check|
          unless group_by_allowable_values.include?(val_to_check)
            raise 'Invalid value for "group_by", must be one of auditEventTime, dbUserName, targetId, targetName, targetClass, objectType, clientHostname, clientProgram, clientId, auditType, eventName.'
          end
        end
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[targetId targetClass targetName objectType dbUserName eventName auditEventTime clientHostname clientProgram clientId auditType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of targetId, targetClass, targetName, objectType, dbUserName, eventName, auditEventTime, clientHostname, clientProgram, clientId, auditType.'
      end

      path = '/auditEventAnalytics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:scimQuery] = opts[:scim_query] if opts[:scim_query]
      query_params[:summaryField] = OCI::ApiClient.build_collection_params(opts[:summary_field], :multi) if opts[:summary_field] && !opts[:summary_field].empty?
      query_params[:timeStarted] = opts[:time_started] if opts[:time_started]
      query_params[:timeEnded] = opts[:time_ended] if opts[:time_ended]
      query_params[:queryTimeZone] = opts[:query_time_zone] if opts[:query_time_zone]
      query_params[:groupBy] = OCI::ApiClient.build_collection_params(opts[:group_by], :multi) if opts[:group_by] && !opts[:group_by].empty?
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_audit_event_analytics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AuditEventAnalyticsCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # The ListAuditEvents operation returns specified `compartmentId` audit Events only.
    # The list does not include any audit Events associated with the `subcompartments` of the specified `compartmentId`.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform ListAuditEvents on the
    # `compartmentId` passed and when it is set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ACCESSIBLE.
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @option opts [Integer] :limit For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :page It is usually retrieved from a previous \"List\" call. For details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :scim_query The scimQuery query parameter accepts filter expressions that use the syntax described in Section 3.2.2.2
    #   of the System for Cross-Domain Identity Management (SCIM) specification, which is available
    #   at [RFC3339](https://tools.ietf.org/html/draft-ietf-scim-api-12). In SCIM filtering expressions,
    #   text, date, and time values must be enclosed in quotation marks, with date and time values using ISO-8601 format.
    #   (Numeric and boolean values should not be quoted.)
    #
    #   **Example:** query=(operationTime ge '2021-06-04T01-00-26') and (eventName eq 'LOGON')
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by If this query parameter is specified, the result is sorted by this query parameter value.
    #    (default to auditEventTime)
    #   Allowed values are: dbUserName, targetName, databaseType, targetClass, auditEventTime, timeCollected, osUserName, operation, operationStatus, eventName, errorCode, errorMessage, objectType, objectName, objectOwner, clientHostname, clientIp, isAlerted, actionTaken, clientProgram, commandText, commandParam, extendedEventAttributes, auditLocation, osTerminal, clientId, auditPolicies, auditType
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AuditEventCollection AuditEventCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_audit_events.rb.html) to see an example of how to use list_audit_events API.
    def list_audit_events(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_audit_events.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_audit_events." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[dbUserName targetName databaseType targetClass auditEventTime timeCollected osUserName operation operationStatus eventName errorCode errorMessage objectType objectName objectOwner clientHostname clientIp isAlerted actionTaken clientProgram commandText commandParam extendedEventAttributes auditLocation osTerminal clientId auditPolicies auditType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of dbUserName, targetName, databaseType, targetClass, auditEventTime, timeCollected, osUserName, operation, operationStatus, eventName, errorCode, errorMessage, objectType, objectName, objectOwner, clientHostname, clientIp, isAlerted, actionTaken, clientProgram, commandText, commandParam, extendedEventAttributes, auditLocation, osTerminal, clientId, auditPolicies, auditType.'
      end

      path = '/auditEvents'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:scimQuery] = opts[:scim_query] if opts[:scim_query]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json, application/xml'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_audit_events') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AuditEventCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves a list of all audited targets with their corresponding provisioned audit policies, and their provisioning conditions.
    #
    # The ListAuditPolicies operation returns only the audit policies in the specified `compartmentId`.
    # The list does not include any subcompartments of the compartmentId passed.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform ListAuditPolicies on the
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
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
    # @option opts [String] :lifecycle_state The current state of the audit policy.
    # @option opts [String] :audit_policy_id An optional filter to return only resources that match the specified id.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field used for sorting. Only one sorting order (sortOrder) can be specified.
    #   The default order for TIMECREATED is descending. The default order for DISPLAYNAME is ascending.
    #   The DISPLAYNAME sort order is case sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AuditPolicyCollection AuditPolicyCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_audit_policies.rb.html) to see an example of how to use list_audit_policies API.
    def list_audit_policies(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_audit_policies.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_audit_policies." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::AUDIT_POLICY_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::AUDIT_POLICY_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      path = '/auditPolicies'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:auditPolicyId] = opts[:audit_policy_id] if opts[:audit_policy_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_audit_policies') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AuditPolicyCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of audit profile aggregated details . A audit profile  aggregation helps understand the overall  state of audit profile profiles.
    # As an example, it helps understand how many audit profiles have paid usage. It is especially useful to create dashboards or to support analytics.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform AuditProfileAnalytics on the
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
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Array<String>] :group_by The group by parameter for summarize operation on audit.
    #   Allowed values are: isPaidUsageEnabled
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AuditProfileAnalyticCollection AuditProfileAnalyticCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_audit_profile_analytics.rb.html) to see an example of how to use list_audit_profile_analytics API.
    def list_audit_profile_analytics(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_audit_profile_analytics.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_audit_profile_analytics." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end


      group_by_allowable_values = %w[isPaidUsageEnabled]
      if opts[:group_by] && !opts[:group_by].empty?
        opts[:group_by].each do |val_to_check|
          unless group_by_allowable_values.include?(val_to_check)
            raise 'Invalid value for "group_by", must be one of isPaidUsageEnabled.'
          end
        end
      end

      path = '/auditProfileAnalytics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:groupBy] = OCI::ApiClient.build_collection_params(opts[:group_by], :multi) if opts[:group_by] && !opts[:group_by].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_audit_profile_analytics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AuditProfileAnalyticCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all audit profiles.
    #
    # The ListAuditProfiles operation returns only the audit profiles in the specified `compartmentId`.
    # The list does not include any subcompartments of the compartmentId passed.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform ListAuditProfiles on the
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
    # @option opts [String] :audit_profile_id A optional filter to return only resources that match the specified id.
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
    # @option opts [String] :display_name A filter to return only resources that match the specified display name.
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :lifecycle_state A optional filter to return only resources that match the specified lifecycle state.
    # @option opts [BOOLEAN] :is_override_global_retention_setting A optional filter to return only resources that match the specified retention configured value.
    # @option opts [BOOLEAN] :is_paid_usage_enabled Indicates if you want to continue audit record collection beyond the free limit
    #   of one million audit records per month per target database, incurring additional charges.
    #   The default value is inherited from the global settings. You can change at the global level
    #   or at the target level.
    #
    # @option opts [Integer] :audit_collected_volume_greater_than_or_equal_to A filter to return only items that have count of audit records collected greater than or equal to the specified value.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field used for sorting. Only one sorting order (sortOrder) can be specified.
    #   The default order for TIMECREATED is descending. The default order for DISPLAYNAME is ascending.
    #   The DISPLAYNAME sort order is case sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AuditProfileCollection AuditProfileCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_audit_profiles.rb.html) to see an example of how to use list_audit_profiles API.
    def list_audit_profiles(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_audit_profiles.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_audit_profiles." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::AUDIT_PROFILE_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::AUDIT_PROFILE_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      path = '/auditProfiles'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:auditProfileId] = opts[:audit_profile_id] if opts[:audit_profile_id]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:isOverrideGlobalRetentionSetting] = opts[:is_override_global_retention_setting] if !opts[:is_override_global_retention_setting].nil?
      query_params[:isPaidUsageEnabled] = opts[:is_paid_usage_enabled] if !opts[:is_paid_usage_enabled].nil?
      query_params[:auditCollectedVolumeGreaterThanOrEqualTo] = opts[:audit_collected_volume_greater_than_or_equal_to] if opts[:audit_collected_volume_greater_than_or_equal_to]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_audit_profiles') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AuditProfileCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of audit trail aggregated details . A audit trail aggregation helps understand the overall  state of trails.
    # As an example, it helps understand how many trails are running or stopped. It is especially useful to create dashboards or to support analytics.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform AuditTrailAnalytics on the
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
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Array<String>] :group_by The group by parameter for summarize operation on audit trail.
    #   Allowed values are: location, lifecycleState, status, targetId
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AuditTrailAnalyticCollection AuditTrailAnalyticCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_audit_trail_analytics.rb.html) to see an example of how to use list_audit_trail_analytics API.
    def list_audit_trail_analytics(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_audit_trail_analytics.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_audit_trail_analytics." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end


      group_by_allowable_values = %w[location lifecycleState status targetId]
      if opts[:group_by] && !opts[:group_by].empty?
        opts[:group_by].each do |val_to_check|
          unless group_by_allowable_values.include?(val_to_check)
            raise 'Invalid value for "group_by", must be one of location, lifecycleState, status, targetId.'
          end
        end
      end

      path = '/auditTrailAnalytics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:groupBy] = OCI::ApiClient.build_collection_params(opts[:group_by], :multi) if opts[:group_by] && !opts[:group_by].empty?
      query_params[:targetId] = opts[:target_id] if opts[:target_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_audit_trail_analytics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AuditTrailAnalyticCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all audit trails.
    # The ListAuditTrails operation returns only the audit trails in the specified `compartmentId`.
    # The list does not include any subcompartments of the compartmentId passed.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform ListAuditTrails on the
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
    # @option opts [String] :audit_trail_id A optional filter to return only resources that match the specified id.
    # @option opts [String] :display_name A filter to return only resources that match the specified display name.
    #
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :lifecycle_state A optional filter to return only resources that match the specified lifecycle state.
    # @option opts [String] :status A optional filter to return only resources that match the specified sub-state of audit trail.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field used for sorting. Only one sorting order (sortOrder) can be specified.
    #   The default order for TIMECREATED is descending. The default order for DISPLAYNAME is ascending.
    #   The DISPLAYNAME sort order is case sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AuditTrailCollection AuditTrailCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_audit_trails.rb.html) to see an example of how to use list_audit_trails API.
    def list_audit_trails(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_audit_trails.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_audit_trails." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::AUDIT_TRAIL_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::AUDIT_TRAIL_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:status] && !OCI::DataSafe::Models::AUDIT_TRAIL_STATUS_ENUM.include?(opts[:status])
        raise 'Invalid value for "status", must be one of the values in OCI::DataSafe::Models::AUDIT_TRAIL_STATUS_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      path = '/auditTrails'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:auditTrailId] = opts[:audit_trail_id] if opts[:audit_trail_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:status] = opts[:status] if opts[:status]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_audit_trails') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AuditTrailCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieves a list of audit trails, and associated audit event volume for each trail up to defined start date.
    # @param [String] audit_profile_id The OCID of the audit.
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :trail_location The audit trail location.
    # @option opts [DateTime] :month_in_consideration_greater_than Specifying `monthInConsiderationGreaterThan` parameter
    #   will retrieve all items for which the event month is
    #   greater than the date and time specified,
    #   in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    #   **Example:** 2016-12-19T00:00:00.000Z
    #
    # @option opts [DateTime] :month_in_consideration_less_than Specifying `monthInConsiderationLessThan` parameter
    #   will retrieve all items for which the event month is
    #   less than the date and time specified,
    #   in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    #   **Example:** 2016-12-19T00:00:00.000Z
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order(sortOrder). The default order for all fields is ascending.
    #    (default to monthInConsideration)
    #   Allowed values are: monthInConsideration, volume, trailLocation
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::AvailableAuditVolumeCollection AvailableAuditVolumeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_available_audit_volumes.rb.html) to see an example of how to use list_available_audit_volumes API.
    def list_available_audit_volumes(audit_profile_id, work_request_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_available_audit_volumes.' if logger

      raise "Missing the required parameter 'audit_profile_id' when calling list_available_audit_volumes." if audit_profile_id.nil?
      raise "Missing the required parameter 'work_request_id' when calling list_available_audit_volumes." if work_request_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[monthInConsideration volume trailLocation].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of monthInConsideration, volume, trailLocation.'
      end
      raise "Parameter value for 'audit_profile_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_profile_id)

      path = '/auditProfiles/{auditProfileId}/availableAuditVolumes'.sub('{auditProfileId}', audit_profile_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:workRequestId] = work_request_id
      query_params[:trailLocation] = opts[:trail_location] if opts[:trail_location]
      query_params[:monthInConsiderationGreaterThan] = opts[:month_in_consideration_greater_than] if opts[:month_in_consideration_greater_than]
      query_params[:monthInConsiderationLessThan] = opts[:month_in_consideration_less_than] if opts[:month_in_consideration_less_than]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_available_audit_volumes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::AvailableAuditVolumeCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all collected audit volume data points.
    # @param [String] audit_profile_id The OCID of the audit.
    # @param [String] work_request_id The OCID of the work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :month_in_consideration_greater_than Specifying `monthInConsiderationGreaterThan` parameter
    #   will retrieve all items for which the event month is
    #   greater than the date and time specified,
    #   in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    #   **Example:** 2016-12-19T00:00:00.000Z
    #
    # @option opts [DateTime] :month_in_consideration_less_than Specifying `monthInConsiderationLessThan` parameter
    #   will retrieve all items for which the event month is
    #   less than the date and time specified,
    #   in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    #   **Example:** 2016-12-19T00:00:00.000Z
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order(sortOrder). The default order for all fields is ascending.
    #    (default to monthInConsideration)
    #   Allowed values are: monthInConsideration, onlineVolume, archivedVolume
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::CollectedAuditVolumeCollection CollectedAuditVolumeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_collected_audit_volumes.rb.html) to see an example of how to use list_collected_audit_volumes API.
    def list_collected_audit_volumes(audit_profile_id, work_request_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_collected_audit_volumes.' if logger

      raise "Missing the required parameter 'audit_profile_id' when calling list_collected_audit_volumes." if audit_profile_id.nil?
      raise "Missing the required parameter 'work_request_id' when calling list_collected_audit_volumes." if work_request_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[monthInConsideration onlineVolume archivedVolume].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of monthInConsideration, onlineVolume, archivedVolume.'
      end
      raise "Parameter value for 'audit_profile_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_profile_id)

      path = '/auditProfiles/{auditProfileId}/collectedAuditVolumes'.sub('{auditProfileId}', audit_profile_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:workRequestId] = work_request_id
      query_params[:monthInConsiderationGreaterThan] = opts[:month_in_consideration_greater_than] if opts[:month_in_consideration_greater_than]
      query_params[:monthInConsiderationLessThan] = opts[:month_in_consideration_less_than] if opts[:month_in_consideration_less_than]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_collected_audit_volumes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::CollectedAuditVolumeCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of column metadata objects.
    #
    # @param [String] target_database_id The OCID of the Data Safe target database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Array<String>] :schema_name A filter to return only items related to specific schema name.
    # @option opts [Array<String>] :table_name A filter to return only items related to specific table name.
    # @option opts [Array<String>] :column_name A filter to return only a specific column based on column name.
    # @option opts [Array<String>] :datatype A filter to return only items related to specific datatype.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field used for sorting. Only one sorting order (sortOrder) can be specified.
    #    (default to COLUMNNAME)
    #   Allowed values are: SCHEMANAME, TABLENAME, COLUMNNAME, DATATYPE
    # @option opts [String] :schema_name_contains A filter to return only items if schema name contains a specific string.
    # @option opts [String] :table_name_contains A filter to return only items if table name contains a specific string.
    # @option opts [String] :column_name_contains A filter to return only items if column name contains a specific string.
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::ColumnSummary ColumnSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_columns.rb.html) to see an example of how to use list_columns API.
    def list_columns(target_database_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_columns.' if logger

      raise "Missing the required parameter 'target_database_id' when calling list_columns." if target_database_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[SCHEMANAME TABLENAME COLUMNNAME DATATYPE].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of SCHEMANAME, TABLENAME, COLUMNNAME, DATATYPE.'
      end
      raise "Parameter value for 'target_database_id' must not be blank" if OCI::Internal::Util.blank_string?(target_database_id)

      path = '/targetDatabases/{targetDatabaseId}/columns'.sub('{targetDatabaseId}', target_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:schemaName] = OCI::ApiClient.build_collection_params(opts[:schema_name], :multi) if opts[:schema_name] && !opts[:schema_name].empty?
      query_params[:tableName] = OCI::ApiClient.build_collection_params(opts[:table_name], :multi) if opts[:table_name] && !opts[:table_name].empty?
      query_params[:columnName] = OCI::ApiClient.build_collection_params(opts[:column_name], :multi) if opts[:column_name] && !opts[:column_name].empty?
      query_params[:datatype] = OCI::ApiClient.build_collection_params(opts[:datatype], :multi) if opts[:datatype] && !opts[:datatype].empty?
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:schemaNameContains] = opts[:schema_name_contains] if opts[:schema_name_contains]
      query_params[:tableNameContains] = opts[:table_name_contains] if opts[:table_name_contains]
      query_params[:columnNameContains] = opts[:column_name_contains] if opts[:column_name_contains]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_columns') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::ColumnSummary>'
        )
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


    # Gets consolidated discovery analytics data based on the specified query parameters.
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :group_by Attribute by which the discovery analytics data should be grouped.
    #   Allowed values are: targetId, sensitiveDataModelId
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
    # @option opts [String] :sensitive_data_model_id A filter to return only the resources that match the specified sensitive data model OCID.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::DiscoveryAnalyticsCollection DiscoveryAnalyticsCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_discovery_analytics.rb.html) to see an example of how to use list_discovery_analytics API.
    def list_discovery_analytics(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_discovery_analytics.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_discovery_analytics." if compartment_id.nil?

      if opts[:group_by] && !%w[targetId sensitiveDataModelId].include?(opts[:group_by])
        raise 'Invalid value for "group_by", must be one of targetId, sensitiveDataModelId.'
      end

      path = '/discoveryAnalytics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:groupBy] = opts[:group_by] if opts[:group_by]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:sensitiveDataModelId] = opts[:sensitive_data_model_id] if opts[:sensitive_data_model_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_discovery_analytics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::DiscoveryAnalyticsCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of discovery results based on the specified query parameters.
    # @param [String] discovery_job_id The OCID of the discovery job.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :discovery_type A filter to return only the resources that match the specified discovery type.
    # @option opts [String] :planned_action A filter to return only the resources that match the specified planned action.
    # @option opts [BOOLEAN] :is_result_applied A filter to return the discovery result resources based on the value of their isResultApplied attribute.
    # @option opts [Array<String>] :schema_name A filter to return only items related to specific schema name.
    # @option opts [Array<String>] :object_name A filter to return only items related to a specific object name.
    # @option opts [Array<String>] :column_name A filter to return only a specific column based on column name.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for timeFinished is descending.
    #   The default order for discoveryType, schemaName, objectName, columnName and plannedAction is ascending.
    #    (default to timeFinished)
    #   Allowed values are: discoveryType, timeFinished, schemaName, objectName, columnName, plannedAction
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::DiscoveryJobResultCollection DiscoveryJobResultCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_discovery_job_results.rb.html) to see an example of how to use list_discovery_job_results API.
    def list_discovery_job_results(discovery_job_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_discovery_job_results.' if logger

      raise "Missing the required parameter 'discovery_job_id' when calling list_discovery_job_results." if discovery_job_id.nil?

      if opts[:discovery_type] && !OCI::DataSafe::Models::DiscoveryJob::DISCOVERY_TYPE_ENUM.include?(opts[:discovery_type])
        raise 'Invalid value for "discovery_type", must be one of the values in OCI::DataSafe::Models::DiscoveryJob::DISCOVERY_TYPE_ENUM.'
      end

      if opts[:planned_action] && !OCI::DataSafe::Models::DiscoveryJobResult::PLANNED_ACTION_ENUM.include?(opts[:planned_action])
        raise 'Invalid value for "planned_action", must be one of the values in OCI::DataSafe::Models::DiscoveryJobResult::PLANNED_ACTION_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[discoveryType timeFinished schemaName objectName columnName plannedAction].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of discoveryType, timeFinished, schemaName, objectName, columnName, plannedAction.'
      end
      raise "Parameter value for 'discovery_job_id' must not be blank" if OCI::Internal::Util.blank_string?(discovery_job_id)

      path = '/discoveryJobs/{discoveryJobId}/results'.sub('{discoveryJobId}', discovery_job_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:discoveryType] = opts[:discovery_type] if opts[:discovery_type]
      query_params[:plannedAction] = opts[:planned_action] if opts[:planned_action]
      query_params[:isResultApplied] = opts[:is_result_applied] if !opts[:is_result_applied].nil?
      query_params[:schemaName] = OCI::ApiClient.build_collection_params(opts[:schema_name], :multi) if opts[:schema_name] && !opts[:schema_name].empty?
      query_params[:objectName] = OCI::ApiClient.build_collection_params(opts[:object_name], :multi) if opts[:object_name] && !opts[:object_name].empty?
      query_params[:columnName] = OCI::ApiClient.build_collection_params(opts[:column_name], :multi) if opts[:column_name] && !opts[:column_name].empty?
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_discovery_job_results') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::DiscoveryJobResultCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of incremental discovery jobs based on the specified query parameters.
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
    # @option opts [String] :discovery_job_id A filter to return only the resources that match the specified discovery job OCID.
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
    # @option opts [String] :lifecycle_state A filter to return only the resources that match the specified lifecycle state.
    # @option opts [String] :sensitive_data_model_id A filter to return only the resources that match the specified sensitive data model OCID.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for timeFinished is descending.
    #   The default order for displayName is ascending.
    #    (default to timeStarted)
    #   Allowed values are: timeStarted, displayName
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::DiscoveryJobCollection DiscoveryJobCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_discovery_jobs.rb.html) to see an example of how to use list_discovery_jobs API.
    def list_discovery_jobs(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_discovery_jobs.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_discovery_jobs." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::DISCOVERY_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::DISCOVERY_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeStarted displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeStarted, displayName.'
      end

      path = '/discoveryJobs'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:discoveryJobId] = opts[:discovery_job_id] if opts[:discovery_job_id]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:sensitiveDataModelId] = opts[:sensitive_data_model_id] if opts[:sensitive_data_model_id]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_discovery_jobs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::DiscoveryJobCollection'
        )
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


    # Gets a list of library masking formats based on the specified query parameters.
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :library_masking_format_id A filter to return only the resources that match the specified library masking format OCID.
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
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :lifecycle_state A filter to return only the resources that match the specified lifecycle states.
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter to return only the resources that were created after the specified date and time, as defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   Using TimeCreatedGreaterThanOrEqualToQueryParam parameter retrieves all resources created after that date.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_created_less_than Search for resources that were created before a specific date.
    #   Specifying this parameter corresponding `timeCreatedLessThan`
    #   parameter will retrieve all resources created before the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [String] :library_masking_format_source A filter to return the library masking format resources based on the value of their source attribute. (default to USER)
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for timeCreated is descending.
    #   The default order for displayName is ascending. The displayName sort order is case sensitive.
    #    (default to timeCreated)
    #   Allowed values are: displayName, timeCreated
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::LibraryMaskingFormatCollection LibraryMaskingFormatCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_library_masking_formats.rb.html) to see an example of how to use list_library_masking_formats API.
    def list_library_masking_formats(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_library_masking_formats.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_library_masking_formats." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::MASKING_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::MASKING_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:library_masking_format_source] && !OCI::DataSafe::Models::LIBRARY_MASKING_FORMAT_SOURCE_ENUM.include?(opts[:library_masking_format_source])
        raise 'Invalid value for "library_masking_format_source", must be one of the values in OCI::DataSafe::Models::LIBRARY_MASKING_FORMAT_SOURCE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated.'
      end

      path = '/libraryMaskingFormats'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:libraryMaskingFormatId] = opts[:library_masking_format_id] if opts[:library_masking_format_id]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:libraryMaskingFormatSource] = opts[:library_masking_format_source] if opts[:library_masking_format_source]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_library_masking_formats') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::LibraryMaskingFormatCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of masked columns present in the specified masking report and based on the specified query parameters.
    #
    # @param [String] masking_report_id The OCID of the masking report.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for all the fields is ascending.
    #    (default to schemaName)
    #   Allowed values are: schemaName, objectName
    # @option opts [Array<String>] :schema_name A filter to return only items related to specific schema name.
    # @option opts [Array<String>] :object_name A filter to return only items related to a specific object name.
    # @option opts [Array<String>] :column_name A filter to return only a specific column based on column name.
    # @option opts [Array<String>] :object_type A filter to return only items related to a specific object type. (default to [ALL])
    #   Allowed values are: ALL, TABLE, EDITIONING_VIEW
    # @option opts [Array<String>] :masking_column_group A filter to return only the resources that match the specified masking column group.
    # @option opts [String] :sensitive_type_id A filter to return only items related to a specific sensitive type OCID.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::MaskedColumnCollection MaskedColumnCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_masked_columns.rb.html) to see an example of how to use list_masked_columns API.
    def list_masked_columns(masking_report_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_masked_columns.' if logger

      raise "Missing the required parameter 'masking_report_id' when calling list_masked_columns." if masking_report_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[schemaName objectName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of schemaName, objectName.'
      end


      object_type_allowable_values = %w[ALL TABLE EDITIONING_VIEW]
      if opts[:object_type] && !opts[:object_type].empty?
        opts[:object_type].each do |val_to_check|
          unless object_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "object_type", must be one of ALL, TABLE, EDITIONING_VIEW.'
          end
        end
      end
      raise "Parameter value for 'masking_report_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_report_id)

      path = '/maskingReports/{maskingReportId}/maskedColumns'.sub('{maskingReportId}', masking_report_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:schemaName] = OCI::ApiClient.build_collection_params(opts[:schema_name], :multi) if opts[:schema_name] && !opts[:schema_name].empty?
      query_params[:objectName] = OCI::ApiClient.build_collection_params(opts[:object_name], :multi) if opts[:object_name] && !opts[:object_name].empty?
      query_params[:columnName] = OCI::ApiClient.build_collection_params(opts[:column_name], :multi) if opts[:column_name] && !opts[:column_name].empty?
      query_params[:objectType] = OCI::ApiClient.build_collection_params(opts[:object_type], :multi) if opts[:object_type] && !opts[:object_type].empty?
      query_params[:maskingColumnGroup] = OCI::ApiClient.build_collection_params(opts[:masking_column_group], :multi) if opts[:masking_column_group] && !opts[:masking_column_group].empty?
      query_params[:sensitiveTypeId] = opts[:sensitive_type_id] if opts[:sensitive_type_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_masked_columns') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::MaskedColumnCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets consolidated masking analytics data based on the specified query parameters.
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :group_by Attribute by which the masking analytics data should be grouped.
    #   Allowed values are: targetId, policyId
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
    # @option opts [String] :masking_policy_id A filter to return only the resources that match the specified masking policy OCID.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::MaskingAnalyticsCollection MaskingAnalyticsCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_masking_analytics.rb.html) to see an example of how to use list_masking_analytics API.
    def list_masking_analytics(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_masking_analytics.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_masking_analytics." if compartment_id.nil?

      if opts[:group_by] && !%w[targetId policyId].include?(opts[:group_by])
        raise 'Invalid value for "group_by", must be one of targetId, policyId.'
      end

      path = '/maskingAnalytics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:groupBy] = opts[:group_by] if opts[:group_by]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:maskingPolicyId] = opts[:masking_policy_id] if opts[:masking_policy_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_masking_analytics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::MaskingAnalyticsCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of masking columns present in the specified masking policy and based on the specified query parameters.
    #
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for timeCreated is descending.
    #   The default order for other fields is ascending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, schemaName, objectName
    # @option opts [String] :masking_column_lifecycle_state A filter to return only the resources that match the specified lifecycle states.
    # @option opts [Array<String>] :data_type A filter to return only resources that match the specified data types.
    #   Allowed values are: CHARACTER, DATE, LOB, NUMERIC
    # @option opts [Array<String>] :schema_name A filter to return only items related to specific schema name.
    # @option opts [Array<String>] :object_name A filter to return only items related to a specific object name.
    # @option opts [Array<String>] :column_name A filter to return only a specific column based on column name.
    # @option opts [Array<String>] :object_type A filter to return only items related to a specific object type. (default to [ALL])
    #   Allowed values are: ALL, TABLE, EDITIONING_VIEW
    # @option opts [Array<String>] :masking_column_group A filter to return only the resources that match the specified masking column group.
    # @option opts [String] :sensitive_type_id A filter to return only items related to a specific sensitive type OCID.
    # @option opts [BOOLEAN] :is_masking_enabled A filter to return the masking column resources based on the value of their isMaskingEnabled attribute.
    #   A value of true returns only those columns for which masking is enabled. A value of false returns only those columns
    #   for which masking is disabled. Omitting this parameter returns all the masking columns in a masking policy.
    #
    # @option opts [BOOLEAN] :is_seed_required A filter to return masking columns based on whether the assigned masking formats need a
    #   seed value for masking. A value of true returns those masking columns that are using
    #   Deterministic Encryption or Deterministic Substitution masking format.
    #    (default to false)
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter to return only the resources that were created after the specified date and time, as defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   Using TimeCreatedGreaterThanOrEqualToQueryParam parameter retrieves all resources created after that date.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_created_less_than Search for resources that were created before a specific date.
    #   Specifying this parameter corresponding `timeCreatedLessThan`
    #   parameter will retrieve all resources created before the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_updated_greater_than_or_equal_to Search for resources that were updated after a specific date.
    #   Specifying this parameter corresponding `timeUpdatedGreaterThanOrEqualTo`
    #   parameter will retrieve all resources updated after the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    # @option opts [DateTime] :time_updated_less_than Search for resources that were updated before a specific date.
    #   Specifying this parameter corresponding `timeUpdatedLessThan`
    #   parameter will retrieve all resources updated before the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::MaskingColumnCollection MaskingColumnCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_masking_columns.rb.html) to see an example of how to use list_masking_columns API.
    def list_masking_columns(masking_policy_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_masking_columns.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling list_masking_columns." if masking_policy_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated schemaName objectName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, schemaName, objectName.'
      end

      if opts[:masking_column_lifecycle_state] && !OCI::DataSafe::Models::MASKING_COLUMN_LIFECYCLE_STATE_ENUM.include?(opts[:masking_column_lifecycle_state])
        raise 'Invalid value for "masking_column_lifecycle_state", must be one of the values in OCI::DataSafe::Models::MASKING_COLUMN_LIFECYCLE_STATE_ENUM.'
      end


      data_type_allowable_values = %w[CHARACTER DATE LOB NUMERIC]
      if opts[:data_type] && !opts[:data_type].empty?
        opts[:data_type].each do |val_to_check|
          unless data_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "data_type", must be one of CHARACTER, DATE, LOB, NUMERIC.'
          end
        end
      end


      object_type_allowable_values = %w[ALL TABLE EDITIONING_VIEW]
      if opts[:object_type] && !opts[:object_type].empty?
        opts[:object_type].each do |val_to_check|
          unless object_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "object_type", must be one of ALL, TABLE, EDITIONING_VIEW.'
          end
        end
      end
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/maskingColumns'.sub('{maskingPolicyId}', masking_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:maskingColumnLifecycleState] = opts[:masking_column_lifecycle_state] if opts[:masking_column_lifecycle_state]
      query_params[:dataType] = OCI::ApiClient.build_collection_params(opts[:data_type], :multi) if opts[:data_type] && !opts[:data_type].empty?
      query_params[:schemaName] = OCI::ApiClient.build_collection_params(opts[:schema_name], :multi) if opts[:schema_name] && !opts[:schema_name].empty?
      query_params[:objectName] = OCI::ApiClient.build_collection_params(opts[:object_name], :multi) if opts[:object_name] && !opts[:object_name].empty?
      query_params[:columnName] = OCI::ApiClient.build_collection_params(opts[:column_name], :multi) if opts[:column_name] && !opts[:column_name].empty?
      query_params[:objectType] = OCI::ApiClient.build_collection_params(opts[:object_type], :multi) if opts[:object_type] && !opts[:object_type].empty?
      query_params[:maskingColumnGroup] = OCI::ApiClient.build_collection_params(opts[:masking_column_group], :multi) if opts[:masking_column_group] && !opts[:masking_column_group].empty?
      query_params[:sensitiveTypeId] = opts[:sensitive_type_id] if opts[:sensitive_type_id]
      query_params[:isMaskingEnabled] = opts[:is_masking_enabled] if !opts[:is_masking_enabled].nil?
      query_params[:isSeedRequired] = opts[:is_seed_required] if !opts[:is_seed_required].nil?
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:timeUpdatedGreaterThanOrEqualTo] = opts[:time_updated_greater_than_or_equal_to] if opts[:time_updated_greater_than_or_equal_to]
      query_params[:timeUpdatedLessThan] = opts[:time_updated_less_than] if opts[:time_updated_less_than]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_masking_columns') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::MaskingColumnCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of masking policies based on the specified query parameters.
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :masking_policy_id A filter to return only the resources that match the specified masking policy OCID.
    # @option opts [String] :display_name A filter to return only resources that match the specified display name.
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :lifecycle_state A filter to return only the resources that match the specified lifecycle states.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for timeCreated is descending.
    #   The default order for displayName is ascending. The displayName sort order is case sensitive.
    #    (default to timeCreated)
    #   Allowed values are: displayName, timeCreated
    # @option opts [String] :sensitive_data_model_id A filter to return only the resources that match the specified sensitive data model OCID.
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter to return only the resources that were created after the specified date and time, as defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   Using TimeCreatedGreaterThanOrEqualToQueryParam parameter retrieves all resources created after that date.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_created_less_than Search for resources that were created before a specific date.
    #   Specifying this parameter corresponding `timeCreatedLessThan`
    #   parameter will retrieve all resources created before the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::MaskingPolicyCollection MaskingPolicyCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_masking_policies.rb.html) to see an example of how to use list_masking_policies API.
    def list_masking_policies(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_masking_policies.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_masking_policies." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::MASKING_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::MASKING_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      path = '/maskingPolicies'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:maskingPolicyId] = opts[:masking_policy_id] if opts[:masking_policy_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sensitiveDataModelId] = opts[:sensitive_data_model_id] if opts[:sensitive_data_model_id]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_masking_policies') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::MaskingPolicyCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of masking reports based on the specified query parameters.
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :masking_policy_id A filter to return only the resources that match the specified masking policy OCID.
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for timeMaskingFinished is descending.
    #    (default to timeMaskingFinished)
    #   Allowed values are: timeMaskingFinished
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
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::MaskingReportCollection MaskingReportCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_masking_reports.rb.html) to see an example of how to use list_masking_reports API.
    def list_masking_reports(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_masking_reports.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_masking_reports." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeMaskingFinished].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeMaskingFinished.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      path = '/maskingReports'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:maskingPolicyId] = opts[:masking_policy_id] if opts[:masking_policy_id]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_masking_reports') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::MaskingReportCollection'
        )
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


    # Gets a list of report definitions.
    # The ListReportDefinitions operation returns only the report definitions in the specified `compartmentId`.
    # It also returns the seeded report definitions which are available to all the compartments.
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
    # @option opts [String] :display_name The name of the report definition to query.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field used for sorting. Only one sorting order (sortOrder) can be specified.
    #   The default order for TIMECREATED is descending. The default order for DISPLAYNAME is ascending.
    #   The DISPLAYNAME sort order is case sensitive.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME, DISPLAYORDER
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [BOOLEAN] :is_seeded A boolean flag indicating to list seeded report definitions. Set this parameter to get list of seeded report definitions. (default to false)
    # @option opts [String] :data_source Specifies the name of a resource that provides data for the report. For example  alerts, events.
    # @option opts [String] :lifecycle_state An optional filter to return only resources that match the specified lifecycle state.
    # @option opts [String] :category An optional filter to return only resources that match the specified category.
    #   Allowed values are: CUSTOM_REPORTS, SUMMARY, ACTIVITY_AUDITING
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::ReportDefinitionCollection ReportDefinitionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_report_definitions.rb.html) to see an example of how to use list_report_definitions API.
    def list_report_definitions(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_report_definitions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_report_definitions." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME DISPLAYORDER].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME, DISPLAYORDER.'
      end

      if opts[:data_source] && !OCI::DataSafe::Models::REPORT_DEFINITION_DATA_SOURCE_ENUM.include?(opts[:data_source])
        raise 'Invalid value for "data_source", must be one of the values in OCI::DataSafe::Models::REPORT_DEFINITION_DATA_SOURCE_ENUM.'
      end

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::REPORT_DEFINITION_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::REPORT_DEFINITION_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:category] && !%w[CUSTOM_REPORTS SUMMARY ACTIVITY_AUDITING].include?(opts[:category])
        raise 'Invalid value for "category", must be one of CUSTOM_REPORTS, SUMMARY, ACTIVITY_AUDITING.'
      end

      path = '/reportDefinitions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:isSeeded] = opts[:is_seeded] if !opts[:is_seeded].nil?
      query_params[:dataSource] = opts[:data_source] if opts[:data_source]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:category] = opts[:category] if opts[:category]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_report_definitions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::ReportDefinitionCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all the reports in the compartment. It contains information such as report generation time.
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
    # @option opts [String] :display_name The name of the report definition to query.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeGenerated is descending. Default order for displayName is ascending. If no value is specified timeGenerated is default.
    #    (default to timeGenerated)
    #   Allowed values are: timeGenerated, displayName
    # @option opts [String] :report_definition_id The ID of the report definition to filter the list of reports
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :lifecycle_state An optional filter to return only resources that match the specified lifecycle state.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::ReportCollection ReportCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_reports.rb.html) to see an example of how to use list_reports API.
    def list_reports(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_reports.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_reports." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeGenerated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeGenerated, displayName.'
      end

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::REPORT_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::REPORT_LIFECYCLE_STATE_ENUM.'
      end

      path = '/reports'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:reportDefinitionId] = opts[:report_definition_id] if opts[:report_definition_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_reports') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::ReportCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of role metadata objects.
    #
    # @param [String] target_database_id The OCID of the Data Safe target database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Array<String>] :role_name A filter to return only a specific role based on role name.
    # @option opts [BOOLEAN] :is_oracle_maintained A filter to return roles based on whether they are maintained by oracle or not.
    # @option opts [String] :authentication_type A filter to return roles based on authentication type.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field used for sorting. Only one sorting order (sortOrder) can be specified.
    #    (default to ROLENAME)
    #   Allowed values are: ROLENAME
    # @option opts [String] :role_name_contains A filter to return only items if role name contains a specific string.
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::RoleSummary RoleSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_roles.rb.html) to see an example of how to use list_roles API.
    def list_roles(target_database_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_roles.' if logger

      raise "Missing the required parameter 'target_database_id' when calling list_roles." if target_database_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[ROLENAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of ROLENAME.'
      end
      raise "Parameter value for 'target_database_id' must not be blank" if OCI::Internal::Util.blank_string?(target_database_id)

      path = '/targetDatabases/{targetDatabaseId}/roles'.sub('{targetDatabaseId}', target_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:roleName] = OCI::ApiClient.build_collection_params(opts[:role_name], :multi) if opts[:role_name] && !opts[:role_name].empty?
      query_params[:isOracleMaintained] = opts[:is_oracle_maintained] if !opts[:is_oracle_maintained].nil?
      query_params[:authenticationType] = opts[:authentication_type] if opts[:authentication_type]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:roleNameContains] = opts[:role_name_contains] if opts[:role_name_contains]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_roles') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::RoleSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns list of schema.
    #
    # @param [String] target_database_id The OCID of the Data Safe target database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Array<String>] :schema_name A filter to return only items related to specific schema name.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field used for sorting. Only one sorting order (sortOrder) can be specified.
    #    (default to SCHEMANAME)
    #   Allowed values are: SCHEMANAME
    # @option opts [BOOLEAN] :is_oracle_maintained A filter to return only items related to specific type of schema.
    # @option opts [String] :schema_name_contains A filter to return only items if schema name contains a specific string.
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::SchemaSummary SchemaSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_schemas.rb.html) to see an example of how to use list_schemas API.
    def list_schemas(target_database_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_schemas.' if logger

      raise "Missing the required parameter 'target_database_id' when calling list_schemas." if target_database_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[SCHEMANAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of SCHEMANAME.'
      end
      raise "Parameter value for 'target_database_id' must not be blank" if OCI::Internal::Util.blank_string?(target_database_id)

      path = '/targetDatabases/{targetDatabaseId}/schemas'.sub('{targetDatabaseId}', target_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:schemaName] = OCI::ApiClient.build_collection_params(opts[:schema_name], :multi) if opts[:schema_name] && !opts[:schema_name].empty?
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:isOracleMaintained] = opts[:is_oracle_maintained] if !opts[:is_oracle_maintained].nil?
      query_params[:schemaNameContains] = opts[:schema_name_contains] if opts[:schema_name_contains]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_schemas') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::SchemaSummary>'
        )
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
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [BOOLEAN] :is_baseline A filter to return only security assessments that are set as baseline. (default to false)
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order(sortOrder). The default order for timeCreated is descending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter to return only the resources that were created after the specified date and time, as defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   Using TimeCreatedGreaterThanOrEqualToQueryParam parameter retrieves all resources created after that date.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_created_less_than Search for resources that were created before a specific date.
    #   Specifying this parameter corresponding `timeCreatedLessThan`
    #   parameter will retrieve all resources created before the
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


    # Gets a list of sensitive columns present in the specified sensitive data model based on the specified query parameters.
    #
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter to return only the resources that were created after the specified date and time, as defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   Using TimeCreatedGreaterThanOrEqualToQueryParam parameter retrieves all resources created after that date.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_created_less_than Search for resources that were created before a specific date.
    #   Specifying this parameter corresponding `timeCreatedLessThan`
    #   parameter will retrieve all resources created before the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_updated_greater_than_or_equal_to Search for resources that were updated after a specific date.
    #   Specifying this parameter corresponding `timeUpdatedGreaterThanOrEqualTo`
    #   parameter will retrieve all resources updated after the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    # @option opts [DateTime] :time_updated_less_than Search for resources that were updated before a specific date.
    #   Specifying this parameter corresponding `timeUpdatedLessThan`
    #   parameter will retrieve all resources updated before the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    # @option opts [String] :sensitive_column_lifecycle_state Filters the sensitive column resources with the given lifecycle state values.
    # @option opts [Array<String>] :schema_name A filter to return only items related to specific schema name.
    # @option opts [Array<String>] :object_name A filter to return only items related to a specific object name.
    # @option opts [Array<String>] :column_name A filter to return only a specific column based on column name.
    # @option opts [Array<String>] :object_type A filter to return only items related to a specific object type. (default to [ALL])
    #   Allowed values are: ALL, TABLE, EDITIONING_VIEW
    # @option opts [Array<String>] :data_type A filter to return only the resources that match the specified data types.
    # @option opts [Array<String>] :status A filter to return only the sensitive columns that match the specified status.
    #   Allowed values are: VALID, INVALID
    # @option opts [Array<String>] :sensitive_type_id A filter to return only the sensitive columns that are associated with one of the sensitive types identified by the specified OCIDs.
    # @option opts [Array<String>] :parent_column_key A filter to return only the sensitive columns that are children of one of the columns identified by the specified keys.
    # @option opts [Array<String>] :relation_type A filter to return sensitive columns based on their relationship with their parent columns. If set to NONE,
    #   it returns the sensitive columns that do not have any parent. The response includes the parent columns as
    #   well as the independent columns that are not in any relationship. If set to APP_DEFINED, it returns all the
    #   child columns that have application-level (non-dictionary) relationship with their parents. If set to DB_DEFINED,
    #   it returns all the child columns that have database-level (dictionary-defined) relationship with their parents.
    #
    #   Allowed values are: NONE, APP_DEFINED, DB_DEFINED
    # @option opts [String] :column_group A filter to return only the sensitive columns that belong to the specified column group.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for timeCreated is descending.
    #   The default order for schemaName, objectName, and columnName is ascending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, schemaName, objectName, columnName
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::SensitiveColumnCollection SensitiveColumnCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_sensitive_columns.rb.html) to see an example of how to use list_sensitive_columns API.
    def list_sensitive_columns(sensitive_data_model_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_sensitive_columns.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling list_sensitive_columns." if sensitive_data_model_id.nil?

      if opts[:sensitive_column_lifecycle_state] && !OCI::DataSafe::Models::SENSITIVE_COLUMN_LIFECYCLE_STATE_ENUM.include?(opts[:sensitive_column_lifecycle_state])
        raise 'Invalid value for "sensitive_column_lifecycle_state", must be one of the values in OCI::DataSafe::Models::SENSITIVE_COLUMN_LIFECYCLE_STATE_ENUM.'
      end


      object_type_allowable_values = %w[ALL TABLE EDITIONING_VIEW]
      if opts[:object_type] && !opts[:object_type].empty?
        opts[:object_type].each do |val_to_check|
          unless object_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "object_type", must be one of ALL, TABLE, EDITIONING_VIEW.'
          end
        end
      end


      status_allowable_values = %w[VALID INVALID]
      if opts[:status] && !opts[:status].empty?
        opts[:status].each do |val_to_check|
          unless status_allowable_values.include?(val_to_check)
            raise 'Invalid value for "status", must be one of VALID, INVALID.'
          end
        end
      end


      relation_type_allowable_values = %w[NONE APP_DEFINED DB_DEFINED]
      if opts[:relation_type] && !opts[:relation_type].empty?
        opts[:relation_type].each do |val_to_check|
          unless relation_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "relation_type", must be one of NONE, APP_DEFINED, DB_DEFINED.'
          end
        end
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated schemaName objectName columnName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, schemaName, objectName, columnName.'
      end
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)

      path = '/sensitiveDataModels/{sensitiveDataModelId}/sensitiveColumns'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:timeUpdatedGreaterThanOrEqualTo] = opts[:time_updated_greater_than_or_equal_to] if opts[:time_updated_greater_than_or_equal_to]
      query_params[:timeUpdatedLessThan] = opts[:time_updated_less_than] if opts[:time_updated_less_than]
      query_params[:sensitiveColumnLifecycleState] = opts[:sensitive_column_lifecycle_state] if opts[:sensitive_column_lifecycle_state]
      query_params[:schemaName] = OCI::ApiClient.build_collection_params(opts[:schema_name], :multi) if opts[:schema_name] && !opts[:schema_name].empty?
      query_params[:objectName] = OCI::ApiClient.build_collection_params(opts[:object_name], :multi) if opts[:object_name] && !opts[:object_name].empty?
      query_params[:columnName] = OCI::ApiClient.build_collection_params(opts[:column_name], :multi) if opts[:column_name] && !opts[:column_name].empty?
      query_params[:objectType] = OCI::ApiClient.build_collection_params(opts[:object_type], :multi) if opts[:object_type] && !opts[:object_type].empty?
      query_params[:dataType] = OCI::ApiClient.build_collection_params(opts[:data_type], :multi) if opts[:data_type] && !opts[:data_type].empty?
      query_params[:status] = OCI::ApiClient.build_collection_params(opts[:status], :multi) if opts[:status] && !opts[:status].empty?
      query_params[:sensitiveTypeId] = OCI::ApiClient.build_collection_params(opts[:sensitive_type_id], :multi) if opts[:sensitive_type_id] && !opts[:sensitive_type_id].empty?
      query_params[:parentColumnKey] = OCI::ApiClient.build_collection_params(opts[:parent_column_key], :multi) if opts[:parent_column_key] && !opts[:parent_column_key].empty?
      query_params[:relationType] = OCI::ApiClient.build_collection_params(opts[:relation_type], :multi) if opts[:relation_type] && !opts[:relation_type].empty?
      query_params[:columnGroup] = opts[:column_group] if opts[:column_group]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_sensitive_columns') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::SensitiveColumnCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of sensitive data models based on the specified query parameters.
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
    # @option opts [String] :sensitive_data_model_id A filter to return only the resources that match the specified sensitive data model OCID.
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter to return only the resources that were created after the specified date and time, as defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   Using TimeCreatedGreaterThanOrEqualToQueryParam parameter retrieves all resources created after that date.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_created_less_than Search for resources that were created before a specific date.
    #   Specifying this parameter corresponding `timeCreatedLessThan`
    #   parameter will retrieve all resources created before the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for timeCreated is descending.
    #   The default order for displayName is ascending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :lifecycle_state A filter to return only the resources that match the specified lifecycle state.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::SensitiveDataModelCollection SensitiveDataModelCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_sensitive_data_models.rb.html) to see an example of how to use list_sensitive_data_models API.
    def list_sensitive_data_models(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_sensitive_data_models.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_sensitive_data_models." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::DISCOVERY_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::DISCOVERY_LIFECYCLE_STATE_ENUM.'
      end

      path = '/sensitiveDataModels'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:sensitiveDataModelId] = opts[:sensitive_data_model_id] if opts[:sensitive_data_model_id]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_sensitive_data_models') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::SensitiveDataModelCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of sensitive types based on the specified query parameters.
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
    # @option opts [String] :sensitive_type_id A filter to return only items related to a specific sensitive type OCID.
    # @option opts [String] :sensitive_type_source A filter to return the sensitive type resources based on the value of their source attribute. (default to USER)
    # @option opts [String] :entity_type A filter to return the sensitive type resources based on the value of their entityType attribute.
    # @option opts [String] :parent_category_id A filter to return only the sensitive types that are children of the sensitive category identified by the specified OCID.
    # @option opts [String] :default_masking_format_id A filter to return only the sensitive types that have the default masking format identified by the specified OCID.
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter to return only the resources that were created after the specified date and time, as defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   Using TimeCreatedGreaterThanOrEqualToQueryParam parameter retrieves all resources created after that date.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_created_less_than Search for resources that were created before a specific date.
    #   Specifying this parameter corresponding `timeCreatedLessThan`
    #   parameter will retrieve all resources created before the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order (sortOrder). The default order for timeCreated is descending.
    #   The default order for displayName is ascending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :lifecycle_state A filter to return only the resources that match the specified lifecycle state.
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::SensitiveTypeCollection SensitiveTypeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_sensitive_types.rb.html) to see an example of how to use list_sensitive_types API.
    def list_sensitive_types(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_sensitive_types.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_sensitive_types." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sensitive_type_source] && !OCI::DataSafe::Models::SENSITIVE_TYPE_SOURCE_ENUM.include?(opts[:sensitive_type_source])
        raise 'Invalid value for "sensitive_type_source", must be one of the values in OCI::DataSafe::Models::SENSITIVE_TYPE_SOURCE_ENUM.'
      end

      if opts[:entity_type] && !OCI::DataSafe::Models::SENSITIVE_TYPE_ENTITY_ENUM.include?(opts[:entity_type])
        raise 'Invalid value for "entity_type", must be one of the values in OCI::DataSafe::Models::SENSITIVE_TYPE_ENTITY_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::DISCOVERY_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::DISCOVERY_LIFECYCLE_STATE_ENUM.'
      end

      path = '/sensitiveTypes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:sensitiveTypeId] = opts[:sensitive_type_id] if opts[:sensitive_type_id]
      query_params[:sensitiveTypeSource] = opts[:sensitive_type_source] if opts[:sensitive_type_source]
      query_params[:entityType] = opts[:entity_type] if opts[:entity_type]
      query_params[:parentCategoryId] = opts[:parent_category_id] if opts[:parent_category_id]
      query_params[:defaultMaskingFormatId] = opts[:default_masking_format_id] if opts[:default_masking_format_id]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_sensitive_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::SensitiveTypeCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of table metadata objects.
    #
    # @param [String] target_database_id The OCID of the Data Safe target database.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Array<String>] :schema_name A filter to return only items related to specific schema name.
    # @option opts [Array<String>] :table_name A filter to return only items related to specific table name.
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field used for sorting. Only one sorting order (sortOrder) can be specified.
    #    (default to TABLENAME)
    #   Allowed values are: SCHEMANAME, TABLENAME
    # @option opts [String] :table_name_contains A filter to return only items if table name contains a specific string.
    # @option opts [String] :schema_name_contains A filter to return only items if schema name contains a specific string.
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::TableSummary TableSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_tables.rb.html) to see an example of how to use list_tables API.
    def list_tables(target_database_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_tables.' if logger

      raise "Missing the required parameter 'target_database_id' when calling list_tables." if target_database_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[SCHEMANAME TABLENAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of SCHEMANAME, TABLENAME.'
      end
      raise "Parameter value for 'target_database_id' must not be blank" if OCI::Internal::Util.blank_string?(target_database_id)

      path = '/targetDatabases/{targetDatabaseId}/tables'.sub('{targetDatabaseId}', target_database_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:schemaName] = OCI::ApiClient.build_collection_params(opts[:schema_name], :multi) if opts[:schema_name] && !opts[:schema_name].empty?
      query_params[:tableName] = OCI::ApiClient.build_collection_params(opts[:table_name], :multi) if opts[:table_name] && !opts[:table_name].empty?
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:tableNameContains] = opts[:table_name_contains] if opts[:table_name_contains]
      query_params[:schemaNameContains] = opts[:schema_name_contains] if opts[:schema_name_contains]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_tables') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::DataSafe::Models::TableSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all target-alert policy associations.
    #
    # @param [String] compartment_id A filter to return only resources that match the specified compartment OCID.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :target_alert_policy_association_id A filter to return only items related to a specific target-alert policy association ID.
    # @option opts [String] :alert_policy_id A filter to return policy by it's OCID.
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
    # @option opts [String] :lifecycle_state An optional filter to return only alert policies that have the given life-cycle state.
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
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter to return only the resources that were created after the specified date and time, as defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   Using TimeCreatedGreaterThanOrEqualToQueryParam parameter retrieves all resources created after that date.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_created_less_than Search for resources that were created before a specific date.
    #   Specifying this parameter corresponding `timeCreatedLessThan`
    #   parameter will retrieve all resources created before the
    #   specified created date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed and all compartments and subcompartments in the tenancy are returned. Depends on the 'accessLevel' setting.
    #    (default to false)
    # @option opts [String] :access_level Valid values are RESTRICTED and ACCESSIBLE. Default is RESTRICTED.
    #   Setting this to ACCESSIBLE returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment). When set to RESTRICTED permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::TargetAlertPolicyAssociationCollection TargetAlertPolicyAssociationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_target_alert_policy_associations.rb.html) to see an example of how to use list_target_alert_policy_associations API.
    def list_target_alert_policy_associations(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_target_alert_policy_associations.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_target_alert_policy_associations." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::ALERT_POLICY_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::ALERT_POLICY_LIFECYCLE_STATE_ENUM.'
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

      path = '/targetAlertPolicyAssociations'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:targetAlertPolicyAssociationId] = opts[:target_alert_policy_association_id] if opts[:target_alert_policy_association_id]
      query_params[:alertPolicyId] = opts[:alert_policy_id] if opts[:alert_policy_id]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#list_target_alert_policy_associations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::TargetAlertPolicyAssociationCollection'
        )
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
    # @option opts [String] :associated_resource_id A filter to return the target databases that are associated to the resource id passed in as a parameter value.
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

      if opts[:lifecycle_state] && !OCI::DataSafe::Models::TARGET_DATABASE_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::DataSafe::Models::TARGET_DATABASE_LIFECYCLE_STATE_ENUM.'
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
      query_params[:associatedResourceId] = opts[:associated_resource_id] if opts[:associated_resource_id]
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
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
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
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
    # @option opts [String] :type A filter to return only items that match the specified assessment type.
    #   Allowed values are: LATEST, SAVED, COMPARTMENT, SAVE_SCHEDULE
    # @option opts [String] :triggered_by A filter to return user assessments that were created by either the system or by a user only.
    #   Allowed values are: USER, SYSTEM
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter to return only user assessments that were created after the specified date and time, as defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    #   Using timeCreatedGreaterThanOrEqualTo parameter retrieves all assessments created after that date.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_created_less_than Search for resources that were created before a specific date.
    #   Specifying this parameter corresponding `timeCreatedLessThan`
    #   parameter will retrieve all resources created before the
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
    # @option opts [String] :target_id A filter to return only items related to a specific target OCID.
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
    # @option opts [String] :sort_by The field used for sorting. Only one sorting order (sortOrder) can be specified.
    #   The default order is descending.
    #    (default to STARTTIME)
    #   Allowed values are: STARTTIME, FINISHTIME, ACCEPTEDTIME
    # @option opts [String] :sort_order The sort order to use, either ascending (ASC) or descending (DESC). (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :resource_id A filter to return only work requests that match the specified resource OCID.
    # @option opts [String] :target_database_id A filter to return only work requests that are associated to the specified target database OCID.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @option opts [String] :page For list pagination. The page token representing the page at which to start retrieving results. It is usually retrieved from a previous \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @option opts [Integer] :limit For list pagination. The maximum number of items to return per page in a paginated \"List\" call. For details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/usingapi.htm#nine).
    # @return [Response] A Response object with data of type Array<{OCI::DataSafe::Models::WorkRequestSummary WorkRequestSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      if opts[:sort_by] && !%w[STARTTIME FINISHTIME ACCEPTEDTIME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of STARTTIME, FINISHTIME, ACCEPTEDTIME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:operationType] = opts[:operation_type] if opts[:operation_type]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:resourceId] = opts[:resource_id] if opts[:resource_id]
      query_params[:targetDatabaseId] = opts[:target_database_id] if opts[:target_database_id]
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


    # Masks data using the specified masking policy.
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [OCI::DataSafe::Models::MaskDataDetails] mask_data_details Details to mask data.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/mask_data.rb.html) to see an example of how to use mask_data API.
    def mask_data(masking_policy_id, mask_data_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#mask_data.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling mask_data." if masking_policy_id.nil?
      raise "Missing the required parameter 'mask_data_details' when calling mask_data." if mask_data_details.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/actions/mask'.sub('{maskingPolicyId}', masking_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(mask_data_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#mask_data') do
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


    # Modifies Global Settings in Data Safe in the tenancy and region.
    #
    # @param [OCI::DataSafe::Models::ModifyGlobalSettingsDetails] modify_global_settings_details The details used to update global settings in Data Safe.
    # @param [String] compartment_id The OCID of the compartment.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/modify_global_settings.rb.html) to see an example of how to use modify_global_settings API.
    def modify_global_settings(modify_global_settings_details, compartment_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#modify_global_settings.' if logger

      raise "Missing the required parameter 'modify_global_settings_details' when calling modify_global_settings." if modify_global_settings_details.nil?
      raise "Missing the required parameter 'compartment_id' when calling modify_global_settings." if compartment_id.nil?
      raise "Parameter value for 'compartment_id' must not be blank" if OCI::Internal::Util.blank_string?(compartment_id)

      path = '/configuration/{compartmentId}/actions/modifyGlobalSettings'.sub('{compartmentId}', compartment_id.to_s)
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

      post_body = @api_client.object_to_http_body(modify_global_settings_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#modify_global_settings') do
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


    # Patch alerts. Updates one or more alerts by specifying alert Ids.
    # @param [OCI::DataSafe::Models::PatchAlertsDetails] patch_alerts_details Details to patch alerts.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/patch_alerts.rb.html) to see an example of how to use patch_alerts API.
    def patch_alerts(patch_alerts_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#patch_alerts.' if logger

      raise "Missing the required parameter 'patch_alerts_details' when calling patch_alerts." if patch_alerts_details.nil?

      path = '/alerts'
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

      post_body = @api_client.object_to_http_body(patch_alerts_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#patch_alerts') do
        @api_client.call_api(
          :PATCH,
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


    # Patches one or more discovery results. You can use this operation to set the plannedAction attribute before using
    # ApplyDiscoveryJobResults to process the results based on this attribute.
    #
    # @param [String] discovery_job_id The OCID of the discovery job.
    # @param [OCI::DataSafe::Models::PatchDiscoveryJobResultDetails] patch_discovery_job_result_details Details to patch discovery results.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/patch_discovery_job_results.rb.html) to see an example of how to use patch_discovery_job_results API.
    def patch_discovery_job_results(discovery_job_id, patch_discovery_job_result_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#patch_discovery_job_results.' if logger

      raise "Missing the required parameter 'discovery_job_id' when calling patch_discovery_job_results." if discovery_job_id.nil?
      raise "Missing the required parameter 'patch_discovery_job_result_details' when calling patch_discovery_job_results." if patch_discovery_job_result_details.nil?
      raise "Parameter value for 'discovery_job_id' must not be blank" if OCI::Internal::Util.blank_string?(discovery_job_id)

      path = '/discoveryJobs/{discoveryJobId}/results'.sub('{discoveryJobId}', discovery_job_id.to_s)
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

      post_body = @api_client.object_to_http_body(patch_discovery_job_result_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#patch_discovery_job_results') do
        @api_client.call_api(
          :PATCH,
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


    # Patches one or more columns in the specified masking policy. Use it to create, or update
    # masking columns. To create masking columns, use CreateMaskingColumnDetails as the patch
    # value. And to update masking columns, use UpdateMaskingColumnDetails as the patch value.
    #
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [OCI::DataSafe::Models::PatchMaskingColumnsDetails] patch_masking_columns_details Details to patch masking columns.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/patch_masking_columns.rb.html) to see an example of how to use patch_masking_columns API.
    def patch_masking_columns(masking_policy_id, patch_masking_columns_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#patch_masking_columns.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling patch_masking_columns." if masking_policy_id.nil?
      raise "Missing the required parameter 'patch_masking_columns_details' when calling patch_masking_columns." if patch_masking_columns_details.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/maskingColumns'.sub('{maskingPolicyId}', masking_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(patch_masking_columns_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#patch_masking_columns') do
        @api_client.call_api(
          :PATCH,
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


    # Patches one or more columns in the specified sensitive data model. Use it to create, update, or delete sensitive columns.
    # To create sensitive columns, use CreateSensitiveColumnDetails as the patch value. And to update sensitive columns,
    # use UpdateSensitiveColumnDetails as the patch value.
    #
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [OCI::DataSafe::Models::PatchSensitiveColumnDetails] patch_sensitive_column_details Details to patch sensitive columns.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/patch_sensitive_columns.rb.html) to see an example of how to use patch_sensitive_columns API.
    def patch_sensitive_columns(sensitive_data_model_id, patch_sensitive_column_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#patch_sensitive_columns.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling patch_sensitive_columns." if sensitive_data_model_id.nil?
      raise "Missing the required parameter 'patch_sensitive_column_details' when calling patch_sensitive_columns." if patch_sensitive_column_details.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)

      path = '/sensitiveDataModels/{sensitiveDataModelId}/sensitiveColumns'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s)
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

      post_body = @api_client.object_to_http_body(patch_sensitive_column_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#patch_sensitive_columns') do
        @api_client.call_api(
          :PATCH,
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


    # Provision audit policy.
    # @param [OCI::DataSafe::Models::ProvisionAuditPolicyDetails] provision_audit_policy_details Details for provisioning the given policies on the source target database.
    # @param [String] audit_policy_id Unique audit policy identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/provision_audit_policy.rb.html) to see an example of how to use provision_audit_policy API.
    def provision_audit_policy(provision_audit_policy_details, audit_policy_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#provision_audit_policy.' if logger

      raise "Missing the required parameter 'provision_audit_policy_details' when calling provision_audit_policy." if provision_audit_policy_details.nil?
      raise "Missing the required parameter 'audit_policy_id' when calling provision_audit_policy." if audit_policy_id.nil?
      raise "Parameter value for 'audit_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_policy_id)

      path = '/auditPolicies/{auditPolicyId}/actions/provision'.sub('{auditPolicyId}', audit_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(provision_audit_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#provision_audit_policy') do
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


    # Resumes the specified audit trail once it got stopped.
    # @param [String] audit_trail_id The OCID of the audit trail.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/resume_audit_trail.rb.html) to see an example of how to use resume_audit_trail API.
    def resume_audit_trail(audit_trail_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#resume_audit_trail.' if logger

      raise "Missing the required parameter 'audit_trail_id' when calling resume_audit_trail." if audit_trail_id.nil?
      raise "Parameter value for 'audit_trail_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_trail_id)

      path = '/auditTrails/{auditTrailId}/actions/resume'.sub('{auditTrailId}', audit_trail_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#resume_audit_trail') do
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


    # Resume the given work request. Issuing a resume does not guarantee of immediate resume of the work request.
    #
    # @param [String] work_request_id The OCID of the work request.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/resume_work_request.rb.html) to see an example of how to use resume_work_request API.
    def resume_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#resume_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling resume_work_request." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/actions/resume'.sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#resume_work_request') do
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


    # Retrieves the audit policy details from the source target database.
    # @param [String] audit_policy_id Unique audit policy identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/retrieve_audit_policies.rb.html) to see an example of how to use retrieve_audit_policies API.
    def retrieve_audit_policies(audit_policy_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#retrieve_audit_policies.' if logger

      raise "Missing the required parameter 'audit_policy_id' when calling retrieve_audit_policies." if audit_policy_id.nil?
      raise "Parameter value for 'audit_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_policy_id)

      path = '/auditPolicies/{auditPolicyId}/actions/retrieveFromTarget'.sub('{auditPolicyId}', audit_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#retrieve_audit_policies') do
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


    # Starts collection of audit records on the specified audit trail.
    # @param [OCI::DataSafe::Models::StartAuditTrailDetails] start_audit_trail_details Details for the starting audit.
    # @param [String] audit_trail_id The OCID of the audit trail.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/start_audit_trail.rb.html) to see an example of how to use start_audit_trail API.
    def start_audit_trail(start_audit_trail_details, audit_trail_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#start_audit_trail.' if logger

      raise "Missing the required parameter 'start_audit_trail_details' when calling start_audit_trail." if start_audit_trail_details.nil?
      raise "Missing the required parameter 'audit_trail_id' when calling start_audit_trail." if audit_trail_id.nil?
      raise "Parameter value for 'audit_trail_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_trail_id)

      path = '/auditTrails/{auditTrailId}/actions/start'.sub('{auditTrailId}', audit_trail_id.to_s)
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

      post_body = @api_client.object_to_http_body(start_audit_trail_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#start_audit_trail') do
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


    # Stops the specified audit trail.
    # @param [String] audit_trail_id The OCID of the audit trail.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/stop_audit_trail.rb.html) to see an example of how to use stop_audit_trail API.
    def stop_audit_trail(audit_trail_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#stop_audit_trail.' if logger

      raise "Missing the required parameter 'audit_trail_id' when calling stop_audit_trail." if audit_trail_id.nil?
      raise "Parameter value for 'audit_trail_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_trail_id)

      path = '/auditTrails/{auditTrailId}/actions/stop'.sub('{auditTrailId}', audit_trail_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#stop_audit_trail') do
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


    # Suspend the given work request. Issuing a suspend does not guarantee of a immediate suspend of the work request.
    #
    # @param [String] work_request_id The OCID of the work request.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/suspend_work_request.rb.html) to see an example of how to use suspend_work_request API.
    def suspend_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#suspend_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling suspend_work_request." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/actions/suspend'.sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#suspend_work_request') do
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


    # Updates alert status of the specified alert.
    # @param [String] alert_id The OCID of alert.
    # @param [OCI::DataSafe::Models::UpdateAlertDetails] update_alert_details The details used to update alert status.
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
    # @return [Response] A Response object with data of type {OCI::DataSafe::Models::Alert Alert}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_alert.rb.html) to see an example of how to use update_alert API.
    def update_alert(alert_id, update_alert_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_alert.' if logger

      raise "Missing the required parameter 'alert_id' when calling update_alert." if alert_id.nil?
      raise "Missing the required parameter 'update_alert_details' when calling update_alert." if update_alert_details.nil?
      raise "Parameter value for 'alert_id' must not be blank" if OCI::Internal::Util.blank_string?(alert_id)

      path = '/alerts/{alertId}'.sub('{alertId}', alert_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_alert_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_alert') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::DataSafe::Models::Alert'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the audit archive retrieval.
    # @param [String] audit_archive_retrieval_id OCID of the archive retrieval.
    # @param [OCI::DataSafe::Models::UpdateAuditArchiveRetrievalDetails] update_audit_archive_retrieval_details Details to update the audit archive retrieval.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_audit_archive_retrieval.rb.html) to see an example of how to use update_audit_archive_retrieval API.
    def update_audit_archive_retrieval(audit_archive_retrieval_id, update_audit_archive_retrieval_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_audit_archive_retrieval.' if logger

      raise "Missing the required parameter 'audit_archive_retrieval_id' when calling update_audit_archive_retrieval." if audit_archive_retrieval_id.nil?
      raise "Missing the required parameter 'update_audit_archive_retrieval_details' when calling update_audit_archive_retrieval." if update_audit_archive_retrieval_details.nil?
      raise "Parameter value for 'audit_archive_retrieval_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_archive_retrieval_id)

      path = '/auditArchiveRetrievals/{auditArchiveRetrievalId}'.sub('{auditArchiveRetrievalId}', audit_archive_retrieval_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_audit_archive_retrieval_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_audit_archive_retrieval') do
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


    # Updates the audit policy.
    # @param [String] audit_policy_id Unique audit policy identifier.
    # @param [OCI::DataSafe::Models::UpdateAuditPolicyDetails] update_audit_policy_details Details to update the audit policy.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_audit_policy.rb.html) to see an example of how to use update_audit_policy API.
    def update_audit_policy(audit_policy_id, update_audit_policy_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_audit_policy.' if logger

      raise "Missing the required parameter 'audit_policy_id' when calling update_audit_policy." if audit_policy_id.nil?
      raise "Missing the required parameter 'update_audit_policy_details' when calling update_audit_policy." if update_audit_policy_details.nil?
      raise "Parameter value for 'audit_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_policy_id)

      path = '/auditPolicies/{auditPolicyId}'.sub('{auditPolicyId}', audit_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_audit_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_audit_policy') do
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


    # Updates one or more attributes of the specified audit profile.
    # @param [String] audit_profile_id The OCID of the audit.
    # @param [OCI::DataSafe::Models::UpdateAuditProfileDetails] update_audit_profile_details The information to be updated.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_audit_profile.rb.html) to see an example of how to use update_audit_profile API.
    def update_audit_profile(audit_profile_id, update_audit_profile_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_audit_profile.' if logger

      raise "Missing the required parameter 'audit_profile_id' when calling update_audit_profile." if audit_profile_id.nil?
      raise "Missing the required parameter 'update_audit_profile_details' when calling update_audit_profile." if update_audit_profile_details.nil?
      raise "Parameter value for 'audit_profile_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_profile_id)

      path = '/auditProfiles/{auditProfileId}'.sub('{auditProfileId}', audit_profile_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_audit_profile_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_audit_profile') do
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


    # Updates one or more attributes of the specified audit trail.
    # @param [String] audit_trail_id The OCID of the audit trail.
    # @param [OCI::DataSafe::Models::UpdateAuditTrailDetails] update_audit_trail_details The information to be updated.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_audit_trail.rb.html) to see an example of how to use update_audit_trail API.
    def update_audit_trail(audit_trail_id, update_audit_trail_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_audit_trail.' if logger

      raise "Missing the required parameter 'audit_trail_id' when calling update_audit_trail." if audit_trail_id.nil?
      raise "Missing the required parameter 'update_audit_trail_details' when calling update_audit_trail." if update_audit_trail_details.nil?
      raise "Parameter value for 'audit_trail_id' must not be blank" if OCI::Internal::Util.blank_string?(audit_trail_id)

      path = '/auditTrails/{auditTrailId}'.sub('{auditTrailId}', audit_trail_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_audit_trail_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_audit_trail') do
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


    # Updates one or more attributes of the specified library masking format. Note that updating the formatEntries attribute replaces all the existing masking format entries with the specified format entries.
    # @param [String] library_masking_format_id The OCID of the library masking format.
    # @param [OCI::DataSafe::Models::UpdateLibraryMaskingFormatDetails] update_library_masking_format_details Details to update a library masking format.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_library_masking_format.rb.html) to see an example of how to use update_library_masking_format API.
    def update_library_masking_format(library_masking_format_id, update_library_masking_format_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_library_masking_format.' if logger

      raise "Missing the required parameter 'library_masking_format_id' when calling update_library_masking_format." if library_masking_format_id.nil?
      raise "Missing the required parameter 'update_library_masking_format_details' when calling update_library_masking_format." if update_library_masking_format_details.nil?
      raise "Parameter value for 'library_masking_format_id' must not be blank" if OCI::Internal::Util.blank_string?(library_masking_format_id)

      path = '/libraryMaskingFormats/{libraryMaskingFormatId}'.sub('{libraryMaskingFormatId}', library_masking_format_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_library_masking_format_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_library_masking_format') do
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


    # Updates one or more attributes of the specified masking column. Note that updating the maskingFormats
    # attribute replaces the currently assigned masking formats with the specified masking formats.
    #
    # @param [String] masking_column_key The unique key that identifies the masking column. It's numeric and unique within a masking policy.
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [OCI::DataSafe::Models::UpdateMaskingColumnDetails] update_masking_column_details Details to update a masking column.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_masking_column.rb.html) to see an example of how to use update_masking_column API.
    def update_masking_column(masking_column_key, masking_policy_id, update_masking_column_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_masking_column.' if logger

      raise "Missing the required parameter 'masking_column_key' when calling update_masking_column." if masking_column_key.nil?
      raise "Missing the required parameter 'masking_policy_id' when calling update_masking_column." if masking_policy_id.nil?
      raise "Missing the required parameter 'update_masking_column_details' when calling update_masking_column." if update_masking_column_details.nil?
      raise "Parameter value for 'masking_column_key' must not be blank" if OCI::Internal::Util.blank_string?(masking_column_key)
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/maskingColumns/{maskingColumnKey}'.sub('{maskingColumnKey}', masking_column_key.to_s).sub('{maskingPolicyId}', masking_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_masking_column_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_masking_column') do
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


    # Updates one or more attributes of the specified masking policy.
    # @param [String] masking_policy_id The OCID of the masking policy.
    # @param [OCI::DataSafe::Models::UpdateMaskingPolicyDetails] update_masking_policy_details Details to update a masking policy.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_masking_policy.rb.html) to see an example of how to use update_masking_policy API.
    def update_masking_policy(masking_policy_id, update_masking_policy_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_masking_policy.' if logger

      raise "Missing the required parameter 'masking_policy_id' when calling update_masking_policy." if masking_policy_id.nil?
      raise "Missing the required parameter 'update_masking_policy_details' when calling update_masking_policy." if update_masking_policy_details.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}'.sub('{maskingPolicyId}', masking_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_masking_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_masking_policy') do
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


    # Updates the specified report definition. Only user created report definition can be updated. Seeded report definitions need to be saved as new report definition first.
    # @param [String] report_definition_id Unique report definition identifier
    # @param [OCI::DataSafe::Models::UpdateReportDefinitionDetails] update_report_definition_details Details for the modified report definition.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_report_definition.rb.html) to see an example of how to use update_report_definition API.
    def update_report_definition(report_definition_id, update_report_definition_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_report_definition.' if logger

      raise "Missing the required parameter 'report_definition_id' when calling update_report_definition." if report_definition_id.nil?
      raise "Missing the required parameter 'update_report_definition_details' when calling update_report_definition." if update_report_definition_details.nil?
      raise "Parameter value for 'report_definition_id' must not be blank" if OCI::Internal::Util.blank_string?(report_definition_id)

      path = '/reportDefinitions/{reportDefinitionId}'.sub('{reportDefinitionId}', report_definition_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_report_definition_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_report_definition') do
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


    # Updates one or more attributes of the specified sensitive column.
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [String] sensitive_column_key The unique key that identifies the sensitive column. It's numeric and unique within a sensitive data model.
    # @param [OCI::DataSafe::Models::UpdateSensitiveColumnDetails] update_sensitive_column_details Details to update a sensitive column.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_sensitive_column.rb.html) to see an example of how to use update_sensitive_column API.
    def update_sensitive_column(sensitive_data_model_id, sensitive_column_key, update_sensitive_column_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_sensitive_column.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling update_sensitive_column." if sensitive_data_model_id.nil?
      raise "Missing the required parameter 'sensitive_column_key' when calling update_sensitive_column." if sensitive_column_key.nil?
      raise "Missing the required parameter 'update_sensitive_column_details' when calling update_sensitive_column." if update_sensitive_column_details.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)
      raise "Parameter value for 'sensitive_column_key' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_column_key)

      path = '/sensitiveDataModels/{sensitiveDataModelId}/sensitiveColumns/{sensitiveColumnKey}'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s).sub('{sensitiveColumnKey}', sensitive_column_key.to_s)
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

      post_body = @api_client.object_to_http_body(update_sensitive_column_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_sensitive_column') do
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


    # Updates one or more attributes of the specified sensitive data model. Note that updating any attribute of a sensitive
    # data model does not perform data discovery.
    #
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [OCI::DataSafe::Models::UpdateSensitiveDataModelDetails] update_sensitive_data_model_details Details to update a sensitive data model.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_sensitive_data_model.rb.html) to see an example of how to use update_sensitive_data_model API.
    def update_sensitive_data_model(sensitive_data_model_id, update_sensitive_data_model_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_sensitive_data_model.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling update_sensitive_data_model." if sensitive_data_model_id.nil?
      raise "Missing the required parameter 'update_sensitive_data_model_details' when calling update_sensitive_data_model." if update_sensitive_data_model_details.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)

      path = '/sensitiveDataModels/{sensitiveDataModelId}'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_sensitive_data_model_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_sensitive_data_model') do
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


    # Updates one or more attributes of the specified sensitive type.
    # @param [String] sensitive_type_id The OCID of the sensitive type.
    # @param [OCI::DataSafe::Models::UpdateSensitiveTypeDetails] update_sensitive_type_details Details to update a sensitive type.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_sensitive_type.rb.html) to see an example of how to use update_sensitive_type API.
    def update_sensitive_type(sensitive_type_id, update_sensitive_type_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_sensitive_type.' if logger

      raise "Missing the required parameter 'sensitive_type_id' when calling update_sensitive_type." if sensitive_type_id.nil?
      raise "Missing the required parameter 'update_sensitive_type_details' when calling update_sensitive_type." if update_sensitive_type_details.nil?
      raise "Parameter value for 'sensitive_type_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_type_id)

      path = '/sensitiveTypes/{sensitiveTypeId}'.sub('{sensitiveTypeId}', sensitive_type_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_sensitive_type_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_sensitive_type') do
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


    # Updates the specified target-alert policy association.
    # @param [String] target_alert_policy_association_id The OCID of the target-alert policy association.
    # @param [OCI::DataSafe::Models::UpdateTargetAlertPolicyAssociationDetails] update_target_alert_policy_association_details The details used to update the target-alert policy association.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/update_target_alert_policy_association.rb.html) to see an example of how to use update_target_alert_policy_association API.
    def update_target_alert_policy_association(target_alert_policy_association_id, update_target_alert_policy_association_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#update_target_alert_policy_association.' if logger

      raise "Missing the required parameter 'target_alert_policy_association_id' when calling update_target_alert_policy_association." if target_alert_policy_association_id.nil?
      raise "Missing the required parameter 'update_target_alert_policy_association_details' when calling update_target_alert_policy_association." if update_target_alert_policy_association_details.nil?
      raise "Parameter value for 'target_alert_policy_association_id' must not be blank" if OCI::Internal::Util.blank_string?(target_alert_policy_association_id)

      path = '/targetAlertPolicyAssociations/{targetAlertPolicyAssociationId}'.sub('{targetAlertPolicyAssociationId}', target_alert_policy_association_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_target_alert_policy_association_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#update_target_alert_policy_association') do
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Uploads a masking policy file (also called template) to update the specified masking policy.
    # To create a new masking policy using a file, first use the CreateMaskingPolicy operation
    # to create an empty masking policy and then use this endpoint to upload the masking policy file.
    # Note that the upload operation replaces the content of the specified masking policy,
    # including all the existing columns and masking formats, with the content of the file.
    #
    # @param [String, IO] upload_masking_policy_details Details to upload a masking policy file.
    # @param [String] masking_policy_id The OCID of the masking policy.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/upload_masking_policy.rb.html) to see an example of how to use upload_masking_policy API.
    def upload_masking_policy(upload_masking_policy_details, masking_policy_id, opts = {})
      logger.debug 'Calling operation DataSafeClient#upload_masking_policy.' if logger

      raise "Missing the required parameter 'upload_masking_policy_details' when calling upload_masking_policy." if upload_masking_policy_details.nil?
      raise "Missing the required parameter 'masking_policy_id' when calling upload_masking_policy." if masking_policy_id.nil?
      raise "Parameter value for 'masking_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(masking_policy_id)

      path = '/maskingPolicies/{maskingPolicyId}/actions/upload'.sub('{maskingPolicyId}', masking_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'

      post_body = @api_client.object_to_http_body(upload_masking_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#upload_masking_policy') do
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


    # Uploads a sensitive data model file (also called template) to update the specified sensitive data model. To create
    # a new sensitive data model using a file, first use the CreateSensitiveDataModel operation to create an empty data model
    # and then use this endpoint to upload the data model file. Note that the upload operation replaces the content of the
    # specified sensitive data model, including all the existing columns and their relationships, with the content of the file.
    #
    # @param [String] sensitive_data_model_id The OCID of the sensitive data model.
    # @param [String, IO] upload_sensitive_data_model_details Details to upload a sensitive data model file.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/datasafe/upload_sensitive_data_model.rb.html) to see an example of how to use upload_sensitive_data_model API.
    def upload_sensitive_data_model(sensitive_data_model_id, upload_sensitive_data_model_details, opts = {})
      logger.debug 'Calling operation DataSafeClient#upload_sensitive_data_model.' if logger

      raise "Missing the required parameter 'sensitive_data_model_id' when calling upload_sensitive_data_model." if sensitive_data_model_id.nil?
      raise "Missing the required parameter 'upload_sensitive_data_model_details' when calling upload_sensitive_data_model." if upload_sensitive_data_model_details.nil?
      raise "Parameter value for 'sensitive_data_model_id' must not be blank" if OCI::Internal::Util.blank_string?(sensitive_data_model_id)

      path = '/sensitiveDataModels/{sensitiveDataModelId}/actions/upload'.sub('{sensitiveDataModelId}', sensitive_data_model_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'content-type'] ||= 'application/octet-stream'

      post_body = @api_client.object_to_http_body(upload_sensitive_data_model_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DataSafeClient#upload_sensitive_data_model') do
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
