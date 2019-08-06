# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API for the Load Balancing service. Use this API to manage load balancers, backend sets, and related items. For more
  # information, see [Overview of Load Balancing](/iaas/Content/Balance/Concepts/balanceoverview.htm).
  class LoadBalancer::LoadBalancerClient
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


    # Creates a new LoadBalancerClient.
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
        @endpoint = endpoint + '/20170115'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "LoadBalancerClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://iaas.{region}.{secondLevelDomain}') + '/20170115'
      logger.info "LoadBalancerClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a load balancer into a different compartment within the same tenancy. For information about moving resources
    # between compartments, see [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the load balancer to move.
    # @param [OCI::LoadBalancer::Models::ChangeLoadBalancerCompartmentDetails] change_load_balancer_compartment_details The configuration details for moving a load balancer to a different compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. Set the if-match parameter to the value of the ETag from a
    #   previous GET or POST response for that resource. The resource is moved only if the ETag you
    #   provide matches the resource's current ETag value.
    #
    #   Example: `example-etag`
    #    (default to )
    # @return [Response] A Response object with data of type nil
    def change_load_balancer_compartment(load_balancer_id, change_load_balancer_compartment_details, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#change_load_balancer_compartment.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling change_load_balancer_compartment." if load_balancer_id.nil?
      raise "Missing the required parameter 'change_load_balancer_compartment_details' when calling change_load_balancer_compartment." if change_load_balancer_compartment_details.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/changeCompartment'.sub('{loadBalancerId}', load_balancer_id.to_s)
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
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_load_balancer_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#change_load_balancer_compartment') do
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


    # Adds a backend server to a backend set.
    # @param [OCI::LoadBalancer::Models::CreateBackendDetails] create_backend_details The details to add a backend server to a backend set.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend set and servers.
    # @param [String] backend_set_name The name of the backend set to add the backend server to.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def create_backend(create_backend_details, load_balancer_id, backend_set_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#create_backend.' if logger

      raise "Missing the required parameter 'create_backend_details' when calling create_backend." if create_backend_details.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling create_backend." if load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling create_backend." if backend_set_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/loadBalancers/{loadBalancerId}/backendSets/{backendSetName}/backends'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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

      post_body = @api_client.object_to_http_body(create_backend_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#create_backend') do
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


    # Adds a backend set to a load balancer.
    # @param [OCI::LoadBalancer::Models::CreateBackendSetDetails] create_backend_set_details The details for adding a backend set.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer on which to add a backend set.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def create_backend_set(create_backend_set_details, load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#create_backend_set.' if logger

      raise "Missing the required parameter 'create_backend_set_details' when calling create_backend_set." if create_backend_set_details.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling create_backend_set." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/backendSets'.sub('{loadBalancerId}', load_balancer_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_backend_set_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#create_backend_set') do
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


    # Creates an asynchronous request to add an SSL certificate bundle.
    # @param [OCI::LoadBalancer::Models::CreateCertificateDetails] create_certificate_details The details of the certificate bundle to add.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer on which to add the certificate bundle.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def create_certificate(create_certificate_details, load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#create_certificate.' if logger

      raise "Missing the required parameter 'create_certificate_details' when calling create_certificate." if create_certificate_details.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling create_certificate." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/certificates'.sub('{loadBalancerId}', load_balancer_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_certificate_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#create_certificate') do
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


    # Adds a hostname resource to the specified load balancer. For more information, see
    # [Managing Request Routing](https://docs.cloud.oracle.com/Content/Balance/Tasks/managingrequest.htm).
    #
    # @param [OCI::LoadBalancer::Models::CreateHostnameDetails] create_hostname_details The details of the hostname resource to add to the specified load balancer.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer to add the hostname to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def create_hostname(create_hostname_details, load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#create_hostname.' if logger

      raise "Missing the required parameter 'create_hostname_details' when calling create_hostname." if create_hostname_details.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling create_hostname." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/hostnames'.sub('{loadBalancerId}', load_balancer_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_hostname_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#create_hostname') do
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


    # Adds a listener to a load balancer.
    # @param [OCI::LoadBalancer::Models::CreateListenerDetails] create_listener_details Details to add a listener.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer on which to add a listener.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def create_listener(create_listener_details, load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#create_listener.' if logger

      raise "Missing the required parameter 'create_listener_details' when calling create_listener." if create_listener_details.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling create_listener." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/listeners'.sub('{loadBalancerId}', load_balancer_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_listener_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#create_listener') do
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


    # Creates a new load balancer in the specified compartment. For general information about load balancers,
    # see [Overview of the Load Balancing Service](https://docs.cloud.oracle.com/Content/Balance/Concepts/balanceoverview.htm).
    #
    # For the purposes of access control, you must provide the OCID of the compartment where you want
    # the load balancer to reside. Notice that the load balancer doesn't have to be in the same compartment as the VCN
    # or backend set. If you're not sure which compartment to use, put the load balancer in the same compartment as the VCN.
    # For information about access control and compartments, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/Content/Identity/Concepts/overview.htm).
    #
    # You must specify a display name for the load balancer. It does not have to be unique, and you can change it.
    #
    # For information about Availability Domains, see
    # [Regions and Availability Domains](https://docs.cloud.oracle.com/Content/General/Concepts/regions.htm).
    # To get a list of Availability Domains, use the `ListAvailabilityDomains` operation
    # in the Identity and Access Management Service API.
    #
    # All Oracle Cloud Infrastructure resources, including load balancers, get an Oracle-assigned,
    # unique ID called an Oracle Cloud Identifier (OCID). When you create a resource, you can find its OCID
    # in the response. You can also retrieve a resource's OCID by using a List API operation on that resource type,
    # or by viewing the resource in the Console. Fore more information, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # After you send your request, the new object's state will temporarily be PROVISIONING. Before using the
    # object, first make sure its state has changed to RUNNING.
    #
    # When you create a load balancer, the system assigns an IP address.
    # To get the IP address, use the {#get_load_balancer get_load_balancer} operation.
    #
    # @param [OCI::LoadBalancer::Models::CreateLoadBalancerDetails] create_load_balancer_details The configuration details for creating a load balancer.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def create_load_balancer(create_load_balancer_details, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#create_load_balancer.' if logger

      raise "Missing the required parameter 'create_load_balancer_details' when calling create_load_balancer." if create_load_balancer_details.nil?

      path = '/loadBalancers'
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

      post_body = @api_client.object_to_http_body(create_load_balancer_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#create_load_balancer') do
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


    # Adds a path route set to a load balancer. For more information, see
    # [Managing Request Routing](https://docs.cloud.oracle.com/Content/Balance/Tasks/managingrequest.htm).
    #
    # @param [OCI::LoadBalancer::Models::CreatePathRouteSetDetails] create_path_route_set_details The details of the path route set to add.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer to add the path route set to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def create_path_route_set(create_path_route_set_details, load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#create_path_route_set.' if logger

      raise "Missing the required parameter 'create_path_route_set_details' when calling create_path_route_set." if create_path_route_set_details.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling create_path_route_set." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/pathRouteSets'.sub('{loadBalancerId}', load_balancer_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_path_route_set_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#create_path_route_set') do
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


    # Creates a new rule set associated with the specified load balancer. For more information, see
    # [Managing Rule Sets](https://docs.cloud.oracle.com/Content/Balance/Tasks/managingrulesets.htm).
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the specified load balancer.
    # @param [OCI::LoadBalancer::Models::CreateRuleSetDetails] create_rule_set_details The configuration details for the rule set to create.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    def create_rule_set(load_balancer_id, create_rule_set_details, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#create_rule_set.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling create_rule_set." if load_balancer_id.nil?
      raise "Missing the required parameter 'create_rule_set_details' when calling create_rule_set." if create_rule_set_details.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/ruleSets'.sub('{loadBalancerId}', load_balancer_id.to_s)
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

      post_body = @api_client.object_to_http_body(create_rule_set_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#create_rule_set') do
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


    # Removes a backend server from a given load balancer and backend set.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend set and server.
    # @param [String] backend_set_name The name of the backend set associated with the backend server.
    #
    #   Example: `example_backend_set`
    #
    # @param [String] backend_name The IP address and port of the backend server to remove.
    #
    #   Example: `10.0.0.3:8080`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    def delete_backend(load_balancer_id, backend_set_name, backend_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#delete_backend.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling delete_backend." if load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling delete_backend." if backend_set_name.nil?
      raise "Missing the required parameter 'backend_name' when calling delete_backend." if backend_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)
      raise "Parameter value for 'backend_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_name)

      path = '/loadBalancers/{loadBalancerId}/backendSets/{backendSetName}/backends/{backendName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s).sub('{backendName}', backend_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#delete_backend') do
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


    # Deletes the specified backend set. Note that deleting a backend set removes its backend servers from the load balancer.
    #
    # Before you can delete a backend set, you must remove it from any active listeners.
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend set.
    # @param [String] backend_set_name The name of the backend set to delete.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    def delete_backend_set(load_balancer_id, backend_set_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#delete_backend_set.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling delete_backend_set." if load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling delete_backend_set." if backend_set_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/loadBalancers/{loadBalancerId}/backendSets/{backendSetName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#delete_backend_set') do
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


    # Deletes an SSL certificate bundle from a load balancer.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the certificate bundle
    #   to be deleted.
    #
    # @param [String] certificate_name The name of the certificate bundle to delete.
    #
    #   Example: `example_certificate_bundle`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    def delete_certificate(load_balancer_id, certificate_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#delete_certificate.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling delete_certificate." if load_balancer_id.nil?
      raise "Missing the required parameter 'certificate_name' when calling delete_certificate." if certificate_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'certificate_name' must not be blank" if OCI::Internal::Util.blank_string?(certificate_name)

      path = '/loadBalancers/{loadBalancerId}/certificates/{certificateName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{certificateName}', certificate_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#delete_certificate') do
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


    # Deletes a hostname resource from the specified load balancer.
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the hostname to delete.
    # @param [String] name The name of the hostname resource to delete.
    #
    #   Example: `example_hostname_001`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    def delete_hostname(load_balancer_id, name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#delete_hostname.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling delete_hostname." if load_balancer_id.nil?
      raise "Missing the required parameter 'name' when calling delete_hostname." if name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'name' must not be blank" if OCI::Internal::Util.blank_string?(name)

      path = '/loadBalancers/{loadBalancerId}/hostnames/{name}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{name}', name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#delete_hostname') do
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


    # Deletes a listener from a load balancer.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the listener to delete.
    # @param [String] listener_name The name of the listener to delete.
    #
    #   Example: `example_listener`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    def delete_listener(load_balancer_id, listener_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#delete_listener.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling delete_listener." if load_balancer_id.nil?
      raise "Missing the required parameter 'listener_name' when calling delete_listener." if listener_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'listener_name' must not be blank" if OCI::Internal::Util.blank_string?(listener_name)

      path = '/loadBalancers/{loadBalancerId}/listeners/{listenerName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{listenerName}', listener_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#delete_listener') do
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


    # Stops a load balancer and removes it from service.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer to delete.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    def delete_load_balancer(load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#delete_load_balancer.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling delete_load_balancer." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}'.sub('{loadBalancerId}', load_balancer_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#delete_load_balancer') do
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


    # Deletes a path route set from the specified load balancer.
    #
    # To delete a path route rule from a path route set, use the
    # {#update_path_route_set update_path_route_set} operation.
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the path route set to delete.
    # @param [String] path_route_set_name The name of the path route set to delete.
    #
    #   Example: `example_path_route_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    def delete_path_route_set(load_balancer_id, path_route_set_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#delete_path_route_set.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling delete_path_route_set." if load_balancer_id.nil?
      raise "Missing the required parameter 'path_route_set_name' when calling delete_path_route_set." if path_route_set_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'path_route_set_name' must not be blank" if OCI::Internal::Util.blank_string?(path_route_set_name)

      path = '/loadBalancers/{loadBalancerId}/pathRouteSets/{pathRouteSetName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{pathRouteSetName}', path_route_set_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#delete_path_route_set') do
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


    # Deletes a rule set from the specified load balancer.
    #
    # To delete a rule from a rule set, use the
    # {#update_rule_set update_rule_set} operation.
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the specified load balancer.
    # @param [String] rule_set_name The name of the rule set to delete.
    #
    #   Example: `example_rule_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    def delete_rule_set(load_balancer_id, rule_set_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#delete_rule_set.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling delete_rule_set." if load_balancer_id.nil?
      raise "Missing the required parameter 'rule_set_name' when calling delete_rule_set." if rule_set_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'rule_set_name' must not be blank" if OCI::Internal::Util.blank_string?(rule_set_name)

      path = '/loadBalancers/{loadBalancerId}/ruleSets/{ruleSetName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{ruleSetName}', rule_set_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#delete_rule_set') do
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


    # Gets the specified backend server's configuration information.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend set and server.
    # @param [String] backend_set_name The name of the backend set that includes the backend server.
    #
    #   Example: `example_backend_set`
    #
    # @param [String] backend_name The IP address and port of the backend server to retrieve.
    #
    #   Example: `10.0.0.3:8080`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::LoadBalancer::Models::Backend Backend}
    def get_backend(load_balancer_id, backend_set_name, backend_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#get_backend.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling get_backend." if load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling get_backend." if backend_set_name.nil?
      raise "Missing the required parameter 'backend_name' when calling get_backend." if backend_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)
      raise "Parameter value for 'backend_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_name)

      path = '/loadBalancers/{loadBalancerId}/backendSets/{backendSetName}/backends/{backendName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s).sub('{backendName}', backend_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#get_backend') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LoadBalancer::Models::Backend'
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


    # Gets the current health status of the specified backend server.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend server health status to be retrieved.
    # @param [String] backend_set_name The name of the backend set associated with the backend server to retrieve the health status for.
    #
    #   Example: `example_backend_set`
    #
    # @param [String] backend_name The IP address and port of the backend server to retrieve the health status for.
    #
    #   Example: `10.0.0.3:8080`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::LoadBalancer::Models::BackendHealth BackendHealth}
    def get_backend_health(load_balancer_id, backend_set_name, backend_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#get_backend_health.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling get_backend_health." if load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling get_backend_health." if backend_set_name.nil?
      raise "Missing the required parameter 'backend_name' when calling get_backend_health." if backend_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)
      raise "Parameter value for 'backend_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_name)

      path = '/loadBalancers/{loadBalancerId}/backendSets/{backendSetName}/backends/{backendName}/health'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s).sub('{backendName}', backend_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#get_backend_health') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LoadBalancer::Models::BackendHealth'
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


    # Gets the specified backend set's configuration information.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the specified load balancer.
    # @param [String] backend_set_name The name of the backend set to retrieve.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::LoadBalancer::Models::BackendSet BackendSet}
    def get_backend_set(load_balancer_id, backend_set_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#get_backend_set.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling get_backend_set." if load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling get_backend_set." if backend_set_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/loadBalancers/{loadBalancerId}/backendSets/{backendSetName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#get_backend_set') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LoadBalancer::Models::BackendSet'
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


    # Gets the health status for the specified backend set.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend set health status to be retrieved.
    # @param [String] backend_set_name The name of the backend set to retrieve the health status for.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::LoadBalancer::Models::BackendSetHealth BackendSetHealth}
    def get_backend_set_health(load_balancer_id, backend_set_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#get_backend_set_health.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling get_backend_set_health." if load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling get_backend_set_health." if backend_set_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/loadBalancers/{loadBalancerId}/backendSets/{backendSetName}/health'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#get_backend_set_health') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LoadBalancer::Models::BackendSetHealth'
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


    # Gets the health check policy information for a given load balancer and backend set.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the health check policy to be retrieved.
    # @param [String] backend_set_name The name of the backend set associated with the health check policy to be retrieved.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::LoadBalancer::Models::HealthChecker HealthChecker}
    def get_health_checker(load_balancer_id, backend_set_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#get_health_checker.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling get_health_checker." if load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling get_health_checker." if backend_set_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/loadBalancers/{loadBalancerId}/backendSets/{backendSetName}/healthChecker'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#get_health_checker') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LoadBalancer::Models::HealthChecker'
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


    # Gets the specified hostname resource's configuration information.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the specified load balancer.
    # @param [String] name The name of the hostname resource to retrieve.
    #
    #   Example: `example_hostname_001`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::LoadBalancer::Models::Hostname Hostname}
    def get_hostname(load_balancer_id, name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#get_hostname.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling get_hostname." if load_balancer_id.nil?
      raise "Missing the required parameter 'name' when calling get_hostname." if name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'name' must not be blank" if OCI::Internal::Util.blank_string?(name)

      path = '/loadBalancers/{loadBalancerId}/hostnames/{name}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{name}', name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#get_hostname') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LoadBalancer::Models::Hostname'
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


    # Gets the specified load balancer's configuration information.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer to retrieve.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::LoadBalancer::Models::LoadBalancer LoadBalancer}
    def get_load_balancer(load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#get_load_balancer.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling get_load_balancer." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}'.sub('{loadBalancerId}', load_balancer_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#get_load_balancer') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LoadBalancer::Models::LoadBalancer'
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


    # Gets the health status for the specified load balancer.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer to return health status for.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::LoadBalancer::Models::LoadBalancerHealth LoadBalancerHealth}
    def get_load_balancer_health(load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#get_load_balancer_health.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling get_load_balancer_health." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/health'.sub('{loadBalancerId}', load_balancer_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#get_load_balancer_health') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LoadBalancer::Models::LoadBalancerHealth'
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


    # Gets the specified path route set's configuration information.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the specified load balancer.
    # @param [String] path_route_set_name The name of the path route set to retrieve.
    #
    #   Example: `example_path_route_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::LoadBalancer::Models::PathRouteSet PathRouteSet}
    def get_path_route_set(load_balancer_id, path_route_set_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#get_path_route_set.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling get_path_route_set." if load_balancer_id.nil?
      raise "Missing the required parameter 'path_route_set_name' when calling get_path_route_set." if path_route_set_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'path_route_set_name' must not be blank" if OCI::Internal::Util.blank_string?(path_route_set_name)

      path = '/loadBalancers/{loadBalancerId}/pathRouteSets/{pathRouteSetName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{pathRouteSetName}', path_route_set_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#get_path_route_set') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LoadBalancer::Models::PathRouteSet'
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


    # Gets the specified set of rules.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the specified load balancer.
    # @param [String] rule_set_name The name of the rule set to retrieve.
    #
    #   Example: `example_rule_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::LoadBalancer::Models::RuleSet RuleSet}
    def get_rule_set(load_balancer_id, rule_set_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#get_rule_set.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling get_rule_set." if load_balancer_id.nil?
      raise "Missing the required parameter 'rule_set_name' when calling get_rule_set." if rule_set_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'rule_set_name' must not be blank" if OCI::Internal::Util.blank_string?(rule_set_name)

      path = '/loadBalancers/{loadBalancerId}/ruleSets/{ruleSetName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{ruleSetName}', rule_set_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#get_rule_set') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LoadBalancer::Models::RuleSet'
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


    # Gets the details of a work request.
    # @param [String] work_request_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the work request to retrieve.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type {OCI::LoadBalancer::Models::WorkRequest WorkRequest}
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#get_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling get_work_request." if work_request_id.nil?
      raise "Parameter value for 'work_request_id' must not be blank" if OCI::Internal::Util.blank_string?(work_request_id)

      path = '/loadBalancerWorkRequests/{workRequestId}'.sub('{workRequestId}', work_request_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::LoadBalancer::Models::WorkRequest'
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


    # Lists all backend sets associated with a given load balancer.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend sets to retrieve.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type Array<{OCI::LoadBalancer::Models::BackendSet BackendSet}>
    def list_backend_sets(load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#list_backend_sets.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling list_backend_sets." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/backendSets'.sub('{loadBalancerId}', load_balancer_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#list_backend_sets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::LoadBalancer::Models::BackendSet>'
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


    # Lists the backend servers for a given load balancer and backend set.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend set and servers.
    # @param [String] backend_set_name The name of the backend set associated with the backend servers.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type Array<{OCI::LoadBalancer::Models::Backend Backend}>
    def list_backends(load_balancer_id, backend_set_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#list_backends.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling list_backends." if load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling list_backends." if backend_set_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/loadBalancers/{loadBalancerId}/backendSets/{backendSetName}/backends'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#list_backends') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::LoadBalancer::Models::Backend>'
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


    # Lists all SSL certificates bundles associated with a given load balancer.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the certificate bundles
    #   to be listed.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type Array<{OCI::LoadBalancer::Models::Certificate Certificate}>
    def list_certificates(load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#list_certificates.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling list_certificates." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/certificates'.sub('{loadBalancerId}', load_balancer_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#list_certificates') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::LoadBalancer::Models::Certificate>'
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


    # Lists all hostname resources associated with the specified load balancer.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the hostnames
    #   to retrieve.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type Array<{OCI::LoadBalancer::Models::Hostname Hostname}>
    def list_hostnames(load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#list_hostnames.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling list_hostnames." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/hostnames'.sub('{loadBalancerId}', load_balancer_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#list_hostnames') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::LoadBalancer::Models::Hostname>'
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


    # Lists all of the rules from all of the rule sets associated with the specified listener. The response organizes
    # the rules in the following order:
    #
    # *  Access control rules
    # *  Allow method rules
    # *  Request header rules
    # *  Response header rules
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the listener.
    # @param [String] listener_name The name of the listener the rules are associated with.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type Array<{OCI::LoadBalancer::Models::ListenerRuleSummary ListenerRuleSummary}>
    def list_listener_rules(load_balancer_id, listener_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#list_listener_rules.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling list_listener_rules." if load_balancer_id.nil?
      raise "Missing the required parameter 'listener_name' when calling list_listener_rules." if listener_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'listener_name' must not be blank" if OCI::Internal::Util.blank_string?(listener_name)

      path = '/loadBalancers/{loadBalancerId}/listeners/{listenerName}/rules'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{listenerName}', listener_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#list_listener_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::LoadBalancer::Models::ListenerRuleSummary>'
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


    # Lists the summary health statuses for all load balancers in the specified compartment.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the load balancers to return health status information for.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `50`
    #    (default to 10)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `3`
    #
    # @return [Response] A Response object with data of type Array<{OCI::LoadBalancer::Models::LoadBalancerHealthSummary LoadBalancerHealthSummary}>
    def list_load_balancer_healths(compartment_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#list_load_balancer_healths.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_load_balancer_healths." if compartment_id.nil?

      path = '/loadBalancerHealths'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#list_load_balancer_healths') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::LoadBalancer::Models::LoadBalancerHealthSummary>'
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


    # Lists all load balancers in the specified compartment.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the load balancers to list.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `50`
    #    (default to 10)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `3`
    #
    # @option opts [String] :detail The level of detail to return for each result. Can be `full` or `simple`.
    #
    #   Example: `full`
    #    (default to full)
    # @option opts [String] :sort_by The field to sort by.  You can provide one sort order (`sortOrder`). Default order for TIMECREATED is descending.
    #   Default order for DISPLAYNAME is ascending. The DISPLAYNAME sort order is case sensitive.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The DISPLAYNAME sort order is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    #
    #   Example: `example_load_balancer`
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state.
    #
    #   Example: `SUCCEEDED`
    #
    # @return [Response] A Response object with data of type Array<{OCI::LoadBalancer::Models::LoadBalancer LoadBalancer}>
    def list_load_balancers(compartment_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#list_load_balancers.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_load_balancers." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::LoadBalancer::Models::LoadBalancer::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::LoadBalancer::Models::LoadBalancer::LIFECYCLE_STATE_ENUM.'
      end

      path = '/loadBalancers'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:detail] = opts[:detail] if opts[:detail]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#list_load_balancers') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::LoadBalancer::Models::LoadBalancer>'
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


    # Lists all path route sets associated with the specified load balancer.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the path route sets
    #   to retrieve.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type Array<{OCI::LoadBalancer::Models::PathRouteSet PathRouteSet}>
    def list_path_route_sets(load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#list_path_route_sets.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling list_path_route_sets." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/pathRouteSets'.sub('{loadBalancerId}', load_balancer_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#list_path_route_sets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::LoadBalancer::Models::PathRouteSet>'
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


    # Lists the available load balancer policies.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the load balancer policies to list.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `50`
    #    (default to 16)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `3`
    #
    # @return [Response] A Response object with data of type Array<{OCI::LoadBalancer::Models::LoadBalancerPolicy LoadBalancerPolicy}>
    def list_policies(compartment_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#list_policies.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_policies." if compartment_id.nil?

      path = '/loadBalancerPolicies'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#list_policies') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::LoadBalancer::Models::LoadBalancerPolicy>'
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


    # Lists all supported traffic protocols.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the load balancer protocols to list.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `50`
    #    (default to 16)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `3`
    #
    # @return [Response] A Response object with data of type Array<{OCI::LoadBalancer::Models::LoadBalancerProtocol LoadBalancerProtocol}>
    def list_protocols(compartment_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#list_protocols.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_protocols." if compartment_id.nil?

      path = '/loadBalancerProtocols'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#list_protocols') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::LoadBalancer::Models::LoadBalancerProtocol>'
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


    # Lists all rule sets associated with the specified load balancer.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the specified load balancer.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type Array<{OCI::LoadBalancer::Models::RuleSet RuleSet}>
    def list_rule_sets(load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#list_rule_sets.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling list_rule_sets." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/ruleSets'.sub('{loadBalancerId}', load_balancer_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#list_rule_sets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::LoadBalancer::Models::RuleSet>'
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


    # Lists the valid load balancer shapes.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment containing the load balancer shapes to list.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `50`
    #    (default to 16)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `3`
    #
    # @return [Response] A Response object with data of type Array<{OCI::LoadBalancer::Models::LoadBalancerShape LoadBalancerShape}>
    def list_shapes(compartment_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#list_shapes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_shapes." if compartment_id.nil?

      path = '/loadBalancerShapes'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#list_shapes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::LoadBalancer::Models::LoadBalancerShape>'
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


    # Lists the work requests for a given load balancer.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the work requests to retrieve.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page, or items to return in a paginated \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `50`
    #    (default to 100)
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response header from the previous \"List\" call.
    #   For important details about how pagination works, see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `3`
    #
    # @return [Response] A Response object with data of type Array<{OCI::LoadBalancer::Models::WorkRequest WorkRequest}>
    def list_work_requests(load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#list_work_requests.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling list_work_requests." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/workRequests'.sub('{loadBalancerId}', load_balancer_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::LoadBalancer::Models::WorkRequest>'
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


    # Updates the configuration of a backend server within the specified backend set.
    # @param [OCI::LoadBalancer::Models::UpdateBackendDetails] update_backend_details Details for updating a backend server.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend set and server.
    # @param [String] backend_set_name The name of the backend set associated with the backend server.
    #
    #   Example: `example_backend_set`
    #
    # @param [String] backend_name The IP address and port of the backend server to update.
    #
    #   Example: `10.0.0.3:8080`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def update_backend(update_backend_details, load_balancer_id, backend_set_name, backend_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#update_backend.' if logger

      raise "Missing the required parameter 'update_backend_details' when calling update_backend." if update_backend_details.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling update_backend." if load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling update_backend." if backend_set_name.nil?
      raise "Missing the required parameter 'backend_name' when calling update_backend." if backend_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)
      raise "Parameter value for 'backend_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_name)

      path = '/loadBalancers/{loadBalancerId}/backendSets/{backendSetName}/backends/{backendName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s).sub('{backendName}', backend_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_backend_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#update_backend') do
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


    # Updates a backend set.
    # @param [OCI::LoadBalancer::Models::UpdateBackendSetDetails] update_backend_set_details The details to update a backend set.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the backend set.
    # @param [String] backend_set_name The name of the backend set to update.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def update_backend_set(update_backend_set_details, load_balancer_id, backend_set_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#update_backend_set.' if logger

      raise "Missing the required parameter 'update_backend_set_details' when calling update_backend_set." if update_backend_set_details.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling update_backend_set." if load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling update_backend_set." if backend_set_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/loadBalancers/{loadBalancerId}/backendSets/{backendSetName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_backend_set_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#update_backend_set') do
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


    # Updates the health check policy for a given load balancer and backend set.
    # @param [OCI::LoadBalancer::Models::UpdateHealthCheckerDetails] health_checker The health check policy configuration details.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the health check policy to be updated.
    # @param [String] backend_set_name The name of the backend set associated with the health check policy to be retrieved.
    #
    #   Example: `example_backend_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def update_health_checker(health_checker, load_balancer_id, backend_set_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#update_health_checker.' if logger

      raise "Missing the required parameter 'health_checker' when calling update_health_checker." if health_checker.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling update_health_checker." if load_balancer_id.nil?
      raise "Missing the required parameter 'backend_set_name' when calling update_health_checker." if backend_set_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'backend_set_name' must not be blank" if OCI::Internal::Util.blank_string?(backend_set_name)

      path = '/loadBalancers/{loadBalancerId}/backendSets/{backendSetName}/healthChecker'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{backendSetName}', backend_set_name.to_s)
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

      post_body = @api_client.object_to_http_body(health_checker)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#update_health_checker') do
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


    # Overwrites an existing hostname resource on the specified load balancer. Use this operation to change a
    # virtual hostname.
    #
    # @param [OCI::LoadBalancer::Models::UpdateHostnameDetails] update_hostname_details The configuration details to update a virtual hostname.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the virtual hostname
    #   to update.
    #
    # @param [String] name The name of the hostname resource to update.
    #
    #   Example: `example_hostname_001`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    def update_hostname(update_hostname_details, load_balancer_id, name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#update_hostname.' if logger

      raise "Missing the required parameter 'update_hostname_details' when calling update_hostname." if update_hostname_details.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling update_hostname." if load_balancer_id.nil?
      raise "Missing the required parameter 'name' when calling update_hostname." if name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'name' must not be blank" if OCI::Internal::Util.blank_string?(name)

      path = '/loadBalancers/{loadBalancerId}/hostnames/{name}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{name}', name.to_s)
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

      post_body = @api_client.object_to_http_body(update_hostname_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#update_hostname') do
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


    # Updates a listener for a given load balancer.
    # @param [OCI::LoadBalancer::Models::UpdateListenerDetails] update_listener_details Details to update a listener.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the listener to update.
    # @param [String] listener_name The name of the listener to update.
    #
    #   Example: `example_listener`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def update_listener(update_listener_details, load_balancer_id, listener_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#update_listener.' if logger

      raise "Missing the required parameter 'update_listener_details' when calling update_listener." if update_listener_details.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling update_listener." if load_balancer_id.nil?
      raise "Missing the required parameter 'listener_name' when calling update_listener." if listener_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'listener_name' must not be blank" if OCI::Internal::Util.blank_string?(listener_name)

      path = '/loadBalancers/{loadBalancerId}/listeners/{listenerName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{listenerName}', listener_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_listener_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#update_listener') do
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


    # Updates a load balancer's configuration.
    # @param [OCI::LoadBalancer::Models::UpdateLoadBalancerDetails] update_load_balancer_details The details for updating a load balancer's configuration.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def update_load_balancer(update_load_balancer_details, load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#update_load_balancer.' if logger

      raise "Missing the required parameter 'update_load_balancer_details' when calling update_load_balancer." if update_load_balancer_details.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling update_load_balancer." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}'.sub('{loadBalancerId}', load_balancer_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_load_balancer_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#update_load_balancer') do
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


    # Updates the network security groups to be used by a load balancer.
    # @param [OCI::LoadBalancer::Models::UpdateNetworkSecurityGroupsDetails] update_network_security_groups_details The details for updating the NSGs of the load balancer.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer on which update the NSGs.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def update_network_security_groups(update_network_security_groups_details, load_balancer_id, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#update_network_security_groups.' if logger

      raise "Missing the required parameter 'update_network_security_groups_details' when calling update_network_security_groups." if update_network_security_groups_details.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling update_network_security_groups." if load_balancer_id.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)

      path = '/loadBalancers/{loadBalancerId}/networkSecurityGroups'.sub('{loadBalancerId}', load_balancer_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_network_security_groups_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#update_network_security_groups') do
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


    # Overwrites an existing path route set on the specified load balancer. Use this operation to add, delete, or alter
    # path route rules in a path route set.
    #
    # To add a new path route rule to a path route set, the `pathRoutes` in the
    # {#update_path_route_set_details update_path_route_set_details} object must include
    # both the new path route rule to add and the existing path route rules to retain.
    #
    # @param [OCI::LoadBalancer::Models::UpdatePathRouteSetDetails] update_path_route_set_details The configuration details to update a path route set.
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the load balancer associated with the path route set to update.
    # @param [String] path_route_set_name The name of the path route set to update.
    #
    #   Example: `example_path_route_set`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (e.g., if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def update_path_route_set(update_path_route_set_details, load_balancer_id, path_route_set_name, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#update_path_route_set.' if logger

      raise "Missing the required parameter 'update_path_route_set_details' when calling update_path_route_set." if update_path_route_set_details.nil?
      raise "Missing the required parameter 'load_balancer_id' when calling update_path_route_set." if load_balancer_id.nil?
      raise "Missing the required parameter 'path_route_set_name' when calling update_path_route_set." if path_route_set_name.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'path_route_set_name' must not be blank" if OCI::Internal::Util.blank_string?(path_route_set_name)

      path = '/loadBalancers/{loadBalancerId}/pathRouteSets/{pathRouteSetName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{pathRouteSetName}', path_route_set_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_path_route_set_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#update_path_route_set') do
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


    # Overwrites an existing set of rules on the specified load balancer. Use this operation to add or alter
    # the rules in a rule set.
    #
    # To add a new rule to a set, the body must include both the new rule to add and the existing rules to retain.
    #
    # @param [String] load_balancer_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the specified load balancer.
    # @param [String] rule_set_name The name of the rule set to update.
    #
    #   Example: `example_rule_set`
    #
    # @param [OCI::LoadBalancer::Models::UpdateRuleSetDetails] update_rule_set_details The configuration details to update a set of rules.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a
    #   particular request, please provide the request ID.
    #    (default to )
    # @return [Response] A Response object with data of type nil
    def update_rule_set(load_balancer_id, rule_set_name, update_rule_set_details, opts = {})
      logger.debug 'Calling operation LoadBalancerClient#update_rule_set.' if logger

      raise "Missing the required parameter 'load_balancer_id' when calling update_rule_set." if load_balancer_id.nil?
      raise "Missing the required parameter 'rule_set_name' when calling update_rule_set." if rule_set_name.nil?
      raise "Missing the required parameter 'update_rule_set_details' when calling update_rule_set." if update_rule_set_details.nil?
      raise "Parameter value for 'load_balancer_id' must not be blank" if OCI::Internal::Util.blank_string?(load_balancer_id)
      raise "Parameter value for 'rule_set_name' must not be blank" if OCI::Internal::Util.blank_string?(rule_set_name)

      path = '/loadBalancers/{loadBalancerId}/ruleSets/{ruleSetName}'.sub('{loadBalancerId}', load_balancer_id.to_s).sub('{ruleSetName}', rule_set_name.to_s)
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

      post_body = @api_client.object_to_http_body(update_rule_set_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'LoadBalancerClient#update_rule_set') do
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
