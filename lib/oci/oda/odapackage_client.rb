# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API to create and maintain Oracle Digital Assistant service instances.
  class Oda::OdapackageClient
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


    # Creates a new OdapackageClient.
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
      logger.info "OdapackageClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://digitalassistant-api.{region}.oci.{secondLevelDomain}') + '/20190506'
      logger.info "OdapackageClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Starts an asynchronous job to import a package into a Digital Assistant instance.
    #
    # To monitor the status of the job, take the `opc-work-request-id` response
    # header value and use it to call `GET /workRequests/{workRequestId}`.
    #
    # @param [OCI::Oda::Models::CreateImportedPackageDetails] create_imported_package_details Parameter values required to import the package.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that you can retry the request if there's
    #   a timeout or server error without the risk of executing that same action again.
    #
    #   Retry tokens expire after 24 hours, but they can become invalid before then if there are
    #   conflicting operations. For example, if an instance was deleted and purged from the system,
    #   then the service might reject a retry of the original creation request.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::ImportedPackage ImportedPackage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/create_imported_package.rb.html) to see an example of how to use create_imported_package API.
    def create_imported_package(create_imported_package_details, oda_instance_id, opts = {})
      logger.debug 'Calling operation OdapackageClient#create_imported_package.' if logger

      raise "Missing the required parameter 'create_imported_package_details' when calling create_imported_package." if create_imported_package_details.nil?
      raise "Missing the required parameter 'oda_instance_id' when calling create_imported_package." if oda_instance_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/importedPackages'.sub('{odaInstanceId}', oda_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_imported_package_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdapackageClient#create_imported_package') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::ImportedPackage'
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


    # Starts an asynchronous job to delete a package from a Digital Assistant instance.
    #
    # To monitor the status of the job, take the `opc-work-request-id` response
    # header value and use it to call `GET /workRequests/{workRequestId}`.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] package_id Unique Digital Assistant package identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that you can retry the request if there's
    #   a timeout or server error without the risk of executing that same action again.
    #
    #   Retry tokens expire after 24 hours, but they can become invalid before then if there are
    #   conflicting operations. For example, if an instance was deleted and purged from the system,
    #   then the service might reject a retry of the original creation request.
    #
    # @option opts [String] :if_match For optimistic concurrency control in a PUT or DELETE call for
    #   a Digital Assistant instance, set the `if-match` query parameter
    #   to the value of the `ETAG` header from a previous GET or POST
    #   response for that instance. The service updates or deletes the
    #   instance only if the etag that you provide matches the instance's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/delete_imported_package.rb.html) to see an example of how to use delete_imported_package API.
    def delete_imported_package(oda_instance_id, package_id, opts = {})
      logger.debug 'Calling operation OdapackageClient#delete_imported_package.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling delete_imported_package." if oda_instance_id.nil?
      raise "Missing the required parameter 'package_id' when calling delete_imported_package." if package_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'package_id' must not be blank" if OCI::Internal::Util.blank_string?(package_id)

      path = '/odaInstances/{odaInstanceId}/importedPackages/{packageId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{packageId}', package_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdapackageClient#delete_imported_package') do
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


    # Returns a list of summaries for imported packages in the instance.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] package_id Unique Digital Assistant package identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::ImportedPackage ImportedPackage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/get_imported_package.rb.html) to see an example of how to use get_imported_package API.
    def get_imported_package(oda_instance_id, package_id, opts = {})
      logger.debug 'Calling operation OdapackageClient#get_imported_package.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling get_imported_package." if oda_instance_id.nil?
      raise "Missing the required parameter 'package_id' when calling get_imported_package." if package_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'package_id' must not be blank" if OCI::Internal::Util.blank_string?(package_id)

      path = '/odaInstances/{odaInstanceId}/importedPackages/{packageId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{packageId}', package_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdapackageClient#get_imported_package') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::ImportedPackage'
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


    # Returns details about a package, and how to import it.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] package_id Unique Digital Assistant package identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::Package Package}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/get_package.rb.html) to see an example of how to use get_package API.
    def get_package(oda_instance_id, package_id, opts = {})
      logger.debug 'Calling operation OdapackageClient#get_package.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling get_package." if oda_instance_id.nil?
      raise "Missing the required parameter 'package_id' when calling get_package." if package_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'package_id' must not be blank" if OCI::Internal::Util.blank_string?(package_id)

      path = '/odaInstances/{odaInstanceId}/packages/{packageId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{packageId}', package_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdapackageClient#get_package') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::Package'
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


    # Returns a list of summaries for imported packages in the instance.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name List only the information for the package with this name. Package names are unique to a publisher and may not change.
    #
    #   Example: `My Package`
    #
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
    # @return [Response] A Response object with data of type Array<{OCI::Oda::Models::ImportedPackageSummary ImportedPackageSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/list_imported_packages.rb.html) to see an example of how to use list_imported_packages API.
    def list_imported_packages(oda_instance_id, opts = {})
      logger.debug 'Calling operation OdapackageClient#list_imported_packages.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling list_imported_packages." if oda_instance_id.nil?

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/importedPackages'.sub('{odaInstanceId}', oda_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdapackageClient#list_imported_packages') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Oda::Models::ImportedPackageSummary>'
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


    # Returns a page of summaries for packages that are available for import. The optional odaInstanceId query
    # parameter can be used to filter packages that are available for import by a specific instance. If odaInstanceId
    # query parameter is not provided, the returned list will
    # include packages available within the region indicated by the request URL. The optional resourceType query
    # param may be specified to filter packages that contain the indicated resource type. If no resourceType query
    # param is given, packages containing all resource types will be returned. The optional name query parameter can
    # be used to limit the list to packages whose name matches the given name. The optional displayName query
    # parameter can be used to limit the list to packages whose displayName matches the given name. The optional
    # isLatestVersionOnly query parameter can be used to limit the returned list to include only the latest version
    # of any given package. If not specified, all versions of any otherwise matching package will be returned.
    #
    # If the `opc-next-page` header appears in the response, then
    # there are more items to retrieve. To get the next page in the subsequent
    # GET request, include the header's value as the `page` query parameter.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :oda_instance_id List only the information for this Digital Assistant instance.
    # @option opts [String] :resource_type Resource type identifier. Used to limit query results to the items which are applicable to the given type. (default to oracle_da_skills)
    # @option opts [String] :name List only the information for the package with this name. Package names are unique to a publisher and may not change.
    #
    #   Example: `My Package`
    #
    # @option opts [String] :display_name List only the information for the Digital Assistant instance with this user-friendly name. These names don't have to be unique and may change.
    #
    #   Example: `My new resource`
    #
    # @option opts [BOOLEAN] :is_latest_skill_only Should we return only the latest version of a package (instead of all versions)? (default to false)
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
    # @return [Response] A Response object with data of type Array<{OCI::Oda::Models::PackageSummary PackageSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/list_packages.rb.html) to see an example of how to use list_packages API.
    def list_packages(opts = {})
      logger.debug 'Calling operation OdapackageClient#list_packages.' if logger


      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      path = '/packages'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:odaInstanceId] = opts[:oda_instance_id] if opts[:oda_instance_id]
      query_params[:resourceType] = opts[:resource_type] if opts[:resource_type]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:isLatestSkillOnly] = opts[:is_latest_skill_only] if !opts[:is_latest_skill_only].nil?
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdapackageClient#list_packages') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Oda::Models::PackageSummary>'
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


    # Starts an asynchronous job to update a package within a Digital Assistant instance.
    #
    # To monitor the status of the job, take the `opc-work-request-id` response
    # header value and use it to call `GET /workRequests/{workRequestId}`.
    #
    # @param [OCI::Oda::Models::UpdateImportedPackageDetails] update_imported_package_details Parameter values required to import the package, with updated values.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] package_id Unique Digital Assistant package identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :is_replace_skills Should old skills be replaced by new skills if packageId differs from already imported package? (default to false)
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so that you can retry the request if there's
    #   a timeout or server error without the risk of executing that same action again.
    #
    #   Retry tokens expire after 24 hours, but they can become invalid before then if there are
    #   conflicting operations. For example, if an instance was deleted and purged from the system,
    #   then the service might reject a retry of the original creation request.
    #
    # @option opts [String] :if_match For optimistic concurrency control in a PUT or DELETE call for
    #   a Digital Assistant instance, set the `if-match` query parameter
    #   to the value of the `ETAG` header from a previous GET or POST
    #   response for that instance. The service updates or deletes the
    #   instance only if the etag that you provide matches the instance's
    #   current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::ImportedPackage ImportedPackage}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/update_imported_package.rb.html) to see an example of how to use update_imported_package API.
    def update_imported_package(update_imported_package_details, oda_instance_id, package_id, opts = {})
      logger.debug 'Calling operation OdapackageClient#update_imported_package.' if logger

      raise "Missing the required parameter 'update_imported_package_details' when calling update_imported_package." if update_imported_package_details.nil?
      raise "Missing the required parameter 'oda_instance_id' when calling update_imported_package." if oda_instance_id.nil?
      raise "Missing the required parameter 'package_id' when calling update_imported_package." if package_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'package_id' must not be blank" if OCI::Internal::Util.blank_string?(package_id)

      path = '/odaInstances/{odaInstanceId}/importedPackages/{packageId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{packageId}', package_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:isReplaceSkills] = opts[:is_replace_skills] if !opts[:is_replace_skills].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(update_imported_package_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'OdapackageClient#update_imported_package') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::ImportedPackage'
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
