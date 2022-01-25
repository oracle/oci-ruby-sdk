# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API for the OS Management service. Use these API operations for working
  # with Managed instances and Managed instance groups.
  class OsManagement::EventClient
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


    # Creates a new EventClient.
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
        @endpoint = endpoint + '/20190801'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "EventClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://osms.{region}.oci.{secondLevelDomain}') + '/20190801'
      logger.info "EventClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Delete an event content ZIP archive from the service
    #
    # @param [String] managed_instance_id Instance Oracle Cloud identifier (ocid)
    # @param [String] event_id Unique Event identifier (OCID)
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/delete_event_content.rb.html) to see an example of how to use delete_event_content API.
    def delete_event_content(managed_instance_id, event_id, compartment_id, opts = {})
      logger.debug 'Calling operation EventClient#delete_event_content.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling delete_event_content." if managed_instance_id.nil?
      raise "Missing the required parameter 'event_id' when calling delete_event_content." if event_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling delete_event_content." if compartment_id.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)
      raise "Parameter value for 'event_id' must not be blank" if OCI::Internal::Util.blank_string?(event_id)

      path = '/managedInstances/{managedInstanceId}/events/{eventId}/content'.sub('{managedInstanceId}', managed_instance_id.to_s).sub('{eventId}', event_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EventClient#delete_event_content') do
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


    # Gets an Event by identifier
    # @param [String] managed_instance_id Instance Oracle Cloud identifier (ocid)
    # @param [String] event_id Unique Event identifier (OCID)
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::Event Event}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/get_event.rb.html) to see an example of how to use get_event API.
    def get_event(managed_instance_id, event_id, compartment_id, opts = {})
      logger.debug 'Calling operation EventClient#get_event.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling get_event." if managed_instance_id.nil?
      raise "Missing the required parameter 'event_id' when calling get_event." if event_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_event." if compartment_id.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)
      raise "Parameter value for 'event_id' must not be blank" if OCI::Internal::Util.blank_string?(event_id)

      path = '/managedInstances/{managedInstanceId}/events/{eventId}'.sub('{managedInstanceId}', managed_instance_id.to_s).sub('{eventId}', event_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EventClient#get_event') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::Event'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get additional data about a event as a ZIP archive. The archive content depends on the event eventType.
    #
    # @param [String] managed_instance_id Instance Oracle Cloud identifier (ocid)
    # @param [String] event_id Unique Event identifier (OCID)
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/get_event_content.rb.html) to see an example of how to use get_event_content API.
    def get_event_content(managed_instance_id, event_id, compartment_id, opts = {}, &block)
      logger.debug 'Calling operation EventClient#get_event_content.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling get_event_content." if managed_instance_id.nil?
      raise "Missing the required parameter 'event_id' when calling get_event_content." if event_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_event_content." if compartment_id.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)
      raise "Parameter value for 'event_id' must not be blank" if OCI::Internal::Util.blank_string?(event_id)

      path = '/managedInstances/{managedInstanceId}/events/{eventId}/content'.sub('{managedInstanceId}', managed_instance_id.to_s).sub('{eventId}', event_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'application/octet-stream'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EventClient#get_event_content') do
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


    # Get summary information about events on this instance.
    #
    # @param [String] managed_instance_id Instance Oracle Cloud identifier (ocid)
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :latest_timestamp_less_than filter event occurrence. Selecting only those last occurred before given date in ISO 8601 format
    #   Example: 2017-07-14T02:40:00.000Z
    #
    # @option opts [DateTime] :latest_timestamp_greater_than_or_equal_to filter event occurrence. Selecting only those last occurred on or after given date in ISO 8601 format
    #   Example: 2017-07-14T02:40:00.000Z
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::EventReport EventReport}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/get_event_report.rb.html) to see an example of how to use get_event_report API.
    def get_event_report(managed_instance_id, compartment_id, opts = {})
      logger.debug 'Calling operation EventClient#get_event_report.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling get_event_report." if managed_instance_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_event_report." if compartment_id.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/events/report'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:latestTimestampLessThan] = opts[:latest_timestamp_less_than] if opts[:latest_timestamp_less_than]
      query_params[:latestTimestampGreaterThanOrEqualTo] = opts[:latest_timestamp_greater_than_or_equal_to] if opts[:latest_timestamp_greater_than_or_equal_to]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EventClient#get_event_report') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::EventReport'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of Events.
    #
    # @param [String] managed_instance_id Instance Oracle Cloud identifier (ocid)
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :event_id Unique event identifier (OCID)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for TIMECREATED is descending. Default order for DISPLAYNAME is ascending. If no value is specified TIMECREATED is default.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :event_type A filter to return only event of given type.
    # @option opts [DateTime] :latest_timestamp_less_than filter event occurrence. Selecting only those last occurred before given date in ISO 8601 format
    #   Example: 2017-07-14T02:40:00.000Z
    #
    # @option opts [DateTime] :latest_timestamp_greater_than_or_equal_to filter event occurrence. Selecting only those last occurred on or after given date in ISO 8601 format
    #   Example: 2017-07-14T02:40:00.000Z
    #
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::EventCollection EventCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_events.rb.html) to see an example of how to use list_events API.
    def list_events(managed_instance_id, compartment_id, opts = {})
      logger.debug 'Calling operation EventClient#list_events.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling list_events." if managed_instance_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_events." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:event_type] && !OCI::OsManagement::Models::EVENT_TYPE_ENUM.include?(opts[:event_type])
        raise 'Invalid value for "event_type", must be one of the values in OCI::OsManagement::Models::EVENT_TYPE_ENUM.'
      end
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)

      path = '/managedInstances/{managedInstanceId}/events'.sub('{managedInstanceId}', managed_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:eventId] = opts[:event_id] if opts[:event_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:eventType] = opts[:event_type] if opts[:event_type]
      query_params[:latestTimestampLessThan] = opts[:latest_timestamp_less_than] if opts[:latest_timestamp_less_than]
      query_params[:latestTimestampGreaterThanOrEqualTo] = opts[:latest_timestamp_greater_than_or_equal_to] if opts[:latest_timestamp_greater_than_or_equal_to]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EventClient#list_events') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::EventCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of related events. For now pagination is not implemented.
    #
    # @param [String] event_fingerprint Event fingerprint identifier
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to DESC)
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for id is descending.
    #    (default to instanceId)
    #   Allowed values are: instanceId, id, eventFingerprint
    # @option opts [DateTime] :latest_timestamp_less_than filter event occurrence. Selecting only those last occurred before given date in ISO 8601 format
    #   Example: 2017-07-14T02:40:00.000Z
    #
    # @option opts [DateTime] :latest_timestamp_greater_than_or_equal_to filter event occurrence. Selecting only those last occurred on or after given date in ISO 8601 format
    #   Example: 2017-07-14T02:40:00.000Z
    #
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::RelatedEventCollection RelatedEventCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/list_related_events.rb.html) to see an example of how to use list_related_events API.
    def list_related_events(event_fingerprint, compartment_id, opts = {})
      logger.debug 'Calling operation EventClient#list_related_events.' if logger

      raise "Missing the required parameter 'event_fingerprint' when calling list_related_events." if event_fingerprint.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_related_events." if compartment_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[instanceId id eventFingerprint].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of instanceId, id, eventFingerprint.'
      end

      path = '/relatedEvents'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:eventFingerprint] = event_fingerprint
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:latestTimestampLessThan] = opts[:latest_timestamp_less_than] if opts[:latest_timestamp_less_than]
      query_params[:latestTimestampGreaterThanOrEqualTo] = opts[:latest_timestamp_greater_than_or_equal_to] if opts[:latest_timestamp_greater_than_or_equal_to]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EventClient#list_related_events') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::RelatedEventCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates an existing event associated to a managed instance
    # @param [String] managed_instance_id Instance Oracle Cloud identifier (ocid)
    # @param [String] event_id Unique Event identifier (OCID)
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [OCI::OsManagement::Models::UpdateEventDetails] update_event_details Details about the event to update
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::OsManagement::Models::Event Event}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/update_event.rb.html) to see an example of how to use update_event API.
    def update_event(managed_instance_id, event_id, compartment_id, update_event_details, opts = {})
      logger.debug 'Calling operation EventClient#update_event.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling update_event." if managed_instance_id.nil?
      raise "Missing the required parameter 'event_id' when calling update_event." if event_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling update_event." if compartment_id.nil?
      raise "Missing the required parameter 'update_event_details' when calling update_event." if update_event_details.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)
      raise "Parameter value for 'event_id' must not be blank" if OCI::Internal::Util.blank_string?(event_id)

      path = '/managedInstances/{managedInstanceId}/events/{eventId}'.sub('{managedInstanceId}', managed_instance_id.to_s).sub('{eventId}', event_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_event_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EventClient#update_event') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::OsManagement::Models::Event'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Upload the event content as a ZIP archive from the managed instance to the service
    #
    # @param [String] managed_instance_id Instance Oracle Cloud identifier (ocid)
    # @param [String] event_id Unique Event identifier (OCID)
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/osmanagement/upload_event_content.rb.html) to see an example of how to use upload_event_content API.
    def upload_event_content(managed_instance_id, event_id, compartment_id, opts = {})
      logger.debug 'Calling operation EventClient#upload_event_content.' if logger

      raise "Missing the required parameter 'managed_instance_id' when calling upload_event_content." if managed_instance_id.nil?
      raise "Missing the required parameter 'event_id' when calling upload_event_content." if event_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling upload_event_content." if compartment_id.nil?
      raise "Parameter value for 'managed_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_instance_id)
      raise "Parameter value for 'event_id' must not be blank" if OCI::Internal::Util.blank_string?(event_id)

      path = '/managedInstances/{managedInstanceId}/events/{eventId}/content/actions/upload'.sub('{managedInstanceId}', managed_instance_id.to_s).sub('{eventId}', event_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EventClient#upload_event_content') do
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
