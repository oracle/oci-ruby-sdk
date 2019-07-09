# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API for the Email Delivery service. Use this API to send high-volume, application-generated
  # emails. For more information, see [Overview of the Email Delivery Service](/iaas/Content/Email/Concepts/overview.htm).
  #
  #
  # **Note:** Write actions (POST, UPDATE, DELETE) may take several minutes to propagate and be reflected by the API. If a subsequent read request fails to reflect your changes, wait a few minutes and try again.
  class Email::EmailClient
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


    # Creates a new EmailClient.
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
        @endpoint = endpoint + '/20170907'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "EmailClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://email.{region}.{secondLevelDomain}') + '/20170907'
      logger.info "EmailClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a sender into a different compartment. When provided, If-Match is checked against ETag values of the resource.
    # @param [String] sender_id The unique OCID of the sender.
    # @param [OCI::Email::Models::ChangeSenderCompartmentDetails] change_sender_compartment_details Details for moving a sender into a different compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The request ID for tracing from the system
    # @return [Response] A Response object with data of type nil
    def change_sender_compartment(sender_id, change_sender_compartment_details, opts = {})
      logger.debug 'Calling operation EmailClient#change_sender_compartment.' if logger

      raise "Missing the required parameter 'sender_id' when calling change_sender_compartment." if sender_id.nil?
      raise "Missing the required parameter 'change_sender_compartment_details' when calling change_sender_compartment." if change_sender_compartment_details.nil?
      raise "Parameter value for 'sender_id' must not be blank" if OCI::Internal::Util.blank_string?(sender_id)

      path = '/senders/{senderId}/actions/changeCompartment'.sub('{senderId}', sender_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_sender_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EmailClient#change_sender_compartment') do
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


    # Creates a sender for a tenancy in a given compartment.
    # @param [OCI::Email::Models::CreateSenderDetails] create_sender_details Create a sender.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The request ID for tracing from the system
    # @return [Response] A Response object with data of type {OCI::Email::Models::Sender Sender}
    def create_sender(create_sender_details, opts = {})
      logger.debug 'Calling operation EmailClient#create_sender.' if logger

      raise "Missing the required parameter 'create_sender_details' when calling create_sender." if create_sender_details.nil?

      path = '/senders'
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

      post_body = @api_client.object_to_http_body(create_sender_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EmailClient#create_sender') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Email::Models::Sender'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Adds recipient email addresses to the suppression list for a tenancy.
    # Addresses added to the suppression list via the API are denoted as
    # \"MANUAL\" in the `reason` field. *Note:* All email addresses added to the
    # suppression list are normalized to include only lowercase letters.
    #
    # @param [OCI::Email::Models::CreateSuppressionDetails] create_suppression_details Adds a single email address to the suppression list for a compartment's tenancy.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The request ID for tracing from the system
    # @return [Response] A Response object with data of type {OCI::Email::Models::Suppression Suppression}
    def create_suppression(create_suppression_details, opts = {})
      logger.debug 'Calling operation EmailClient#create_suppression.' if logger

      raise "Missing the required parameter 'create_suppression_details' when calling create_suppression." if create_suppression_details.nil?

      path = '/suppressions'
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

      post_body = @api_client.object_to_http_body(create_suppression_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EmailClient#create_suppression') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Email::Models::Suppression'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes an approved sender for a tenancy in a given compartment for a
    # provided `senderId`.
    #
    # @param [String] sender_id The unique OCID of the sender.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The request ID for tracing from the system
    # @return [Response] A Response object with data of type nil
    def delete_sender(sender_id, opts = {})
      logger.debug 'Calling operation EmailClient#delete_sender.' if logger

      raise "Missing the required parameter 'sender_id' when calling delete_sender." if sender_id.nil?
      raise "Parameter value for 'sender_id' must not be blank" if OCI::Internal::Util.blank_string?(sender_id)

      path = '/senders/{senderId}'.sub('{senderId}', sender_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EmailClient#delete_sender') do
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


    # Removes a suppressed recipient email address from the suppression list
    # for a tenancy in a given compartment for a provided `suppressionId`.
    #
    # @param [String] suppression_id The unique OCID of the suppression.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The request ID for tracing from the system
    # @return [Response] A Response object with data of type nil
    def delete_suppression(suppression_id, opts = {})
      logger.debug 'Calling operation EmailClient#delete_suppression.' if logger

      raise "Missing the required parameter 'suppression_id' when calling delete_suppression." if suppression_id.nil?
      raise "Parameter value for 'suppression_id' must not be blank" if OCI::Internal::Util.blank_string?(suppression_id)

      path = '/suppressions/{suppressionId}'.sub('{suppressionId}', suppression_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EmailClient#delete_suppression') do
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


    # Gets an approved sender for a given `senderId`.
    # @param [String] sender_id The unique OCID of the sender.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The request ID for tracing from the system
    # @return [Response] A Response object with data of type {OCI::Email::Models::Sender Sender}
    def get_sender(sender_id, opts = {})
      logger.debug 'Calling operation EmailClient#get_sender.' if logger

      raise "Missing the required parameter 'sender_id' when calling get_sender." if sender_id.nil?
      raise "Parameter value for 'sender_id' must not be blank" if OCI::Internal::Util.blank_string?(sender_id)

      path = '/senders/{senderId}'.sub('{senderId}', sender_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EmailClient#get_sender') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Email::Models::Sender'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of a suppressed recipient email address for a given
    # `suppressionId`. Each suppression is given a unique OCID.
    #
    # @param [String] suppression_id The unique OCID of the suppression.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The request ID for tracing from the system
    # @return [Response] A Response object with data of type {OCI::Email::Models::Suppression Suppression}
    def get_suppression(suppression_id, opts = {})
      logger.debug 'Calling operation EmailClient#get_suppression.' if logger

      raise "Missing the required parameter 'suppression_id' when calling get_suppression." if suppression_id.nil?
      raise "Parameter value for 'suppression_id' must not be blank" if OCI::Internal::Util.blank_string?(suppression_id)

      path = '/suppressions/{suppressionId}'.sub('{suppressionId}', suppression_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EmailClient#get_suppression') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Email::Models::Suppression'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a collection of approved sender email addresses and sender IDs.
    #
    # @param [String] compartment_id The OCID for the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The request ID for tracing from the system
    # @option opts [String] :lifecycle_state The current state of a sender.
    # @option opts [String] :email_address The email address of the approved sender.
    # @option opts [String] :page For list pagination. The value of the opc-next-page response header from the previous \"List\" call.
    #   For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a
    #   paginated \"List\" call. `1` is the minimum, `1000` is the maximum. For important details about
    #   how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_by The field to sort by. The `TIMECREATED` value returns the list in in
    #   descending order by default. The `EMAILADDRESS` value returns the list in
    #   ascending order by default. Use the `SortOrderQueryParam` to change the
    #   direction of the returned list of items.
    #
    #   Allowed values are: TIMECREATED, EMAILADDRESS
    # @option opts [String] :sort_order The sort order to use, either ascending or descending order.
    #
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Email::Models::SenderSummary SenderSummary}>
    def list_senders(compartment_id, opts = {})
      logger.debug 'Calling operation EmailClient#list_senders.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_senders." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Email::Models::Sender::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Email::Models::Sender::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[TIMECREATED EMAILADDRESS].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, EMAILADDRESS.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/senders'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:emailAddress] = opts[:email_address] if opts[:email_address]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EmailClient#list_senders') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Email::Models::SenderSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of suppressed recipient email addresses for a user. The
    # `compartmentId` for suppressions must be a tenancy OCID. The returned list
    # is sorted by creation time in descending order.
    #
    # @param [String] compartment_id The OCID for the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The request ID for tracing from the system
    # @option opts [String] :email_address The email address of the suppression.
    # @option opts [DateTime] :time_created_greater_than_or_equal_to Search for suppressions that were created within a specific date range,
    #   using this parameter to specify the earliest creation date for the
    #   returned list (inclusive). Specifying this parameter without the
    #   corresponding `timeCreatedLessThan` parameter will retrieve suppressions created from the
    #   given `timeCreatedGreaterThanOrEqualTo` to the current time, in \"YYYY-MM-ddThh:mmZ\" format with a
    #   Z offset, as defined by RFC 3339.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [DateTime] :time_created_less_than Search for suppressions that were created within a specific date range,
    #   using this parameter to specify the latest creation date for the returned
    #   list (exclusive). Specifying this parameter without the corresponding
    #   `timeCreatedGreaterThanOrEqualTo` parameter will retrieve all suppressions created before the
    #   specified end date, in \"YYYY-MM-ddThh:mmZ\" format with a Z offset, as
    #   defined by RFC 3339.
    #
    #   **Example:** 2016-12-19T16:39:57.600Z
    #
    # @option opts [String] :page For list pagination. The value of the opc-next-page response header from the previous \"List\" call.
    #   For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a
    #   paginated \"List\" call. `1` is the minimum, `1000` is the maximum. For important details about
    #   how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_by The field to sort by. The `TIMECREATED` value returns the list in in
    #   descending order by default. The `EMAILADDRESS` value returns the list in
    #   ascending order by default. Use the `SortOrderQueryParam` to change the
    #   direction of the returned list of items.
    #
    #   Allowed values are: TIMECREATED, EMAILADDRESS
    # @option opts [String] :sort_order The sort order to use, either ascending or descending order.
    #
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Email::Models::SuppressionSummary SuppressionSummary}>
    def list_suppressions(compartment_id, opts = {})
      logger.debug 'Calling operation EmailClient#list_suppressions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_suppressions." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED EMAILADDRESS].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, EMAILADDRESS.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/suppressions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:emailAddress] = opts[:email_address] if opts[:email_address]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:limit] = opts[:limit] if opts[:limit]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EmailClient#list_suppressions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Email::Models::SuppressionSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Replaces the set of tags for a sender with the tags provided. If either freeform
    # or defined tags are omitted, the tags for that set remain the same. Each set must
    # include the full set of tags for the sender, partial updates are not permitted.
    # For more information about tagging, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # @param [String] sender_id The unique OCID of the sender.
    # @param [OCI::Email::Models::UpdateSenderDetails] update_sender_details update details for sender.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match Used for optimistic concurrency control. In the update or delete call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous get, create, or update response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The request ID for tracing from the system
    # @return [Response] A Response object with data of type {OCI::Email::Models::Sender Sender}
    def update_sender(sender_id, update_sender_details, opts = {})
      logger.debug 'Calling operation EmailClient#update_sender.' if logger

      raise "Missing the required parameter 'sender_id' when calling update_sender." if sender_id.nil?
      raise "Missing the required parameter 'update_sender_details' when calling update_sender." if update_sender_details.nil?
      raise "Parameter value for 'sender_id' must not be blank" if OCI::Internal::Util.blank_string?(sender_id)

      path = '/senders/{senderId}'.sub('{senderId}', sender_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_sender_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'EmailClient#update_sender') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Email::Models::Sender'
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
