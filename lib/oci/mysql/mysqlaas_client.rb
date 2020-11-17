# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The API for the MySQL Database Service
  class Mysql::MysqlaasClient
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


    # Creates a new MysqlaasClient.
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
        @endpoint = endpoint + '/20190415'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "MysqlaasClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://mysql.{region}.ocp.{secondLevelDomain}') + '/20190415'
      logger.info "MysqlaasClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new Configuration.
    # @param [OCI::Mysql::Models::CreateConfigurationDetails] create_configuration_details Request to create a Configuration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original
    #   creation request may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::Configuration Configuration}
    def create_configuration(create_configuration_details, opts = {})
      logger.debug 'Calling operation MysqlaasClient#create_configuration.' if logger

      raise "Missing the required parameter 'create_configuration_details' when calling create_configuration." if create_configuration_details.nil?

      path = '/configurations'
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

      post_body = @api_client.object_to_http_body(create_configuration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MysqlaasClient#create_configuration') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::Configuration'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes a Configuration.
    # The Configuration must not be in use by any DB Systems.
    #
    # @param [String] configuration_id The OCID of the Configuration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @return [Response] A Response object with data of type nil
    def delete_configuration(configuration_id, opts = {})
      logger.debug 'Calling operation MysqlaasClient#delete_configuration.' if logger

      raise "Missing the required parameter 'configuration_id' when calling delete_configuration." if configuration_id.nil?
      raise "Parameter value for 'configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(configuration_id)

      path = '/configurations/{configurationId}'.sub('{configurationId}', configuration_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MysqlaasClient#delete_configuration') do
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


    # Get the full details of the specified Configuration, including the list of MySQL Variables and their values.
    #
    # @param [String] configuration_id The OCID of the Configuration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :if_none_match For conditional requests. In the GET call for a resource, set the
    #   `If-None-Match` header to the value of the ETag from a previous GET (or
    #   POST or PUT) response for that resource. The server will return with
    #   either a 304 Not Modified response if the resource has not changed, or a
    #   200 OK response with the updated representation.
    #
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::Configuration Configuration}
    def get_configuration(configuration_id, opts = {})
      logger.debug 'Calling operation MysqlaasClient#get_configuration.' if logger

      raise "Missing the required parameter 'configuration_id' when calling get_configuration." if configuration_id.nil?
      raise "Parameter value for 'configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(configuration_id)

      path = '/configurations/{configurationId}'.sub('{configurationId}', configuration_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MysqlaasClient#get_configuration') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::Configuration'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the Configurations available when creating a DB System.
    #
    # This may include DEFAULT configurations per Shape and CUSTOM configurations.
    #
    # The default sort order is a multi-part sort by:
    #   - shapeName, ascending
    #   - DEFAULT-before-CUSTOM
    #   - displayName ascending
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [String] :configuration_id The requested Configuration instance.
    # @option opts [String] :lifecycle_state Configuration Lifecycle State (default to AVAILABLE)
    # @option opts [Array<String>] :type The requested Configuration types. (default to [DEFAULT])
    #   Allowed values are: DEFAULT, CUSTOM
    # @option opts [String] :display_name A filter to return only the resource matching the given display name exactly.
    # @option opts [String] :shape_name The requested Shape name.
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Time fields are default ordered as descending. Display name is default ordered as ascending.
    #    (default to timeCreated)
    #   Allowed values are: displayName, shapeName, timeCreated, timeUpdated
    # @option opts [String] :sort_order The sort order to use (ASC or DESC). (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return in a paginated list call. For information about pagination, see
    #   [List Pagination](https://docs.cloud.oracle.com/#API/Concepts/usingapi.htm#List_Pagination).
    #    (default to 100)
    # @option opts [String] :page The value of the `opc-next-page` or `opc-prev-page` response header from
    #   the previous list call. For information about pagination, see [List
    #   Pagination](https://docs.cloud.oracle.com/#API/Concepts/usingapi.htm#List_Pagination).
    #
    # @return [Response] A Response object with data of type Array<{OCI::Mysql::Models::ConfigurationSummary ConfigurationSummary}>
    def list_configurations(compartment_id, opts = {})
      logger.debug 'Calling operation MysqlaasClient#list_configurations.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_configurations." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Mysql::Models::Configuration::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Mysql::Models::Configuration::LIFECYCLE_STATE_ENUM.'
      end


      type_allowable_values = %w[DEFAULT CUSTOM]
      if opts[:type] && !opts[:type].empty?
        opts[:type].each do |val_to_check|
          unless type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "type", must be one of DEFAULT, CUSTOM.'
          end
        end
      end

      if opts[:sort_by] && !%w[displayName shapeName timeCreated timeUpdated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, shapeName, timeCreated, timeUpdated.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/configurations'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:configurationId] = opts[:configuration_id] if opts[:configuration_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:type] = OCI::ApiClient.build_collection_params(opts[:type], :multi) if opts[:type] && !opts[:type].empty?
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:shapeName] = opts[:shape_name] if opts[:shape_name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MysqlaasClient#list_configurations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Mysql::Models::ConfigurationSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of the shapes you can use to create a new MySQL DB System.
    # The shape determines the resources allocated to the DB System:
    # CPU cores and memory for VM shapes; CPU cores, memory and
    # storage for non-VM (or bare metal) shapes.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @option opts [Array<String>] :is_supported_for Return shapes that are supported by the service feature.
    #    (default to [DBSYSTEM])
    #   Allowed values are: DBSYSTEM, ANALYTICSCLUSTER
    # @option opts [String] :availability_domain The name of the Availability Domain.
    # @option opts [String] :name Name
    # @return [Response] A Response object with data of type Array<{OCI::Mysql::Models::ShapeSummary ShapeSummary}>
    def list_shapes(compartment_id, opts = {})
      logger.debug 'Calling operation MysqlaasClient#list_shapes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_shapes." if compartment_id.nil?


      is_supported_for_allowable_values = %w[DBSYSTEM ANALYTICSCLUSTER]
      if opts[:is_supported_for] && !opts[:is_supported_for].empty?
        opts[:is_supported_for].each do |val_to_check|
          unless is_supported_for_allowable_values.include?(val_to_check)
            raise 'Invalid value for "is_supported_for", must be one of DBSYSTEM, ANALYTICSCLUSTER.'
          end
        end
      end

      path = '/shapes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:isSupportedFor] = OCI::ApiClient.build_collection_params(opts[:is_supported_for], :multi) if opts[:is_supported_for] && !opts[:is_supported_for].empty?
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]
      query_params[:name] = opts[:name] if opts[:name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MysqlaasClient#list_shapes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Mysql::Models::ShapeSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Get a list of supported and available MySQL database major versions.
    #
    # The list is sorted by version family.
    #
    # @param [String] compartment_id The compartment [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Mysql::Models::VersionSummary VersionSummary}>
    def list_versions(compartment_id, opts = {})
      logger.debug 'Calling operation MysqlaasClient#list_versions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_versions." if compartment_id.nil?

      path = '/versions'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MysqlaasClient#list_versions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Mysql::Models::VersionSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the Configuration details.
    # @param [String] configuration_id The OCID of the Configuration.
    # @param [OCI::Mysql::Models::UpdateConfigurationDetails] update_configuration_details Request to update a Configuration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a
    #   resource, set the `If-Match` header to the value of the etag from a
    #   previous GET or POST response for that resource. The resource will be
    #   updated or deleted only if the etag you provide matches the resource's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id Customer-defined unique identifier for the request. If you need to
    #   contact Oracle about a specific request, please provide the request
    #   ID that you supplied in this header with the request.
    #
    # @return [Response] A Response object with data of type {OCI::Mysql::Models::Configuration Configuration}
    def update_configuration(configuration_id, update_configuration_details, opts = {})
      logger.debug 'Calling operation MysqlaasClient#update_configuration.' if logger

      raise "Missing the required parameter 'configuration_id' when calling update_configuration." if configuration_id.nil?
      raise "Missing the required parameter 'update_configuration_details' when calling update_configuration." if update_configuration_details.nil?
      raise "Parameter value for 'configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(configuration_id)

      path = '/configurations/{configurationId}'.sub('{configurationId}', configuration_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_configuration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'MysqlaasClient#update_configuration') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Mysql::Models::Configuration'
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
