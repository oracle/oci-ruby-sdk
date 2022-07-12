# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API to create and maintain Oracle Digital Assistant service instances.
  class Oda::ManagementClient
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


    # Creates a new ManagementClient.
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
      logger.info "ManagementClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://digitalassistant-api.{region}.oci.{secondLevelDomain}') + '/20190506'
      logger.info "ManagementClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # This will store the provided parameters in the Digital Assistant instance and update any Digital Assistants with matching parameters.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::ConfigureDigitalAssistantParametersDetails] configure_digital_assistant_parameters_details The parameter values to use.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/configure_digital_assistant_parameters.rb.html) to see an example of how to use configure_digital_assistant_parameters API.
    def configure_digital_assistant_parameters(oda_instance_id, configure_digital_assistant_parameters_details, opts = {})
      logger.debug 'Calling operation ManagementClient#configure_digital_assistant_parameters.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling configure_digital_assistant_parameters." if oda_instance_id.nil?
      raise "Missing the required parameter 'configure_digital_assistant_parameters_details' when calling configure_digital_assistant_parameters." if configure_digital_assistant_parameters_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/actions/configureDigitalAssistantParameters'.sub('{odaInstanceId}', oda_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(configure_digital_assistant_parameters_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#configure_digital_assistant_parameters') do
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


    # Creates a new Authentication Provider
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::CreateAuthenticationProviderDetails] create_authentication_provider_details Property values required to create the new Authentication Provider.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::AuthenticationProvider AuthenticationProvider}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/create_authentication_provider.rb.html) to see an example of how to use create_authentication_provider API.
    def create_authentication_provider(oda_instance_id, create_authentication_provider_details, opts = {})
      logger.debug 'Calling operation ManagementClient#create_authentication_provider.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling create_authentication_provider." if oda_instance_id.nil?
      raise "Missing the required parameter 'create_authentication_provider_details' when calling create_authentication_provider." if create_authentication_provider_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/authenticationProviders'.sub('{odaInstanceId}', oda_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_authentication_provider_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#create_authentication_provider') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::AuthenticationProvider'
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


    # Creates a new Channel.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::CreateChannelDetails] create_channel_details Property values for creating the new Channel.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::CreateChannelResult CreateChannelResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/create_channel.rb.html) to see an example of how to use create_channel API.
    def create_channel(oda_instance_id, create_channel_details, opts = {})
      logger.debug 'Calling operation ManagementClient#create_channel.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling create_channel." if oda_instance_id.nil?
      raise "Missing the required parameter 'create_channel_details' when calling create_channel." if create_channel_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/channels'.sub('{odaInstanceId}', oda_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_channel_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#create_channel') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::CreateChannelResult'
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


    # Creates a new Digital Assistant.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::CreateDigitalAssistantDetails] create_digital_assistant_details Property values for creating the new Digital Assistant.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/create_digital_assistant.rb.html) to see an example of how to use create_digital_assistant API.
    def create_digital_assistant(oda_instance_id, create_digital_assistant_details, opts = {})
      logger.debug 'Calling operation ManagementClient#create_digital_assistant.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling create_digital_assistant." if oda_instance_id.nil?
      raise "Missing the required parameter 'create_digital_assistant_details' when calling create_digital_assistant." if create_digital_assistant_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/digitalAssistants'.sub('{odaInstanceId}', oda_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_digital_assistant_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#create_digital_assistant') do
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


    # Creates a new Skill from scratch.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::CreateSkillDetails] create_skill_details Property values for creating the Skill.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/create_skill.rb.html) to see an example of how to use create_skill API.
    def create_skill(oda_instance_id, create_skill_details, opts = {})
      logger.debug 'Calling operation ManagementClient#create_skill.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling create_skill." if oda_instance_id.nil?
      raise "Missing the required parameter 'create_skill_details' when calling create_skill." if create_skill_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/skills'.sub('{odaInstanceId}', oda_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_skill_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#create_skill') do
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


    # Creates a new Skill Parameter.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
    # @param [OCI::Oda::Models::CreateSkillParameterDetails] create_skill_parameter_details Property values for creating the new Skill Parameter.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::SkillParameter SkillParameter}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/create_skill_parameter.rb.html) to see an example of how to use create_skill_parameter API.
    def create_skill_parameter(oda_instance_id, skill_id, create_skill_parameter_details, opts = {})
      logger.debug 'Calling operation ManagementClient#create_skill_parameter.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling create_skill_parameter." if oda_instance_id.nil?
      raise "Missing the required parameter 'skill_id' when calling create_skill_parameter." if skill_id.nil?
      raise "Missing the required parameter 'create_skill_parameter_details' when calling create_skill_parameter." if create_skill_parameter_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'skill_id' must not be blank" if OCI::Internal::Util.blank_string?(skill_id)

      path = '/odaInstances/{odaInstanceId}/skills/{skillId}/parameters'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{skillId}', skill_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_skill_parameter_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#create_skill_parameter') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::SkillParameter'
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


    # Creates a new Translator
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::CreateTranslatorDetails] create_translator_details Property values to create the new Translator.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::Translator Translator}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/create_translator.rb.html) to see an example of how to use create_translator API.
    def create_translator(oda_instance_id, create_translator_details, opts = {})
      logger.debug 'Calling operation ManagementClient#create_translator.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling create_translator." if oda_instance_id.nil?
      raise "Missing the required parameter 'create_translator_details' when calling create_translator." if create_translator_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/translators'.sub('{odaInstanceId}', oda_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_translator_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#create_translator') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::Translator'
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


    # Delete the specified Authentication Provider.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] authentication_provider_id Unique Authentication Provider identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/delete_authentication_provider.rb.html) to see an example of how to use delete_authentication_provider API.
    def delete_authentication_provider(oda_instance_id, authentication_provider_id, opts = {})
      logger.debug 'Calling operation ManagementClient#delete_authentication_provider.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling delete_authentication_provider." if oda_instance_id.nil?
      raise "Missing the required parameter 'authentication_provider_id' when calling delete_authentication_provider." if authentication_provider_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'authentication_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(authentication_provider_id)

      path = '/odaInstances/{odaInstanceId}/authenticationProviders/{authenticationProviderId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{authenticationProviderId}', authentication_provider_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#delete_authentication_provider') do
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


    # Delete the specified Channel.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] channel_id Unique Channel identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/delete_channel.rb.html) to see an example of how to use delete_channel API.
    def delete_channel(oda_instance_id, channel_id, opts = {})
      logger.debug 'Calling operation ManagementClient#delete_channel.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling delete_channel." if oda_instance_id.nil?
      raise "Missing the required parameter 'channel_id' when calling delete_channel." if channel_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'channel_id' must not be blank" if OCI::Internal::Util.blank_string?(channel_id)

      path = '/odaInstances/{odaInstanceId}/channels/{channelId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{channelId}', channel_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#delete_channel') do
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


    # Delete the specified Digital Assistant.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] digital_assistant_id Unique Digital Assistant identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/delete_digital_assistant.rb.html) to see an example of how to use delete_digital_assistant API.
    def delete_digital_assistant(oda_instance_id, digital_assistant_id, opts = {})
      logger.debug 'Calling operation ManagementClient#delete_digital_assistant.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling delete_digital_assistant." if oda_instance_id.nil?
      raise "Missing the required parameter 'digital_assistant_id' when calling delete_digital_assistant." if digital_assistant_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'digital_assistant_id' must not be blank" if OCI::Internal::Util.blank_string?(digital_assistant_id)

      path = '/odaInstances/{odaInstanceId}/digitalAssistants/{digitalAssistantId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{digitalAssistantId}', digital_assistant_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#delete_digital_assistant') do
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


    # Delete the specified Skill.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/delete_skill.rb.html) to see an example of how to use delete_skill API.
    def delete_skill(oda_instance_id, skill_id, opts = {})
      logger.debug 'Calling operation ManagementClient#delete_skill.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling delete_skill." if oda_instance_id.nil?
      raise "Missing the required parameter 'skill_id' when calling delete_skill." if skill_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'skill_id' must not be blank" if OCI::Internal::Util.blank_string?(skill_id)

      path = '/odaInstances/{odaInstanceId}/skills/{skillId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{skillId}', skill_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#delete_skill') do
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


    # Delete the specified Skill Parameter.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
    # @param [String] parameter_name The name of a Skill Parameter.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/delete_skill_parameter.rb.html) to see an example of how to use delete_skill_parameter API.
    def delete_skill_parameter(oda_instance_id, skill_id, parameter_name, opts = {})
      logger.debug 'Calling operation ManagementClient#delete_skill_parameter.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling delete_skill_parameter." if oda_instance_id.nil?
      raise "Missing the required parameter 'skill_id' when calling delete_skill_parameter." if skill_id.nil?
      raise "Missing the required parameter 'parameter_name' when calling delete_skill_parameter." if parameter_name.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'skill_id' must not be blank" if OCI::Internal::Util.blank_string?(skill_id)
      raise "Parameter value for 'parameter_name' must not be blank" if OCI::Internal::Util.blank_string?(parameter_name)

      path = '/odaInstances/{odaInstanceId}/skills/{skillId}/parameters/{parameterName}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{skillId}', skill_id.to_s).sub('{parameterName}', parameter_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#delete_skill_parameter') do
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


    # Delete the specified Translator.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] translator_id Unique Translator identifier.
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/delete_translator.rb.html) to see an example of how to use delete_translator API.
    def delete_translator(oda_instance_id, translator_id, opts = {})
      logger.debug 'Calling operation ManagementClient#delete_translator.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling delete_translator." if oda_instance_id.nil?
      raise "Missing the required parameter 'translator_id' when calling delete_translator." if translator_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'translator_id' must not be blank" if OCI::Internal::Util.blank_string?(translator_id)

      path = '/odaInstances/{odaInstanceId}/translators/{translatorId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{translatorId}', translator_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#delete_translator') do
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


    # Exports the specified Digital Assistant as an archive to Object Storage.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] digital_assistant_id Unique Digital Assistant identifier.
    # @param [OCI::Oda::Models::ExportDigitalAssistantDetails] export_digital_assistant_details Where in Object Storage to export the Digital Assistant to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/export_digital_assistant.rb.html) to see an example of how to use export_digital_assistant API.
    def export_digital_assistant(oda_instance_id, digital_assistant_id, export_digital_assistant_details, opts = {})
      logger.debug 'Calling operation ManagementClient#export_digital_assistant.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling export_digital_assistant." if oda_instance_id.nil?
      raise "Missing the required parameter 'digital_assistant_id' when calling export_digital_assistant." if digital_assistant_id.nil?
      raise "Missing the required parameter 'export_digital_assistant_details' when calling export_digital_assistant." if export_digital_assistant_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'digital_assistant_id' must not be blank" if OCI::Internal::Util.blank_string?(digital_assistant_id)

      path = '/odaInstances/{odaInstanceId}/digitalAssistants/{digitalAssistantId}/actions/export'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{digitalAssistantId}', digital_assistant_id.to_s)
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

      post_body = @api_client.object_to_http_body(export_digital_assistant_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#export_digital_assistant') do
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


    # Exports the specified Skill as an archive to Object Storage.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
    # @param [OCI::Oda::Models::ExportSkillDetails] export_skill_details Where in Object Storage to export the Skill to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/export_skill.rb.html) to see an example of how to use export_skill API.
    def export_skill(oda_instance_id, skill_id, export_skill_details, opts = {})
      logger.debug 'Calling operation ManagementClient#export_skill.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling export_skill." if oda_instance_id.nil?
      raise "Missing the required parameter 'skill_id' when calling export_skill." if skill_id.nil?
      raise "Missing the required parameter 'export_skill_details' when calling export_skill." if export_skill_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'skill_id' must not be blank" if OCI::Internal::Util.blank_string?(skill_id)

      path = '/odaInstances/{odaInstanceId}/skills/{skillId}/actions/export'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{skillId}', skill_id.to_s)
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

      post_body = @api_client.object_to_http_body(export_skill_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#export_skill') do
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


    # Gets the specified Authentication Provider.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] authentication_provider_id Unique Authentication Provider identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::AuthenticationProvider AuthenticationProvider}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/get_authentication_provider.rb.html) to see an example of how to use get_authentication_provider API.
    def get_authentication_provider(oda_instance_id, authentication_provider_id, opts = {})
      logger.debug 'Calling operation ManagementClient#get_authentication_provider.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling get_authentication_provider." if oda_instance_id.nil?
      raise "Missing the required parameter 'authentication_provider_id' when calling get_authentication_provider." if authentication_provider_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'authentication_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(authentication_provider_id)

      path = '/odaInstances/{odaInstanceId}/authenticationProviders/{authenticationProviderId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{authenticationProviderId}', authentication_provider_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#get_authentication_provider') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::AuthenticationProvider'
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


    # Gets the specified Channel.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] channel_id Unique Channel identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::Channel Channel}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/get_channel.rb.html) to see an example of how to use get_channel API.
    def get_channel(oda_instance_id, channel_id, opts = {})
      logger.debug 'Calling operation ManagementClient#get_channel.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling get_channel." if oda_instance_id.nil?
      raise "Missing the required parameter 'channel_id' when calling get_channel." if channel_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'channel_id' must not be blank" if OCI::Internal::Util.blank_string?(channel_id)

      path = '/odaInstances/{odaInstanceId}/channels/{channelId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{channelId}', channel_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#get_channel') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::Channel'
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


    # Gets the specified Digital Assistant.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] digital_assistant_id Unique Digital Assistant identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::DigitalAssistant DigitalAssistant}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/get_digital_assistant.rb.html) to see an example of how to use get_digital_assistant API.
    def get_digital_assistant(oda_instance_id, digital_assistant_id, opts = {})
      logger.debug 'Calling operation ManagementClient#get_digital_assistant.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling get_digital_assistant." if oda_instance_id.nil?
      raise "Missing the required parameter 'digital_assistant_id' when calling get_digital_assistant." if digital_assistant_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'digital_assistant_id' must not be blank" if OCI::Internal::Util.blank_string?(digital_assistant_id)

      path = '/odaInstances/{odaInstanceId}/digitalAssistants/{digitalAssistantId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{digitalAssistantId}', digital_assistant_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#get_digital_assistant') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::DigitalAssistant'
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


    # Gets the specified Digital Assistant Parameter.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] digital_assistant_id Unique Digital Assistant identifier.
    # @param [String] parameter_name The name of a Digital Assistant Parameter.  This is unique with the Digital Assistant.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::DigitalAssistantParameter DigitalAssistantParameter}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/get_digital_assistant_parameter.rb.html) to see an example of how to use get_digital_assistant_parameter API.
    def get_digital_assistant_parameter(oda_instance_id, digital_assistant_id, parameter_name, opts = {})
      logger.debug 'Calling operation ManagementClient#get_digital_assistant_parameter.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling get_digital_assistant_parameter." if oda_instance_id.nil?
      raise "Missing the required parameter 'digital_assistant_id' when calling get_digital_assistant_parameter." if digital_assistant_id.nil?
      raise "Missing the required parameter 'parameter_name' when calling get_digital_assistant_parameter." if parameter_name.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'digital_assistant_id' must not be blank" if OCI::Internal::Util.blank_string?(digital_assistant_id)
      raise "Parameter value for 'parameter_name' must not be blank" if OCI::Internal::Util.blank_string?(parameter_name)

      path = '/odaInstances/{odaInstanceId}/digitalAssistants/{digitalAssistantId}/parameters/{parameterName}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{digitalAssistantId}', digital_assistant_id.to_s).sub('{parameterName}', parameter_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#get_digital_assistant_parameter') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::DigitalAssistantParameter'
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


    # Gets the specified Skill.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::Skill Skill}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/get_skill.rb.html) to see an example of how to use get_skill API.
    def get_skill(oda_instance_id, skill_id, opts = {})
      logger.debug 'Calling operation ManagementClient#get_skill.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling get_skill." if oda_instance_id.nil?
      raise "Missing the required parameter 'skill_id' when calling get_skill." if skill_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'skill_id' must not be blank" if OCI::Internal::Util.blank_string?(skill_id)

      path = '/odaInstances/{odaInstanceId}/skills/{skillId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{skillId}', skill_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#get_skill') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::Skill'
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


    # Gets the specified Skill Parameter.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
    # @param [String] parameter_name The name of a Skill Parameter.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::SkillParameter SkillParameter}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/get_skill_parameter.rb.html) to see an example of how to use get_skill_parameter API.
    def get_skill_parameter(oda_instance_id, skill_id, parameter_name, opts = {})
      logger.debug 'Calling operation ManagementClient#get_skill_parameter.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling get_skill_parameter." if oda_instance_id.nil?
      raise "Missing the required parameter 'skill_id' when calling get_skill_parameter." if skill_id.nil?
      raise "Missing the required parameter 'parameter_name' when calling get_skill_parameter." if parameter_name.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'skill_id' must not be blank" if OCI::Internal::Util.blank_string?(skill_id)
      raise "Parameter value for 'parameter_name' must not be blank" if OCI::Internal::Util.blank_string?(parameter_name)

      path = '/odaInstances/{odaInstanceId}/skills/{skillId}/parameters/{parameterName}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{skillId}', skill_id.to_s).sub('{parameterName}', parameter_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#get_skill_parameter') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::SkillParameter'
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


    # Gets the specified Translator.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] translator_id Unique Translator identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::Translator Translator}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/get_translator.rb.html) to see an example of how to use get_translator API.
    def get_translator(oda_instance_id, translator_id, opts = {})
      logger.debug 'Calling operation ManagementClient#get_translator.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling get_translator." if oda_instance_id.nil?
      raise "Missing the required parameter 'translator_id' when calling get_translator." if translator_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'translator_id' must not be blank" if OCI::Internal::Util.blank_string?(translator_id)

      path = '/odaInstances/{odaInstanceId}/translators/{translatorId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{translatorId}', translator_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#get_translator') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::Translator'
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


    # Import a Bot archive from Object Storage.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [OCI::Oda::Models::ImportBotDetails] import_bot_details Properties for where in Object Storage to import the Bot archive from.
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
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/import_bot.rb.html) to see an example of how to use import_bot API.
    def import_bot(oda_instance_id, import_bot_details, opts = {})
      logger.debug 'Calling operation ManagementClient#import_bot.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling import_bot." if oda_instance_id.nil?
      raise "Missing the required parameter 'import_bot_details' when calling import_bot." if import_bot_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/actions/importBot'.sub('{odaInstanceId}', oda_instance_id.to_s)
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

      post_body = @api_client.object_to_http_body(import_bot_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#import_bot') do
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


    # Returns a page of Authentication Providers that belong to the specified Digital Assistant instance.
    #
    # If the `opc-next-page` header appears in the response, then
    # there are more items to retrieve. To get the next page in the subsequent
    # GET request, include the header's value as the `page` query parameter.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :id Unique Authentication Provider identifier.
    # @option opts [String] :identity_provider List only Authentication Providers for this Identity Provider.
    # @option opts [String] :name List only the information for Authentication Providers with this name. Authentication Provider names are unique and may not change.
    #
    #   Example: `MyProvider`
    #
    # @option opts [String] :lifecycle_state List only the resources that are in this lifecycle state.
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
    # @option opts [String] :sort_by Sort on this field. You can specify one sort order only. The default sort field is `timeCreated`.
    #
    #   The default sort order for `timeCreated` and `timeUpdated` is descending.
    #   For all other sort fields the default sort order is ascending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, name, identityProvider
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::AuthenticationProviderCollection AuthenticationProviderCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/list_authentication_providers.rb.html) to see an example of how to use list_authentication_providers API.
    def list_authentication_providers(oda_instance_id, opts = {})
      logger.debug 'Calling operation ManagementClient#list_authentication_providers.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling list_authentication_providers." if oda_instance_id.nil?

      if opts[:identity_provider] && !OCI::Oda::Models::AUTHENTICATION_IDENTITY_PROVIDER_ENUM.include?(opts[:identity_provider])
        raise 'Invalid value for "identity_provider", must be one of the values in OCI::Oda::Models::AUTHENTICATION_IDENTITY_PROVIDER_ENUM.'
      end

      if opts[:lifecycle_state] && !OCI::Oda::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Oda::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated name identityProvider].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, name, identityProvider.'
      end
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/authenticationProviders'.sub('{odaInstanceId}', oda_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:identityProvider] = opts[:identity_provider] if opts[:identity_provider]
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#list_authentication_providers') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::AuthenticationProviderCollection'
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


    # Returns a page of Channels that belong to the specified Digital Assistant instance.
    #
    # If the `opc-next-page` header appears in the response, then
    # there are more items to retrieve. To get the next page in the subsequent
    # GET request, include the header's value as the `page` query parameter.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :id Unique Channel identifier.
    # @option opts [String] :name List only the information for Channels with this name. Channels names are unique and may not change.
    #
    #   Example: `MyChannel`
    #
    # @option opts [String] :category List only Channels with this category.
    # @option opts [String] :type List only Channels of this type.
    # @option opts [String] :lifecycle_state List only the resources that are in this lifecycle state.
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
    # @option opts [String] :sort_by Sort on this field. You can specify one sort order only. The default sort field is `timeCreated`.
    #
    #   The default sort order for `timeCreated` and `timeUpdated` is descending, and the default sort order for `name` is ascending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, name
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::ChannelCollection ChannelCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/list_channels.rb.html) to see an example of how to use list_channels API.
    def list_channels(oda_instance_id, opts = {})
      logger.debug 'Calling operation ManagementClient#list_channels.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling list_channels." if oda_instance_id.nil?

      if opts[:category] && !OCI::Oda::Models::CHANNEL_CATEGORY_ENUM.include?(opts[:category])
        raise 'Invalid value for "category", must be one of the values in OCI::Oda::Models::CHANNEL_CATEGORY_ENUM.'
      end

      if opts[:type] && !OCI::Oda::Models::CHANNEL_TYPE_ENUM.include?(opts[:type])
        raise 'Invalid value for "type", must be one of the values in OCI::Oda::Models::CHANNEL_TYPE_ENUM.'
      end

      if opts[:lifecycle_state] && !OCI::Oda::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Oda::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, name.'
      end
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/channels'.sub('{odaInstanceId}', oda_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:category] = opts[:category] if opts[:category]
      query_params[:type] = opts[:type] if opts[:type]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#list_channels') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::ChannelCollection'
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


    # Returns a page of Parameters that belong to the specified Digital Assistant.
    #
    # If the `opc-next-page` header appears in the response, then
    # there are more items to retrieve. To get the next page in the subsequent
    # GET request, include the header's value as the `page` query parameter.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] digital_assistant_id Unique Digital Assistant identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name List only Parameters with this name.
    # @option opts [String] :lifecycle_state List only the resources that are in this lifecycle state.
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
    # @option opts [String] :sort_by Sort on this field. You can specify one sort order only. The default sort field is `name`.
    #
    #   The default sort order is ascending.
    #    (default to name)
    #   Allowed values are: name, displayName, type
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::DigitalAssistantParameterCollection DigitalAssistantParameterCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/list_digital_assistant_parameters.rb.html) to see an example of how to use list_digital_assistant_parameters API.
    def list_digital_assistant_parameters(oda_instance_id, digital_assistant_id, opts = {})
      logger.debug 'Calling operation ManagementClient#list_digital_assistant_parameters.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling list_digital_assistant_parameters." if oda_instance_id.nil?
      raise "Missing the required parameter 'digital_assistant_id' when calling list_digital_assistant_parameters." if digital_assistant_id.nil?

      if opts[:lifecycle_state] && !OCI::Oda::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Oda::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[name displayName type].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, displayName, type.'
      end
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'digital_assistant_id' must not be blank" if OCI::Internal::Util.blank_string?(digital_assistant_id)

      path = '/odaInstances/{odaInstanceId}/digitalAssistants/{digitalAssistantId}/parameters'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{digitalAssistantId}', digital_assistant_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#list_digital_assistant_parameters') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::DigitalAssistantParameterCollection'
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


    # Returns a page of Digital Assistants that belong to the specified Digital Assistant instance.
    #
    # If the `opc-next-page` header appears in the response, then
    # there are more items to retrieve. To get the next page in the subsequent
    # GET request, include the header's value as the `page` query parameter.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :digital_assistant_id Unique Digital Assistant identifier.
    # @option opts [String] :category List only Bot resources with this category.
    # @option opts [String] :name List only Bot resources with this name. Names are unique and may not change.
    #
    #   Example: `MySkill`
    #
    # @option opts [String] :version List only Bot resources with this version. Versions are unique and may not change.
    #
    #   Example: `1.0`
    #
    # @option opts [String] :namespace List only Bot resources with this namespace. Namespaces may not change.
    #
    #   Example: `MyNamespace`
    #
    # @option opts [String] :platform_version List only Bot resources with this platform version.
    #
    # @option opts [String] :lifecycle_state List only the resources that are in this lifecycle state.
    # @option opts [String] :lifecycle_details List only Bot resources with this lifecycle details.
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
    # @option opts [String] :sort_by Sort on this field. You can specify one sort order only. The default sort field is `timeCreated`.
    #
    #   The default sort order for `timeCreated` and `timeUpdated` is descending.
    #   For all other sort fields the default sort order is ascending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, name
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::DigitalAssistantCollection DigitalAssistantCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/list_digital_assistants.rb.html) to see an example of how to use list_digital_assistants API.
    def list_digital_assistants(oda_instance_id, opts = {})
      logger.debug 'Calling operation ManagementClient#list_digital_assistants.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling list_digital_assistants." if oda_instance_id.nil?

      if opts[:lifecycle_state] && !OCI::Oda::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Oda::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, name.'
      end
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/digitalAssistants'.sub('{odaInstanceId}', oda_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:digitalAssistantId] = opts[:digital_assistant_id] if opts[:digital_assistant_id]
      query_params[:category] = opts[:category] if opts[:category]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:version] = opts[:version] if opts[:version]
      query_params[:namespace] = opts[:namespace] if opts[:namespace]
      query_params[:platformVersion] = opts[:platform_version] if opts[:platform_version]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:lifecycleDetails] = opts[:lifecycle_details] if opts[:lifecycle_details]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#list_digital_assistants') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::DigitalAssistantCollection'
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


    # Returns a page of Skill Parameters that belong to the specified Skill.
    #
    # If the `opc-next-page` header appears in the response, then
    # there are more items to retrieve. To get the next page in the subsequent
    # GET request, include the header's value as the `page` query parameter.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :name List only Parameters with this name.
    # @option opts [String] :lifecycle_state List only the resources that are in this lifecycle state.
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
    # @option opts [String] :sort_by Sort on this field. You can specify one sort order only. The default sort field is `name`.
    #
    #   The default sort order is ascending.
    #    (default to name)
    #   Allowed values are: name, displayName, type
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::SkillParameterCollection SkillParameterCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/list_skill_parameters.rb.html) to see an example of how to use list_skill_parameters API.
    def list_skill_parameters(oda_instance_id, skill_id, opts = {})
      logger.debug 'Calling operation ManagementClient#list_skill_parameters.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling list_skill_parameters." if oda_instance_id.nil?
      raise "Missing the required parameter 'skill_id' when calling list_skill_parameters." if skill_id.nil?

      if opts[:lifecycle_state] && !OCI::Oda::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Oda::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[name displayName type].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, displayName, type.'
      end
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'skill_id' must not be blank" if OCI::Internal::Util.blank_string?(skill_id)

      path = '/odaInstances/{odaInstanceId}/skills/{skillId}/parameters'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{skillId}', skill_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#list_skill_parameters') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::SkillParameterCollection'
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


    # Returns a page of Skills that belong to the specified Digital Assistant instance.
    #
    # If the `opc-next-page` header appears in the response, then
    # there are more items to retrieve. To get the next page in the subsequent
    # GET request, include the header's value as the `page` query parameter.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :skill_id Unique Skill identifier.
    # @option opts [String] :category List only Bot resources with this category.
    # @option opts [String] :name List only Bot resources with this name. Names are unique and may not change.
    #
    #   Example: `MySkill`
    #
    # @option opts [String] :version List only Bot resources with this version. Versions are unique and may not change.
    #
    #   Example: `1.0`
    #
    # @option opts [String] :namespace List only Bot resources with this namespace. Namespaces may not change.
    #
    #   Example: `MyNamespace`
    #
    # @option opts [String] :platform_version List only Bot resources with this platform version.
    #
    # @option opts [String] :lifecycle_state List only the resources that are in this lifecycle state.
    # @option opts [String] :lifecycle_details List only Bot resources with this lifecycle details.
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
    # @option opts [String] :sort_by Sort on this field. You can specify one sort order only. The default sort field is `timeCreated`.
    #
    #   The default sort order for `timeCreated` and `timeUpdated` is descending.
    #   For all other sort fields the default sort order is ascending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, name
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::SkillCollection SkillCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/list_skills.rb.html) to see an example of how to use list_skills API.
    def list_skills(oda_instance_id, opts = {})
      logger.debug 'Calling operation ManagementClient#list_skills.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling list_skills." if oda_instance_id.nil?

      if opts[:lifecycle_state] && !OCI::Oda::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Oda::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated name].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, name.'
      end
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/skills'.sub('{odaInstanceId}', oda_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:skillId] = opts[:skill_id] if opts[:skill_id]
      query_params[:category] = opts[:category] if opts[:category]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:version] = opts[:version] if opts[:version]
      query_params[:namespace] = opts[:namespace] if opts[:namespace]
      query_params[:platformVersion] = opts[:platform_version] if opts[:platform_version]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:lifecycleDetails] = opts[:lifecycle_details] if opts[:lifecycle_details]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#list_skills') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::SkillCollection'
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


    # Returns a page of Translators that belong to the specified Digital Assistant instance.
    #
    # If the `opc-next-page` header appears in the response, then
    # there are more items to retrieve. To get the next page in the subsequent
    # GET request, include the header's value as the `page` query parameter.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :id Unique Translator identifier.
    # @option opts [String] :type List only Translators of this type.
    # @option opts [String] :name List only Translators with this name. Translator names are unique and may not change.
    #
    #   Example: `MyTranslator`
    #
    # @option opts [String] :lifecycle_state List only the resources that are in this lifecycle state.
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
    # @option opts [String] :sort_by Sort on this field. You can specify one sort order only. The default sort field is `timeCreated`.
    #
    #   The default sort order for `timeCreated` and `timeUpdated` is descending.
    #   For all other sort fields the default sort order is ascending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, timeUpdated, name, type
    # @option opts [String] :opc_request_id The client request ID for tracing. This value is included in the opc-request-id response header.
    # @return [Response] A Response object with data of type {OCI::Oda::Models::TranslatorCollection TranslatorCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/list_translators.rb.html) to see an example of how to use list_translators API.
    def list_translators(oda_instance_id, opts = {})
      logger.debug 'Calling operation ManagementClient#list_translators.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling list_translators." if oda_instance_id.nil?

      if opts[:type] && !OCI::Oda::Models::TRANSLATION_SERVICE_ENUM.include?(opts[:type])
        raise 'Invalid value for "type", must be one of the values in OCI::Oda::Models::TRANSLATION_SERVICE_ENUM.'
      end

      if opts[:lifecycle_state] && !OCI::Oda::Models::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Oda::Models::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:sort_by] && !%w[timeCreated timeUpdated name type].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, timeUpdated, name, type.'
      end
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)

      path = '/odaInstances/{odaInstanceId}/translators'.sub('{odaInstanceId}', oda_instance_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:type] = opts[:type] if opts[:type]
      query_params[:name] = opts[:name] if opts[:name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#list_translators') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::TranslatorCollection'
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


    # Publish a draft Digital Assistant.
    # Once published the Digital Assistant cannot be modified.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] digital_assistant_id Unique Digital Assistant identifier.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::DigitalAssistant DigitalAssistant}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/publish_digital_assistant.rb.html) to see an example of how to use publish_digital_assistant API.
    def publish_digital_assistant(oda_instance_id, digital_assistant_id, opts = {})
      logger.debug 'Calling operation ManagementClient#publish_digital_assistant.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling publish_digital_assistant." if oda_instance_id.nil?
      raise "Missing the required parameter 'digital_assistant_id' when calling publish_digital_assistant." if digital_assistant_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'digital_assistant_id' must not be blank" if OCI::Internal::Util.blank_string?(digital_assistant_id)

      path = '/odaInstances/{odaInstanceId}/digitalAssistants/{digitalAssistantId}/actions/publish'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{digitalAssistantId}', digital_assistant_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#publish_digital_assistant') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::DigitalAssistant'
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


    # Publish a draft Skill.
    # Once published it cannot be modified.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::Skill Skill}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/publish_skill.rb.html) to see an example of how to use publish_skill API.
    def publish_skill(oda_instance_id, skill_id, opts = {})
      logger.debug 'Calling operation ManagementClient#publish_skill.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling publish_skill." if oda_instance_id.nil?
      raise "Missing the required parameter 'skill_id' when calling publish_skill." if skill_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'skill_id' must not be blank" if OCI::Internal::Util.blank_string?(skill_id)

      path = '/odaInstances/{odaInstanceId}/skills/{skillId}/actions/publish'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{skillId}', skill_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#publish_skill') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::Skill'
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


    # This will generate new keys for any generated keys in the Channel (eg. secretKey, verifyToken).
    # If a Channel has no generated keys then no changes will be made.
    # Ensure that you take note of the newly generated keys in the response as they will not be returned again.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] channel_id Unique Channel identifier.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::CreateChannelResult CreateChannelResult}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/rotate_channel_keys.rb.html) to see an example of how to use rotate_channel_keys API.
    def rotate_channel_keys(oda_instance_id, channel_id, opts = {})
      logger.debug 'Calling operation ManagementClient#rotate_channel_keys.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling rotate_channel_keys." if oda_instance_id.nil?
      raise "Missing the required parameter 'channel_id' when calling rotate_channel_keys." if channel_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'channel_id' must not be blank" if OCI::Internal::Util.blank_string?(channel_id)

      path = '/odaInstances/{odaInstanceId}/channels/{channelId}/actions/rotateKeys'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{channelId}', channel_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#rotate_channel_keys') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::CreateChannelResult'
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


    # Starts a Channel so that it will begin accepting messages.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] channel_id Unique Channel identifier.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::Channel Channel}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/start_channel.rb.html) to see an example of how to use start_channel API.
    def start_channel(oda_instance_id, channel_id, opts = {})
      logger.debug 'Calling operation ManagementClient#start_channel.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling start_channel." if oda_instance_id.nil?
      raise "Missing the required parameter 'channel_id' when calling start_channel." if channel_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'channel_id' must not be blank" if OCI::Internal::Util.blank_string?(channel_id)

      path = '/odaInstances/{odaInstanceId}/channels/{channelId}/actions/start'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{channelId}', channel_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#start_channel') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::Channel'
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


    # Stops a Channel so that it will no longer accept messages.
    #
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] channel_id Unique Channel identifier.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::Channel Channel}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/stop_channel.rb.html) to see an example of how to use stop_channel API.
    def stop_channel(oda_instance_id, channel_id, opts = {})
      logger.debug 'Calling operation ManagementClient#stop_channel.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling stop_channel." if oda_instance_id.nil?
      raise "Missing the required parameter 'channel_id' when calling stop_channel." if channel_id.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'channel_id' must not be blank" if OCI::Internal::Util.blank_string?(channel_id)

      path = '/odaInstances/{odaInstanceId}/channels/{channelId}/actions/stop'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{channelId}', channel_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#stop_channel') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::Channel'
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


    # Updates the specified Authentication Provider with the information in the request body.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] authentication_provider_id Unique Authentication Provider identifier.
    # @param [OCI::Oda::Models::UpdateAuthenticationProviderDetails] update_authentication_provider_details Property values to update the Authentication Provider.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::AuthenticationProvider AuthenticationProvider}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/update_authentication_provider.rb.html) to see an example of how to use update_authentication_provider API.
    def update_authentication_provider(oda_instance_id, authentication_provider_id, update_authentication_provider_details, opts = {})
      logger.debug 'Calling operation ManagementClient#update_authentication_provider.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling update_authentication_provider." if oda_instance_id.nil?
      raise "Missing the required parameter 'authentication_provider_id' when calling update_authentication_provider." if authentication_provider_id.nil?
      raise "Missing the required parameter 'update_authentication_provider_details' when calling update_authentication_provider." if update_authentication_provider_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'authentication_provider_id' must not be blank" if OCI::Internal::Util.blank_string?(authentication_provider_id)

      path = '/odaInstances/{odaInstanceId}/authenticationProviders/{authenticationProviderId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{authenticationProviderId}', authentication_provider_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_authentication_provider_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#update_authentication_provider') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::AuthenticationProvider'
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


    # Updates the specified Channel with the information in the request body.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] channel_id Unique Channel identifier.
    # @param [OCI::Oda::Models::UpdateChannelDetails] update_channel_details Property values to update the Channel.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::Channel Channel}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/update_channel.rb.html) to see an example of how to use update_channel API.
    def update_channel(oda_instance_id, channel_id, update_channel_details, opts = {})
      logger.debug 'Calling operation ManagementClient#update_channel.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling update_channel." if oda_instance_id.nil?
      raise "Missing the required parameter 'channel_id' when calling update_channel." if channel_id.nil?
      raise "Missing the required parameter 'update_channel_details' when calling update_channel." if update_channel_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'channel_id' must not be blank" if OCI::Internal::Util.blank_string?(channel_id)

      path = '/odaInstances/{odaInstanceId}/channels/{channelId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{channelId}', channel_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_channel_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#update_channel') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::Channel'
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


    # Updates the specified Digital Assistant with the information in the request body.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] digital_assistant_id Unique Digital Assistant identifier.
    # @param [OCI::Oda::Models::UpdateDigitalAssistantDetails] update_digital_assistant_details Property values to update the Digital Assistant.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::DigitalAssistant DigitalAssistant}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/update_digital_assistant.rb.html) to see an example of how to use update_digital_assistant API.
    def update_digital_assistant(oda_instance_id, digital_assistant_id, update_digital_assistant_details, opts = {})
      logger.debug 'Calling operation ManagementClient#update_digital_assistant.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling update_digital_assistant." if oda_instance_id.nil?
      raise "Missing the required parameter 'digital_assistant_id' when calling update_digital_assistant." if digital_assistant_id.nil?
      raise "Missing the required parameter 'update_digital_assistant_details' when calling update_digital_assistant." if update_digital_assistant_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'digital_assistant_id' must not be blank" if OCI::Internal::Util.blank_string?(digital_assistant_id)

      path = '/odaInstances/{odaInstanceId}/digitalAssistants/{digitalAssistantId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{digitalAssistantId}', digital_assistant_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_digital_assistant_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#update_digital_assistant') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::DigitalAssistant'
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


    # Updates the specified Digital Assistant Parameter with the information in the request body.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] digital_assistant_id Unique Digital Assistant identifier.
    # @param [String] parameter_name The name of a Digital Assistant Parameter.  This is unique with the Digital Assistant.
    # @param [OCI::Oda::Models::UpdateDigitalAssistantParameterDetails] update_digital_assistant_parameter_details Property values to update the Digital Assistant Parameter.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::DigitalAssistantParameter DigitalAssistantParameter}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/update_digital_assistant_parameter.rb.html) to see an example of how to use update_digital_assistant_parameter API.
    def update_digital_assistant_parameter(oda_instance_id, digital_assistant_id, parameter_name, update_digital_assistant_parameter_details, opts = {})
      logger.debug 'Calling operation ManagementClient#update_digital_assistant_parameter.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling update_digital_assistant_parameter." if oda_instance_id.nil?
      raise "Missing the required parameter 'digital_assistant_id' when calling update_digital_assistant_parameter." if digital_assistant_id.nil?
      raise "Missing the required parameter 'parameter_name' when calling update_digital_assistant_parameter." if parameter_name.nil?
      raise "Missing the required parameter 'update_digital_assistant_parameter_details' when calling update_digital_assistant_parameter." if update_digital_assistant_parameter_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'digital_assistant_id' must not be blank" if OCI::Internal::Util.blank_string?(digital_assistant_id)
      raise "Parameter value for 'parameter_name' must not be blank" if OCI::Internal::Util.blank_string?(parameter_name)

      path = '/odaInstances/{odaInstanceId}/digitalAssistants/{digitalAssistantId}/parameters/{parameterName}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{digitalAssistantId}', digital_assistant_id.to_s).sub('{parameterName}', parameter_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_digital_assistant_parameter_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#update_digital_assistant_parameter') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::DigitalAssistantParameter'
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


    # Updates the specified Skill with the information in the request body.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
    # @param [OCI::Oda::Models::UpdateSkillDetails] update_skill_details Property values to update the Skill.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::Skill Skill}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/update_skill.rb.html) to see an example of how to use update_skill API.
    def update_skill(oda_instance_id, skill_id, update_skill_details, opts = {})
      logger.debug 'Calling operation ManagementClient#update_skill.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling update_skill." if oda_instance_id.nil?
      raise "Missing the required parameter 'skill_id' when calling update_skill." if skill_id.nil?
      raise "Missing the required parameter 'update_skill_details' when calling update_skill." if update_skill_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'skill_id' must not be blank" if OCI::Internal::Util.blank_string?(skill_id)

      path = '/odaInstances/{odaInstanceId}/skills/{skillId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{skillId}', skill_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_skill_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#update_skill') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::Skill'
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


    # Updates the specified Skill Parameter with the information in the request body.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] skill_id Unique Skill identifier.
    # @param [String] parameter_name The name of a Skill Parameter.
    # @param [OCI::Oda::Models::UpdateSkillParameterDetails] update_skill_parameter_details Property values to update the Skill Parameter.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::SkillParameter SkillParameter}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/update_skill_parameter.rb.html) to see an example of how to use update_skill_parameter API.
    def update_skill_parameter(oda_instance_id, skill_id, parameter_name, update_skill_parameter_details, opts = {})
      logger.debug 'Calling operation ManagementClient#update_skill_parameter.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling update_skill_parameter." if oda_instance_id.nil?
      raise "Missing the required parameter 'skill_id' when calling update_skill_parameter." if skill_id.nil?
      raise "Missing the required parameter 'parameter_name' when calling update_skill_parameter." if parameter_name.nil?
      raise "Missing the required parameter 'update_skill_parameter_details' when calling update_skill_parameter." if update_skill_parameter_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'skill_id' must not be blank" if OCI::Internal::Util.blank_string?(skill_id)
      raise "Parameter value for 'parameter_name' must not be blank" if OCI::Internal::Util.blank_string?(parameter_name)

      path = '/odaInstances/{odaInstanceId}/skills/{skillId}/parameters/{parameterName}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{skillId}', skill_id.to_s).sub('{parameterName}', parameter_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_skill_parameter_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#update_skill_parameter') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::SkillParameter'
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


    # Updates the specified Translator with the information in the request body.
    # @param [String] oda_instance_id Unique Digital Assistant instance identifier.
    # @param [String] translator_id Unique Translator identifier.
    # @param [OCI::Oda::Models::UpdateTranslatorDetails] update_translator_details Property values to update the Translator.
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
    # @return [Response] A Response object with data of type {OCI::Oda::Models::Translator Translator}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/oda/update_translator.rb.html) to see an example of how to use update_translator API.
    def update_translator(oda_instance_id, translator_id, update_translator_details, opts = {})
      logger.debug 'Calling operation ManagementClient#update_translator.' if logger

      raise "Missing the required parameter 'oda_instance_id' when calling update_translator." if oda_instance_id.nil?
      raise "Missing the required parameter 'translator_id' when calling update_translator." if translator_id.nil?
      raise "Missing the required parameter 'update_translator_details' when calling update_translator." if update_translator_details.nil?
      raise "Parameter value for 'oda_instance_id' must not be blank" if OCI::Internal::Util.blank_string?(oda_instance_id)
      raise "Parameter value for 'translator_id' must not be blank" if OCI::Internal::Util.blank_string?(translator_id)

      path = '/odaInstances/{odaInstanceId}/translators/{translatorId}'.sub('{odaInstanceId}', oda_instance_id.to_s).sub('{translatorId}', translator_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_translator_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ManagementClient#update_translator') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Oda::Models::Translator'
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
