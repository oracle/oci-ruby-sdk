# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API covering the [Networking](/iaas/Content/Network/Concepts/overview.htm),
  # [Compute](/iaas/Content/Compute/Concepts/computeoverview.htm), and
  # [Block Volume](/iaas/Content/Block/Concepts/overview.htm) services. Use this API
  # to manage resources such as virtual cloud networks (VCNs), compute instances, and
  # block storage volumes.
  class Core::ComputeManagementClient
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


    # Creates a new ComputeManagementClient.
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
        @endpoint = endpoint + '/20160918'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "ComputeManagementClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://iaas.{region}.{secondLevelDomain}') + '/20160918'
      logger.info "ComputeManagementClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Attach a load balancer to the instance pool.
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [OCI::Core::Models::AttachLoadBalancerDetails] attach_load_balancer_details Load balancer being attached
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstancePool InstancePool}
    def attach_load_balancer(instance_pool_id, attach_load_balancer_details, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#attach_load_balancer.' if logger

      raise "Missing the required parameter 'instance_pool_id' when calling attach_load_balancer." if instance_pool_id.nil?
      raise "Missing the required parameter 'attach_load_balancer_details' when calling attach_load_balancer." if attach_load_balancer_details.nil?
      raise "Parameter value for 'instance_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_pool_id)

      path = '/instancePools/{instancePoolId}/actions/attachLoadBalancer'.sub('{instancePoolId}', instance_pool_id.to_s)
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
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(attach_load_balancer_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#attach_load_balancer') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstancePool'
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


    # Moves an instance configuration into a different compartment within the same tenancy.
    # For information about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # When you move an instance configuration to a different compartment, associated resources such as
    # instance pools are not moved.
    #
    # **Important:** Most of the properties for an existing instance configuration, including the compartment,
    # cannot be modified after you create the instance configuration. Although you can move an instance configuration
    # to a different compartment, you will not be able to use the instance configuration to manage instance pools
    # in the new compartment. If you want to update an instance configuration to point to a different compartment,
    # you should instead create a new instance configuration in the target compartment using
    # [CreateInstanceConfiguration](https://docs.cloud.oracle.com/iaas/api/#/en/iaas/20160918/InstanceConfiguration/CreateInstanceConfiguration).
    #
    # @param [String] instance_configuration_id The OCID of the instance configuration.
    # @param [OCI::Core::Models::ChangeInstanceConfigurationCompartmentDetails] change_instance_configuration_compartment_details Request to change the compartment of given instance configuration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def change_instance_configuration_compartment(instance_configuration_id, change_instance_configuration_compartment_details, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#change_instance_configuration_compartment.' if logger

      raise "Missing the required parameter 'instance_configuration_id' when calling change_instance_configuration_compartment." if instance_configuration_id.nil?
      raise "Missing the required parameter 'change_instance_configuration_compartment_details' when calling change_instance_configuration_compartment." if change_instance_configuration_compartment_details.nil?
      raise "Parameter value for 'instance_configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_configuration_id)

      path = '/instanceConfigurations/{instanceConfigurationId}/actions/changeCompartment'.sub('{instanceConfigurationId}', instance_configuration_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_instance_configuration_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#change_instance_configuration_compartment') do
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


    # Moves an instance pool into a different compartment within the same tenancy. For
    # information about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # When you move an instance pool to a different compartment, associated resources such as the instances in
    # the pool, boot volumes, VNICs, and autoscaling configurations are not moved.
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [OCI::Core::Models::ChangeInstancePoolCompartmentDetails] change_instance_pool_compartment_details Request to change the compartment of given instance pool.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def change_instance_pool_compartment(instance_pool_id, change_instance_pool_compartment_details, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#change_instance_pool_compartment.' if logger

      raise "Missing the required parameter 'instance_pool_id' when calling change_instance_pool_compartment." if instance_pool_id.nil?
      raise "Missing the required parameter 'change_instance_pool_compartment_details' when calling change_instance_pool_compartment." if change_instance_pool_compartment_details.nil?
      raise "Parameter value for 'instance_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_pool_id)

      path = '/instancePools/{instancePoolId}/actions/changeCompartment'.sub('{instancePoolId}', instance_pool_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_instance_pool_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#change_instance_pool_compartment') do
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


    # Creates an instance configuration. An instance configuration is a template that defines the
    # settings to use when creating Compute instances.
    #
    # @param [OCI::Core::Models::CreateInstanceConfigurationBase] create_instance_configuration Instance configuration creation details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstanceConfiguration InstanceConfiguration}
    def create_instance_configuration(create_instance_configuration, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#create_instance_configuration.' if logger

      raise "Missing the required parameter 'create_instance_configuration' when calling create_instance_configuration." if create_instance_configuration.nil?

      path = '/instanceConfigurations'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_instance_configuration)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#create_instance_configuration') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstanceConfiguration'
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


    # Create an instance pool.
    # @param [OCI::Core::Models::CreateInstancePoolDetails] create_instance_pool_details Instance pool creation details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstancePool InstancePool}
    def create_instance_pool(create_instance_pool_details, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#create_instance_pool.' if logger

      raise "Missing the required parameter 'create_instance_pool_details' when calling create_instance_pool." if create_instance_pool_details.nil?

      path = '/instancePools'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_instance_pool_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#create_instance_pool') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstancePool'
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


    # Deletes an instance configuration.
    # @param [String] instance_configuration_id The OCID of the instance configuration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_instance_configuration(instance_configuration_id, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#delete_instance_configuration.' if logger

      raise "Missing the required parameter 'instance_configuration_id' when calling delete_instance_configuration." if instance_configuration_id.nil?
      raise "Parameter value for 'instance_configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_configuration_id)

      path = '/instanceConfigurations/{instanceConfigurationId}'.sub('{instanceConfigurationId}', instance_configuration_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#delete_instance_configuration') do
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


    # Detach a load balancer from the instance pool.
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [OCI::Core::Models::DetachLoadBalancerDetails] detach_load_balancer_details Load balancer being detached
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstancePool InstancePool}
    def detach_load_balancer(instance_pool_id, detach_load_balancer_details, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#detach_load_balancer.' if logger

      raise "Missing the required parameter 'instance_pool_id' when calling detach_load_balancer." if instance_pool_id.nil?
      raise "Missing the required parameter 'detach_load_balancer_details' when calling detach_load_balancer." if detach_load_balancer_details.nil?
      raise "Parameter value for 'instance_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_pool_id)

      path = '/instancePools/{instancePoolId}/actions/detachLoadBalancer'.sub('{instancePoolId}', instance_pool_id.to_s)
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
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(detach_load_balancer_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#detach_load_balancer') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstancePool'
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
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified instance configuration
    # @param [String] instance_configuration_id The OCID of the instance configuration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstanceConfiguration InstanceConfiguration}
    def get_instance_configuration(instance_configuration_id, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#get_instance_configuration.' if logger

      raise "Missing the required parameter 'instance_configuration_id' when calling get_instance_configuration." if instance_configuration_id.nil?
      raise "Parameter value for 'instance_configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_configuration_id)

      path = '/instanceConfigurations/{instanceConfigurationId}'.sub('{instanceConfigurationId}', instance_configuration_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#get_instance_configuration') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstanceConfiguration'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified instance pool
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstancePool InstancePool}
    def get_instance_pool(instance_pool_id, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#get_instance_pool.' if logger

      raise "Missing the required parameter 'instance_pool_id' when calling get_instance_pool." if instance_pool_id.nil?
      raise "Parameter value for 'instance_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_pool_id)

      path = '/instancePools/{instancePoolId}'.sub('{instancePoolId}', instance_pool_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#get_instance_pool') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstancePool'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information about a load balancer that is attached to the specified instance pool.
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [String] instance_pool_load_balancer_attachment_id The OCID of the load balancer attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstancePoolLoadBalancerAttachment InstancePoolLoadBalancerAttachment}
    def get_instance_pool_load_balancer_attachment(instance_pool_id, instance_pool_load_balancer_attachment_id, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#get_instance_pool_load_balancer_attachment.' if logger

      raise "Missing the required parameter 'instance_pool_id' when calling get_instance_pool_load_balancer_attachment." if instance_pool_id.nil?
      raise "Missing the required parameter 'instance_pool_load_balancer_attachment_id' when calling get_instance_pool_load_balancer_attachment." if instance_pool_load_balancer_attachment_id.nil?
      raise "Parameter value for 'instance_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_pool_id)
      raise "Parameter value for 'instance_pool_load_balancer_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_pool_load_balancer_attachment_id)

      path = '/instancePools/{instancePoolId}/loadBalancerAttachments/{instancePoolLoadBalancerAttachmentId}'.sub('{instancePoolId}', instance_pool_id.to_s).sub('{instancePoolLoadBalancerAttachmentId}', instance_pool_load_balancer_attachment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#get_instance_pool_load_balancer_attachment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstancePoolLoadBalancerAttachment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Launches an instance from an instance configuration.
    #
    # If the instance configuration does not include all of the parameters that are
    # required to launch an instance, such as the availability domain and subnet ID, you must
    # provide these parameters when you launch an instance from the instance configuration.
    # For more information, see the {InstanceConfiguration}
    # resource.
    #
    # @param [String] instance_configuration_id The OCID of the instance configuration.
    # @param [OCI::Core::Models::InstanceConfigurationInstanceDetails] instance_configuration Instance configuration Instance Details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Instance Instance}
    def launch_instance_configuration(instance_configuration_id, instance_configuration, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#launch_instance_configuration.' if logger

      raise "Missing the required parameter 'instance_configuration_id' when calling launch_instance_configuration." if instance_configuration_id.nil?
      raise "Missing the required parameter 'instance_configuration' when calling launch_instance_configuration." if instance_configuration.nil?
      raise "Parameter value for 'instance_configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_configuration_id)

      path = '/instanceConfigurations/{instanceConfigurationId}/actions/launch'.sub('{instanceConfigurationId}', instance_configuration_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(instance_configuration)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#launch_instance_configuration') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Instance'
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


    # Lists the instance configurations in the specified compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `50`
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\"
    #   call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for DISPLAYNAME is ascending. The DISPLAYNAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by availability domain if the scope of the resource type is within a
    #   single availability domain. If you call one of these \"List\" operations without specifying
    #   an availability domain, the resources are grouped by availability domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The DISPLAYNAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::InstanceConfigurationSummary InstanceConfigurationSummary}>
    def list_instance_configurations(compartment_id, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#list_instance_configurations.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_instance_configurations." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/instanceConfigurations'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#list_instance_configurations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::InstanceConfigurationSummary>'
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


    # List the instances in the specified instance pool.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `50`
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\"
    #   call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for DISPLAYNAME is ascending. The DISPLAYNAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by availability domain if the scope of the resource type is within a
    #   single availability domain. If you call one of these \"List\" operations without specifying
    #   an availability domain, the resources are grouped by availability domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The DISPLAYNAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::InstanceSummary InstanceSummary}>
    def list_instance_pool_instances(compartment_id, instance_pool_id, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#list_instance_pool_instances.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_instance_pool_instances." if compartment_id.nil?
      raise "Missing the required parameter 'instance_pool_id' when calling list_instance_pool_instances." if instance_pool_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'instance_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_pool_id)

      path = '/instancePools/{instancePoolId}/instances'.sub('{instancePoolId}', instance_pool_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#list_instance_pool_instances') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::InstanceSummary>'
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


    # Lists the instance pools in the specified compartment.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    #
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated
    #   \"List\" call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `50`
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\"
    #   call. For important details about how pagination works, see
    #   [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for DISPLAYNAME is ascending. The DISPLAYNAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by availability domain if the scope of the resource type is within a
    #   single availability domain. If you call one of these \"List\" operations without specifying
    #   an availability domain, the resources are grouped by availability domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The DISPLAYNAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::InstancePoolSummary InstancePoolSummary}>
    def list_instance_pools(compartment_id, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#list_instance_pools.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_instance_pools." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::InstancePoolSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::InstancePoolSummary::LIFECYCLE_STATE_ENUM.'
      end

      path = '/instancePools'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#list_instance_pools') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::InstancePoolSummary>'
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


    # Performs the reset (power off and power on) action on the specified instance pool,
    # which performs the action on all the instances in the pool.
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstancePool InstancePool}
    def reset_instance_pool(instance_pool_id, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#reset_instance_pool.' if logger

      raise "Missing the required parameter 'instance_pool_id' when calling reset_instance_pool." if instance_pool_id.nil?
      raise "Parameter value for 'instance_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_pool_id)

      path = '/instancePools/{instancePoolId}/actions/reset'.sub('{instancePoolId}', instance_pool_id.to_s)
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
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#reset_instance_pool') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstancePool'
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


    # Performs the softreset (ACPI shutdown and power on) action on the specified instance pool,
    # which performs the action on all the instances in the pool.
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstancePool InstancePool}
    def softreset_instance_pool(instance_pool_id, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#softreset_instance_pool.' if logger

      raise "Missing the required parameter 'instance_pool_id' when calling softreset_instance_pool." if instance_pool_id.nil?
      raise "Parameter value for 'instance_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_pool_id)

      path = '/instancePools/{instancePoolId}/actions/softreset'.sub('{instancePoolId}', instance_pool_id.to_s)
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
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#softreset_instance_pool') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstancePool'
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


    # Performs the start (power on) action on the specified instance pool,
    # which performs the action on all the instances in the pool.
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstancePool InstancePool}
    def start_instance_pool(instance_pool_id, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#start_instance_pool.' if logger

      raise "Missing the required parameter 'instance_pool_id' when calling start_instance_pool." if instance_pool_id.nil?
      raise "Parameter value for 'instance_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_pool_id)

      path = '/instancePools/{instancePoolId}/actions/start'.sub('{instancePoolId}', instance_pool_id.to_s)
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
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#start_instance_pool') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstancePool'
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


    # Performs the stop (power off) action on the specified instance pool,
    # which performs the action on all the instances in the pool.
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstancePool InstancePool}
    def stop_instance_pool(instance_pool_id, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#stop_instance_pool.' if logger

      raise "Missing the required parameter 'instance_pool_id' when calling stop_instance_pool." if instance_pool_id.nil?
      raise "Parameter value for 'instance_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_pool_id)

      path = '/instancePools/{instancePoolId}/actions/stop'.sub('{instancePoolId}', instance_pool_id.to_s)
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
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#stop_instance_pool') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstancePool'
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


    # Terminate the specified instance pool.
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def terminate_instance_pool(instance_pool_id, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#terminate_instance_pool.' if logger

      raise "Missing the required parameter 'instance_pool_id' when calling terminate_instance_pool." if instance_pool_id.nil?
      raise "Parameter value for 'instance_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_pool_id)

      path = '/instancePools/{instancePoolId}'.sub('{instancePoolId}', instance_pool_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#terminate_instance_pool') do
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


    # Updates the free-form tags, defined tags, and display name of an instance configuration.
    # @param [String] instance_configuration_id The OCID of the instance configuration.
    # @param [OCI::Core::Models::UpdateInstanceConfigurationDetails] update_instance_configuration_details Updates the freeFormTags, definedTags, and display name of an instance configuration.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstanceConfiguration InstanceConfiguration}
    def update_instance_configuration(instance_configuration_id, update_instance_configuration_details, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#update_instance_configuration.' if logger

      raise "Missing the required parameter 'instance_configuration_id' when calling update_instance_configuration." if instance_configuration_id.nil?
      raise "Missing the required parameter 'update_instance_configuration_details' when calling update_instance_configuration." if update_instance_configuration_details.nil?
      raise "Parameter value for 'instance_configuration_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_configuration_id)

      path = '/instanceConfigurations/{instanceConfigurationId}'.sub('{instanceConfigurationId}', instance_configuration_id.to_s)
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
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(update_instance_configuration_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#update_instance_configuration') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstanceConfiguration'
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


    # Update the specified instance pool.
    # The OCID of the instance pool remains the same.
    #
    # @param [String] instance_pool_id The OCID of the instance pool.
    # @param [OCI::Core::Models::UpdateInstancePoolDetails] update_instance_pool_details Update instance pool configuration
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstancePool InstancePool}
    def update_instance_pool(instance_pool_id, update_instance_pool_details, opts = {})
      logger.debug 'Calling operation ComputeManagementClient#update_instance_pool.' if logger

      raise "Missing the required parameter 'instance_pool_id' when calling update_instance_pool." if instance_pool_id.nil?
      raise "Missing the required parameter 'update_instance_pool_details' when calling update_instance_pool." if update_instance_pool_details.nil?
      raise "Parameter value for 'instance_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_pool_id)

      path = '/instancePools/{instancePoolId}'.sub('{instancePoolId}', instance_pool_id.to_s)
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
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(update_instance_pool_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeManagementClient#update_instance_pool') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstancePool'
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
