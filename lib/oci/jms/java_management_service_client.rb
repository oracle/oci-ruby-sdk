# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API for the Java Management Service. Use this API to view and manage Fleets.
  class Jms::JavaManagementServiceClient
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


    # Creates a new JavaManagementServiceClient.
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
        @endpoint = endpoint + '/20210610'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "JavaManagementServiceClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://javamanagement.{region}.oci.{secondLevelDomain}') + '/20210610'
      logger.info "JavaManagementServiceClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Move a specified Fleet into the compartment identified in the POST form. When provided, If-Match is checked against ETag values of the resource.
    #
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [OCI::Jms::Models::ChangeFleetCompartmentDetails] change_fleet_compartment_details Compartment identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   ETag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the ETag you
    #   provide matches the resource's current ETag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/change_fleet_compartment.rb.html) to see an example of how to use change_fleet_compartment API.
    def change_fleet_compartment(fleet_id, change_fleet_compartment_details, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#change_fleet_compartment.' if logger

      raise "Missing the required parameter 'fleet_id' when calling change_fleet_compartment." if fleet_id.nil?
      raise "Missing the required parameter 'change_fleet_compartment_details' when calling change_fleet_compartment." if change_fleet_compartment_details.nil?
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}/actions/changeCompartment'.sub('{fleetId}', fleet_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_fleet_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#change_fleet_compartment') do
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


    # Create a new Fleet using the information provided.
    #
    # @param [OCI::Jms::Models::CreateFleetDetails] create_fleet_details Details for the new Fleet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/create_fleet.rb.html) to see an example of how to use create_fleet API.
    def create_fleet(create_fleet_details, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#create_fleet.' if logger

      raise "Missing the required parameter 'create_fleet_details' when calling create_fleet." if create_fleet_details.nil?

      path = '/fleets'
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

      post_body = @api_client.object_to_http_body(create_fleet_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#create_fleet') do
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


    # Deletes the Fleet specified by an identifier.
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   ETag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the ETag you
    #   provide matches the resource's current ETag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/delete_fleet.rb.html) to see an example of how to use delete_fleet API.
    def delete_fleet(fleet_id, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#delete_fleet.' if logger

      raise "Missing the required parameter 'fleet_id' when calling delete_fleet." if fleet_id.nil?
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}'.sub('{fleetId}', fleet_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#delete_fleet') do
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


    # Retrieve a Fleet with the specified identifier.
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Jms::Models::Fleet Fleet}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/get_fleet.rb.html) to see an example of how to use get_fleet API.
    def get_fleet(fleet_id, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#get_fleet.' if logger

      raise "Missing the required parameter 'fleet_id' when calling get_fleet." if fleet_id.nil?
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}'.sub('{fleetId}', fleet_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#get_fleet') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::Fleet'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve a Fleet Agent Configuration for the specified Fleet.
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Jms::Models::FleetAgentConfiguration FleetAgentConfiguration}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/get_fleet_agent_configuration.rb.html) to see an example of how to use get_fleet_agent_configuration API.
    def get_fleet_agent_configuration(fleet_id, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#get_fleet_agent_configuration.' if logger

      raise "Missing the required parameter 'fleet_id' when calling get_fleet_agent_configuration." if fleet_id.nil?
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}/agentConfiguration'.sub('{fleetId}', fleet_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#get_fleet_agent_configuration') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::FleetAgentConfiguration'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve the details of a work request with the specified ID.
    # @param [String] work_request_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the asynchronous work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Jms::Models::WorkRequest WorkRequest}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/get_work_request.rb.html) to see an example of how to use get_work_request API.
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns a list of all the Fleets contained by a compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment in which to list resources.
    # @option opts [String] :id The ID of the Fleet.
    # @option opts [String] :lifecycle_state The state of the lifecycle.
    # @option opts [String] :display_name The display name.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. The token is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort Fleets. Only one sort order may be provided.
    #   Default order for _timeCreated_, _approximateJreCount_, _approximateInstallationCount_,
    #   _approximateApplicationCount_ and _approximateManagedInstanceCount_  is **descending**.
    #   Default order for _displayName_ is **ascending**.
    #   If no value is specified _timeCreated_ is default.
    #    (default to timeCreated)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Jms::Models::FleetCollection FleetCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/list_fleets.rb.html) to see an example of how to use list_fleets API.
    def list_fleets(opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#list_fleets.' if logger


      if opts[:lifecycle_state] && !OCI::Jms::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Jms::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::Jms::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Jms::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !OCI::Jms::Models::SORT_BY_ENUM.include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of the values in OCI::Jms::Models::SORT_BY_ENUM.'
      end

      path = '/fleets'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:id] = opts[:id] if opts[:id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#list_fleets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::FleetCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve a (paginated) list of errors for a specified work request.
    #
    # @param [String] work_request_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the asynchronous work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. The token is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @return [Response] A Response object with data of type {OCI::Jms::Models::WorkRequestErrorCollection WorkRequestErrorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/list_work_request_errors.rb.html) to see an example of how to use list_work_request_errors API.
    def list_work_request_errors(work_request_id, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#list_work_request_errors.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#list_work_request_errors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::WorkRequestErrorCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Retrieve a (paginated) list of logs for a specified work request.
    #
    # @param [String] work_request_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the asynchronous work request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. The token is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @return [Response] A Response object with data of type {OCI::Jms::Models::WorkRequestLogEntryCollection WorkRequestLogEntryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/list_work_request_logs.rb.html) to see an example of how to use list_work_request_logs API.
    def list_work_request_logs(work_request_id, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#list_work_request_logs.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#list_work_request_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::WorkRequestLogEntryCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List the work requests in a compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment in which to list resources.
    # @option opts [String] :id The ID of an asynchronous work request.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :page The page token representing the page at which to start retrieving results. The token is usually retrieved from a previous list call.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @return [Response] A Response object with data of type {OCI::Jms::Models::WorkRequestCollection WorkRequestCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/list_work_requests.rb.html) to see an example of how to use list_work_requests API.
    def list_work_requests(opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#list_work_requests.' if logger


      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:id] = opts[:id] if opts[:id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::WorkRequestCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List application usage in a specified Fleet filtered by form parameters.
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [OCI::Jms::Models::RequestSummarizedApplicationUsageDetails] request_summarized_application_usage_details Parameters for filtering application usage.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. The token is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Jms::Models::ApplicationUsageCollection ApplicationUsageCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/request_summarized_application_usage.rb.html) to see an example of how to use request_summarized_application_usage API.
    def request_summarized_application_usage(fleet_id, request_summarized_application_usage_details, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#request_summarized_application_usage.' if logger

      raise "Missing the required parameter 'fleet_id' when calling request_summarized_application_usage." if fleet_id.nil?
      raise "Missing the required parameter 'request_summarized_application_usage_details' when calling request_summarized_application_usage." if request_summarized_application_usage_details.nil?
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}/actions/summarizeApplicationUsage'.sub('{fleetId}', fleet_id.to_s)
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

      post_body = @api_client.object_to_http_body(request_summarized_application_usage_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#request_summarized_application_usage') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::ApplicationUsageCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List Java installation usage in a specified Fleet filtered by form parameters.
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [OCI::Jms::Models::RequestSummarizedInstallationUsageDetails] request_summarized_installation_usage_details Parameters for filtering Java installation usage.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. The token is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Jms::Models::InstallationUsageCollection InstallationUsageCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/request_summarized_installation_usage.rb.html) to see an example of how to use request_summarized_installation_usage API.
    def request_summarized_installation_usage(fleet_id, request_summarized_installation_usage_details, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#request_summarized_installation_usage.' if logger

      raise "Missing the required parameter 'fleet_id' when calling request_summarized_installation_usage." if fleet_id.nil?
      raise "Missing the required parameter 'request_summarized_installation_usage_details' when calling request_summarized_installation_usage." if request_summarized_installation_usage_details.nil?
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}/actions/summarizeInstallationUsage'.sub('{fleetId}', fleet_id.to_s)
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

      post_body = @api_client.object_to_http_body(request_summarized_installation_usage_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#request_summarized_installation_usage') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::InstallationUsageCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List Java Runtime usage in a specified Fleet filtered by form parameters.
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [OCI::Jms::Models::RequestSummarizedJreUsageDetails] request_summarized_jre_usage_details Parameters for filtering Java Runtime usage.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. The token is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Jms::Models::JreUsageCollection JreUsageCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/request_summarized_jre_usage.rb.html) to see an example of how to use request_summarized_jre_usage API.
    def request_summarized_jre_usage(fleet_id, request_summarized_jre_usage_details, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#request_summarized_jre_usage.' if logger

      raise "Missing the required parameter 'fleet_id' when calling request_summarized_jre_usage." if fleet_id.nil?
      raise "Missing the required parameter 'request_summarized_jre_usage_details' when calling request_summarized_jre_usage." if request_summarized_jre_usage_details.nil?
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}/actions/summarizeJreUsage'.sub('{fleetId}', fleet_id.to_s)
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

      post_body = @api_client.object_to_http_body(request_summarized_jre_usage_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#request_summarized_jre_usage') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::JreUsageCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List managed instance usage in a specified Fleet filtered by form parameters.
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [OCI::Jms::Models::RequestSummarizedManagedInstanceUsageDetails] request_summarized_managed_instance_usage_details Parameters for filtering managed instance usage.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. The token is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Jms::Models::ManagedInstanceUsageCollection ManagedInstanceUsageCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/request_summarized_managed_instance_usage.rb.html) to see an example of how to use request_summarized_managed_instance_usage API.
    def request_summarized_managed_instance_usage(fleet_id, request_summarized_managed_instance_usage_details, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#request_summarized_managed_instance_usage.' if logger

      raise "Missing the required parameter 'fleet_id' when calling request_summarized_managed_instance_usage." if fleet_id.nil?
      raise "Missing the required parameter 'request_summarized_managed_instance_usage_details' when calling request_summarized_managed_instance_usage." if request_summarized_managed_instance_usage_details.nil?
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}/actions/summarizeManagedInstanceUsage'.sub('{fleetId}', fleet_id.to_s)
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

      post_body = @api_client.object_to_http_body(request_summarized_managed_instance_usage_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#request_summarized_managed_instance_usage') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::ManagedInstanceUsageCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List application usage in a Fleet filtered by query parameters.
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :application_id The Fleet-unique identifier of the application.
    # @option opts [String] :display_name The display name.
    # @option opts [String] :application_type The type of the application.
    # @option opts [String] :jre_vendor The vendor of the related Java Runtime.
    # @option opts [String] :jre_distribution The distribution of the related Java Runtime.
    # @option opts [String] :jre_version The version of the related Java Runtime.
    # @option opts [String] :installation_path The file system path of the installation.
    # @option opts [String] :managed_instance_id The Fleet-unique identifier of the related managed instance.
    # @option opts [Array<String>] :fields Additional fields to include into the returned model on top of the required ones.
    #   This parameter can also include 'approximateJreCount', 'approximateInstallationCount' and 'approximateManagedInstanceCount'.
    #   For example 'approximateJreCount,approximateInstallationCount'.
    #    (default to [])
    #   Allowed values are: approximateJreCount, approximateInstallationCount, approximateManagedInstanceCount
    # @option opts [DateTime] :time_start The start of the time period during which resources are searched (formatted according to RFC3339).
    # @option opts [DateTime] :time_end The end of the time period during which resources are searched (formatted according to RFC3339).
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. The token is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort application views. Only one sort order may be provided.
    #   Default order for _timeFirstSeen_, _timeLastSeen_, _approximateJreCount_, _approximateInstallationCount_
    #   and _approximateManagedInstanceCount_  is **descending**.
    #   Default order for _displayName_ is **ascending**.
    #   If no value is specified _timeLastSeen_ is default.
    #    (default to timeLastSeen)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Jms::Models::ApplicationUsageCollection ApplicationUsageCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/summarize_application_usage.rb.html) to see an example of how to use summarize_application_usage API.
    def summarize_application_usage(fleet_id, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#summarize_application_usage.' if logger

      raise "Missing the required parameter 'fleet_id' when calling summarize_application_usage." if fleet_id.nil?


      fields_allowable_values = %w[approximateJreCount approximateInstallationCount approximateManagedInstanceCount]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of approximateJreCount, approximateInstallationCount, approximateManagedInstanceCount.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Jms::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Jms::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !OCI::Jms::Models::APPLICATION_SORT_BY_ENUM.include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of the values in OCI::Jms::Models::APPLICATION_SORT_BY_ENUM.'
      end
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}/actions/summarizeApplicationUsage'.sub('{fleetId}', fleet_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:applicationId] = opts[:application_id] if opts[:application_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:applicationType] = opts[:application_type] if opts[:application_type]
      query_params[:jreVendor] = opts[:jre_vendor] if opts[:jre_vendor]
      query_params[:jreDistribution] = opts[:jre_distribution] if opts[:jre_distribution]
      query_params[:jreVersion] = opts[:jre_version] if opts[:jre_version]
      query_params[:installationPath] = opts[:installation_path] if opts[:installation_path]
      query_params[:managedInstanceId] = opts[:managed_instance_id] if opts[:managed_instance_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :csv) if opts[:fields] && !opts[:fields].empty?
      query_params[:timeStart] = opts[:time_start] if opts[:time_start]
      query_params[:timeEnd] = opts[:time_end] if opts[:time_end]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#summarize_application_usage') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::ApplicationUsageCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List Java installation usage in a Fleet filtered by query parameters.
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :jre_vendor The vendor of the related Java Runtime.
    # @option opts [String] :jre_distribution The distribution of the related Java Runtime.
    # @option opts [String] :jre_version The version of the related Java Runtime.
    # @option opts [String] :installation_path The file system path of the installation.
    # @option opts [String] :application_id The Fleet-unique identifier of the related application.
    # @option opts [String] :managed_instance_id The Fleet-unique identifier of the related managed instance.
    # @option opts [Array<String>] :fields Additional fields to include into the returned model on top of the required ones.
    #   This parameter can also include 'approximateApplicationCount' and 'approximateManagedInstanceCount'.
    #   For example 'approximateApplicationCount,approximateManagedInstanceCount'.
    #    (default to [])
    #   Allowed values are: approximateApplicationCount, approximateManagedInstanceCount
    # @option opts [DateTime] :time_start The start of the time period during which resources are searched (formatted according to RFC3339).
    # @option opts [DateTime] :time_end The end of the time period during which resources are searched (formatted according to RFC3339).
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. The token is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort installation views. Only one sort order may be provided.
    #   Default order for _timeFirstSeen_, _timeLastSeen_, and _jreVersion_, _approximateApplicationCount_
    #   and _approximateManagedInstanceCount_  is **descending**.
    #   Default order for _jreDistribution_ and _jreVendor_ is **ascending**. If no value is specified _timeLastSeen_ is default.
    #    (default to timeLastSeen)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Jms::Models::InstallationUsageCollection InstallationUsageCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/summarize_installation_usage.rb.html) to see an example of how to use summarize_installation_usage API.
    def summarize_installation_usage(fleet_id, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#summarize_installation_usage.' if logger

      raise "Missing the required parameter 'fleet_id' when calling summarize_installation_usage." if fleet_id.nil?


      fields_allowable_values = %w[approximateApplicationCount approximateManagedInstanceCount]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of approximateApplicationCount, approximateManagedInstanceCount.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Jms::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Jms::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !OCI::Jms::Models::INSTALLATION_SORT_BY_ENUM.include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of the values in OCI::Jms::Models::INSTALLATION_SORT_BY_ENUM.'
      end
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}/actions/summarizeInstallationUsage'.sub('{fleetId}', fleet_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:jreVendor] = opts[:jre_vendor] if opts[:jre_vendor]
      query_params[:jreDistribution] = opts[:jre_distribution] if opts[:jre_distribution]
      query_params[:jreVersion] = opts[:jre_version] if opts[:jre_version]
      query_params[:installationPath] = opts[:installation_path] if opts[:installation_path]
      query_params[:applicationId] = opts[:application_id] if opts[:application_id]
      query_params[:managedInstanceId] = opts[:managed_instance_id] if opts[:managed_instance_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :csv) if opts[:fields] && !opts[:fields].empty?
      query_params[:timeStart] = opts[:time_start] if opts[:time_start]
      query_params[:timeEnd] = opts[:time_end] if opts[:time_end]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#summarize_installation_usage') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::InstallationUsageCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List Java Runtime usage in a specified Fleet filtered by query parameters.
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :jre_vendor The vendor of the Java Runtime.
    # @option opts [String] :jre_distribution The distribution of the Java Runtime.
    # @option opts [String] :jre_version The version of the Java Runtime.
    # @option opts [String] :application_id The Fleet-unique identifier of the related application.
    # @option opts [String] :managed_instance_id The Fleet-unique identifier of the related managed instance.
    # @option opts [Array<String>] :fields Additional fields to include into the returned model on top of the required ones.
    #   This parameter can also include 'approximateApplicationCount', 'approximateInstallationCount' and 'approximateManagedInstanceCount'.
    #   For example 'approximateApplicationCount,approximateManagedInstanceCount'.
    #    (default to [])
    #   Allowed values are: approximateInstallationCount, approximateApplicationCount, approximateManagedInstanceCount
    # @option opts [DateTime] :time_start The start of the time period during which resources are searched (formatted according to RFC3339).
    # @option opts [DateTime] :time_end The end of the time period during which resources are searched (formatted according to RFC3339).
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. The token is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort JRE usages. Only one sort order may be provided.
    #   Default order for _timeFirstSeen_, _timeLastSeen_, and _version_ is **descending**.
    #   Default order for _timeFirstSeen_, _timeLastSeen_, _version_, _approximateInstallationCount_,
    #   _approximateApplicationCount_ and _approximateManagedInstanceCount_  is **descending**.
    #   Default order for _distribution_ and _vendor_ is **ascending**. If no value is specified _timeLastSeen_ is default.
    #    (default to timeLastSeen)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Jms::Models::JreUsageCollection JreUsageCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/summarize_jre_usage.rb.html) to see an example of how to use summarize_jre_usage API.
    def summarize_jre_usage(fleet_id, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#summarize_jre_usage.' if logger

      raise "Missing the required parameter 'fleet_id' when calling summarize_jre_usage." if fleet_id.nil?


      fields_allowable_values = %w[approximateInstallationCount approximateApplicationCount approximateManagedInstanceCount]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of approximateInstallationCount, approximateApplicationCount, approximateManagedInstanceCount.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Jms::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Jms::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !OCI::Jms::Models::JRE_SORT_BY_ENUM.include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of the values in OCI::Jms::Models::JRE_SORT_BY_ENUM.'
      end
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}/actions/summarizeJreUsage'.sub('{fleetId}', fleet_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:jreVendor] = opts[:jre_vendor] if opts[:jre_vendor]
      query_params[:jreDistribution] = opts[:jre_distribution] if opts[:jre_distribution]
      query_params[:jreVersion] = opts[:jre_version] if opts[:jre_version]
      query_params[:applicationId] = opts[:application_id] if opts[:application_id]
      query_params[:managedInstanceId] = opts[:managed_instance_id] if opts[:managed_instance_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :csv) if opts[:fields] && !opts[:fields].empty?
      query_params[:timeStart] = opts[:time_start] if opts[:time_start]
      query_params[:timeEnd] = opts[:time_end] if opts[:time_end]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#summarize_jre_usage') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::JreUsageCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # List managed instance usage in a Fleet filtered by query parameters.
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :managed_instance_id The Fleet-unique identifier of the managed instance.
    # @option opts [String] :managed_instance_type The type of the managed instance.
    # @option opts [String] :jre_vendor The vendor of the related Java Runtime.
    # @option opts [String] :jre_distribution The distribution of the related Java Runtime.
    # @option opts [String] :jre_version The version of the related Java Runtime.
    # @option opts [String] :installation_path The file system path of the installation.
    # @option opts [String] :application_id The Fleet-unique identifier of the related application.
    # @option opts [Array<String>] :fields Additional fields to include into the returned model on top of the required ones.
    #   This parameter can also include 'approximateJreCount', 'approximateInstallationCount' and 'approximateApplicationCount'.
    #   For example 'approximateJreCount,approximateInstallationCount'.
    #    (default to [])
    #   Allowed values are: approximateJreCount, approximateInstallationCount, approximateApplicationCount
    # @option opts [DateTime] :time_start The start of the time period during which resources are searched (formatted according to RFC3339).
    # @option opts [DateTime] :time_end The end of the time period during which resources are searched (formatted according to RFC3339).
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. The token is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort managed instance views. Only one sort order may be provided.
    #   Default order for _timeFirstSeen_, _timeLastSeen_, approximateJreCount_, _approximateInstallationCount_
    #   and _approximateApplicationCount_  is **descending**.
    #   If no value is specified _timeLastSeen_ is default.
    #    (default to timeLastSeen)
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::Jms::Models::ManagedInstanceUsageCollection ManagedInstanceUsageCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/summarize_managed_instance_usage.rb.html) to see an example of how to use summarize_managed_instance_usage API.
    def summarize_managed_instance_usage(fleet_id, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#summarize_managed_instance_usage.' if logger

      raise "Missing the required parameter 'fleet_id' when calling summarize_managed_instance_usage." if fleet_id.nil?

      if opts[:managed_instance_type] && !OCI::Jms::Models::MANAGED_INSTANCE_TYPE_ENUM.include?(opts[:managed_instance_type])
        raise 'Invalid value for "managed_instance_type", must be one of the values in OCI::Jms::Models::MANAGED_INSTANCE_TYPE_ENUM.'
      end


      fields_allowable_values = %w[approximateJreCount approximateInstallationCount approximateApplicationCount]
      if opts[:fields] && !opts[:fields].empty?
        opts[:fields].each do |val_to_check|
          unless fields_allowable_values.include?(val_to_check)
            raise 'Invalid value for "fields", must be one of approximateJreCount, approximateInstallationCount, approximateApplicationCount.'
          end
        end
      end

      if opts[:sort_order] && !OCI::Jms::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Jms::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !OCI::Jms::Models::MANAGED_INSTANCE_SORT_BY_ENUM.include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of the values in OCI::Jms::Models::MANAGED_INSTANCE_SORT_BY_ENUM.'
      end
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}/actions/summarizeManagedInstanceUsage'.sub('{fleetId}', fleet_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:managedInstanceId] = opts[:managed_instance_id] if opts[:managed_instance_id]
      query_params[:managedInstanceType] = opts[:managed_instance_type] if opts[:managed_instance_type]
      query_params[:jreVendor] = opts[:jre_vendor] if opts[:jre_vendor]
      query_params[:jreDistribution] = opts[:jre_distribution] if opts[:jre_distribution]
      query_params[:jreVersion] = opts[:jre_version] if opts[:jre_version]
      query_params[:installationPath] = opts[:installation_path] if opts[:installation_path]
      query_params[:applicationId] = opts[:application_id] if opts[:application_id]
      query_params[:fields] = OCI::ApiClient.build_collection_params(opts[:fields], :csv) if opts[:fields] && !opts[:fields].empty?
      query_params[:timeStart] = opts[:time_start] if opts[:time_start]
      query_params[:timeEnd] = opts[:time_end] if opts[:time_end]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#summarize_managed_instance_usage') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Jms::Models::ManagedInstanceUsageCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Update the Fleet specified by an identifier.
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [OCI::Jms::Models::UpdateFleetDetails] update_fleet_details The new details for the Fleet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   ETag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the ETag you
    #   provide matches the resource's current ETag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/update_fleet.rb.html) to see an example of how to use update_fleet API.
    def update_fleet(fleet_id, update_fleet_details, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#update_fleet.' if logger

      raise "Missing the required parameter 'fleet_id' when calling update_fleet." if fleet_id.nil?
      raise "Missing the required parameter 'update_fleet_details' when calling update_fleet." if update_fleet_details.nil?
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}'.sub('{fleetId}', fleet_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_fleet_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#update_fleet') do
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


    # Update the Fleet Agent Configuration for the specified Fleet.
    # @param [String] fleet_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @param [OCI::Jms::Models::UpdateFleetAgentConfigurationDetails] update_fleet_agent_configuration_details The new details for the Fleet Agent Configuration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   ETag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the ETag you
    #   provide matches the resource's current ETag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/jms/update_fleet_agent_configuration.rb.html) to see an example of how to use update_fleet_agent_configuration API.
    def update_fleet_agent_configuration(fleet_id, update_fleet_agent_configuration_details, opts = {})
      logger.debug 'Calling operation JavaManagementServiceClient#update_fleet_agent_configuration.' if logger

      raise "Missing the required parameter 'fleet_id' when calling update_fleet_agent_configuration." if fleet_id.nil?
      raise "Missing the required parameter 'update_fleet_agent_configuration_details' when calling update_fleet_agent_configuration." if update_fleet_agent_configuration_details.nil?
      raise "Parameter value for 'fleet_id' must not be blank" if OCI::Internal::Util.blank_string?(fleet_id)

      path = '/fleets/{fleetId}/agentConfiguration'.sub('{fleetId}', fleet_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_fleet_agent_configuration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'JavaManagementServiceClient#update_fleet_agent_configuration') do
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
