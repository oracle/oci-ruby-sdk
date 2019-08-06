# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API for the Health Checks service. Use this API to manage endpoint probes and monitors.
  # For more information, see
  # [Overview of the Health Checks Service](/iaas/Content/HealthChecks/Concepts/healthchecks.htm).
  class Healthchecks::HealthChecksClient
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


    # Creates a new HealthChecksClient.
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
        @endpoint = endpoint + '/20180501'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "HealthChecksClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://healthchecks.{region}.oci.{secondLevelDomain}') + '/20180501'
      logger.info "HealthChecksClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a monitor into a different compartment. When provided, `If-Match` is checked
    # against ETag values of the resource.
    #
    # @param [String] monitor_id The OCID of a monitor.
    # @param [OCI::Healthchecks::Models::ChangeHttpMonitorCompartmentDetails] change_http_monitor_compartment_details The details needed to move the monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET
    #   or POST response for that resource.  The resource will be updated or deleted
    #   only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type nil
    def change_http_monitor_compartment(monitor_id, change_http_monitor_compartment_details, opts = {})
      logger.debug 'Calling operation HealthChecksClient#change_http_monitor_compartment.' if logger

      raise "Missing the required parameter 'monitor_id' when calling change_http_monitor_compartment." if monitor_id.nil?
      raise "Missing the required parameter 'change_http_monitor_compartment_details' when calling change_http_monitor_compartment." if change_http_monitor_compartment_details.nil?
      raise "Parameter value for 'monitor_id' must not be blank" if OCI::Internal::Util.blank_string?(monitor_id)

      path = '/httpMonitors/{monitorId}/actions/changeCompartment'.sub('{monitorId}', monitor_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_http_monitor_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#change_http_monitor_compartment') do
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


    # Moves a monitor into a different compartment. When provided, `If-Match` is checked
    # against ETag values of the resource.
    #
    # @param [String] monitor_id The OCID of a monitor.
    # @param [OCI::Healthchecks::Models::ChangePingMonitorCompartmentDetails] change_ping_monitor_compartment_details The details needed to move the monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET
    #   or POST response for that resource.  The resource will be updated or deleted
    #   only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type nil
    def change_ping_monitor_compartment(monitor_id, change_ping_monitor_compartment_details, opts = {})
      logger.debug 'Calling operation HealthChecksClient#change_ping_monitor_compartment.' if logger

      raise "Missing the required parameter 'monitor_id' when calling change_ping_monitor_compartment." if monitor_id.nil?
      raise "Missing the required parameter 'change_ping_monitor_compartment_details' when calling change_ping_monitor_compartment." if change_ping_monitor_compartment_details.nil?
      raise "Parameter value for 'monitor_id' must not be blank" if OCI::Internal::Util.blank_string?(monitor_id)

      path = '/pingMonitors/{monitorId}/actions/changeCompartment'.sub('{monitorId}', monitor_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_ping_monitor_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#change_ping_monitor_compartment') do
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


    # Creates an HTTP monitor. Vantage points will be automatically selected if not specified,
    # and probes will be initiated from each vantage point to each of the targets at the frequency
    # specified by `intervalInSeconds`.
    #
    # @param [OCI::Healthchecks::Models::CreateHttpMonitorDetails] create_http_monitor_details The configuration details for creating an HTTP monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type {OCI::Healthchecks::Models::HttpMonitor HttpMonitor}
    def create_http_monitor(create_http_monitor_details, opts = {})
      logger.debug 'Calling operation HealthChecksClient#create_http_monitor.' if logger

      raise "Missing the required parameter 'create_http_monitor_details' when calling create_http_monitor." if create_http_monitor_details.nil?

      path = '/httpMonitors'
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

      post_body = @api_client.object_to_http_body(create_http_monitor_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#create_http_monitor') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Healthchecks::Models::HttpMonitor'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates an on-demand HTTP probe. The location response header contains the URL for
    # fetching the probe results.
    #
    # *Note:* On-demand probe configurations are not saved.
    #
    # @param [OCI::Healthchecks::Models::CreateOnDemandHttpProbeDetails] create_on_demand_http_probe_details The configuration of the HTTP probe.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Healthchecks::Models::HttpProbe HttpProbe}
    def create_on_demand_http_probe(create_on_demand_http_probe_details, opts = {})
      logger.debug 'Calling operation HealthChecksClient#create_on_demand_http_probe.' if logger

      raise "Missing the required parameter 'create_on_demand_http_probe_details' when calling create_on_demand_http_probe." if create_on_demand_http_probe_details.nil?

      path = '/httpProbeResults'
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

      post_body = @api_client.object_to_http_body(create_on_demand_http_probe_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#create_on_demand_http_probe') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Healthchecks::Models::HttpProbe'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates an on-demand ping probe. The location response header contains the URL for
    # fetching probe results.
    #
    # *Note:* The on-demand probe configuration is not saved.
    #
    # @param [OCI::Healthchecks::Models::CreateOnDemandPingProbeDetails] create_on_demand_ping_probe_details Configuration details for creating an on-demand ping probe.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Healthchecks::Models::PingProbe PingProbe}
    def create_on_demand_ping_probe(create_on_demand_ping_probe_details, opts = {})
      logger.debug 'Calling operation HealthChecksClient#create_on_demand_ping_probe.' if logger

      raise "Missing the required parameter 'create_on_demand_ping_probe_details' when calling create_on_demand_ping_probe." if create_on_demand_ping_probe_details.nil?

      path = '/pingProbeResults'
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

      post_body = @api_client.object_to_http_body(create_on_demand_ping_probe_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#create_on_demand_ping_probe') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Healthchecks::Models::PingProbe'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a ping monitor. Vantage points will be automatically selected if not specified,
    # and probes will be initiated from each vantage point to each of the targets at the frequency
    # specified by `intervalInSeconds`.
    #
    # @param [OCI::Healthchecks::Models::CreatePingMonitorDetails] create_ping_monitor_details The configuration details for creating a ping monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request that can be retried in case of a timeout or
    #   server error without risk of executing the same action again. Retry tokens expire after 24
    #   hours.
    #
    #   *Note:* Retry tokens can be invalidated before the 24 hour time limit due to conflicting
    #   operations, such as a resource being deleted or purged from the system.
    #
    # @return [Response] A Response object with data of type {OCI::Healthchecks::Models::PingMonitor PingMonitor}
    def create_ping_monitor(create_ping_monitor_details, opts = {})
      logger.debug 'Calling operation HealthChecksClient#create_ping_monitor.' if logger

      raise "Missing the required parameter 'create_ping_monitor_details' when calling create_ping_monitor." if create_ping_monitor_details.nil?

      path = '/pingMonitors'
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

      post_body = @api_client.object_to_http_body(create_ping_monitor_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#create_ping_monitor') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Healthchecks::Models::PingMonitor'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the HTTP monitor and its configuration. All future probes of this
    # monitor are stopped. Results associated with the monitor are not deleted.
    #
    # @param [String] monitor_id The OCID of a monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET
    #   or POST response for that resource.  The resource will be updated or deleted
    #   only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_http_monitor(monitor_id, opts = {})
      logger.debug 'Calling operation HealthChecksClient#delete_http_monitor.' if logger

      raise "Missing the required parameter 'monitor_id' when calling delete_http_monitor." if monitor_id.nil?
      raise "Parameter value for 'monitor_id' must not be blank" if OCI::Internal::Util.blank_string?(monitor_id)

      path = '/httpMonitors/{monitorId}'.sub('{monitorId}', monitor_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#delete_http_monitor') do
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


    # Deletes the ping monitor and its configuration. All future probes of this
    # monitor are stopped. Results associated with the monitor are not deleted.
    #
    # @param [String] monitor_id The OCID of a monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET
    #   or POST response for that resource.  The resource will be updated or deleted
    #   only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_ping_monitor(monitor_id, opts = {})
      logger.debug 'Calling operation HealthChecksClient#delete_ping_monitor.' if logger

      raise "Missing the required parameter 'monitor_id' when calling delete_ping_monitor." if monitor_id.nil?
      raise "Parameter value for 'monitor_id' must not be blank" if OCI::Internal::Util.blank_string?(monitor_id)

      path = '/pingMonitors/{monitorId}'.sub('{monitorId}', monitor_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#delete_ping_monitor') do
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


    # Gets the configuration for the specified monitor.
    #
    # @param [String] monitor_id The OCID of a monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @return [Response] A Response object with data of type {OCI::Healthchecks::Models::HttpMonitor HttpMonitor}
    def get_http_monitor(monitor_id, opts = {})
      logger.debug 'Calling operation HealthChecksClient#get_http_monitor.' if logger

      raise "Missing the required parameter 'monitor_id' when calling get_http_monitor." if monitor_id.nil?
      raise "Parameter value for 'monitor_id' must not be blank" if OCI::Internal::Util.blank_string?(monitor_id)

      path = '/httpMonitors/{monitorId}'.sub('{monitorId}', monitor_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#get_http_monitor') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Healthchecks::Models::HttpMonitor'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the configuration for the specified ping monitor.
    #
    # @param [String] monitor_id The OCID of a monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @return [Response] A Response object with data of type {OCI::Healthchecks::Models::PingMonitor PingMonitor}
    def get_ping_monitor(monitor_id, opts = {})
      logger.debug 'Calling operation HealthChecksClient#get_ping_monitor.' if logger

      raise "Missing the required parameter 'monitor_id' when calling get_ping_monitor." if monitor_id.nil?
      raise "Parameter value for 'monitor_id' must not be blank" if OCI::Internal::Util.blank_string?(monitor_id)

      path = '/pingMonitors/{monitorId}'.sub('{monitorId}', monitor_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#get_ping_monitor') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Healthchecks::Models::PingMonitor'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about all vantage points available to the user.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header
    #   from the previous \"List\" call.
    #
    # @option opts [String] :sort_by The field to sort by when listing vantage points.
    #   Allowed values are: name, displayName
    # @option opts [String] :sort_order Controls the sort order of results. (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :name Filters results that exactly match the `name` field.
    # @option opts [String] :display_name Filters results that exactly match the `displayName` field.
    # @return [Response] A Response object with data of type Array<{OCI::Healthchecks::Models::HealthChecksVantagePointSummary HealthChecksVantagePointSummary}>
    def list_health_checks_vantage_points(opts = {})
      logger.debug 'Calling operation HealthChecksClient#list_health_checks_vantage_points.' if logger


      if opts[:sort_by] && !%w[name displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/vantagePoints'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#list_health_checks_vantage_points') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Healthchecks::Models::HealthChecksVantagePointSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of HTTP monitors.
    #
    # @param [String] compartment_id Filters results by compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header
    #   from the previous \"List\" call.
    #
    # @option opts [String] :sort_by The field to sort by when listing monitors.
    #   Allowed values are: id, displayName
    # @option opts [String] :sort_order Controls the sort order of results. (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :display_name Filters results that exactly match the `displayName` field.
    # @return [Response] A Response object with data of type Array<{OCI::Healthchecks::Models::HttpMonitorSummary HttpMonitorSummary}>
    def list_http_monitors(compartment_id, opts = {})
      logger.debug 'Calling operation HealthChecksClient#list_http_monitors.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_http_monitors." if compartment_id.nil?

      if opts[:sort_by] && !%w[id displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/httpMonitors'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#list_http_monitors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Healthchecks::Models::HttpMonitorSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the HTTP probe results for the specified probe or monitor, where
    # the `probeConfigurationId` is the OCID of either a monitor or an
    # on-demand probe.
    #
    # @param [String] probe_configuration_id The OCID of a monitor or on-demand probe.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header
    #   from the previous \"List\" call.
    #
    # @option opts [Float] :start_time_greater_than_or_equal_to Returns results with a `startTime` equal to or greater than the specified value.
    # @option opts [Float] :start_time_less_than_or_equal_to Returns results with a `startTime` equal to or less than the specified value.
    # @option opts [String] :sort_order Controls the sort order of results. (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :target Filters results that match the `target`.
    # @return [Response] A Response object with data of type Array<{OCI::Healthchecks::Models::HttpProbeResultSummary HttpProbeResultSummary}>
    def list_http_probe_results(probe_configuration_id, opts = {})
      logger.debug 'Calling operation HealthChecksClient#list_http_probe_results.' if logger

      raise "Missing the required parameter 'probe_configuration_id' when calling list_http_probe_results." if probe_configuration_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'probe_configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(probe_configuration_id)

      path = '/httpProbeResults/{probeConfigurationId}'.sub('{probeConfigurationId}', probe_configuration_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:startTimeGreaterThanOrEqualTo] = opts[:start_time_greater_than_or_equal_to] if opts[:start_time_greater_than_or_equal_to]
      query_params[:startTimeLessThanOrEqualTo] = opts[:start_time_less_than_or_equal_to] if opts[:start_time_less_than_or_equal_to]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:target] = opts[:target] if opts[:target]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#list_http_probe_results') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Healthchecks::Models::HttpProbeResultSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of configured ping monitors.
    #
    # Results are paginated based on `page` and `limit`.  The `opc-next-page` header provides
    # a URL for fetching the next page.
    #
    # @param [String] compartment_id Filters results by compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header
    #   from the previous \"List\" call.
    #
    # @option opts [String] :sort_by The field to sort by when listing monitors.
    #   Allowed values are: id, displayName
    # @option opts [String] :sort_order Controls the sort order of results. (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :display_name Filters results that exactly match the `displayName` field.
    # @return [Response] A Response object with data of type Array<{OCI::Healthchecks::Models::PingMonitorSummary PingMonitorSummary}>
    def list_ping_monitors(compartment_id, opts = {})
      logger.debug 'Calling operation HealthChecksClient#list_ping_monitors.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_ping_monitors." if compartment_id.nil?

      if opts[:sort_by] && !%w[id displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, displayName.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/pingMonitors'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#list_ping_monitors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Healthchecks::Models::PingMonitorSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns the results for the specified probe, where the `probeConfigurationId`
    # is the OCID of either a monitor or an on-demand probe.
    #
    # Results are paginated based on `page` and `limit`.  The `opc-next-page` header provides
    # a URL for fetching the next page.  Use `sortOrder` to set the order of the
    # results.  If `sortOrder` is unspecified, results are sorted in ascending order by
    # `startTime`.
    #
    # @param [String] probe_configuration_id The OCID of a monitor or on-demand probe.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    # @option opts [String] :page The value of the `opc-next-page` response header
    #   from the previous \"List\" call.
    #
    # @option opts [Float] :start_time_greater_than_or_equal_to Returns results with a `startTime` equal to or greater than the specified value.
    # @option opts [Float] :start_time_less_than_or_equal_to Returns results with a `startTime` equal to or less than the specified value.
    # @option opts [String] :sort_order Controls the sort order of results. (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :target Filters results that match the `target`.
    # @return [Response] A Response object with data of type Array<{OCI::Healthchecks::Models::PingProbeResultSummary PingProbeResultSummary}>
    def list_ping_probe_results(probe_configuration_id, opts = {})
      logger.debug 'Calling operation HealthChecksClient#list_ping_probe_results.' if logger

      raise "Missing the required parameter 'probe_configuration_id' when calling list_ping_probe_results." if probe_configuration_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'probe_configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(probe_configuration_id)

      path = '/pingProbeResults/{probeConfigurationId}'.sub('{probeConfigurationId}', probe_configuration_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:startTimeGreaterThanOrEqualTo] = opts[:start_time_greater_than_or_equal_to] if opts[:start_time_greater_than_or_equal_to]
      query_params[:startTimeLessThanOrEqualTo] = opts[:start_time_less_than_or_equal_to] if opts[:start_time_less_than_or_equal_to]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:target] = opts[:target] if opts[:target]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#list_ping_probe_results') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Healthchecks::Models::PingProbeResultSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the configuration of the specified HTTP monitor. Only the fields
    # specified in the request body will be updated; all other configuration
    # properties will remain unchanged.
    #
    # @param [String] monitor_id The OCID of a monitor.
    # @param [OCI::Healthchecks::Models::UpdateHttpMonitorDetails] update_http_monitor_details The configuration details to update for the HTTP monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET
    #   or POST response for that resource.  The resource will be updated or deleted
    #   only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Healthchecks::Models::HttpMonitor HttpMonitor}
    def update_http_monitor(monitor_id, update_http_monitor_details, opts = {})
      logger.debug 'Calling operation HealthChecksClient#update_http_monitor.' if logger

      raise "Missing the required parameter 'monitor_id' when calling update_http_monitor." if monitor_id.nil?
      raise "Missing the required parameter 'update_http_monitor_details' when calling update_http_monitor." if update_http_monitor_details.nil?
      raise "Parameter value for 'monitor_id' must not be blank" if OCI::Internal::Util.blank_string?(monitor_id)

      path = '/httpMonitors/{monitorId}'.sub('{monitorId}', monitor_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_http_monitor_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#update_http_monitor') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Healthchecks::Models::HttpMonitor'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the configuration of the specified ping monitor. Only the fields
    # specified in the request body will be updated; all other configuration properties
    # will remain unchanged.
    #
    # @param [String] monitor_id The OCID of a monitor.
    # @param [OCI::Healthchecks::Models::UpdatePingMonitorDetails] update_ping_monitor_details Details for updating a Ping monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource,
    #   set the `if-match` parameter to the value of the etag from a previous GET
    #   or POST response for that resource.  The resource will be updated or deleted
    #   only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Healthchecks::Models::PingMonitor PingMonitor}
    def update_ping_monitor(monitor_id, update_ping_monitor_details, opts = {})
      logger.debug 'Calling operation HealthChecksClient#update_ping_monitor.' if logger

      raise "Missing the required parameter 'monitor_id' when calling update_ping_monitor." if monitor_id.nil?
      raise "Missing the required parameter 'update_ping_monitor_details' when calling update_ping_monitor." if update_ping_monitor_details.nil?
      raise "Parameter value for 'monitor_id' must not be blank" if OCI::Internal::Util.blank_string?(monitor_id)

      path = '/pingMonitors/{monitorId}'.sub('{monitorId}', monitor_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_ping_monitor_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'HealthChecksClient#update_ping_monitor') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Healthchecks::Models::PingMonitor'
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
