# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API to create and maintain Oracle Digital Assistant service instances.
  class Oda::OdaClient
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


    # Creates a new OdaClient.
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
        @endpoint = endpoint + '/20190506'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "OdaClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://digitalassistant-api.{region}.oci.{secondLevelDomain}') + '/20190506'
      logger.info "OdaClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves an Digital Assistant instance into a different compartment. When provided, If-Match is checked against
    # ETag values of the resource.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::ChangeOdaInstanceCompartmentDetails] change_oda_instance_compartment_details The compartment to which the Digital Assistant instance should be moved.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control in a PUT or DELETE call for
    #   a Digital Assistant instance, set the `if-match` query parameter
    #   to the value of the `ETAG` header from a previous GET or POST
    #   response for that instance. The service updates or deletes the
    #   instance only if the etag that you provide matches the instance's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that you can retry the request if there's
    #   a timeout or server error without the risk of executing that same action again.
    #
    #   Retry tokens expire after 24 hours, but they can become invalid before then if there are
    #   conflicting operations. For example, if an instance was deleted and purged from the system,
    #   then the service might reject a retry of the original creation request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/change_oda_instance_compartment.rb.html) to see an example of how to use change_oda_instance_compartment API.
    def change_oda_instance_compartment(oda_instance_id, change_oda_instance_compartment_details, opts = {})
      logger.debug 'Calling operation OdaClient#change_oda_instance_compartment.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling change_oda_instance_compartment." if oda_instance_id.nil?
      raise "Missing the required parameter 'change_oda_instance_compartment_details' when calling change_oda_instance_compartment." if change_oda_instance_compartment_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/actions/changeCompartment'.sub('{odaInstanceId}', oda_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_oda_instance_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdaClient#change_oda_instance_compartment') do
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


    # Starts an asynchronous job to create a Digital Assistant instance.
    #
    # To monitor the status of the job, take the `opc-work-request-id` response
    # header value and use it to call `GET /workRequests/{workRequestID}`.
    #
    # @param [OCI::Oda::Models::CreateOdaInstanceDetails] create_oda_instance_details Details for the new Digital Assistant instance.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that you can retry the request if there's
    #   a timeout or server error without the risk of executing that same action again.
    #
    #   Retry tokens expire after 24 hours, but they can become invalid before then if there are
    #   conflicting operations. For example, if an instance was deleted and purged from the system,
    #   then the service might reject a retry of the original creation request.
    #
    # @return [Response] A Response object with data of type {OCI::Oda::Models::OdaInstance OdaInstance}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/create_oda_instance.rb.html) to see an example of how to use create_oda_instance API.
    def create_oda_instance(create_oda_instance_details, opts = {})
      logger.debug 'Calling operation OdaClient#create_oda_instance.' if logger

      raise "Missing the required parameter 'create_oda_instance_details' when calling create_oda_instance." if create_oda_instance_details.nil?

      path = '/odaInstances'
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

      post_body = @api_client.object_to_http_body(create_oda_instance_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdaClient#create_oda_instance') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::OdaInstance'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Starts an asynchronous job to delete the specified Digital Assistant instance.
    # To monitor the status of the job, take the `opc-work-request-id` response header value and use it to call `GET /workRequests/{workRequestID}`.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control in a PUT or DELETE call for
    #   a Digital Assistant instance, set the `if-match` query parameter
    #   to the value of the `ETAG` header from a previous GET or POST
    #   response for that instance. The service updates or deletes the
    #   instance only if the etag that you provide matches the instance's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/delete_oda_instance.rb.html) to see an example of how to use delete_oda_instance API.
    def delete_oda_instance(oda_instance_id, opts = {})
      logger.debug 'Calling operation OdaClient#delete_oda_instance.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling delete_oda_instance." if oda_instance_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}'.sub('{odaInstanceId}', oda_instance_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdaClient#delete_oda_instance') do
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


    # Gets the specified Digital Assistant instance.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::OdaInstance OdaInstance}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/get_oda_instance.rb.html) to see an example of how to use get_oda_instance API.
    def get_oda_instance(oda_instance_id, opts = {})
      logger.debug 'Calling operation OdaClient#get_oda_instance.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling get_oda_instance." if oda_instance_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}'.sub('{odaInstanceId}', oda_instance_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdaClient#get_oda_instance') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::OdaInstance'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the work request with the specified ID, including its status.
    #
    # You can use this operation to monitor the status of jobs that you
    # requested to create, delete, and update instances.
    #
    # @param [String] work_request_id The identifier of the asynchronous work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation OdaClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdaClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a page of Digital Assistant instances that belong to the specified
    # compartment.
    #
    # If the `opc-next-page` header appears in the response, then
    # there are more items to retrieve. To get the next page in the subsequent
    # GET request, include the header's value as the `page` query parameter.
    #
    # @param [String] compartment_id List the Digital Assistant instances that belong to this compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name List only the information for the Digital Assistant instance with this user-friendly name. These names don't have to be unique and may change.
    #
    #   Example: `My new resource`
    #
    # @option opts [String] :lifecycle_state List only the Digital Assistant instances that are in this lifecycle state.
    #   Allowed values are: CREATING, UPDATING, ACTIVE, INACTIVE, DELETING, DELETED, FAILED
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 100)
    # @option opts [String] :page The page at which to start retrieving results.
    #
    #   You get this value from the `opc-next-page` header in a previous list request.
    #   To retireve the first page, omit this query parameter.
    #
    #   Example: `MToxMA==`
    #
    # @option opts [String] :sort_order Sort the results in this order, use either `ASC` (ascending) or `DESC` (descending).
    #   Allowed values are: ASC, DESC
    # @option opts [String] :sort_by Sort on this field. You can specify one sort order only. The default sort field is `TIMECREATED`.
    #
    #   The default sort order for `TIMECREATED` is descending, and the default sort order for `DISPLAYNAME` is ascending.
    #    (default to TIMECREATED)
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type Array<{OCI::Oda::Models::OdaInstanceSummary OdaInstanceSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/list_oda_instances.rb.html) to see an example of how to use list_oda_instances API.
    def list_oda_instances(compartment_id, opts = {})
      logger.debug 'Calling operation OdaClient#list_oda_instances.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_oda_instances." if compartment_id.nil?

      if opts[:lifecycle_state] && !%w[CREATING UPDATING ACTIVE INACTIVE DELETING DELETED FAILED].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of CREATING, UPDATING, ACTIVE, INACTIVE, DELETING, DELETED, FAILED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      path = '/odaInstances'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdaClient#list_oda_instances') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Oda::Models::OdaInstanceSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a page of errors for the specified work request.
    #
    # If the `opc-next-page` header appears in the response, then
    # there are more items to retrieve. To get the next page in the subsequent
    # GET request, include the header's value as the `page` query parameter.
    #
    # @param [String] work_request_id The identifier of the asynchronous work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @option opts [String] :page The page at which to start retrieving results.
    #
    #   You get this value from the `opc-next-page` header in a previous list request.
    #   To retireve the first page, omit this query parameter.
    #
    #   Example: `MToxMA==`
    #
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 100)
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order. If no value is specified, then the default is `TIMESTAMP`.
    #
    #   The default sort order for both `TIMESTAMP` and `CODE` is ascending.
    #    (default to TIMESTAMP)
    #   Allowed values are: CODE, TIMESTAMP
    # @option opts [String] :sort_order Sort the results in this order, use either `ASC` (ascending) or `DESC` (descending).
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Oda::Models::WorkRequestError WorkRequestError}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation OdaClient#list_work_request_errors.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_errors." if work_request_id.nil?

      if opts[:sort_by] && !%w[CODE TIMESTAMP].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of CODE, TIMESTAMP.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/errors'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdaClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Oda::Models::WorkRequestError>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a page of of log messages for a given work request.
    #
    # If the `opc-next-page` header appears in the response, then
    # there are more items to retrieve. To get the next page in the subsequent
    # GET request, include the header's value as the `page` query parameter.
    #
    # @param [String] work_request_id The identifier of the asynchronous work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @option opts [String] :page The page at which to start retrieving results.
    #
    #   You get this value from the `opc-next-page` header in a previous list request.
    #   To retireve the first page, omit this query parameter.
    #
    #   Example: `MToxMA==`
    #
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 100)
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order. If no value is specified, then the default is `TIMESTAMP`.
    #
    #   The default sort order for both `TIMESTAMP` and `MESSAGE` is ascending.
    #    (default to TIMESTAMP)
    #   Allowed values are: MESSAGE, TIMESTAMP
    # @option opts [String] :sort_order Sort the results in this order, use either `ASC` (ascending) or `DESC` (descending).
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Oda::Models::WorkRequestLogEntry WorkRequestLogEntry}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation OdaClient#list_work_request_logs.' if logger

      raise "Missing the required parameter 'work_request_id' when calling list_work_request_logs." if work_request_id.nil?

      if opts[:sort_by] && !%w[MESSAGE TIMESTAMP].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of MESSAGE, TIMESTAMP.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/workRequests/{workRequestId}/logs'.sub('{workRequestId}', work_request_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdaClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Oda::Models::WorkRequestLogEntry>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a page of work requests for the specified compartment.
    #
    # If the `opc-next-page` header appears in the response, then
    # there are more items to retrieve. To get the next page in the subsequent
    # GET request, include the header's value as the `page` query parameter.
    #
    # @param [String] compartment_id List the Digital Assistant instances that belong to this compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @option opts [String] :oda_instance_id List only the information for this Digital Assistant instance.
    # @option opts [String] :page The page at which to start retrieving results.
    #
    #   You get this value from the `opc-next-page` header in a previous list request.
    #   To retireve the first page, omit this query parameter.
    #
    #   Example: `MToxMA==`
    #
    # @option opts [Integer] :limit The maximum number of items to return per page. (default to 100)
    # @option opts [String] :sort_by The field to sort by. You can specify only one sort order. If no value is specified, then the default is `TIME_ACCEPTED`.
    #
    #   The default sort order for the time fields is descending. The default order for `DISPLAYNAME` and `STATUS` is ascending.default: TIME_ACCEPTED
    #    (default to TIME_ACCEPTED)
    #   Allowed values are: OPERATION_TYPE, STATUS, TIME_ACCEPTED, TIME_STARTED, TIME_FINISHED
    # @option opts [String] :sort_order Sort the results in this order, use either `ASC` (ascending) or `DESC` (descending).
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Oda::Models::WorkRequestSummary WorkRequestSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(compartment_id, opts = {})
      logger.debug 'Calling operation OdaClient#list_work_requests.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      if opts[:sort_by] && !%w[OPERATION_TYPE STATUS TIME_ACCEPTED TIME_STARTED TIME_FINISHED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of OPERATION_TYPE, STATUS, TIME_ACCEPTED, TIME_STARTED, TIME_FINISHED.'
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
      query_params[:odaInstanceId] = opts[:oda_instance_id] if opts[:oda_instance_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdaClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Oda::Models::WorkRequestSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Starts an inactive Digital Assistant instance. Once active, the instance will be accessible and metering
    # of requests will be started again.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @option opts [String] :if_match For optimistic concurrency control in a PUT or DELETE call for
    #   a Digital Assistant instance, set the `if-match` query parameter
    #   to the value of the `ETAG` header from a previous GET or POST
    #   response for that instance. The service updates or deletes the
    #   instance only if the etag that you provide matches the instance's
    #   current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that you can retry the request if there's
    #   a timeout or server error without the risk of executing that same action again.
    #
    #   Retry tokens expire after 24 hours, but they can become invalid before then if there are
    #   conflicting operations. For example, if an instance was deleted and purged from the system,
    #   then the service might reject a retry of the original creation request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/start_oda_instance.rb.html) to see an example of how to use start_oda_instance API.
    def start_oda_instance(oda_instance_id, opts = {})
      logger.debug 'Calling operation OdaClient#start_oda_instance.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling start_oda_instance." if oda_instance_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/actions/start'.sub('{odaInstanceId}', oda_instance_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdaClient#start_oda_instance') do
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


    # Stops an active Digital Assistant instance. Once inactive, the instance will not be accessible and metering
    # of requests will be stopped until the instance is started again. Data associated with the instance
    # is not affected.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @option opts [String] :if_match For optimistic concurrency control in a PUT or DELETE call for
    #   a Digital Assistant instance, set the `if-match` query parameter
    #   to the value of the `ETAG` header from a previous GET or POST
    #   response for that instance. The service updates or deletes the
    #   instance only if the etag that you provide matches the instance's
    #   current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that you can retry the request if there's
    #   a timeout or server error without the risk of executing that same action again.
    #
    #   Retry tokens expire after 24 hours, but they can become invalid before then if there are
    #   conflicting operations. For example, if an instance was deleted and purged from the system,
    #   then the service might reject a retry of the original creation request.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/stop_oda_instance.rb.html) to see an example of how to use stop_oda_instance API.
    def stop_oda_instance(oda_instance_id, opts = {})
      logger.debug 'Calling operation OdaClient#stop_oda_instance.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling stop_oda_instance." if oda_instance_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/actions/stop'.sub('{odaInstanceId}', oda_instance_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdaClient#stop_oda_instance') do
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


    # Updates the specified Digital Assistant instance with the information in the request body.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::UpdateOdaInstanceDetails] update_oda_instance_details The information to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control in a PUT or DELETE call for
    #   a Digital Assistant instance, set the `if-match` query parameter
    #   to the value of the `ETAG` header from a previous GET or POST
    #   response for that instance. The service updates or deletes the
    #   instance only if the etag that you provide matches the instance's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::OdaInstance OdaInstance}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/update_oda_instance.rb.html) to see an example of how to use update_oda_instance API.
    def update_oda_instance(oda_instance_id, update_oda_instance_details, opts = {})
      logger.debug 'Calling operation OdaClient#update_oda_instance.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling update_oda_instance." if oda_instance_id.nil?
      raise "Missing the required parameter 'update_oda_instance_details' when calling update_oda_instance." if update_oda_instance_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}'.sub('{odaInstanceId}', oda_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_oda_instance_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdaClient#update_oda_instance') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::OdaInstance'
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
