# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # APIs that interact with the resource limits of a specific resource type
  class Limits::LimitsClient
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


    # Creates a new LimitsClient.
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
        @endpoint = endpoint + '/'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "LimitsClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://limits.{region}.oci.{secondLevelDomain}') + '/'
      logger.info "LimitsClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # For a given compartmentId, resource limit name, and scope, returns the following:
    #   - the number of available resources associated with the given limit
    #   - the usage in the selected compartment for the given limit
    #   Note: not all resource limits support this API. If the value is not available, the API will return 404.
    #
    # @param [String] service_name The service name of the target quota.
    # @param [String] limit_name The limit name for which to fetch the data.
    # @param [String] compartment_id The OCID of the compartment for which data is being fetched.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :availability_domain This field is mandatory if the scopeType of the target resource limit is AD.
    #   Otherwise, this field should be omitted.
    #   If the above requirements are not met, the API will return a 400 - InvalidParameter response.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Limits::Models::ResourceAvailability ResourceAvailability}
    def get_resource_availability(service_name, limit_name, compartment_id, opts = {})
      logger.debug 'Calling operation LimitsClient#get_resource_availability.' if logger

      raise "Missing the required parameter 'service_name' when calling get_resource_availability." if service_name.nil?
      raise "Missing the required parameter 'limit_name' when calling get_resource_availability." if limit_name.nil?
      raise "Missing the required parameter 'compartment_id' when calling get_resource_availability." if compartment_id.nil?
      raise "Parameter value for 'service_name' must not be blank" if OCI::Internal::Util.blank_string?(service_name)
      raise "Parameter value for 'limit_name' must not be blank" if OCI::Internal::Util.blank_string?(limit_name)

      path = '/20190729/services/{serviceName}/limits/{limitName}/resourceAvailability'.sub('{serviceName}', service_name.to_s).sub('{limitName}', limit_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LimitsClient#get_resource_availability') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Limits::Models::ResourceAvailability'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Includes a list of resource limits that are currently supported.
    # If the 'areQuotasSupported' property is true, you can create quota policies on top of this limit at the
    # compartment level.
    #
    # @param [String] compartment_id The OCID of the parent compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :service_name The target service name.
    # @option opts [String] :name Optional field, filter for a specific resource limit.
    # @option opts [String] :sort_by The field to sort by.
    #    (default to name)
    #   Allowed values are: name, description
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. By default it will be ascending.
    #    (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #    (default to 100)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Limits::Models::LimitDefinitionSummary LimitDefinitionSummary}>
    def list_limit_definitions(compartment_id, opts = {})
      logger.debug 'Calling operation LimitsClient#list_limit_definitions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_limit_definitions." if compartment_id.nil?

      if opts[:sort_by] && !%w[name description].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, description.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/20190729/limitDefinitions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:serviceName] = opts[:service_name] if opts[:service_name]
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LimitsClient#list_limit_definitions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Limits::Models::LimitDefinitionSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Includes a full list of resource limits belonging to a given service.
    #
    # @param [String] compartment_id The OCID of the parent compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [String] service_name The target service name
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :scope_type Filter entries by scope type.
    #   Allowed values are: GLOBAL, REGION, AD
    # @option opts [String] :availability_domain Filter entries by availability domain. This implies that only AD-specific values will be returned.
    #
    # @option opts [String] :name Optional field, can be used to see a specific resource limit value.
    # @option opts [String] :sort_by The field to sort by. We will be implicitly sorting by availabilityDomain, as a second level field, if available.
    #    (default to name)
    #   Allowed values are: name
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. By default it will be ascending.
    #    (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #    (default to 100)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Limits::Models::LimitValueSummary LimitValueSummary}>
    def list_limit_values(compartment_id, service_name, opts = {})
      logger.debug 'Calling operation LimitsClient#list_limit_values.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_limit_values." if compartment_id.nil?
      raise "Missing the required parameter 'service_name' when calling list_limit_values." if service_name.nil?

      if opts[:scope_type] && !%w[GLOBAL REGION AD].include?(opts[:scope_type])
        raise 'Invalid value for "scope_type", must be one of GLOBAL, REGION, AD.'
      end

      if opts[:sort_by] && !%w[name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/20190729/limitValues'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:serviceName] = service_name
      query_params[:scopeType] = opts[:scope_type] if opts[:scope_type]
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LimitsClient#list_limit_values') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Limits::Models::LimitValueSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns the list of supported services.
    # This will include the programmatic service name, along with the friendly service name.
    #
    # @param [String] compartment_id The OCID of the parent compartment (remember that the tenancy is simply the root compartment).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :sort_by The field to sort by.
    #    (default to name)
    #   Allowed values are: name, description
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. By default it will be ascending.
    #    (default to ASC)
    #   Allowed values are: ASC, DESC
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #    (default to 100)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :opc_request_id Unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Limits::Models::ServiceSummary ServiceSummary}>
    def list_services(compartment_id, opts = {})
      logger.debug 'Calling operation LimitsClient#list_services.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_services." if compartment_id.nil?

      if opts[:sort_by] && !%w[name description].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, description.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/20190729/services'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LimitsClient#list_services') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Limits::Models::ServiceSummary>'
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
