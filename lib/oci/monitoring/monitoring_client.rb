# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Monitoring API to manage metric queries and alarms for assessing the health, capacity, and performance of your cloud resources.
  # Endpoints vary by operation. For PostMetric, use the &#x60;telemetry-ingestion&#x60; endpoints; for all other operations, use the &#x60;telemetry&#x60; endpoints.
  # For information about monitoring, see [Monitoring Overview](/iaas/Content/Monitoring/Concepts/monitoringoverview.htm).
  class Monitoring::MonitoringClient
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


    # Creates a new MonitoringClient.
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
        @endpoint = endpoint + '/20180401'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "MonitoringClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://telemetry.{region}.{secondLevelDomain}') + '/20180401'
      logger.info "MonitoringClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves an alarm into a different compartment within the same tenancy.
    #
    # For information about moving resources between compartments, see [Moving Resources Between Compartments](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] alarm_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of an alarm.
    #
    # @param [OCI::Monitoring::Models::ChangeAlarmCompartmentDetails] change_alarm_compartment_details The configuration details for moving an alarm.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Customer part of the request identifier token. If you need to contact Oracle about a particular
    #   request, please provide the complete request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    def change_alarm_compartment(alarm_id, change_alarm_compartment_details, opts = {})
      logger.debug 'Calling operation MonitoringClient#change_alarm_compartment.' if logger

      raise "Missing the required parameter 'alarm_id' when calling change_alarm_compartment." if alarm_id.nil?
      raise "Missing the required parameter 'change_alarm_compartment_details' when calling change_alarm_compartment." if change_alarm_compartment_details.nil?
      raise "Parameter value for 'alarm_id' must not be blank" if OCI::Internal::Util.blank_string?(alarm_id)

      path = '/alarms/{alarmId}/actions/changeCompartment'.sub('{alarmId}', alarm_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_alarm_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MonitoringClient#change_alarm_compartment') do
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


    # Creates a new alarm in the specified compartment.
    # For important limits information, see [Limits on Monitoring](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#Limits).
    #
    # Transactions Per Second (TPS) per-tenancy limit for this operation: 1.
    #
    # @param [OCI::Monitoring::Models::CreateAlarmDetails] create_alarm_details Document for creating an alarm.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer part of the request identifier token. If you need to contact Oracle about a particular
    #   request, please provide the complete request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::Monitoring::Models::Alarm Alarm}
    def create_alarm(create_alarm_details, opts = {})
      logger.debug 'Calling operation MonitoringClient#create_alarm.' if logger

      raise "Missing the required parameter 'create_alarm_details' when calling create_alarm." if create_alarm_details.nil?

      path = '/alarms'
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

      post_body = @api_client.object_to_http_body(create_alarm_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MonitoringClient#create_alarm') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Monitoring::Models::Alarm'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the specified alarm.
    # For important limits information, see [Limits on Monitoring](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#Limits).
    #
    # Transactions Per Second (TPS) per-tenancy limit for this operation: 1.
    #
    # @param [String] alarm_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of an alarm.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Customer part of the request identifier token. If you need to contact Oracle about a particular
    #   request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type nil
    def delete_alarm(alarm_id, opts = {})
      logger.debug 'Calling operation MonitoringClient#delete_alarm.' if logger

      raise "Missing the required parameter 'alarm_id' when calling delete_alarm." if alarm_id.nil?
      raise "Parameter value for 'alarm_id' must not be blank" if OCI::Internal::Util.blank_string?(alarm_id)

      path = '/alarms/{alarmId}'.sub('{alarmId}', alarm_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MonitoringClient#delete_alarm') do
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


    # Gets the specified alarm.
    # For important limits information, see [Limits on Monitoring](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#Limits).
    #
    # Transactions Per Second (TPS) per-tenancy limit for this operation: 1.
    #
    # @param [String] alarm_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of an alarm.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer part of the request identifier token. If you need to contact Oracle about a particular
    #   request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Monitoring::Models::Alarm Alarm}
    def get_alarm(alarm_id, opts = {})
      logger.debug 'Calling operation MonitoringClient#get_alarm.' if logger

      raise "Missing the required parameter 'alarm_id' when calling get_alarm." if alarm_id.nil?
      raise "Parameter value for 'alarm_id' must not be blank" if OCI::Internal::Util.blank_string?(alarm_id)

      path = '/alarms/{alarmId}'.sub('{alarmId}', alarm_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MonitoringClient#get_alarm') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Monitoring::Models::Alarm'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get the history of the specified alarm.
    # For important limits information, see [Limits on Monitoring](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#Limits).
    #
    # Transactions Per Second (TPS) per-tenancy limit for this operation: 1.
    #
    # @param [String] alarm_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of an alarm.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer part of the request identifier token. If you need to contact Oracle about a particular
    #   request, please provide the complete request ID.
    #
    # @option opts [String] :alarm_historytype The type of history entries to retrieve. State history (STATE_HISTORY) or state transition history (STATE_TRANSITION_HISTORY).
    #   If not specified, entries of both types are retrieved.
    #
    #   Example: `STATE_HISTORY`
    #
    #   Allowed values are: STATE_HISTORY, STATE_TRANSITION_HISTORY
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Default: 1000
    #
    #   Example: 500
    #
    # @option opts [DateTime] :timestamp_greater_than_or_equal_to A filter to return only alarm history entries with timestamps occurring on or after the specified date and time. Format defined by RFC3339.
    #
    #   Example: `2019-01-01T01:00:00.789Z`
    #
    # @option opts [DateTime] :timestamp_less_than A filter to return only alarm history entries with timestamps occurring before the specified date and time. Format defined by RFC3339.
    #
    #   Example: `2019-01-02T01:00:00.789Z`
    #
    # @return [Response] A Response object with data of type {OCI::Monitoring::Models::AlarmHistoryCollection AlarmHistoryCollection}
    def get_alarm_history(alarm_id, opts = {})
      logger.debug 'Calling operation MonitoringClient#get_alarm_history.' if logger

      raise "Missing the required parameter 'alarm_id' when calling get_alarm_history." if alarm_id.nil?

      if opts[:alarm_historytype] && !%w[STATE_HISTORY STATE_TRANSITION_HISTORY].include?(opts[:alarm_historytype])
        raise 'Invalid value for "alarm_historytype", must be one of STATE_HISTORY, STATE_TRANSITION_HISTORY.'
      end
      raise "Parameter value for 'alarm_id' must not be blank" if OCI::Internal::Util.blank_string?(alarm_id)

      path = '/alarms/{alarmId}/history'.sub('{alarmId}', alarm_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:alarmHistorytype] = opts[:alarm_historytype] if opts[:alarm_historytype]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:timestampGreaterThanOrEqualTo] = opts[:timestamp_greater_than_or_equal_to] if opts[:timestamp_greater_than_or_equal_to]
      query_params[:timestampLessThan] = opts[:timestamp_less_than] if opts[:timestamp_less_than]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MonitoringClient#get_alarm_history') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Monitoring::Models::AlarmHistoryCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the alarms for the specified compartment.
    # For important limits information, see [Limits on Monitoring](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#Limits).
    #
    # Transactions Per Second (TPS) per-tenancy limit for this operation: 1.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the
    #   resources monitored by the metric that you are searching for. Use tenancyId to search in
    #   the root compartment.
    #
    #   Example: `ocid1.compartment.oc1..exampleuniqueID`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer part of the request identifier token. If you need to contact Oracle about a particular
    #   request, please provide the complete request ID.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Default: 1000
    #
    #   Example: 500
    #
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    #   Use this filter to list an alarm by name. Alternatively, when you know the alarm OCID, use the GetAlarm operation.
    #
    # @option opts [String] :lifecycle_state A filter to return only alarms that match the given lifecycle state exactly. When not specified, only alarms in the ACTIVE lifecycle state are listed.
    #
    # @option opts [String] :sort_by The field to use when sorting returned alarm definitions. Only one sorting level is provided.
    #
    #   Example: `severity`
    #
    #   Allowed values are: displayName, severity
    # @option opts [String] :sort_order The sort order to use when sorting returned alarm definitions. Ascending (ASC) or descending (DESC).
    #
    #   Example: `ASC`
    #
    #   Allowed values are: ASC, DESC
    # @option opts [BOOLEAN] :compartment_id_in_subtree When true, returns resources from all compartments and subcompartments. The parameter can
    #   only be set to true when compartmentId is the tenancy OCID (the tenancy is the root compartment).
    #   A true value requires the user to have tenancy-level permissions. If this requirement is not met,
    #   then the call is rejected. When false, returns resources from only the compartment specified in
    #   compartmentId. Default is false.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Monitoring::Models::AlarmSummary AlarmSummary}>
    def list_alarms(compartment_id, opts = {})
      logger.debug 'Calling operation MonitoringClient#list_alarms.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_alarms." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Monitoring::Models::Alarm::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Monitoring::Models::Alarm::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName severity].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, severity.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/alarms'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MonitoringClient#list_alarms') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Monitoring::Models::AlarmSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List the status of each alarm in the specified compartment.
    # For important limits information, see [Limits on Monitoring](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#Limits).
    #
    # Transactions Per Second (TPS) per-tenancy limit for this operation: 1.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the
    #   resources monitored by the metric that you are searching for. Use tenancyId to search in
    #   the root compartment.
    #
    #   Example: `ocid1.compartment.oc1..exampleuniqueID`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer part of the request identifier token. If you need to contact Oracle about a particular
    #   request, please provide the complete request ID.
    #
    # @option opts [BOOLEAN] :compartment_id_in_subtree When true, returns resources from all compartments and subcompartments. The parameter can
    #   only be set to true when compartmentId is the tenancy OCID (the tenancy is the root compartment).
    #   A true value requires the user to have tenancy-level permissions. If this requirement is not met,
    #   then the call is rejected. When false, returns resources from only the compartment specified in
    #   compartmentId. Default is false.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Default: 1000
    #
    #   Example: 500
    #
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    #   Use this filter to list an alarm by name. Alternatively, when you know the alarm OCID, use the GetAlarm operation.
    #
    # @option opts [String] :sort_by The field to use when sorting returned alarm definitions. Only one sorting level is provided.
    #
    #   Example: `severity`
    #
    #   Allowed values are: displayName, severity
    # @option opts [String] :sort_order The sort order to use when sorting returned alarm definitions. Ascending (ASC) or descending (DESC).
    #
    #   Example: `ASC`
    #
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Monitoring::Models::AlarmStatusSummary AlarmStatusSummary}>
    def list_alarms_status(compartment_id, opts = {})
      logger.debug 'Calling operation MonitoringClient#list_alarms_status.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_alarms_status." if compartment_id.nil?

      if opts[:sort_by] && !%w[displayName severity].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, severity.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/alarms/status'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MonitoringClient#list_alarms_status') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Monitoring::Models::AlarmStatusSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns metric definitions that match the criteria specified in the request. Compartment OCID required.
    # For information about metrics, see [Metrics Overview](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#MetricsOverview).
    # For important limits information, see [Limits on Monitoring](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#Limits).
    #
    # Transactions Per Second (TPS) per-tenancy limit for this operation: 1.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the
    #   resources monitored by the metric that you are searching for. Use tenancyId to search in
    #   the root compartment.
    #
    #   Example: `ocid1.compartment.oc1..exampleuniqueID`
    #
    # @param [OCI::Monitoring::Models::ListMetricsDetails] list_metrics_details The dimensions used to filter metrics.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer part of the request identifier token. If you need to contact Oracle about a particular
    #   request, please provide the complete request ID.
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Default: 1000
    #
    #   Example: 500
    #
    # @option opts [BOOLEAN] :compartment_id_in_subtree When true, returns resources from all compartments and subcompartments. The parameter can
    #   only be set to true when compartmentId is the tenancy OCID (the tenancy is the root compartment).
    #   A true value requires the user to have tenancy-level permissions. If this requirement is not met,
    #   then the call is rejected. When false, returns resources from only the compartment specified in
    #   compartmentId. Default is false.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Monitoring::Models::Metric Metric}>
    def list_metrics(compartment_id, list_metrics_details, opts = {})
      logger.debug 'Calling operation MonitoringClient#list_metrics.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_metrics." if compartment_id.nil?
      raise "Missing the required parameter 'list_metrics_details' when calling list_metrics." if list_metrics_details.nil?

      path = '/metrics/actions/listMetrics'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(list_metrics_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MonitoringClient#list_metrics') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Monitoring::Models::Metric>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Publishes raw metric data points to the Monitoring service.
    # For more information about publishing metrics, see [Publishing Custom Metrics](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Tasks/publishingcustommetrics.htm).
    # For important limits information, see [Limits on Monitoring](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#Limits).
    #
    # Per-call limits information follows.
    #
    # * Dimensions per metric group*. Maximum: 20. Minimum: 1.
    # * Unique metric streams*. Maximum: 50.
    # * Transactions Per Second (TPS) per-tenancy limit for this operation: 50.
    #
    # *A metric group is the combination of a given metric, metric namespace, and tenancy for the purpose of determining limits.
    # A dimension is a qualifier provided in a metric definition.
    # A metric stream is an individual set of aggregated data for a metric, typically specific to a resource.
    # For more information about metric-related concepts, see [Monitoring Concepts](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#concepts).
    #
    # The endpoints for this operation differ from other Monitoring operations. Replace the string `telemetry` with `telemetry-ingestion` in the endpoint, as in the following example:
    #
    # https://telemetry-ingestion.eu-frankfurt-1.oraclecloud.com
    #
    # @param [OCI::Monitoring::Models::PostMetricDataDetails] post_metric_data_details An array of metric objects containing raw metric data points to be posted to the Monitoring service.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer part of the request identifier token. If you need to contact Oracle about a particular
    #   request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Monitoring::Models::PostMetricDataResponseDetails PostMetricDataResponseDetails}
    def post_metric_data(post_metric_data_details, opts = {})
      logger.debug 'Calling operation MonitoringClient#post_metric_data.' if logger

      raise "Missing the required parameter 'post_metric_data_details' when calling post_metric_data." if post_metric_data_details.nil?

      path = '/metrics'
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

      post_body = @api_client.object_to_http_body(post_metric_data_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MonitoringClient#post_metric_data') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Monitoring::Models::PostMetricDataResponseDetails'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Removes any existing suppression for the specified alarm.
    # For important limits information, see [Limits on Monitoring](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#Limits).
    #
    # Transactions Per Second (TPS) per-tenancy limit for this operation: 1.
    #
    # @param [String] alarm_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of an alarm.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Customer part of the request identifier token. If you need to contact Oracle about a particular
    #   request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type nil
    def remove_alarm_suppression(alarm_id, opts = {})
      logger.debug 'Calling operation MonitoringClient#remove_alarm_suppression.' if logger

      raise "Missing the required parameter 'alarm_id' when calling remove_alarm_suppression." if alarm_id.nil?
      raise "Parameter value for 'alarm_id' must not be blank" if OCI::Internal::Util.blank_string?(alarm_id)

      path = '/alarms/{alarmId}/actions/removeSuppression'.sub('{alarmId}', alarm_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MonitoringClient#remove_alarm_suppression') do
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


    # Returns aggregated data that match the criteria specified in the request. Compartment OCID required.
    # For information on metric queries, see [Building Metric Queries](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Tasks/buildingqueries.htm).
    # For important limits information, see [Limits on Monitoring](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#Limits).
    #
    # Transactions Per Second (TPS) per-tenancy limit for this operation: 10.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the
    #   resources monitored by the metric that you are searching for. Use tenancyId to search in
    #   the root compartment.
    #
    #   Example: `ocid1.compartment.oc1..exampleuniqueID`
    #
    # @param [OCI::Monitoring::Models::SummarizeMetricsDataDetails] summarize_metrics_data_details The dimensions used to filter for metrics.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer part of the request identifier token. If you need to contact Oracle about a particular
    #   request, please provide the complete request ID.
    #
    # @option opts [BOOLEAN] :compartment_id_in_subtree When true, returns resources from all compartments and subcompartments. The parameter can
    #   only be set to true when compartmentId is the tenancy OCID (the tenancy is the root compartment).
    #   A true value requires the user to have tenancy-level permissions. If this requirement is not met,
    #   then the call is rejected. When false, returns resources from only the compartment specified in
    #   compartmentId. Default is false.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Monitoring::Models::MetricData MetricData}>
    def summarize_metrics_data(compartment_id, summarize_metrics_data_details, opts = {})
      logger.debug 'Calling operation MonitoringClient#summarize_metrics_data.' if logger

      raise "Missing the required parameter 'compartment_id' when calling summarize_metrics_data." if compartment_id.nil?
      raise "Missing the required parameter 'summarize_metrics_data_details' when calling summarize_metrics_data." if summarize_metrics_data_details.nil?

      path = '/metrics/actions/summarizeMetricsData'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(summarize_metrics_data_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MonitoringClient#summarize_metrics_data') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Monitoring::Models::MetricData>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified alarm.
    # For important limits information, see [Limits on Monitoring](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#Limits).
    #
    # Transactions Per Second (TPS) per-tenancy limit for this operation: 1.
    #
    # @param [String] alarm_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of an alarm.
    #
    # @param [OCI::Monitoring::Models::UpdateAlarmDetails] update_alarm_details Document for updating an alarm.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Customer part of the request identifier token. If you need to contact Oracle about a particular
    #   request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Monitoring::Models::Alarm Alarm}
    def update_alarm(alarm_id, update_alarm_details, opts = {})
      logger.debug 'Calling operation MonitoringClient#update_alarm.' if logger

      raise "Missing the required parameter 'alarm_id' when calling update_alarm." if alarm_id.nil?
      raise "Missing the required parameter 'update_alarm_details' when calling update_alarm." if update_alarm_details.nil?
      raise "Parameter value for 'alarm_id' must not be blank" if OCI::Internal::Util.blank_string?(alarm_id)

      path = '/alarms/{alarmId}'.sub('{alarmId}', alarm_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_alarm_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MonitoringClient#update_alarm') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Monitoring::Models::Alarm'
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
