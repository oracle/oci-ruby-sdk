# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The API for the Streaming Service.
  class Streaming::StreamClient
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


    # Creates a new StreamClient.
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
        @endpoint = endpoint + '/20180418'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "StreamClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://streaming.{region}.oci.{secondLevelDomain}') + '/20180418'
      logger.info "StreamClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Provides a mechanism to manually commit offsets, if not using commit-on-get consumer semantics.
    # This commits offsets assicated with the provided cursor, extends the timeout on each of the affected partitions, and returns an updated cursor.
    #
    # @param [String] stream_id The OCID of the stream for which the group is committing offsets.
    # @param [String] cursor The group-cursor representing the offsets of the group. This cursor is retrieved from the CreateGroupCursor API call.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Streaming::Models::Cursor Cursor}
    def consumer_commit(stream_id, cursor, opts = {})
      logger.debug 'Calling operation StreamClient#consumer_commit.' if logger

      raise "Missing the required parameter 'stream_id' when calling consumer_commit." if stream_id.nil?
      raise "Missing the required parameter 'cursor' when calling consumer_commit." if cursor.nil?
      raise "Parameter value for 'stream_id' must not be blank" if OCI::Internal::Util.blank_string?(stream_id)

      path = '/streams/{streamId}/commit'.sub('{streamId}', stream_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:cursor] = cursor

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'StreamClient#consumer_commit') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Streaming::Models::Cursor'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Allows long-running processes to extend the timeout on partitions reserved by a consumer instance.
    #
    # @param [String] stream_id The OCID of the stream for which the group is committing offsets.
    # @param [String] cursor The group-cursor representing the offsets of the group. This cursor is retrieved from the CreateGroupCursor API call.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Streaming::Models::Cursor Cursor}
    def consumer_heartbeat(stream_id, cursor, opts = {})
      logger.debug 'Calling operation StreamClient#consumer_heartbeat.' if logger

      raise "Missing the required parameter 'stream_id' when calling consumer_heartbeat." if stream_id.nil?
      raise "Missing the required parameter 'cursor' when calling consumer_heartbeat." if cursor.nil?
      raise "Parameter value for 'stream_id' must not be blank" if OCI::Internal::Util.blank_string?(stream_id)

      path = '/streams/{streamId}/heartbeat'.sub('{streamId}', stream_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:cursor] = cursor

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'StreamClient#consumer_heartbeat') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Streaming::Models::Cursor'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a cursor. Cursors are used to consume a stream, starting from a specific point in the partition and going forward from there.
    # You can create a cursor based on an offset, a time, the trim horizon, or the most recent message in the stream. As the oldest message
    # inside the retention period boundary, using the trim horizon effectively lets you consume all messages in the stream. A cursor based
    # on the most recent message allows consumption of only messages that are added to the stream after you create the cursor. Cursors expire
    # five minutes after you receive them from the service.
    #
    # @param [String] stream_id The OCID of the stream to create a cursor for.
    # @param [OCI::Streaming::Models::CreateCursorDetails] create_cursor_details The information used to create the cursor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Streaming::Models::Cursor Cursor}
    def create_cursor(stream_id, create_cursor_details, opts = {})
      logger.debug 'Calling operation StreamClient#create_cursor.' if logger

      raise "Missing the required parameter 'stream_id' when calling create_cursor." if stream_id.nil?
      raise "Missing the required parameter 'create_cursor_details' when calling create_cursor." if create_cursor_details.nil?
      raise "Parameter value for 'stream_id' must not be blank" if OCI::Internal::Util.blank_string?(stream_id)

      path = '/streams/{streamId}/cursors'.sub('{streamId}', stream_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_cursor_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'StreamClient#create_cursor') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Streaming::Models::Cursor'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a group-cursor.
    #
    # @param [String] stream_id The OCID of the stream to create a cursor for.
    # @param [OCI::Streaming::Models::CreateGroupCursorDetails] create_group_cursor_details The information used to create the cursor.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Streaming::Models::Cursor Cursor}
    def create_group_cursor(stream_id, create_group_cursor_details, opts = {})
      logger.debug 'Calling operation StreamClient#create_group_cursor.' if logger

      raise "Missing the required parameter 'stream_id' when calling create_group_cursor." if stream_id.nil?
      raise "Missing the required parameter 'create_group_cursor_details' when calling create_group_cursor." if create_group_cursor_details.nil?
      raise "Parameter value for 'stream_id' must not be blank" if OCI::Internal::Util.blank_string?(stream_id)

      path = '/streams/{streamId}/groupCursors'.sub('{streamId}', stream_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_group_cursor_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'StreamClient#create_group_cursor') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Streaming::Models::Cursor'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns the current state of a consumer group.
    #
    # @param [String] stream_id The OCID of the stream, on which the group is operating.
    # @param [String] group_name The name of the consumer group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Streaming::Models::Group Group}
    def get_group(stream_id, group_name, opts = {})
      logger.debug 'Calling operation StreamClient#get_group.' if logger

      raise "Missing the required parameter 'stream_id' when calling get_group." if stream_id.nil?
      raise "Missing the required parameter 'group_name' when calling get_group." if group_name.nil?
      raise "Parameter value for 'stream_id' must not be blank" if OCI::Internal::Util.blank_string?(stream_id)
      raise "Parameter value for 'group_name' must not be blank" if OCI::Internal::Util.blank_string?(group_name)

      path = '/streams/{streamId}/groups/{groupName}'.sub('{streamId}', stream_id.to_s).sub('{groupName}', group_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'StreamClient#get_group') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Streaming::Models::Group'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns messages from the specified stream using the specified cursor as the starting point for consumption. By default, the number of messages returned is undefined, but the service returns as many as possible.
    # To get messages, you must first obtain a cursor using the {#create_cursor create_cursor} operation.
    # In the response, retrieve the value of the 'opc-next-cursor' header to pass as a parameter to get the next batch of messages in the stream.
    #
    # @param [String] stream_id The OCID of the stream to get messages from.
    # @param [String] cursor The cursor used to consume the stream.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of messages to return. You can specify any value up to 10000. By default, the service returns as many messages as possible.
    #   Consider your average message size to help avoid exceeding throughput on the stream.
    #
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Streaming::Models::Message Message}>
    def get_messages(stream_id, cursor, opts = {})
      logger.debug 'Calling operation StreamClient#get_messages.' if logger

      raise "Missing the required parameter 'stream_id' when calling get_messages." if stream_id.nil?
      raise "Missing the required parameter 'cursor' when calling get_messages." if cursor.nil?
      raise "Parameter value for 'stream_id' must not be blank" if OCI::Internal::Util.blank_string?(stream_id)

      path = '/streams/{streamId}/messages'.sub('{streamId}', stream_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:cursor] = cursor
      query_params[:limit] = opts[:limit] if opts[:limit]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'StreamClient#get_messages') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Streaming::Models::Message>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Emits messages to a stream. There's no limit to the number of messages in a request, but the total size of a message or request must be 1 MiB or less.
    # The service calculates the partition ID from the message key and stores messages that share a key on the same partition.
    # If a message does not contain a key or if the key is null, the service generates a message key for you.
    # The partition ID cannot be passed as a parameter.
    #
    # @param [String] stream_id The OCID of the stream where you want to put messages.
    # @param [OCI::Streaming::Models::PutMessagesDetails] put_messages_details Array of messages to put into the stream.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Streaming::Models::PutMessagesResult PutMessagesResult}
    def put_messages(stream_id, put_messages_details, opts = {})
      logger.debug 'Calling operation StreamClient#put_messages.' if logger

      raise "Missing the required parameter 'stream_id' when calling put_messages." if stream_id.nil?
      raise "Missing the required parameter 'put_messages_details' when calling put_messages." if put_messages_details.nil?
      raise "Parameter value for 'stream_id' must not be blank" if OCI::Internal::Util.blank_string?(stream_id)

      path = '/streams/{streamId}/messages'.sub('{streamId}', stream_id.to_s)
      operation_signing_strategy = :exclude_body

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(put_messages_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'StreamClient#put_messages') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Streaming::Models::PutMessagesResult'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Forcefully changes the current location of a group as a whole; reseting processing location of all consumers to a particular location in the stream.
    #
    # @param [String] stream_id The OCID of the stream, on which the group is operating.
    # @param [String] group_name The name of the consumer group.
    # @param [OCI::Streaming::Models::UpdateGroupDetails] update_group_details The information used to modify the group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    def update_group(stream_id, group_name, update_group_details, opts = {})
      logger.debug 'Calling operation StreamClient#update_group.' if logger

      raise "Missing the required parameter 'stream_id' when calling update_group." if stream_id.nil?
      raise "Missing the required parameter 'group_name' when calling update_group." if group_name.nil?
      raise "Missing the required parameter 'update_group_details' when calling update_group." if update_group_details.nil?
      raise "Parameter value for 'stream_id' must not be blank" if OCI::Internal::Util.blank_string?(stream_id)
      raise "Parameter value for 'group_name' must not be blank" if OCI::Internal::Util.blank_string?(group_name)

      path = '/streams/{streamId}/groups/{groupName}'.sub('{streamId}', stream_id.to_s).sub('{groupName}', group_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'StreamClient#update_group') do
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
