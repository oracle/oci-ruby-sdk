# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A description of the Cloud Guard APIs
  class CloudGuard::CloudGuardClient
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


    # Creates a new CloudGuardClient.
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
        @endpoint = endpoint + '/20200131'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "CloudGuardClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://cloudguard-cp-api.{region}.oci.{secondLevelDomain}') + '/20200131'
      logger.info "CloudGuardClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves the DetectorRecipe from current compartment to another.
    # @param [String] detector_recipe_id DetectorRecipe OCID
    # @param [OCI::CloudGuard::Models::ChangeDetectorRecipeCompartmentDetails] change_detector_recipe_compartment_details The target compartment id.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/change_detector_recipe_compartment.rb.html) to see an example of how to use change_detector_recipe_compartment API.
    def change_detector_recipe_compartment(detector_recipe_id, change_detector_recipe_compartment_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#change_detector_recipe_compartment.' if logger

      raise "Missing the required parameter 'detector_recipe_id' when calling change_detector_recipe_compartment." if detector_recipe_id.nil?
      raise "Missing the required parameter 'change_detector_recipe_compartment_details' when calling change_detector_recipe_compartment." if change_detector_recipe_compartment_details.nil?
      raise "Parameter value for 'detector_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_recipe_id)

      path = '/detectorRecipes/{detectorRecipeId}/actions/changeCompartment'.sub('{detectorRecipeId}', detector_recipe_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_detector_recipe_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#change_detector_recipe_compartment') do
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


    # Moves the ManagedList from current compartment to another.
    # @param [String] managed_list_id The cloudguard list OCID to be passed in the request.
    # @param [OCI::CloudGuard::Models::ChangeManagedListCompartmentDetails] change_managed_list_compartment_details The compartment id of the ManagedList
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/change_managed_list_compartment.rb.html) to see an example of how to use change_managed_list_compartment API.
    def change_managed_list_compartment(managed_list_id, change_managed_list_compartment_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#change_managed_list_compartment.' if logger

      raise "Missing the required parameter 'managed_list_id' when calling change_managed_list_compartment." if managed_list_id.nil?
      raise "Missing the required parameter 'change_managed_list_compartment_details' when calling change_managed_list_compartment." if change_managed_list_compartment_details.nil?
      raise "Parameter value for 'managed_list_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_list_id)

      path = '/managedLists/{managedListId}/actions/changeCompartment'.sub('{managedListId}', managed_list_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_managed_list_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#change_managed_list_compartment') do
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


    # Moves the ResponderRecipe from current compartment to another.
    # @param [String] responder_recipe_id OCID of ResponderRecipe
    # @param [OCI::CloudGuard::Models::ChangeResponderRecipeCompartmentDetails] change_responder_recipe_compartment_details The target compartment id.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/change_responder_recipe_compartment.rb.html) to see an example of how to use change_responder_recipe_compartment API.
    def change_responder_recipe_compartment(responder_recipe_id, change_responder_recipe_compartment_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#change_responder_recipe_compartment.' if logger

      raise "Missing the required parameter 'responder_recipe_id' when calling change_responder_recipe_compartment." if responder_recipe_id.nil?
      raise "Missing the required parameter 'change_responder_recipe_compartment_details' when calling change_responder_recipe_compartment." if change_responder_recipe_compartment_details.nil?
      raise "Parameter value for 'responder_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_recipe_id)

      path = '/responderRecipes/{responderRecipeId}/actions/changeCompartment'.sub('{responderRecipeId}', responder_recipe_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_responder_recipe_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#change_responder_recipe_compartment') do
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


    # Creates a DetectorRecipe
    #
    # @param [OCI::CloudGuard::Models::CreateDetectorRecipeDetails] create_detector_recipe_details Details for the new DetectorRecipe.
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
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::DetectorRecipe DetectorRecipe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/create_detector_recipe.rb.html) to see an example of how to use create_detector_recipe API.
    def create_detector_recipe(create_detector_recipe_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#create_detector_recipe.' if logger

      raise "Missing the required parameter 'create_detector_recipe_details' when calling create_detector_recipe." if create_detector_recipe_details.nil?

      path = '/detectorRecipes'
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

      post_body = @api_client.object_to_http_body(create_detector_recipe_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#create_detector_recipe') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::DetectorRecipe'
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


    # Creates a new ManagedList.
    #
    # @param [OCI::CloudGuard::Models::CreateManagedListDetails] create_managed_list_details Details for the new ManagedList.
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
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ManagedList ManagedList}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/create_managed_list.rb.html) to see an example of how to use create_managed_list API.
    def create_managed_list(create_managed_list_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#create_managed_list.' if logger

      raise "Missing the required parameter 'create_managed_list_details' when calling create_managed_list." if create_managed_list_details.nil?

      path = '/managedLists'
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

      post_body = @api_client.object_to_http_body(create_managed_list_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#create_managed_list') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ManagedList'
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


    # Create a ResponderRecipe.
    #
    # @param [OCI::CloudGuard::Models::CreateResponderRecipeDetails] create_responder_recipe_details Details for ResponderRecipe.
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
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderRecipe ResponderRecipe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/create_responder_recipe.rb.html) to see an example of how to use create_responder_recipe API.
    def create_responder_recipe(create_responder_recipe_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#create_responder_recipe.' if logger

      raise "Missing the required parameter 'create_responder_recipe_details' when calling create_responder_recipe." if create_responder_recipe_details.nil?

      path = '/responderRecipes'
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

      post_body = @api_client.object_to_http_body(create_responder_recipe_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#create_responder_recipe') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderRecipe'
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


    # Creates a new Target
    #
    # @param [OCI::CloudGuard::Models::CreateTargetDetails] create_target_details Details for the new Target.
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
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::Target Target}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/create_target.rb.html) to see an example of how to use create_target API.
    def create_target(create_target_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#create_target.' if logger

      raise "Missing the required parameter 'create_target_details' when calling create_target." if create_target_details.nil?

      path = '/targets'
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

      post_body = @api_client.object_to_http_body(create_target_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#create_target') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::Target'
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


    # Attach a DetectorRecipe with the Target
    #
    # @param [String] target_id OCID of target
    # @param [OCI::CloudGuard::Models::AttachTargetDetectorRecipeDetails] attach_target_detector_recipe_details Details for associating DetectorRecipe to Target
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
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetDetectorRecipe TargetDetectorRecipe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/create_target_detector_recipe.rb.html) to see an example of how to use create_target_detector_recipe API.
    def create_target_detector_recipe(target_id, attach_target_detector_recipe_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#create_target_detector_recipe.' if logger

      raise "Missing the required parameter 'target_id' when calling create_target_detector_recipe." if target_id.nil?
      raise "Missing the required parameter 'attach_target_detector_recipe_details' when calling create_target_detector_recipe." if attach_target_detector_recipe_details.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)

      path = '/targets/{targetId}/targetDetectorRecipes'.sub('{targetId}', target_id.to_s)
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

      post_body = @api_client.object_to_http_body(attach_target_detector_recipe_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#create_target_detector_recipe') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetDetectorRecipe'
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


    # Attach a ResponderRecipe with the Target
    #
    # @param [String] target_id OCID of target
    # @param [OCI::CloudGuard::Models::AttachTargetResponderRecipeDetails] attach_target_responder_recipe_details Details for associating ResponderRecipe to Target
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
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetResponderRecipe TargetResponderRecipe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/create_target_responder_recipe.rb.html) to see an example of how to use create_target_responder_recipe API.
    def create_target_responder_recipe(target_id, attach_target_responder_recipe_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#create_target_responder_recipe.' if logger

      raise "Missing the required parameter 'target_id' when calling create_target_responder_recipe." if target_id.nil?
      raise "Missing the required parameter 'attach_target_responder_recipe_details' when calling create_target_responder_recipe." if attach_target_responder_recipe_details.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)

      path = '/targets/{targetId}/targetResponderRecipes'.sub('{targetId}', target_id.to_s)
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

      post_body = @api_client.object_to_http_body(attach_target_responder_recipe_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#create_target_responder_recipe') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetResponderRecipe'
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


    # Deletes a DetectorRecipe identified by detectorRecipeId
    # @param [String] detector_recipe_id DetectorRecipe OCID
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/delete_detector_recipe.rb.html) to see an example of how to use delete_detector_recipe API.
    def delete_detector_recipe(detector_recipe_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#delete_detector_recipe.' if logger

      raise "Missing the required parameter 'detector_recipe_id' when calling delete_detector_recipe." if detector_recipe_id.nil?
      raise "Parameter value for 'detector_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_recipe_id)

      path = '/detectorRecipes/{detectorRecipeId}'.sub('{detectorRecipeId}', detector_recipe_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#delete_detector_recipe') do
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


    # Deletes a managed list identified by managedListId
    # @param [String] managed_list_id The cloudguard list OCID to be passed in the request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/delete_managed_list.rb.html) to see an example of how to use delete_managed_list API.
    def delete_managed_list(managed_list_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#delete_managed_list.' if logger

      raise "Missing the required parameter 'managed_list_id' when calling delete_managed_list." if managed_list_id.nil?
      raise "Parameter value for 'managed_list_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_list_id)

      path = '/managedLists/{managedListId}'.sub('{managedListId}', managed_list_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#delete_managed_list') do
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


    # Delete the ResponderRecipe resource by identifier
    # @param [String] responder_recipe_id OCID of ResponderRecipe
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/delete_responder_recipe.rb.html) to see an example of how to use delete_responder_recipe API.
    def delete_responder_recipe(responder_recipe_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#delete_responder_recipe.' if logger

      raise "Missing the required parameter 'responder_recipe_id' when calling delete_responder_recipe." if responder_recipe_id.nil?
      raise "Parameter value for 'responder_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_recipe_id)

      path = '/responderRecipes/{responderRecipeId}'.sub('{responderRecipeId}', responder_recipe_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#delete_responder_recipe') do
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


    # Deletes a Target identified by targetId
    # @param [String] target_id OCID of target
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/delete_target.rb.html) to see an example of how to use delete_target API.
    def delete_target(target_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#delete_target.' if logger

      raise "Missing the required parameter 'target_id' when calling delete_target." if target_id.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)

      path = '/targets/{targetId}'.sub('{targetId}', target_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#delete_target') do
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


    # Delete the TargetDetectorRecipe resource by identifier
    # @param [String] target_id OCID of target
    # @param [String] target_detector_recipe_id OCID of TargetDetectorRecipe
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/delete_target_detector_recipe.rb.html) to see an example of how to use delete_target_detector_recipe API.
    def delete_target_detector_recipe(target_id, target_detector_recipe_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#delete_target_detector_recipe.' if logger

      raise "Missing the required parameter 'target_id' when calling delete_target_detector_recipe." if target_id.nil?
      raise "Missing the required parameter 'target_detector_recipe_id' when calling delete_target_detector_recipe." if target_detector_recipe_id.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)
      raise "Parameter value for 'target_detector_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(target_detector_recipe_id)

      path = '/targets/{targetId}/targetDetectorRecipes/{targetDetectorRecipeId}'.sub('{targetId}', target_id.to_s).sub('{targetDetectorRecipeId}', target_detector_recipe_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#delete_target_detector_recipe') do
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


    # Delete the TargetResponderRecipe resource by identifier
    # @param [String] target_id OCID of target
    # @param [String] target_responder_recipe_id OCID of TargetResponderRecipe
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/delete_target_responder_recipe.rb.html) to see an example of how to use delete_target_responder_recipe API.
    def delete_target_responder_recipe(target_id, target_responder_recipe_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#delete_target_responder_recipe.' if logger

      raise "Missing the required parameter 'target_id' when calling delete_target_responder_recipe." if target_id.nil?
      raise "Missing the required parameter 'target_responder_recipe_id' when calling delete_target_responder_recipe." if target_responder_recipe_id.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)
      raise "Parameter value for 'target_responder_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(target_responder_recipe_id)

      path = '/targets/{targetId}/targetResponderRecipes/{targetResponderRecipeId}'.sub('{targetId}', target_id.to_s).sub('{targetResponderRecipeId}', target_responder_recipe_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#delete_target_responder_recipe') do
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


    # Executes the responder execution. When provided, If-Match is checked against ETag values of the resource.
    # @param [String] responder_execution_id The identifier of the responder execution.
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [OCI::CloudGuard::Models::ExecuteResponderExecutionDetails] :execute_responder_execution_details Details for Responder Configuration
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/execute_responder_execution.rb.html) to see an example of how to use execute_responder_execution API.
    def execute_responder_execution(responder_execution_id, compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#execute_responder_execution.' if logger

      raise "Missing the required parameter 'responder_execution_id' when calling execute_responder_execution." if responder_execution_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling execute_responder_execution." if compartment_id.nil?
      raise "Parameter value for 'responder_execution_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_execution_id)

      path = '/responderExecutions/{responderExecutionId}/actions/execute'.sub('{responderExecutionId}', responder_execution_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(opts[:execute_responder_execution_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#execute_responder_execution') do
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


    # Returns ConditionType with its details.
    #
    # @param [String] condition_metadata_type_id The type of the condition meta data.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :service_type ServiceType filter for the condition meta data.
    # @option opts [String] :resource_type Resource filter for the condition meta data.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ConditionMetadataType ConditionMetadataType}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_condition_metadata_type.rb.html) to see an example of how to use get_condition_metadata_type API.
    def get_condition_metadata_type(condition_metadata_type_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_condition_metadata_type.' if logger

      raise "Missing the required parameter 'condition_metadata_type_id' when calling get_condition_metadata_type." if condition_metadata_type_id.nil?
      unless OCI::CloudGuard::Models::CONDITION_TYPE_ENUM_ENUM.include?(condition_metadata_type_id)
        raise 'Invalid value for "condition_metadata_type_id", must be one of the values in OCI::CloudGuard::Models::CONDITION_TYPE_ENUM_ENUM.'
      end

      raise "Parameter value for 'condition_metadata_type_id' must not be blank" if OCI::Internal::Util.blank_string?(condition_metadata_type_id)

      path = '/conditionMetadataTypes/{conditionMetadataTypeId}'.sub('{conditionMetadataTypeId}', condition_metadata_type_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:serviceType] = opts[:service_type] if opts[:service_type]
      query_params[:resourceType] = opts[:resource_type] if opts[:resource_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_condition_metadata_type') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ConditionMetadataType'
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


    # GET Cloud Guard Configuration Details for a Tenancy.
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::Configuration Configuration}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_configuration.rb.html) to see an example of how to use get_configuration API.
    def get_configuration(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_configuration.' if logger

      raise "Missing the required parameter 'compartment_id' when calling get_configuration." if compartment_id.nil?

      path = '/configuration'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_configuration') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::Configuration'
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


    # Returns a Detector identified by detectorId.
    #
    # @param [String] detector_id The Name of Detector.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::Detector Detector}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_detector.rb.html) to see an example of how to use get_detector API.
    def get_detector(detector_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_detector.' if logger

      raise "Missing the required parameter 'detector_id' when calling get_detector." if detector_id.nil?
      raise "Parameter value for 'detector_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_id)

      path = '/detectors/{detectorId}'.sub('{detectorId}', detector_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_detector') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::Detector'
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


    # Returns a DetectorRecipe identified by detectorRecipeId
    # @param [String] detector_recipe_id DetectorRecipe OCID
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::DetectorRecipe DetectorRecipe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_detector_recipe.rb.html) to see an example of how to use get_detector_recipe API.
    def get_detector_recipe(detector_recipe_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_detector_recipe.' if logger

      raise "Missing the required parameter 'detector_recipe_id' when calling get_detector_recipe." if detector_recipe_id.nil?
      raise "Parameter value for 'detector_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_recipe_id)

      path = '/detectorRecipes/{detectorRecipeId}'.sub('{detectorRecipeId}', detector_recipe_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_detector_recipe') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::DetectorRecipe'
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


    # Get DetectorRule by identifier
    # @param [String] detector_recipe_id DetectorRecipe OCID
    # @param [String] detector_rule_id The key of Detector Rule.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::DetectorRecipeDetectorRule DetectorRecipeDetectorRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_detector_recipe_detector_rule.rb.html) to see an example of how to use get_detector_recipe_detector_rule API.
    def get_detector_recipe_detector_rule(detector_recipe_id, detector_rule_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_detector_recipe_detector_rule.' if logger

      raise "Missing the required parameter 'detector_recipe_id' when calling get_detector_recipe_detector_rule." if detector_recipe_id.nil?
      raise "Missing the required parameter 'detector_rule_id' when calling get_detector_recipe_detector_rule." if detector_rule_id.nil?
      raise "Parameter value for 'detector_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_recipe_id)
      raise "Parameter value for 'detector_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_rule_id)

      path = '/detectorRecipes/{detectorRecipeId}/detectorRules/{detectorRuleId}'.sub('{detectorRecipeId}', detector_recipe_id.to_s).sub('{detectorRuleId}', detector_rule_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_detector_recipe_detector_rule') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::DetectorRecipeDetectorRule'
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


    # Returns a Detector Rule identified by detectorRuleId
    #
    # @param [String] detector_id The Name of Detector.
    # @param [String] detector_rule_id The key of Detector Rule.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::DetectorRule DetectorRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_detector_rule.rb.html) to see an example of how to use get_detector_rule API.
    def get_detector_rule(detector_id, detector_rule_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_detector_rule.' if logger

      raise "Missing the required parameter 'detector_id' when calling get_detector_rule." if detector_id.nil?
      raise "Missing the required parameter 'detector_rule_id' when calling get_detector_rule." if detector_rule_id.nil?
      raise "Parameter value for 'detector_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_id)
      raise "Parameter value for 'detector_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_rule_id)

      path = '/detectors/{detectorId}/detectorRules/{detectorRuleId}'.sub('{detectorId}', detector_id.to_s).sub('{detectorRuleId}', detector_rule_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_detector_rule') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::DetectorRule'
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


    # Returns a managed list identified by managedListId
    # @param [String] managed_list_id The cloudguard list OCID to be passed in the request.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ManagedList ManagedList}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_managed_list.rb.html) to see an example of how to use get_managed_list API.
    def get_managed_list(managed_list_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_managed_list.' if logger

      raise "Missing the required parameter 'managed_list_id' when calling get_managed_list." if managed_list_id.nil?
      raise "Parameter value for 'managed_list_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_list_id)

      path = '/managedLists/{managedListId}'.sub('{managedListId}', managed_list_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_managed_list') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ManagedList'
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


    # Returns a Problems response
    # @param [String] problem_id OCId of the problem.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::Problem Problem}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_problem.rb.html) to see an example of how to use get_problem API.
    def get_problem(problem_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_problem.' if logger

      raise "Missing the required parameter 'problem_id' when calling get_problem." if problem_id.nil?
      raise "Parameter value for 'problem_id' must not be blank" if OCI::Internal::Util.blank_string?(problem_id)

      path = '/problems/{problemId}'.sub('{problemId}', problem_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_problem') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::Problem'
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


    # Returns a Responder Execution identified by responderExecutionId
    #
    # @param [String] responder_execution_id The identifier of the responder execution.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderExecution ResponderExecution}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_responder_execution.rb.html) to see an example of how to use get_responder_execution API.
    def get_responder_execution(responder_execution_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_responder_execution.' if logger

      raise "Missing the required parameter 'responder_execution_id' when calling get_responder_execution." if responder_execution_id.nil?
      raise "Parameter value for 'responder_execution_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_execution_id)

      path = '/responderExecutions/{responderExecutionId}'.sub('{responderExecutionId}', responder_execution_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_responder_execution') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderExecution'
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


    # Get a ResponderRecipe by identifier
    # @param [String] responder_recipe_id OCID of ResponderRecipe
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderRecipe ResponderRecipe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_responder_recipe.rb.html) to see an example of how to use get_responder_recipe API.
    def get_responder_recipe(responder_recipe_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_responder_recipe.' if logger

      raise "Missing the required parameter 'responder_recipe_id' when calling get_responder_recipe." if responder_recipe_id.nil?
      raise "Parameter value for 'responder_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_recipe_id)

      path = '/responderRecipes/{responderRecipeId}'.sub('{responderRecipeId}', responder_recipe_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_responder_recipe') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderRecipe'
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


    # Get ResponderRule by identifier
    # @param [String] responder_recipe_id OCID of ResponderRecipe
    # @param [String] responder_rule_id The id of ResponderRule
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderRecipeResponderRule ResponderRecipeResponderRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_responder_recipe_responder_rule.rb.html) to see an example of how to use get_responder_recipe_responder_rule API.
    def get_responder_recipe_responder_rule(responder_recipe_id, responder_rule_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_responder_recipe_responder_rule.' if logger

      raise "Missing the required parameter 'responder_recipe_id' when calling get_responder_recipe_responder_rule." if responder_recipe_id.nil?
      raise "Missing the required parameter 'responder_rule_id' when calling get_responder_recipe_responder_rule." if responder_rule_id.nil?
      raise "Parameter value for 'responder_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_recipe_id)
      raise "Parameter value for 'responder_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_rule_id)

      path = '/responderRecipes/{responderRecipeId}/responderRules/{responderRuleId}'.sub('{responderRecipeId}', responder_recipe_id.to_s).sub('{responderRuleId}', responder_rule_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_responder_recipe_responder_rule') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderRecipeResponderRule'
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


    # Get a ResponderRule by identifier
    # @param [String] responder_rule_id The id of ResponderRule
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderRule ResponderRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_responder_rule.rb.html) to see an example of how to use get_responder_rule API.
    def get_responder_rule(responder_rule_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_responder_rule.' if logger

      raise "Missing the required parameter 'responder_rule_id' when calling get_responder_rule." if responder_rule_id.nil?
      raise "Parameter value for 'responder_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_rule_id)

      path = '/responderRules/{responderRuleId}'.sub('{responderRuleId}', responder_rule_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_responder_rule') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderRule'
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


    # Returns a Target identified by targetId
    # @param [String] target_id OCID of target
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::Target Target}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_target.rb.html) to see an example of how to use get_target API.
    def get_target(target_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_target.' if logger

      raise "Missing the required parameter 'target_id' when calling get_target." if target_id.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)

      path = '/targets/{targetId}'.sub('{targetId}', target_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_target') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::Target'
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


    # Get a TargetDetectorRecipe by identifier
    # @param [String] target_id OCID of target
    # @param [String] target_detector_recipe_id OCID of TargetDetectorRecipe
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetDetectorRecipe TargetDetectorRecipe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_target_detector_recipe.rb.html) to see an example of how to use get_target_detector_recipe API.
    def get_target_detector_recipe(target_id, target_detector_recipe_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_target_detector_recipe.' if logger

      raise "Missing the required parameter 'target_id' when calling get_target_detector_recipe." if target_id.nil?
      raise "Missing the required parameter 'target_detector_recipe_id' when calling get_target_detector_recipe." if target_detector_recipe_id.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)
      raise "Parameter value for 'target_detector_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(target_detector_recipe_id)

      path = '/targets/{targetId}/targetDetectorRecipes/{targetDetectorRecipeId}'.sub('{targetId}', target_id.to_s).sub('{targetDetectorRecipeId}', target_detector_recipe_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_target_detector_recipe') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetDetectorRecipe'
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


    # Get DetectorRule by identifier
    # @param [String] target_id OCID of target
    # @param [String] target_detector_recipe_id OCID of TargetDetectorRecipe
    # @param [String] detector_rule_id The id of DetectorRule
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRule TargetDetectorRecipeDetectorRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_target_detector_recipe_detector_rule.rb.html) to see an example of how to use get_target_detector_recipe_detector_rule API.
    def get_target_detector_recipe_detector_rule(target_id, target_detector_recipe_id, detector_rule_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_target_detector_recipe_detector_rule.' if logger

      raise "Missing the required parameter 'target_id' when calling get_target_detector_recipe_detector_rule." if target_id.nil?
      raise "Missing the required parameter 'target_detector_recipe_id' when calling get_target_detector_recipe_detector_rule." if target_detector_recipe_id.nil?
      raise "Missing the required parameter 'detector_rule_id' when calling get_target_detector_recipe_detector_rule." if detector_rule_id.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)
      raise "Parameter value for 'target_detector_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(target_detector_recipe_id)
      raise "Parameter value for 'detector_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_rule_id)

      path = '/targets/{targetId}/targetDetectorRecipes/{targetDetectorRecipeId}/detectorRules/{detectorRuleId}'.sub('{targetId}', target_id.to_s).sub('{targetDetectorRecipeId}', target_detector_recipe_id.to_s).sub('{detectorRuleId}', detector_rule_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_target_detector_recipe_detector_rule') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRule'
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


    # Get a TargetResponderRecipe by identifier
    # @param [String] target_id OCID of target
    # @param [String] target_responder_recipe_id OCID of TargetResponderRecipe
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetResponderRecipe TargetResponderRecipe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_target_responder_recipe.rb.html) to see an example of how to use get_target_responder_recipe API.
    def get_target_responder_recipe(target_id, target_responder_recipe_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_target_responder_recipe.' if logger

      raise "Missing the required parameter 'target_id' when calling get_target_responder_recipe." if target_id.nil?
      raise "Missing the required parameter 'target_responder_recipe_id' when calling get_target_responder_recipe." if target_responder_recipe_id.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)
      raise "Parameter value for 'target_responder_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(target_responder_recipe_id)

      path = '/targets/{targetId}/targetResponderRecipes/{targetResponderRecipeId}'.sub('{targetId}', target_id.to_s).sub('{targetResponderRecipeId}', target_responder_recipe_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_target_responder_recipe') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetResponderRecipe'
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


    # Get ResponderRule by identifier
    # @param [String] target_id OCID of target
    # @param [String] target_responder_recipe_id OCID of TargetResponderRecipe
    # @param [String] responder_rule_id The id of ResponderRule
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetResponderRecipeResponderRule TargetResponderRecipeResponderRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/get_target_responder_recipe_responder_rule.rb.html) to see an example of how to use get_target_responder_recipe_responder_rule API.
    def get_target_responder_recipe_responder_rule(target_id, target_responder_recipe_id, responder_rule_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#get_target_responder_recipe_responder_rule.' if logger

      raise "Missing the required parameter 'target_id' when calling get_target_responder_recipe_responder_rule." if target_id.nil?
      raise "Missing the required parameter 'target_responder_recipe_id' when calling get_target_responder_recipe_responder_rule." if target_responder_recipe_id.nil?
      raise "Missing the required parameter 'responder_rule_id' when calling get_target_responder_recipe_responder_rule." if responder_rule_id.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)
      raise "Parameter value for 'target_responder_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(target_responder_recipe_id)
      raise "Parameter value for 'responder_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_rule_id)

      path = '/targets/{targetId}/targetResponderRecipes/{targetResponderRecipeId}/responderRules/{responderRuleId}'.sub('{targetId}', target_id.to_s).sub('{targetResponderRecipeId}', target_responder_recipe_id.to_s).sub('{responderRuleId}', responder_rule_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#get_target_responder_recipe_responder_rule') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetResponderRecipeResponderRule'
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


    # Returns a list of condition types.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ConditionMetadataTypeCollection ConditionMetadataTypeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_condition_metadata_types.rb.html) to see an example of how to use list_condition_metadata_types API.
    def list_condition_metadata_types(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_condition_metadata_types.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_condition_metadata_types." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/conditionMetadataTypes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_condition_metadata_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ConditionMetadataTypeCollection'
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


    # Returns a list of DetectorRule associated with DetectorRecipe.
    #
    # @param [String] detector_recipe_id DetectorRecipe OCID
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for displayName is ascending. If no value is specified displayName is default.
    #    (default to displayName)
    #   Allowed values are: displayName, riskLevel
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::DetectorRecipeDetectorRuleCollection DetectorRecipeDetectorRuleCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_detector_recipe_detector_rules.rb.html) to see an example of how to use list_detector_recipe_detector_rules API.
    def list_detector_recipe_detector_rules(detector_recipe_id, compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_detector_recipe_detector_rules.' if logger

      raise "Missing the required parameter 'detector_recipe_id' when calling list_detector_recipe_detector_rules." if detector_recipe_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_detector_recipe_detector_rules." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName riskLevel].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, riskLevel.'
      end
      raise "Parameter value for 'detector_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_recipe_id)

      path = '/detectorRecipes/{detectorRecipeId}/detectorRules'.sub('{detectorRecipeId}', detector_recipe_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_detector_recipe_detector_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::DetectorRecipeDetectorRuleCollection'
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


    # Returns a list of all Detector Recipes in a compartment
    #
    # The ListDetectorRecipes operation returns only the detector recipes in `compartmentId` passed.
    # The list does not include any subcompartments of the compartmentId passed.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform ListDetectorRecipes on the
    # `compartmentId` passed and when it is set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ACCESSIBLE.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [BOOLEAN] :resource_metadata_only Default is false.
    #   When set to true, the list of all Oracle Managed Resources
    #   Metadata supported by Cloud Guard is returned.
    #    (default to false)
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #    (default to false)
    # @option opts [String] :access_level Valid values are `RESTRICTED` and `ACCESSIBLE`. Default is `RESTRICTED`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment).
    #   When set to `RESTRICTED` permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::DetectorRecipeCollection DetectorRecipeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_detector_recipes.rb.html) to see an example of how to use list_detector_recipes API.
    def list_detector_recipes(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_detector_recipes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_detector_recipes." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/detectorRecipes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:resourceMetadataOnly] = opts[:resource_metadata_only] if !opts[:resource_metadata_only].nil?
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_detector_recipes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::DetectorRecipeCollection'
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


    # Returns a list of detector rules for the detectorId passed.
    #
    # @param [String] detector_id The Name of Detector.
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::DetectorRuleCollection DetectorRuleCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_detector_rules.rb.html) to see an example of how to use list_detector_rules API.
    def list_detector_rules(detector_id, compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_detector_rules.' if logger

      raise "Missing the required parameter 'detector_id' when calling list_detector_rules." if detector_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_detector_rules." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end
      raise "Parameter value for 'detector_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_id)

      path = '/detectors/{detectorId}/detectorRules'.sub('{detectorId}', detector_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_detector_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::DetectorRuleCollection'
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


    # Returns detector catalog - list of detectors supported by Cloud Guard
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::DetectorCollection DetectorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_detectors.rb.html) to see an example of how to use list_detectors API.
    def list_detectors(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_detectors.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_detectors." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/detectors'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_detectors') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::DetectorCollection'
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


    # Returns a list of Impacted Resources for a CloudGuard Problem
    #
    # @param [String] problem_id OCId of the problem.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ImpactedResourceCollection ImpactedResourceCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_impacted_resources.rb.html) to see an example of how to use list_impacted_resources API.
    def list_impacted_resources(problem_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_impacted_resources.' if logger

      raise "Missing the required parameter 'problem_id' when calling list_impacted_resources." if problem_id.nil?

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated.'
      end
      raise "Parameter value for 'problem_id' must not be blank" if OCI::Internal::Util.blank_string?(problem_id)

      path = '/problems/{problemId}/impactedResources'.sub('{problemId}', problem_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_impacted_resources') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ImpactedResourceCollection'
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


    # Returns all ManagedList types supported by Cloud Guard
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for displayName is ascending. If no value is specified displayName is default.
    #    (default to displayName)
    #   Allowed values are: displayName, riskLevel
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ManagedListTypeCollection ManagedListTypeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_managed_list_types.rb.html) to see an example of how to use list_managed_list_types API.
    def list_managed_list_types(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_managed_list_types.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_managed_list_types." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName riskLevel].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, riskLevel.'
      end

      path = '/managedListTypes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_managed_list_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ManagedListTypeCollection'
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


    # Returns a list of ListManagedLists.
    # The ListManagedLists operation returns only the managed lists in `compartmentId` passed.
    # The list does not include any subcompartments of the compartmentId passed.
    #
    # The parameter `accessLevel` specifies whether to return ManagedLists in only
    # those compartments for which the requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform ListManagedLists on the
    # `compartmentId` passed and when it is set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ACCESSIBLE.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [BOOLEAN] :resource_metadata_only Default is false.
    #   When set to true, the list of all Oracle Managed Resources
    #   Metadata supported by Cloud Guard is returned.
    #    (default to false)
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [String] :list_type The type of the ManagedList.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #    (default to false)
    # @option opts [String] :access_level Valid values are `RESTRICTED` and `ACCESSIBLE`. Default is `RESTRICTED`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment).
    #   When set to `RESTRICTED` permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ManagedListCollection ManagedListCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_managed_lists.rb.html) to see an example of how to use list_managed_lists API.
    def list_managed_lists(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_managed_lists.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_managed_lists." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:list_type] && !OCI::CloudGuard::Models::MANAGED_LIST_TYPE_ENUM.include?(opts[:list_type])
        raise 'Invalid value for "list_type", must be one of the values in OCI::CloudGuard::Models::MANAGED_LIST_TYPE_ENUM.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/managedLists'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:resourceMetadataOnly] = opts[:resource_metadata_only] if !opts[:resource_metadata_only].nil?
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:listType] = opts[:list_type] if opts[:list_type]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_managed_lists') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ManagedListCollection'
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


    # Returns a list of Actions done on CloudGuard Problem
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [String] problem_id OCId of the problem.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ProblemHistoryCollection ProblemHistoryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_problem_histories.rb.html) to see an example of how to use list_problem_histories API.
    def list_problem_histories(compartment_id, problem_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_problem_histories.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_problem_histories." if compartment_id.nil?
      raise "Missing the required parameter 'problem_id' when calling list_problem_histories." if problem_id.nil?

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated.'
      end
      raise "Parameter value for 'problem_id' must not be blank" if OCI::Internal::Util.blank_string?(problem_id)

      path = '/problems/{problemId}/histories'.sub('{problemId}', problem_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_problem_histories') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ProblemHistoryCollection'
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


    # Returns a list of all Problems identified by the Cloud Guard
    #
    # The ListProblems operation returns only the problems in `compartmentId` passed.
    # The list does not include any subcompartments of the compartmentId passed.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform ListProblems on the
    # `compartmentId` passed and when it is set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ACCESSIBLE.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_last_detected_greater_than_or_equal_to Start time for a filter. If start time is not specified, start time will be set to today's current time - 30 days.
    # @option opts [DateTime] :time_last_detected_less_than_or_equal_to End time for a filter. If end time is not specified, end time will be set to today's current time.
    # @option opts [DateTime] :time_first_detected_greater_than_or_equal_to Start time for a filter. If start time is not specified, start time will be set to today's current time - 30 days.
    # @option opts [DateTime] :time_first_detected_less_than_or_equal_to End time for a filter. If end time is not specified, end time will be set to today's current time.
    # @option opts [String] :lifecycle_detail The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to OPEN)
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [String] :region OCI Monitoring region.
    # @option opts [String] :risk_level Risk level of the Problem.
    # @option opts [String] :resource_type Resource Type associated with the resource.
    # @option opts [String] :city City of the problem.
    # @option opts [String] :state State of the problem.
    # @option opts [String] :country Country of the problem.
    # @option opts [String] :label Label associated with the Problem.
    # @option opts [Array<String>] :detector_rule_id_list Comma seperated list of detector rule ids to be passed in to match against Problems. (default to [])
    # @option opts [String] :detector_type The field to list the Problems by Detector Type. Valid values are IAAS_ACTIVITY_DETECTOR and IAAS_CONFIGURATION_DETECTOR
    #
    # @option opts [String] :target_id The ID of the target in which to list resources.
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #    (default to false)
    # @option opts [String] :access_level Valid values are `RESTRICTED` and `ACCESSIBLE`. Default is `RESTRICTED`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment).
    #   When set to `RESTRICTED` permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :resource_id The ID of the resource associated with the problem.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for riskLevel, timeLastDetected and resourceName is descending. Default order for riskLevel and resourceName is ascending. If no value is specified timeLastDetected is default.
    #    (default to timeLastDetected)
    #   Allowed values are: riskLevel, timeLastDetected, resourceName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ProblemCollection ProblemCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_problems.rb.html) to see an example of how to use list_problems API.
    def list_problems(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_problems.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_problems." if compartment_id.nil?

      if opts[:lifecycle_detail] && !OCI::CloudGuard::Models::PROBLEM_LIFECYCLE_DETAIL_ENUM.include?(opts[:lifecycle_detail])
        raise 'Invalid value for "lifecycle_detail", must be one of the values in OCI::CloudGuard::Models::PROBLEM_LIFECYCLE_DETAIL_ENUM.'
      end

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::PROBLEM_LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::PROBLEM_LIFECYCLE_STATE_ENUM.'
      end

      if opts[:detector_type] && !OCI::CloudGuard::Models::DETECTOR_ENUM_ENUM.include?(opts[:detector_type])
        raise 'Invalid value for "detector_type", must be one of the values in OCI::CloudGuard::Models::DETECTOR_ENUM_ENUM.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[riskLevel timeLastDetected resourceName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of riskLevel, timeLastDetected, resourceName.'
      end

      path = '/problems'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:timeLastDetectedGreaterThanOrEqualTo] = opts[:time_last_detected_greater_than_or_equal_to] if opts[:time_last_detected_greater_than_or_equal_to]
      query_params[:timeLastDetectedLessThanOrEqualTo] = opts[:time_last_detected_less_than_or_equal_to] if opts[:time_last_detected_less_than_or_equal_to]
      query_params[:timeFirstDetectedGreaterThanOrEqualTo] = opts[:time_first_detected_greater_than_or_equal_to] if opts[:time_first_detected_greater_than_or_equal_to]
      query_params[:timeFirstDetectedLessThanOrEqualTo] = opts[:time_first_detected_less_than_or_equal_to] if opts[:time_first_detected_less_than_or_equal_to]
      query_params[:lifecycleDetail] = opts[:lifecycle_detail] if opts[:lifecycle_detail]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:region] = opts[:region] if opts[:region]
      query_params[:riskLevel] = opts[:risk_level] if opts[:risk_level]
      query_params[:resourceType] = opts[:resource_type] if opts[:resource_type]
      query_params[:city] = opts[:city] if opts[:city]
      query_params[:state] = opts[:state] if opts[:state]
      query_params[:country] = opts[:country] if opts[:country]
      query_params[:label] = opts[:label] if opts[:label]
      query_params[:detectorRuleIdList] = OCI::ApiClient.build_collection_params(opts[:detector_rule_id_list], :multi) if opts[:detector_rule_id_list] && !opts[:detector_rule_id_list].empty?
      query_params[:detectorType] = opts[:detector_type] if opts[:detector_type]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:resourceId] = opts[:resource_id] if opts[:resource_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_problems') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ProblemCollection'
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


    # Returns a list of all Recommendations.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for riskLevel and timeCreated is descending. If no value is specified riskLevel is default.
    #    (default to riskLevel)
    #   Allowed values are: riskLevel, timeCreated
    # @option opts [String] :target_id The ID of the target in which to list resources.
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #    (default to false)
    # @option opts [String] :access_level Valid values are `RESTRICTED` and `ACCESSIBLE`. Default is `RESTRICTED`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment).
    #   When set to `RESTRICTED` permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [String] :lifecycle_detail The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to OPEN)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::RecommendationSummaryCollection RecommendationSummaryCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_recommendations.rb.html) to see an example of how to use list_recommendations API.
    def list_recommendations(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_recommendations.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_recommendations." if compartment_id.nil?

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[riskLevel timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of riskLevel, timeCreated.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:lifecycle_detail] && !OCI::CloudGuard::Models::RECOMMENDATION_LIFECYCLE_DETAIL_ENUM.include?(opts[:lifecycle_detail])
        raise 'Invalid value for "lifecycle_detail", must be one of the values in OCI::CloudGuard::Models::RECOMMENDATION_LIFECYCLE_DETAIL_ENUM.'
      end

      path = '/recommendations'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:lifecycleDetail] = opts[:lifecycle_detail] if opts[:lifecycle_detail]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_recommendations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::RecommendationSummaryCollection'
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


    # Returns a list of resource types.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for displayName is ascending. If no value is specified displayName is default.
    #    (default to displayName)
    #   Allowed values are: displayName, riskLevel
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResourceTypeCollection ResourceTypeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_resource_types.rb.html) to see an example of how to use list_resource_types API.
    def list_resource_types(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_resource_types.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_resource_types." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName riskLevel].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, riskLevel.'
      end

      path = '/resourceTypes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_resource_types') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResourceTypeCollection'
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


    # Returns a list of Responder activities done on CloudGuard Problem
    #
    # @param [String] problem_id OCId of the problem.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for responderRuleName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, responderRuleName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderActivityCollection ResponderActivityCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_responder_activities.rb.html) to see an example of how to use list_responder_activities API.
    def list_responder_activities(problem_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_responder_activities.' if logger

      raise "Missing the required parameter 'problem_id' when calling list_responder_activities." if problem_id.nil?

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated responderRuleName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, responderRuleName.'
      end
      raise "Parameter value for 'problem_id' must not be blank" if OCI::Internal::Util.blank_string?(problem_id)

      path = '/problems/{problemId}/responderActivities'.sub('{problemId}', problem_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_responder_activities') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderActivityCollection'
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


    # Returns a list of Responder Executions. A Responder Execution is an entity that tracks the collective execution of multiple Responder Rule Executions for a given Problem.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #    (default to false)
    # @option opts [String] :access_level Valid values are `RESTRICTED` and `ACCESSIBLE`. Default is `RESTRICTED`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment).
    #   When set to `RESTRICTED` permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [Array<String>] :responder_rule_ids Responder Rule Ids filter for the Responder Executions. (default to [])
    # @option opts [DateTime] :time_created_greater_than_or_equal_to Creation Start time for filtering
    # @option opts [DateTime] :time_created_less_than_or_equal_to Creation End time for filtering
    # @option opts [DateTime] :time_completed_greater_than_or_equal_to Completion End Time
    # @option opts [DateTime] :time_completed_less_than_or_equal_to Completion Start Time
    # @option opts [String] :target_id The ID of the target in which to list resources.
    # @option opts [String] :resource_type Resource Type associated with the resource.
    # @option opts [String] :responder_type The field to list the Responder Executions by Responder Type. Valid values are REMEDIATION and NOTIFICATION
    #
    #   Allowed values are: REMEDIATION, NOTIFICATION
    # @option opts [String] :responder_execution_status The status of the responder execution in which to list responders. (default to ALL)
    # @option opts [String] :responder_execution_mode The mode of the responder execution in which to list responders. (default to ALL)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for responderRuleName and resourceName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, responderRuleName, resourceName, timeCompleted
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderExecutionCollection ResponderExecutionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_responder_executions.rb.html) to see an example of how to use list_responder_executions API.
    def list_responder_executions(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_responder_executions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_responder_executions." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:responder_type] && !%w[REMEDIATION NOTIFICATION].include?(opts[:responder_type])
        raise 'Invalid value for "responder_type", must be one of REMEDIATION, NOTIFICATION.'
      end

      if opts[:responder_execution_status] && !OCI::CloudGuard::Models::RESPONDER_EXECUTION_STATES_ENUM.include?(opts[:responder_execution_status])
        raise 'Invalid value for "responder_execution_status", must be one of the values in OCI::CloudGuard::Models::RESPONDER_EXECUTION_STATES_ENUM.'
      end

      if opts[:responder_execution_mode] && !OCI::CloudGuard::Models::RESPONDER_EXECUTION_MODES_ENUM.include?(opts[:responder_execution_mode])
        raise 'Invalid value for "responder_execution_mode", must be one of the values in OCI::CloudGuard::Models::RESPONDER_EXECUTION_MODES_ENUM.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated responderRuleName resourceName timeCompleted].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, responderRuleName, resourceName, timeCompleted.'
      end

      path = '/responderExecutions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:responderRuleIds] = OCI::ApiClient.build_collection_params(opts[:responder_rule_ids], :multi) if opts[:responder_rule_ids] && !opts[:responder_rule_ids].empty?
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThanOrEqualTo] = opts[:time_created_less_than_or_equal_to] if opts[:time_created_less_than_or_equal_to]
      query_params[:timeCompletedGreaterThanOrEqualTo] = opts[:time_completed_greater_than_or_equal_to] if opts[:time_completed_greater_than_or_equal_to]
      query_params[:timeCompletedLessThanOrEqualTo] = opts[:time_completed_less_than_or_equal_to] if opts[:time_completed_less_than_or_equal_to]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:resourceType] = opts[:resource_type] if opts[:resource_type]
      query_params[:responderType] = opts[:responder_type] if opts[:responder_type]
      query_params[:responderExecutionStatus] = opts[:responder_execution_status] if opts[:responder_execution_status]
      query_params[:responderExecutionMode] = opts[:responder_execution_mode] if opts[:responder_execution_mode]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_responder_executions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderExecutionCollection'
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


    # Returns a list of ResponderRule associated with ResponderRecipe.
    #
    # @param [String] responder_recipe_id OCID of ResponderRecipe
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for displayName is ascending. If no value is specified displayName is default.
    #    (default to displayName)
    #   Allowed values are: displayName, riskLevel
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderRecipeResponderRuleCollection ResponderRecipeResponderRuleCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_responder_recipe_responder_rules.rb.html) to see an example of how to use list_responder_recipe_responder_rules API.
    def list_responder_recipe_responder_rules(responder_recipe_id, compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_responder_recipe_responder_rules.' if logger

      raise "Missing the required parameter 'responder_recipe_id' when calling list_responder_recipe_responder_rules." if responder_recipe_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_responder_recipe_responder_rules." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName riskLevel].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, riskLevel.'
      end
      raise "Parameter value for 'responder_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_recipe_id)

      path = '/responderRecipes/{responderRecipeId}/responderRules'.sub('{responderRecipeId}', responder_recipe_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_responder_recipe_responder_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderRecipeResponderRuleCollection'
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


    # Returns a list of all ResponderRecipes in a compartment
    # The ListResponderRecipe operation returns only the targets in `compartmentId` passed.
    # The list does not include any subcompartments of the compartmentId passed.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform ListResponderRecipe on the
    # `compartmentId` passed and when it is set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ACCESSIBLE.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :resource_metadata_only Default is false.
    #   When set to true, the list of all Oracle Managed Resources
    #   Metadata supported by Cloud Guard is returned.
    #    (default to false)
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #    (default to false)
    # @option opts [String] :access_level Valid values are `RESTRICTED` and `ACCESSIBLE`. Default is `RESTRICTED`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment).
    #   When set to `RESTRICTED` permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderRecipeCollection ResponderRecipeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_responder_recipes.rb.html) to see an example of how to use list_responder_recipes API.
    def list_responder_recipes(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_responder_recipes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_responder_recipes." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/responderRecipes'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:resourceMetadataOnly] = opts[:resource_metadata_only] if !opts[:resource_metadata_only].nil?
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_responder_recipes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderRecipeCollection'
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


    # Returns a list of ResponderRule.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderRuleCollection ResponderRuleCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_responder_rules.rb.html) to see an example of how to use list_responder_rules API.
    def list_responder_rules(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_responder_rules.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_responder_rules." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/responderRules'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_responder_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderRuleCollection'
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


    # Returns a list of DetectorRule associated with DetectorRecipe within a Target.
    #
    # @param [String] target_id OCID of target
    # @param [String] target_detector_recipe_id OCID of TargetDetectorRecipe
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for displayName is ascending. If no value is specified displayName is default.
    #    (default to displayName)
    #   Allowed values are: displayName, riskLevel
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRuleCollection TargetDetectorRecipeDetectorRuleCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_target_detector_recipe_detector_rules.rb.html) to see an example of how to use list_target_detector_recipe_detector_rules API.
    def list_target_detector_recipe_detector_rules(target_id, target_detector_recipe_id, compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_target_detector_recipe_detector_rules.' if logger

      raise "Missing the required parameter 'target_id' when calling list_target_detector_recipe_detector_rules." if target_id.nil?
      raise "Missing the required parameter 'target_detector_recipe_id' when calling list_target_detector_recipe_detector_rules." if target_detector_recipe_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_target_detector_recipe_detector_rules." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName riskLevel].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, riskLevel.'
      end
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)
      raise "Parameter value for 'target_detector_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(target_detector_recipe_id)

      path = '/targets/{targetId}/targetDetectorRecipes/{targetDetectorRecipeId}/detectorRules'.sub('{targetId}', target_id.to_s).sub('{targetDetectorRecipeId}', target_detector_recipe_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_target_detector_recipe_detector_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRuleCollection'
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


    # Returns a list of all detector recipes associated with the target identified by targetId
    # @param [String] target_id OCID of target
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetDetectorRecipeCollection TargetDetectorRecipeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_target_detector_recipes.rb.html) to see an example of how to use list_target_detector_recipes API.
    def list_target_detector_recipes(target_id, compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_target_detector_recipes.' if logger

      raise "Missing the required parameter 'target_id' when calling list_target_detector_recipes." if target_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_target_detector_recipes." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)

      path = '/targets/{targetId}/targetDetectorRecipes'.sub('{targetId}', target_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_target_detector_recipes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetDetectorRecipeCollection'
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


    # Returns a list of ResponderRule associated with ResponderRecipe within a Target.
    #
    # @param [String] target_id OCID of target
    # @param [String] target_responder_recipe_id OCID of TargetResponderRecipe
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for displayName is ascending. If no value is specified displayName is default.
    #    (default to displayName)
    #   Allowed values are: displayName, riskLevel
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetResponderRecipeResponderRuleCollection TargetResponderRecipeResponderRuleCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_target_responder_recipe_responder_rules.rb.html) to see an example of how to use list_target_responder_recipe_responder_rules API.
    def list_target_responder_recipe_responder_rules(target_id, target_responder_recipe_id, compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_target_responder_recipe_responder_rules.' if logger

      raise "Missing the required parameter 'target_id' when calling list_target_responder_recipe_responder_rules." if target_id.nil?
      raise "Missing the required parameter 'target_responder_recipe_id' when calling list_target_responder_recipe_responder_rules." if target_responder_recipe_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_target_responder_recipe_responder_rules." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName riskLevel].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, riskLevel.'
      end
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)
      raise "Parameter value for 'target_responder_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(target_responder_recipe_id)

      path = '/targets/{targetId}/targetResponderRecipes/{targetResponderRecipeId}/responderRules'.sub('{targetId}', target_id.to_s).sub('{targetResponderRecipeId}', target_responder_recipe_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_target_responder_recipe_responder_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetResponderRecipeResponderRuleCollection'
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


    # Returns a list of all responder recipes associated with the target identified by targetId
    # @param [String] target_id OCID of target
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetResponderRecipeCollection TargetResponderRecipeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_target_responder_recipes.rb.html) to see an example of how to use list_target_responder_recipes API.
    def list_target_responder_recipes(target_id, compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_target_responder_recipes.' if logger

      raise "Missing the required parameter 'target_id' when calling list_target_responder_recipes." if target_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_target_responder_recipes." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)

      path = '/targets/{targetId}/targetResponderRecipes'.sub('{targetId}', target_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_target_responder_recipes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetResponderRecipeCollection'
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


    # Returns a list of all Targets in a compartment
    # The ListTargets operation returns only the targets in `compartmentId` passed.
    # The list does not include any subcompartments of the compartmentId passed.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform ListTargets on the
    # `compartmentId` passed and when it is set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ACCESSIBLE.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :lifecycle_state The field life cycle state. Only one state can be provided. Default value for state is active. If no value is specified state is active. (default to ACTIVE)
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #    (default to false)
    # @option opts [String] :access_level Valid values are `RESTRICTED` and `ACCESSIBLE`. Default is `RESTRICTED`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment).
    #   When set to `RESTRICTED` permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc'. (default to ASC)
    # @option opts [String] :sort_by The field to sort by. Only one sort order may be provided. Default order for timeCreated is descending. Default order for displayName is ascending. If no value is specified timeCreated is default.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetCollection TargetCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/list_targets.rb.html) to see an example of how to use list_targets API.
    def list_targets(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#list_targets.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_targets." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::CloudGuard::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      if opts[:sort_order] && !OCI::CloudGuard::Models::SORT_ORDERS_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::CloudGuard::Models::SORT_ORDERS_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/targets'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#list_targets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetCollection'
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


    # Examines the number of problems related to the resource and the relative severity of those problems.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::RiskScoreAggregationCollection RiskScoreAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/request_risk_scores.rb.html) to see an example of how to use request_risk_scores API.
    def request_risk_scores(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#request_risk_scores.' if logger

      raise "Missing the required parameter 'compartment_id' when calling request_risk_scores." if compartment_id.nil?

      path = '/riskScores'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#request_risk_scores') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::RiskScoreAggregationCollection'
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


    # Measures the number of resources examined across all regions and compares it with the
    # number of problems detected, for a given time period.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_score_computed_greater_than_or_equal_to Start time for a filter. If start time is not specified, start time will be set to today's current time - 30 days.
    # @option opts [DateTime] :time_score_computed_less_than_or_equal_to End time for a filter. If end time is not specified, end time will be set to today's current time.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::SecurityScoreTrendAggregationCollection SecurityScoreTrendAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/request_security_score_summarized_trend.rb.html) to see an example of how to use request_security_score_summarized_trend API.
    def request_security_score_summarized_trend(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#request_security_score_summarized_trend.' if logger

      raise "Missing the required parameter 'compartment_id' when calling request_security_score_summarized_trend." if compartment_id.nil?

      path = '/securityScores/actions/summarizeTrend'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:timeScoreComputedGreaterThanOrEqualTo] = opts[:time_score_computed_greater_than_or_equal_to] if opts[:time_score_computed_greater_than_or_equal_to]
      query_params[:timeScoreComputedLessThanOrEqualTo] = opts[:time_score_computed_less_than_or_equal_to] if opts[:time_score_computed_less_than_or_equal_to]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#request_security_score_summarized_trend') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::SecurityScoreTrendAggregationCollection'
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


    # Measures the number of resources examined across all regions and compares it with the number of problems detected.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::SecurityScoreAggregationCollection SecurityScoreAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/request_security_scores.rb.html) to see an example of how to use request_security_scores API.
    def request_security_scores(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#request_security_scores.' if logger

      raise "Missing the required parameter 'compartment_id' when calling request_security_scores." if compartment_id.nil?

      path = '/securityScores'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#request_security_scores') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::SecurityScoreAggregationCollection'
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


    # Returns the summary of Activity type problems identified by cloud guard, for a given set of dimensions.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform summarize API on the
    # `compartmentId` passed and when it is set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ACCESSIBLE.
    #
    # The compartmentId to be passed with `accessLevel` and `compartmentIdInSubtree` params has to be the root
    # compartment id (tenant-id) only.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #    (default to false)
    # @option opts [String] :access_level Valid values are `RESTRICTED` and `ACCESSIBLE`. Default is `RESTRICTED`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment).
    #   When set to `RESTRICTED` permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [BOOLEAN] :include_unknown_locations Default is false.
    #   When set to true, the summary of activity problems that has unknown values for
    #   city, state or country will be included.
    #    (default to false)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ActivityProblemAggregationCollection ActivityProblemAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/request_summarized_activity_problems.rb.html) to see an example of how to use request_summarized_activity_problems API.
    def request_summarized_activity_problems(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#request_summarized_activity_problems.' if logger

      raise "Missing the required parameter 'compartment_id' when calling request_summarized_activity_problems." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      path = '/problems/actions/summarizeActivityProblems'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:includeUnknownLocations] = opts[:include_unknown_locations] if !opts[:include_unknown_locations].nil?
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#request_summarized_activity_problems') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ActivityProblemAggregationCollection'
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


    # Returns the number of problems identified by cloud guard, for a given set of dimensions.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform summarize API on the
    # `compartmentId` passed and when it is set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ACCESSIBLE.
    #
    # @param [Array<String>] list_dimensions The possible attributes based on which the problems can be distinguished.
    #   Allowed values are: RESOURCE_TYPE, REGION, COMPARTMENT_ID, RISK_LEVEL
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #    (default to false)
    # @option opts [String] :access_level Valid values are `RESTRICTED` and `ACCESSIBLE`. Default is `RESTRICTED`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment).
    #   When set to `RESTRICTED` permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ProblemAggregationCollection ProblemAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/request_summarized_problems.rb.html) to see an example of how to use request_summarized_problems API.
    def request_summarized_problems(list_dimensions, compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#request_summarized_problems.' if logger

      raise "Missing the required parameter 'list_dimensions' when calling request_summarized_problems." if list_dimensions.nil?

      list_dimensions_allowable_values = %w[RESOURCE_TYPE REGION COMPARTMENT_ID RISK_LEVEL]
      list_dimensions.each do |val_to_check|
        unless list_dimensions_allowable_values.include?(val_to_check)
          raise "Invalid value for 'list_dimensions', must be one of RESOURCE_TYPE, REGION, COMPARTMENT_ID, RISK_LEVEL."
        end
      end
      raise "Missing the required parameter 'compartment_id' when calling request_summarized_problems." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      path = '/problems/actions/summarize'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:listDimensions] = OCI::ApiClient.build_collection_params(list_dimensions, :multi)
      query_params[:compartmentId] = compartment_id
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#request_summarized_problems') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ProblemAggregationCollection'
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


    # Returns the number of Responder Executions, for a given set of dimensions.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform summarize API on the
    # `compartmentId` passed and when it is set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ACCESSIBLE.
    #
    # @param [Array<String>] responder_executions_dimensions The possible attributes based on which the responder executions can be distinguished
    #   Allowed values are: RESPONDER_RULE_TYPE, RESPONDER_EXECUTION_STATUS
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Array<String>] :responder_type_filter The possible filters for Responder Type Dimension to distinguish Responder Executions.
    #   If no values are passed, the metric for responder executions of all reponder types are returned
    #    (default to [])
    #   Allowed values are: REMEDIATION, NOTIFICATION
    # @option opts [Array<String>] :responder_execution_status_filter The possible filters for Responder Type Dimension to distinguish Responder Executions.
    #   If no values are passed, the metric for responder executions of all status are returned
    #    (default to [])
    #   Allowed values are: STARTED, AWAITING_CONFIRMATION, SUCCEEDED, FAILED, SKIPPED
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #    (default to false)
    # @option opts [String] :access_level Valid values are `RESTRICTED` and `ACCESSIBLE`. Default is `RESTRICTED`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment).
    #   When set to `RESTRICTED` permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderExecutionAggregationCollection ResponderExecutionAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/request_summarized_responder_executions.rb.html) to see an example of how to use request_summarized_responder_executions API.
    def request_summarized_responder_executions(responder_executions_dimensions, compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#request_summarized_responder_executions.' if logger

      raise "Missing the required parameter 'responder_executions_dimensions' when calling request_summarized_responder_executions." if responder_executions_dimensions.nil?

      responder_executions_dimensions_allowable_values = %w[RESPONDER_RULE_TYPE RESPONDER_EXECUTION_STATUS]
      responder_executions_dimensions.each do |val_to_check|
        unless responder_executions_dimensions_allowable_values.include?(val_to_check)
          raise "Invalid value for 'responder_executions_dimensions', must be one of RESPONDER_RULE_TYPE, RESPONDER_EXECUTION_STATUS."
        end
      end
      raise "Missing the required parameter 'compartment_id' when calling request_summarized_responder_executions." if compartment_id.nil?


      responder_type_filter_allowable_values = %w[REMEDIATION NOTIFICATION]
      if opts[:responder_type_filter] && !opts[:responder_type_filter].empty?
        opts[:responder_type_filter].each do |val_to_check|
          unless responder_type_filter_allowable_values.include?(val_to_check)
            raise 'Invalid value for "responder_type_filter", must be one of REMEDIATION, NOTIFICATION.'
          end
        end
      end


      responder_execution_status_filter_allowable_values = %w[STARTED AWAITING_CONFIRMATION SUCCEEDED FAILED SKIPPED]
      if opts[:responder_execution_status_filter] && !opts[:responder_execution_status_filter].empty?
        opts[:responder_execution_status_filter].each do |val_to_check|
          unless responder_execution_status_filter_allowable_values.include?(val_to_check)
            raise 'Invalid value for "responder_execution_status_filter", must be one of STARTED, AWAITING_CONFIRMATION, SUCCEEDED, FAILED, SKIPPED.'
          end
        end
      end

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      path = '/responderExecutions/actions/summarize'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:responderExecutionsDimensions] = OCI::ApiClient.build_collection_params(responder_executions_dimensions, :multi)
      query_params[:compartmentId] = compartment_id
      query_params[:responderTypeFilter] = OCI::ApiClient.build_collection_params(opts[:responder_type_filter], :multi) if opts[:responder_type_filter] && !opts[:responder_type_filter].empty?
      query_params[:responderExecutionStatusFilter] = OCI::ApiClient.build_collection_params(opts[:responder_execution_status_filter], :multi) if opts[:responder_execution_status_filter] && !opts[:responder_execution_status_filter].empty?
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#request_summarized_responder_executions') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderExecutionAggregationCollection'
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


    # DEPRECATED
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::RiskScoreAggregationCollection RiskScoreAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/request_summarized_risk_scores.rb.html) to see an example of how to use request_summarized_risk_scores API.
    def request_summarized_risk_scores(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#request_summarized_risk_scores.' if logger

      raise "Missing the required parameter 'compartment_id' when calling request_summarized_risk_scores." if compartment_id.nil?

      path = '/problems/actions/summarizeRiskScore'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#request_summarized_risk_scores') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::RiskScoreAggregationCollection'
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


    # DEPRECATED
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::SecurityScoreAggregationCollection SecurityScoreAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/request_summarized_security_scores.rb.html) to see an example of how to use request_summarized_security_scores API.
    def request_summarized_security_scores(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#request_summarized_security_scores.' if logger

      raise "Missing the required parameter 'compartment_id' when calling request_summarized_security_scores." if compartment_id.nil?

      path = '/problems/actions/summarizeSecurityScore'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#request_summarized_security_scores') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::SecurityScoreAggregationCollection'
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


    # Returns the number of problems identified by cloud guard, for a given time period.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform summarize API on the
    # `compartmentId` passed and when it is set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ACCESSIBLE.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_first_detected_greater_than_or_equal_to Start time for a filter. If start time is not specified, start time will be set to today's current time - 30 days.
    # @option opts [DateTime] :time_first_detected_less_than_or_equal_to End time for a filter. If end time is not specified, end time will be set to today's current time.
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #    (default to false)
    # @option opts [String] :access_level Valid values are `RESTRICTED` and `ACCESSIBLE`. Default is `RESTRICTED`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment).
    #   When set to `RESTRICTED` permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ProblemTrendAggregationCollection ProblemTrendAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/request_summarized_trend_problems.rb.html) to see an example of how to use request_summarized_trend_problems API.
    def request_summarized_trend_problems(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#request_summarized_trend_problems.' if logger

      raise "Missing the required parameter 'compartment_id' when calling request_summarized_trend_problems." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      path = '/problems/actions/summarizeTrend'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:timeFirstDetectedGreaterThanOrEqualTo] = opts[:time_first_detected_greater_than_or_equal_to] if opts[:time_first_detected_greater_than_or_equal_to]
      query_params[:timeFirstDetectedLessThanOrEqualTo] = opts[:time_first_detected_less_than_or_equal_to] if opts[:time_first_detected_less_than_or_equal_to]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#request_summarized_trend_problems') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ProblemTrendAggregationCollection'
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


    # Returns the number of remediations performed by Responders, for a given time period.
    #
    # The parameter `accessLevel` specifies whether to return only those compartments for which the
    # requestor has INSPECT permissions on at least one resource directly
    # or indirectly (ACCESSIBLE) (the resource can be in a subcompartment) or to return Not Authorized if
    # Principal doesn't have access to even one of the child compartments. This is valid only when
    # `compartmentIdInSubtree` is set to `true`.
    #
    # The parameter `compartmentIdInSubtree` applies when you perform summarize API on the
    # `compartmentId` passed and when it is set to true, the entire hierarchy of compartments can be returned.
    # To get a full list of all compartments and subcompartments in the tenancy (root compartment),
    # set the parameter `compartmentIdInSubtree` to true and `accessLevel` to ACCESSIBLE.
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_completed_greater_than_or_equal_to Completion End Time
    # @option opts [DateTime] :time_completed_less_than_or_equal_to Completion Start Time
    # @option opts [BOOLEAN] :compartment_id_in_subtree Default is false.
    #   When set to true, the hierarchy of compartments is traversed
    #   and all compartments and subcompartments in the tenancy are
    #   returned depending on the the setting of `accessLevel`.
    #    (default to false)
    # @option opts [String] :access_level Valid values are `RESTRICTED` and `ACCESSIBLE`. Default is `RESTRICTED`.
    #   Setting this to `ACCESSIBLE` returns only those compartments for which the
    #   user has INSPECT permissions directly or indirectly (permissions can be on a
    #   resource in a subcompartment).
    #   When set to `RESTRICTED` permissions are checked and no partial results are displayed.
    #    (default to RESTRICTED)
    #   Allowed values are: RESTRICTED, ACCESSIBLE
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderExecutionTrendAggregationCollection ResponderExecutionTrendAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/request_summarized_trend_responder_executions.rb.html) to see an example of how to use request_summarized_trend_responder_executions API.
    def request_summarized_trend_responder_executions(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#request_summarized_trend_responder_executions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling request_summarized_trend_responder_executions." if compartment_id.nil?

      if opts[:access_level] && !%w[RESTRICTED ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of RESTRICTED, ACCESSIBLE.'
      end

      path = '/responderExecutions/actions/summarizeTrend'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:timeCompletedGreaterThanOrEqualTo] = opts[:time_completed_greater_than_or_equal_to] if opts[:time_completed_greater_than_or_equal_to]
      query_params[:timeCompletedLessThanOrEqualTo] = opts[:time_completed_less_than_or_equal_to] if opts[:time_completed_less_than_or_equal_to]
      query_params[:compartmentIdInSubtree] = opts[:compartment_id_in_subtree] if !opts[:compartment_id_in_subtree].nil?
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#request_summarized_trend_responder_executions') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderExecutionTrendAggregationCollection'
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


    # DEPRECATED
    #
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [DateTime] :time_score_computed_greater_than_or_equal_to Start time for a filter. If start time is not specified, start time will be set to today's current time - 30 days.
    # @option opts [DateTime] :time_score_computed_less_than_or_equal_to End time for a filter. If end time is not specified, end time will be set to today's current time.
    # @option opts [Integer] :limit The maximum number of items to return. (default to 10)
    # @option opts [String] :page The page token representing the page at which to start retrieving results. This is usually retrieved from a previous list call.
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::SecurityScoreTrendAggregationCollection SecurityScoreTrendAggregationCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/request_summarized_trend_security_scores.rb.html) to see an example of how to use request_summarized_trend_security_scores API.
    def request_summarized_trend_security_scores(compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#request_summarized_trend_security_scores.' if logger

      raise "Missing the required parameter 'compartment_id' when calling request_summarized_trend_security_scores." if compartment_id.nil?

      path = '/problems/actions/summarizeSecurityScoreTrend'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:timeScoreComputedGreaterThanOrEqualTo] = opts[:time_score_computed_greater_than_or_equal_to] if opts[:time_score_computed_greater_than_or_equal_to]
      query_params[:timeScoreComputedLessThanOrEqualTo] = opts[:time_score_computed_less_than_or_equal_to] if opts[:time_score_computed_less_than_or_equal_to]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#request_summarized_trend_security_scores') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::SecurityScoreTrendAggregationCollection'
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


    # Skips the execution for a bulk of responder executions
    # The operation is atomic in nature
    #
    # @param [OCI::CloudGuard::Models::SkipBulkResponderExecutionDetails] skip_bulk_responder_execution_details A list of responder execution ids to skip the execution
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/skip_bulk_responder_execution.rb.html) to see an example of how to use skip_bulk_responder_execution API.
    def skip_bulk_responder_execution(skip_bulk_responder_execution_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#skip_bulk_responder_execution.' if logger

      raise "Missing the required parameter 'skip_bulk_responder_execution_details' when calling skip_bulk_responder_execution." if skip_bulk_responder_execution_details.nil?

      path = '/responderExecutions/actions/bulkSkip'
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

      post_body = @api_client.object_to_http_body(skip_bulk_responder_execution_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#skip_bulk_responder_execution') do
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


    # Skips the execution of the responder execution. When provided, If-Match is checked against ETag values of the resource.
    # @param [String] responder_execution_id The identifier of the responder execution.
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/skip_responder_execution.rb.html) to see an example of how to use skip_responder_execution API.
    def skip_responder_execution(responder_execution_id, compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#skip_responder_execution.' if logger

      raise "Missing the required parameter 'responder_execution_id' when calling skip_responder_execution." if responder_execution_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling skip_responder_execution." if compartment_id.nil?
      raise "Parameter value for 'responder_execution_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_execution_id)

      path = '/responderExecutions/{responderExecutionId}/actions/skip'.sub('{responderExecutionId}', responder_execution_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#skip_responder_execution') do
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


    # push the problem to responder
    #
    # @param [String] problem_id OCId of the problem.
    # @param [OCI::CloudGuard::Models::TriggerResponderDetails] trigger_responder_details The responder may update the problem.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/trigger_responder.rb.html) to see an example of how to use trigger_responder API.
    def trigger_responder(problem_id, trigger_responder_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#trigger_responder.' if logger

      raise "Missing the required parameter 'problem_id' when calling trigger_responder." if problem_id.nil?
      raise "Missing the required parameter 'trigger_responder_details' when calling trigger_responder." if trigger_responder_details.nil?
      raise "Parameter value for 'problem_id' must not be blank" if OCI::Internal::Util.blank_string?(problem_id)

      path = '/problems/{problemId}/actions/triggerResponder'.sub('{problemId}', problem_id.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(trigger_responder_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#trigger_responder') do
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


    # Updates the statuses in bulk for a list of problems
    # The operation is atomic in nature
    #
    # @param [OCI::CloudGuard::Models::UpdateBulkProblemStatusDetails] update_bulk_problem_status_details A list of problem ids to be passed in to update the Problem status
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/update_bulk_problem_status.rb.html) to see an example of how to use update_bulk_problem_status API.
    def update_bulk_problem_status(update_bulk_problem_status_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#update_bulk_problem_status.' if logger

      raise "Missing the required parameter 'update_bulk_problem_status_details' when calling update_bulk_problem_status." if update_bulk_problem_status_details.nil?

      path = '/problems/actions/bulkUpdateStatus'
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

      post_body = @api_client.object_to_http_body(update_bulk_problem_status_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#update_bulk_problem_status') do
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


    # Enable/Disable Cloud Guard. The reporting region cannot be updated once created.
    #
    # @param [OCI::CloudGuard::Models::UpdateConfigurationDetails] update_configuration_details Update Configuration Details of Cloud Guard for a Tenancy.
    # @param [String] compartment_id The ID of the compartment in which to list resources.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::Configuration Configuration}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/update_configuration.rb.html) to see an example of how to use update_configuration API.
    def update_configuration(update_configuration_details, compartment_id, opts = {})
      logger.debug 'Calling operation CloudGuardClient#update_configuration.' if logger

      raise "Missing the required parameter 'update_configuration_details' when calling update_configuration." if update_configuration_details.nil?
      raise "Missing the required parameter 'compartment_id' when calling update_configuration." if compartment_id.nil?

      path = '/configuration'
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(update_configuration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#update_configuration') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::Configuration'
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


    # Updates a detector recipe identified by detectorRecipeId
    # @param [String] detector_recipe_id DetectorRecipe OCID
    # @param [OCI::CloudGuard::Models::UpdateDetectorRecipeDetails] update_detector_recipe_details Details for the DetectorRecipe to be updated
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::DetectorRecipe DetectorRecipe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/update_detector_recipe.rb.html) to see an example of how to use update_detector_recipe API.
    def update_detector_recipe(detector_recipe_id, update_detector_recipe_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#update_detector_recipe.' if logger

      raise "Missing the required parameter 'detector_recipe_id' when calling update_detector_recipe." if detector_recipe_id.nil?
      raise "Missing the required parameter 'update_detector_recipe_details' when calling update_detector_recipe." if update_detector_recipe_details.nil?
      raise "Parameter value for 'detector_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_recipe_id)

      path = '/detectorRecipes/{detectorRecipeId}'.sub('{detectorRecipeId}', detector_recipe_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_detector_recipe_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#update_detector_recipe') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::DetectorRecipe'
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


    # Update the DetectorRule by identifier
    # @param [String] detector_recipe_id DetectorRecipe OCID
    # @param [String] detector_rule_id The key of Detector Rule.
    # @param [OCI::CloudGuard::Models::UpdateDetectorRecipeDetectorRuleDetails] update_detector_recipe_detector_rule_details The details to be updated for DetectorRule.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::DetectorRecipeDetectorRule DetectorRecipeDetectorRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/update_detector_recipe_detector_rule.rb.html) to see an example of how to use update_detector_recipe_detector_rule API.
    def update_detector_recipe_detector_rule(detector_recipe_id, detector_rule_id, update_detector_recipe_detector_rule_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#update_detector_recipe_detector_rule.' if logger

      raise "Missing the required parameter 'detector_recipe_id' when calling update_detector_recipe_detector_rule." if detector_recipe_id.nil?
      raise "Missing the required parameter 'detector_rule_id' when calling update_detector_recipe_detector_rule." if detector_rule_id.nil?
      raise "Missing the required parameter 'update_detector_recipe_detector_rule_details' when calling update_detector_recipe_detector_rule." if update_detector_recipe_detector_rule_details.nil?
      raise "Parameter value for 'detector_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_recipe_id)
      raise "Parameter value for 'detector_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_rule_id)

      path = '/detectorRecipes/{detectorRecipeId}/detectorRules/{detectorRuleId}'.sub('{detectorRecipeId}', detector_recipe_id.to_s).sub('{detectorRuleId}', detector_rule_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_detector_recipe_detector_rule_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#update_detector_recipe_detector_rule') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::DetectorRecipeDetectorRule'
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


    # Updates a managed list identified by managedListId
    # @param [String] managed_list_id The cloudguard list OCID to be passed in the request.
    # @param [OCI::CloudGuard::Models::UpdateManagedListDetails] update_managed_list_details Details for the ManagedList to be updated
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ManagedList ManagedList}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/update_managed_list.rb.html) to see an example of how to use update_managed_list API.
    def update_managed_list(managed_list_id, update_managed_list_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#update_managed_list.' if logger

      raise "Missing the required parameter 'managed_list_id' when calling update_managed_list." if managed_list_id.nil?
      raise "Missing the required parameter 'update_managed_list_details' when calling update_managed_list." if update_managed_list_details.nil?
      raise "Parameter value for 'managed_list_id' must not be blank" if OCI::Internal::Util.blank_string?(managed_list_id)

      path = '/managedLists/{managedListId}'.sub('{managedListId}', managed_list_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_managed_list_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#update_managed_list') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ManagedList'
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


    # updates the problem details
    #
    # @param [String] problem_id OCId of the problem.
    # @param [OCI::CloudGuard::Models::UpdateProblemStatusDetails] update_problem_status_details The additional details for the problem.
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
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::Problem Problem}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/update_problem_status.rb.html) to see an example of how to use update_problem_status API.
    def update_problem_status(problem_id, update_problem_status_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#update_problem_status.' if logger

      raise "Missing the required parameter 'problem_id' when calling update_problem_status." if problem_id.nil?
      raise "Missing the required parameter 'update_problem_status_details' when calling update_problem_status." if update_problem_status_details.nil?
      raise "Parameter value for 'problem_id' must not be blank" if OCI::Internal::Util.blank_string?(problem_id)

      path = '/problems/{problemId}/actions/updateStatus'.sub('{problemId}', problem_id.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(update_problem_status_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#update_problem_status') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::Problem'
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


    # Update the ResponderRecipe resource by identifier
    # @param [String] responder_recipe_id OCID of ResponderRecipe
    # @param [OCI::CloudGuard::Models::UpdateResponderRecipeDetails] update_responder_recipe_details The details to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderRecipe ResponderRecipe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/update_responder_recipe.rb.html) to see an example of how to use update_responder_recipe API.
    def update_responder_recipe(responder_recipe_id, update_responder_recipe_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#update_responder_recipe.' if logger

      raise "Missing the required parameter 'responder_recipe_id' when calling update_responder_recipe." if responder_recipe_id.nil?
      raise "Missing the required parameter 'update_responder_recipe_details' when calling update_responder_recipe." if update_responder_recipe_details.nil?
      raise "Parameter value for 'responder_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_recipe_id)

      path = '/responderRecipes/{responderRecipeId}'.sub('{responderRecipeId}', responder_recipe_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_responder_recipe_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#update_responder_recipe') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderRecipe'
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


    # Update the ResponderRule by identifier
    # @param [String] responder_recipe_id OCID of ResponderRecipe
    # @param [String] responder_rule_id The id of ResponderRule
    # @param [OCI::CloudGuard::Models::UpdateResponderRecipeResponderRuleDetails] update_responder_recipe_responder_rule_details The details to be updated for ResponderRule.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::ResponderRecipeResponderRule ResponderRecipeResponderRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/update_responder_recipe_responder_rule.rb.html) to see an example of how to use update_responder_recipe_responder_rule API.
    def update_responder_recipe_responder_rule(responder_recipe_id, responder_rule_id, update_responder_recipe_responder_rule_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#update_responder_recipe_responder_rule.' if logger

      raise "Missing the required parameter 'responder_recipe_id' when calling update_responder_recipe_responder_rule." if responder_recipe_id.nil?
      raise "Missing the required parameter 'responder_rule_id' when calling update_responder_recipe_responder_rule." if responder_rule_id.nil?
      raise "Missing the required parameter 'update_responder_recipe_responder_rule_details' when calling update_responder_recipe_responder_rule." if update_responder_recipe_responder_rule_details.nil?
      raise "Parameter value for 'responder_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_recipe_id)
      raise "Parameter value for 'responder_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_rule_id)

      path = '/responderRecipes/{responderRecipeId}/responderRules/{responderRuleId}'.sub('{responderRecipeId}', responder_recipe_id.to_s).sub('{responderRuleId}', responder_rule_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_responder_recipe_responder_rule_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#update_responder_recipe_responder_rule') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::ResponderRecipeResponderRule'
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


    # Updates a Target identified by targetId
    # @param [String] target_id OCID of target
    # @param [OCI::CloudGuard::Models::UpdateTargetDetails] update_target_details The information to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::Target Target}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/update_target.rb.html) to see an example of how to use update_target API.
    def update_target(target_id, update_target_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#update_target.' if logger

      raise "Missing the required parameter 'target_id' when calling update_target." if target_id.nil?
      raise "Missing the required parameter 'update_target_details' when calling update_target." if update_target_details.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)

      path = '/targets/{targetId}'.sub('{targetId}', target_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_target_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#update_target') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::Target'
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


    # Update the TargetDetectorRecipe resource by identifier
    # @param [String] target_id OCID of target
    # @param [String] target_detector_recipe_id OCID of TargetDetectorRecipe
    # @param [OCI::CloudGuard::Models::UpdateTargetDetectorRecipeDetails] update_target_detector_recipe_details The details to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetDetectorRecipe TargetDetectorRecipe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/update_target_detector_recipe.rb.html) to see an example of how to use update_target_detector_recipe API.
    def update_target_detector_recipe(target_id, target_detector_recipe_id, update_target_detector_recipe_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#update_target_detector_recipe.' if logger

      raise "Missing the required parameter 'target_id' when calling update_target_detector_recipe." if target_id.nil?
      raise "Missing the required parameter 'target_detector_recipe_id' when calling update_target_detector_recipe." if target_detector_recipe_id.nil?
      raise "Missing the required parameter 'update_target_detector_recipe_details' when calling update_target_detector_recipe." if update_target_detector_recipe_details.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)
      raise "Parameter value for 'target_detector_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(target_detector_recipe_id)

      path = '/targets/{targetId}/targetDetectorRecipes/{targetDetectorRecipeId}'.sub('{targetId}', target_id.to_s).sub('{targetDetectorRecipeId}', target_detector_recipe_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_target_detector_recipe_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#update_target_detector_recipe') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetDetectorRecipe'
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


    # Update the DetectorRule by identifier
    # @param [String] target_id OCID of target
    # @param [String] target_detector_recipe_id OCID of TargetDetectorRecipe
    # @param [String] detector_rule_id The id of DetectorRule
    # @param [OCI::CloudGuard::Models::UpdateTargetDetectorRecipeDetectorRuleDetails] update_target_detector_recipe_detector_rule_details The details to be updated for DetectorRule.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRule TargetDetectorRecipeDetectorRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/update_target_detector_recipe_detector_rule.rb.html) to see an example of how to use update_target_detector_recipe_detector_rule API.
    def update_target_detector_recipe_detector_rule(target_id, target_detector_recipe_id, detector_rule_id, update_target_detector_recipe_detector_rule_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#update_target_detector_recipe_detector_rule.' if logger

      raise "Missing the required parameter 'target_id' when calling update_target_detector_recipe_detector_rule." if target_id.nil?
      raise "Missing the required parameter 'target_detector_recipe_id' when calling update_target_detector_recipe_detector_rule." if target_detector_recipe_id.nil?
      raise "Missing the required parameter 'detector_rule_id' when calling update_target_detector_recipe_detector_rule." if detector_rule_id.nil?
      raise "Missing the required parameter 'update_target_detector_recipe_detector_rule_details' when calling update_target_detector_recipe_detector_rule." if update_target_detector_recipe_detector_rule_details.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)
      raise "Parameter value for 'target_detector_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(target_detector_recipe_id)
      raise "Parameter value for 'detector_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(detector_rule_id)

      path = '/targets/{targetId}/targetDetectorRecipes/{targetDetectorRecipeId}/detectorRules/{detectorRuleId}'.sub('{targetId}', target_id.to_s).sub('{targetDetectorRecipeId}', target_detector_recipe_id.to_s).sub('{detectorRuleId}', detector_rule_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_target_detector_recipe_detector_rule_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#update_target_detector_recipe_detector_rule') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetDetectorRecipeDetectorRule'
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


    # Update the TargetResponderRecipe resource by identifier
    # @param [String] target_id OCID of target
    # @param [String] target_responder_recipe_id OCID of TargetResponderRecipe
    # @param [OCI::CloudGuard::Models::UpdateTargetResponderRecipeDetails] update_target_responder_recipe_details The details to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetResponderRecipe TargetResponderRecipe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/update_target_responder_recipe.rb.html) to see an example of how to use update_target_responder_recipe API.
    def update_target_responder_recipe(target_id, target_responder_recipe_id, update_target_responder_recipe_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#update_target_responder_recipe.' if logger

      raise "Missing the required parameter 'target_id' when calling update_target_responder_recipe." if target_id.nil?
      raise "Missing the required parameter 'target_responder_recipe_id' when calling update_target_responder_recipe." if target_responder_recipe_id.nil?
      raise "Missing the required parameter 'update_target_responder_recipe_details' when calling update_target_responder_recipe." if update_target_responder_recipe_details.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)
      raise "Parameter value for 'target_responder_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(target_responder_recipe_id)

      path = '/targets/{targetId}/targetResponderRecipes/{targetResponderRecipeId}'.sub('{targetId}', target_id.to_s).sub('{targetResponderRecipeId}', target_responder_recipe_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_target_responder_recipe_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#update_target_responder_recipe') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetResponderRecipe'
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


    # Update the ResponderRule by identifier
    # @param [String] target_id OCID of target
    # @param [String] target_responder_recipe_id OCID of TargetResponderRecipe
    # @param [String] responder_rule_id The id of ResponderRule
    # @param [OCI::CloudGuard::Models::UpdateTargetResponderRecipeResponderRuleDetails] update_target_responder_recipe_responder_rule_details The details to be updated for ResponderRule.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id The client request ID for tracing.
    # @return [Response] A Response object with data of type {OCI::CloudGuard::Models::TargetResponderRecipeResponderRule TargetResponderRecipeResponderRule}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/cloudguard/update_target_responder_recipe_responder_rule.rb.html) to see an example of how to use update_target_responder_recipe_responder_rule API.
    def update_target_responder_recipe_responder_rule(target_id, target_responder_recipe_id, responder_rule_id, update_target_responder_recipe_responder_rule_details, opts = {})
      logger.debug 'Calling operation CloudGuardClient#update_target_responder_recipe_responder_rule.' if logger

      raise "Missing the required parameter 'target_id' when calling update_target_responder_recipe_responder_rule." if target_id.nil?
      raise "Missing the required parameter 'target_responder_recipe_id' when calling update_target_responder_recipe_responder_rule." if target_responder_recipe_id.nil?
      raise "Missing the required parameter 'responder_rule_id' when calling update_target_responder_recipe_responder_rule." if responder_rule_id.nil?
      raise "Missing the required parameter 'update_target_responder_recipe_responder_rule_details' when calling update_target_responder_recipe_responder_rule." if update_target_responder_recipe_responder_rule_details.nil?
      raise "Parameter value for 'target_id' must not be blank" if OCI::Internal::Util.blank_string?(target_id)
      raise "Parameter value for 'target_responder_recipe_id' must not be blank" if OCI::Internal::Util.blank_string?(target_responder_recipe_id)
      raise "Parameter value for 'responder_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(responder_rule_id)

      path = '/targets/{targetId}/targetResponderRecipes/{targetResponderRecipeId}/responderRules/{responderRuleId}'.sub('{targetId}', target_id.to_s).sub('{targetResponderRecipeId}', target_responder_recipe_id.to_s).sub('{responderRuleId}', responder_rule_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_target_responder_recipe_responder_rule_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'CloudGuardClient#update_target_responder_recipe_responder_rule') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::CloudGuard::Models::TargetResponderRecipeResponderRule'
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
