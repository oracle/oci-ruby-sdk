# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Application Performance Monitoring Synthetic Monitoring API to query synthetic scripts and monitors. For more information, see [Application Performance Monitoring](https://docs.oracle.com/iaas/application-performance-monitoring/index.html).
  class ApmSynthetics::ApmSyntheticClient
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


    # Creates a new ApmSyntheticClient.
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
      logger.info "ApmSyntheticClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://apm-synthetic.{region}.oci.{secondLevelDomain}') + '/20200630'
      logger.info "ApmSyntheticClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Registers a new dedicated vantage point.
    #
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [OCI::ApmSynthetics::Models::CreateDedicatedVantagePointDetails] create_dedicated_vantage_point_details The configuration details for registering a dedicated vantage point.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::DedicatedVantagePoint DedicatedVantagePoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/create_dedicated_vantage_point.rb.html) to see an example of how to use create_dedicated_vantage_point API.
    def create_dedicated_vantage_point(apm_domain_id, create_dedicated_vantage_point_details, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#create_dedicated_vantage_point.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling create_dedicated_vantage_point." if apm_domain_id.nil?
      raise "Missing the required parameter 'create_dedicated_vantage_point_details' when calling create_dedicated_vantage_point." if create_dedicated_vantage_point_details.nil?

      path = '/dedicatedVantagePoints'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_dedicated_vantage_point_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#create_dedicated_vantage_point') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::DedicatedVantagePoint'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new monitor.
    #
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [OCI::ApmSynthetics::Models::CreateMonitorDetails] create_monitor_details The configuration details for creating a monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::Monitor Monitor}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/create_monitor.rb.html) to see an example of how to use create_monitor API.
    def create_monitor(apm_domain_id, create_monitor_details, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#create_monitor.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling create_monitor." if apm_domain_id.nil?
      raise "Missing the required parameter 'create_monitor_details' when calling create_monitor." if create_monitor_details.nil?

      path = '/monitors'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_monitor_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#create_monitor') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::Monitor'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new script.
    #
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [OCI::ApmSynthetics::Models::CreateScriptDetails] create_script_details The configuration details for creating a script.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::Script Script}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/create_script.rb.html) to see an example of how to use create_script API.
    def create_script(apm_domain_id, create_script_details, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#create_script.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling create_script." if apm_domain_id.nil?
      raise "Missing the required parameter 'create_script_details' when calling create_script." if create_script_details.nil?

      path = '/scripts'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_script_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#create_script') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::Script'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deregisters the specified dedicated vantage point.
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [String] dedicated_vantage_point_id The OCID of the dedicated vantage point.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/delete_dedicated_vantage_point.rb.html) to see an example of how to use delete_dedicated_vantage_point API.
    def delete_dedicated_vantage_point(apm_domain_id, dedicated_vantage_point_id, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#delete_dedicated_vantage_point.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling delete_dedicated_vantage_point." if apm_domain_id.nil?
      raise "Missing the required parameter 'dedicated_vantage_point_id' when calling delete_dedicated_vantage_point." if dedicated_vantage_point_id.nil?
      raise "Parameter value for 'dedicated_vantage_point_id' must not be blank" if OCI::Internal::Util.blank_string?(dedicated_vantage_point_id)

      path = '/dedicatedVantagePoints/{dedicatedVantagePointId}'.sub('{dedicatedVantagePointId}', dedicated_vantage_point_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#delete_dedicated_vantage_point') do
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


    # Deletes the specified monitor.
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [String] monitor_id The OCID of the monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/delete_monitor.rb.html) to see an example of how to use delete_monitor API.
    def delete_monitor(apm_domain_id, monitor_id, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#delete_monitor.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling delete_monitor." if apm_domain_id.nil?
      raise "Missing the required parameter 'monitor_id' when calling delete_monitor." if monitor_id.nil?
      raise "Parameter value for 'monitor_id' must not be blank" if OCI::Internal::Util.blank_string?(monitor_id)

      path = '/monitors/{monitorId}'.sub('{monitorId}', monitor_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#delete_monitor') do
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


    # Deletes the specified script.
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [String] script_id The OCID of the script.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/delete_script.rb.html) to see an example of how to use delete_script API.
    def delete_script(apm_domain_id, script_id, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#delete_script.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling delete_script." if apm_domain_id.nil?
      raise "Missing the required parameter 'script_id' when calling delete_script." if script_id.nil?
      raise "Parameter value for 'script_id' must not be blank" if OCI::Internal::Util.blank_string?(script_id)

      path = '/scripts/{scriptId}'.sub('{scriptId}', script_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#delete_script') do
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


    # Gets the details of the dedicated vantage point identified by the OCID.
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [String] dedicated_vantage_point_id The OCID of the dedicated vantage point.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::DedicatedVantagePoint DedicatedVantagePoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/get_dedicated_vantage_point.rb.html) to see an example of how to use get_dedicated_vantage_point API.
    def get_dedicated_vantage_point(apm_domain_id, dedicated_vantage_point_id, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#get_dedicated_vantage_point.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling get_dedicated_vantage_point." if apm_domain_id.nil?
      raise "Missing the required parameter 'dedicated_vantage_point_id' when calling get_dedicated_vantage_point." if dedicated_vantage_point_id.nil?
      raise "Parameter value for 'dedicated_vantage_point_id' must not be blank" if OCI::Internal::Util.blank_string?(dedicated_vantage_point_id)

      path = '/dedicatedVantagePoints/{dedicatedVantagePointId}'.sub('{dedicatedVantagePointId}', dedicated_vantage_point_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#get_dedicated_vantage_point') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::DedicatedVantagePoint'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the configuration of the monitor identified by the OCID.
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [String] monitor_id The OCID of the monitor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::Monitor Monitor}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/get_monitor.rb.html) to see an example of how to use get_monitor API.
    def get_monitor(apm_domain_id, monitor_id, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#get_monitor.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling get_monitor." if apm_domain_id.nil?
      raise "Missing the required parameter 'monitor_id' when calling get_monitor." if monitor_id.nil?
      raise "Parameter value for 'monitor_id' must not be blank" if OCI::Internal::Util.blank_string?(monitor_id)

      path = '/monitors/{monitorId}'.sub('{monitorId}', monitor_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#get_monitor') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::Monitor'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the results for a specific execution of a monitor identified by OCID. The results are in a HAR file, Screenshot, Console Log or Network details.
    #
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [String] monitor_id The OCID of the monitor.
    # @param [String] vantage_point The vantagePoint name.
    #
    # @param [String] result_type The result type: har, screenshot, log, or network.
    #
    # @param [String] result_content_type The result content type: zip or raw.
    #
    # @param [String] execution_time The time the object was posted.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::MonitorResult MonitorResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/get_monitor_result.rb.html) to see an example of how to use get_monitor_result API.
    def get_monitor_result(apm_domain_id, monitor_id, vantage_point, result_type, result_content_type, execution_time, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#get_monitor_result.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling get_monitor_result." if apm_domain_id.nil?
      raise "Missing the required parameter 'monitor_id' when calling get_monitor_result." if monitor_id.nil?
      raise "Missing the required parameter 'vantage_point' when calling get_monitor_result." if vantage_point.nil?
      raise "Missing the required parameter 'result_type' when calling get_monitor_result." if result_type.nil?
      raise "Missing the required parameter 'result_content_type' when calling get_monitor_result." if result_content_type.nil?
      raise "Missing the required parameter 'execution_time' when calling get_monitor_result." if execution_time.nil?
      raise "Parameter value for 'monitor_id' must not be blank" if OCI::Internal::Util.blank_string?(monitor_id)
      raise "Parameter value for 'execution_time' must not be blank" if OCI::Internal::Util.blank_string?(execution_time)

      path = '/monitors/{monitorId}/results/{executionTime}'.sub('{monitorId}', monitor_id.to_s).sub('{executionTime}', execution_time.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id
      query_params[:vantagePoint] = vantage_point
      query_params[:resultType] = result_type
      query_params[:resultContentType] = result_content_type

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#get_monitor_result') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::MonitorResult'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the configuration of the script identified by the OCID.
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [String] script_id The OCID of the script.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::Script Script}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/get_script.rb.html) to see an example of how to use get_script API.
    def get_script(apm_domain_id, script_id, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#get_script.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling get_script." if apm_domain_id.nil?
      raise "Missing the required parameter 'script_id' when calling get_script." if script_id.nil?
      raise "Parameter value for 'script_id' must not be blank" if OCI::Internal::Util.blank_string?(script_id)

      path = '/scripts/{scriptId}'.sub('{scriptId}', script_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#get_script') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::Script'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of dedicated vantage points.
    #
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 100)
    # @option opts [String] :page For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `50`
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). Default sort order is ascending.
    #    (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided.
    #   Default order of displayName is ascending.
    #   Default order of timeCreated and timeUpdated is descending.
    #   The displayName sort by is case sensitive.
    #    (default to displayName)
    #   Allowed values are: displayName, name, timeCreated, timeUpdated, status
    # @option opts [String] :display_name A filter to return only the resources that match the entire display name.
    # @option opts [String] :name A filter to return only the resources that match the entire name.
    # @option opts [String] :status A filter to return only the dedicated vantage points that match a given status.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::DedicatedVantagePointCollection DedicatedVantagePointCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/list_dedicated_vantage_points.rb.html) to see an example of how to use list_dedicated_vantage_points API.
    def list_dedicated_vantage_points(apm_domain_id, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#list_dedicated_vantage_points.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling list_dedicated_vantage_points." if apm_domain_id.nil?

      if opts[:sort_order] && !OCI::ApmSynthetics::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::ApmSynthetics::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName name timeCreated timeUpdated status].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, name, timeCreated, timeUpdated, status.'
      end

      if opts[:status] && !OCI::ApmSynthetics::Models::DEDICATED_VANTAGE_POINT_STATUS_ENUM.include?(opts[:status])
        raise 'Invalid value for "status", must be one of the values in OCI::ApmSynthetics::Models::DEDICATED_VANTAGE_POINT_STATUS_ENUM.'
      end

      path = '/dedicatedVantagePoints'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:status] = opts[:status] if opts[:status]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#list_dedicated_vantage_points') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::DedicatedVantagePointCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of monitors.
    #
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only the resources that match the entire display name.
    # @option opts [String] :script_id A filter to return only monitors using scriptId.
    # @option opts [String] :vantage_point The name of the public or dedicated vantage point.
    #
    # @option opts [String] :monitor_type A filter to return only monitors that match the given monitor type.
    #   Supported values are SCRIPTED_BROWSER, BROWSER, SCRIPTED_REST and REST.
    #
    # @option opts [String] :status A filter to return only monitors that match the status given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 100)
    # @option opts [String] :page For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `50`
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). Default sort order is ascending.
    #    (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided.
    #   Default order of displayName is ascending.
    #   Default order of timeCreated and timeUpdated is descending.
    #   The displayName sort by is case insensitive.
    #    (default to displayName)
    #   Allowed values are: displayName, timeCreated, timeUpdated, status, monitorType
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::MonitorCollection MonitorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/list_monitors.rb.html) to see an example of how to use list_monitors API.
    def list_monitors(apm_domain_id, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#list_monitors.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling list_monitors." if apm_domain_id.nil?

      if opts[:status] && !OCI::ApmSynthetics::Models::MONITOR_STATUS_ENUM.include?(opts[:status])
        raise 'Invalid value for "status", must be one of the values in OCI::ApmSynthetics::Models::MONITOR_STATUS_ENUM.'
      end

      if opts[:sort_order] && !OCI::ApmSynthetics::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::ApmSynthetics::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated timeUpdated status monitorType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated, timeUpdated, status, monitorType.'
      end

      path = '/monitors'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:scriptId] = opts[:script_id] if opts[:script_id]
      query_params[:vantagePoint] = opts[:vantage_point] if opts[:vantage_point]
      query_params[:monitorType] = opts[:monitor_type] if opts[:monitor_type]
      query_params[:status] = opts[:status] if opts[:status]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#list_monitors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::MonitorCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of public vantage points.
    #
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 100)
    # @option opts [String] :page For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `50`
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). Default sort order is ascending.
    #    (default to ASC)
    # @option opts [String] :sort_by The field to sort by. You can provide one sort by (`sortBy`). Default order for displayName or name is ascending. The displayName or name
    #   sort by is case insensitive.
    #    (default to displayName)
    #   Allowed values are: name, displayName
    # @option opts [String] :display_name A filter to return only the resources that match the entire display name.
    # @option opts [String] :name A filter to return only the resources that match the entire name.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::PublicVantagePointCollection PublicVantagePointCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/list_public_vantage_points.rb.html) to see an example of how to use list_public_vantage_points API.
    def list_public_vantage_points(apm_domain_id, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#list_public_vantage_points.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling list_public_vantage_points." if apm_domain_id.nil?

      if opts[:sort_order] && !OCI::ApmSynthetics::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::ApmSynthetics::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[name displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, displayName.'
      end

      path = '/publicVantagePoints'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:name] = opts[:name] if opts[:name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#list_public_vantage_points') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::PublicVantagePointCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of scripts.
    #
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :display_name A filter to return only the resources that match the entire display name.
    # @option opts [String] :content_type A filter to return only resources that match the content type given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 100)
    # @option opts [String] :page For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `50`
    #
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). Default sort order is ascending.
    #    (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided.
    #   Default order of displayName and contentType is ascending.
    #   Default order of timeCreated and timeUpdated is descending.
    #   The displayName sort by is case insensitive.
    #    (default to displayName)
    #   Allowed values are: displayName, timeCreated, timeUpdated, contentType
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::ScriptCollection ScriptCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/list_scripts.rb.html) to see an example of how to use list_scripts API.
    def list_scripts(apm_domain_id, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#list_scripts.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling list_scripts." if apm_domain_id.nil?

      if opts[:sort_order] && !OCI::ApmSynthetics::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::ApmSynthetics::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated timeUpdated contentType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated, timeUpdated, contentType.'
      end

      path = '/scripts'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:contentType] = opts[:content_type] if opts[:content_type]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#list_scripts') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::ScriptCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the dedicated vantage point.
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [String] dedicated_vantage_point_id The OCID of the dedicated vantage point.
    # @param [OCI::ApmSynthetics::Models::UpdateDedicatedVantagePointDetails] update_dedicated_vantage_point_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::DedicatedVantagePoint DedicatedVantagePoint}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/update_dedicated_vantage_point.rb.html) to see an example of how to use update_dedicated_vantage_point API.
    def update_dedicated_vantage_point(apm_domain_id, dedicated_vantage_point_id, update_dedicated_vantage_point_details, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#update_dedicated_vantage_point.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling update_dedicated_vantage_point." if apm_domain_id.nil?
      raise "Missing the required parameter 'dedicated_vantage_point_id' when calling update_dedicated_vantage_point." if dedicated_vantage_point_id.nil?
      raise "Missing the required parameter 'update_dedicated_vantage_point_details' when calling update_dedicated_vantage_point." if update_dedicated_vantage_point_details.nil?
      raise "Parameter value for 'dedicated_vantage_point_id' must not be blank" if OCI::Internal::Util.blank_string?(dedicated_vantage_point_id)

      path = '/dedicatedVantagePoints/{dedicatedVantagePointId}'.sub('{dedicatedVantagePointId}', dedicated_vantage_point_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_dedicated_vantage_point_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#update_dedicated_vantage_point') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::DedicatedVantagePoint'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the monitor.
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [String] monitor_id The OCID of the monitor.
    # @param [OCI::ApmSynthetics::Models::UpdateMonitorDetails] update_monitor_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::Monitor Monitor}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/update_monitor.rb.html) to see an example of how to use update_monitor API.
    def update_monitor(apm_domain_id, monitor_id, update_monitor_details, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#update_monitor.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling update_monitor." if apm_domain_id.nil?
      raise "Missing the required parameter 'monitor_id' when calling update_monitor." if monitor_id.nil?
      raise "Missing the required parameter 'update_monitor_details' when calling update_monitor." if update_monitor_details.nil?
      raise "Parameter value for 'monitor_id' must not be blank" if OCI::Internal::Util.blank_string?(monitor_id)

      path = '/monitors/{monitorId}'.sub('{monitorId}', monitor_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_monitor_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#update_monitor') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::Monitor'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the script.
    # @param [String] apm_domain_id The APM domain ID the request is intended for.
    #
    # @param [String] script_id The OCID of the script.
    # @param [OCI::ApmSynthetics::Models::UpdateScriptDetails] update_script_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::ApmSynthetics::Models::Script Script}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/apmsynthetics/update_script.rb.html) to see an example of how to use update_script API.
    def update_script(apm_domain_id, script_id, update_script_details, opts = {})
      logger.debug 'Calling operation ApmSyntheticClient#update_script.' if logger

      raise "Missing the required parameter 'apm_domain_id' when calling update_script." if apm_domain_id.nil?
      raise "Missing the required parameter 'script_id' when calling update_script." if script_id.nil?
      raise "Missing the required parameter 'update_script_details' when calling update_script." if update_script_details.nil?
      raise "Parameter value for 'script_id' must not be blank" if OCI::Internal::Util.blank_string?(script_id)

      path = '/scripts/{scriptId}'.sub('{scriptId}', script_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:apmDomainId] = apm_domain_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_script_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ApmSyntheticClient#update_script') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::ApmSynthetics::Models::Script'
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
