# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Use the Core Services API to manage resources such as virtual cloud networks (VCNs),
  # compute instances, and block storage volumes. For more information, see the console
  # documentation for the [Networking](/iaas/Content/Network/Concepts/overview.htm),
  # [Compute](/iaas/Content/Compute/Concepts/computeoverview.htm), and
  # [Block Volume](/iaas/Content/Block/Concepts/overview.htm) services.
  class Core::VirtualNetworkClient
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


    # Creates a new VirtualNetworkClient.
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
        @endpoint = endpoint + '/20160918'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "VirtualNetworkClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://iaas.{region}.{secondLevelDomain}') + '/20160918'
      logger.info "VirtualNetworkClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Adds one or more route distribution statements to the specified route distribution.
    #
    # @param [String] drg_route_distribution_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the route distribution.
    # @param [OCI::Core::Models::AddDrgRouteDistributionStatementsDetails] add_drg_route_distribution_statements_details Request with one or more route distribution statements to be inserted into the route distribution.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::DrgRouteDistributionStatement DrgRouteDistributionStatement}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/add_drg_route_distribution_statements.rb.html) to see an example of how to use add_drg_route_distribution_statements API.
    def add_drg_route_distribution_statements(drg_route_distribution_id, add_drg_route_distribution_statements_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#add_drg_route_distribution_statements.' if logger

      raise "Missing the required parameter 'drg_route_distribution_id' when calling add_drg_route_distribution_statements." if drg_route_distribution_id.nil?
      raise "Missing the required parameter 'add_drg_route_distribution_statements_details' when calling add_drg_route_distribution_statements." if add_drg_route_distribution_statements_details.nil?
      raise "Parameter value for 'drg_route_distribution_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_distribution_id)

      path = '/drgRouteDistributions/{drgRouteDistributionId}/actions/addDrgRouteDistributionStatements'.sub('{drgRouteDistributionId}', drg_route_distribution_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(add_drg_route_distribution_statements_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#add_drg_route_distribution_statements') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::DrgRouteDistributionStatement>'
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


    # Adds one or more static route rules to the specified DRG route table.
    #
    # @param [String] drg_route_table_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG route table.
    # @param [OCI::Core::Models::AddDrgRouteRulesDetails] add_drg_route_rules_details Request for one or more route rules to be inserted into the DRG route table.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::DrgRouteRule DrgRouteRule}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/add_drg_route_rules.rb.html) to see an example of how to use add_drg_route_rules API.
    def add_drg_route_rules(drg_route_table_id, add_drg_route_rules_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#add_drg_route_rules.' if logger

      raise "Missing the required parameter 'drg_route_table_id' when calling add_drg_route_rules." if drg_route_table_id.nil?
      raise "Missing the required parameter 'add_drg_route_rules_details' when calling add_drg_route_rules." if add_drg_route_rules_details.nil?
      raise "Parameter value for 'drg_route_table_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_table_id)

      path = '/drgRouteTables/{drgRouteTableId}/actions/addDrgRouteRules'.sub('{drgRouteTableId}', drg_route_table_id.to_s)
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

      post_body = @api_client.object_to_http_body(add_drg_route_rules_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#add_drg_route_rules') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::DrgRouteRule>'
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


    # Add an IPv6 CIDR to a subnet.
    #
    # @param [String] subnet_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the subnet.
    # @param [OCI::Core::Models::AddSubnetIpv6CidrDetails] add_subnet_ipv6_cidr_details Details object for adding an IPv6 CIDR to a subnet.
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
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/add_ipv6_subnet_cidr.rb.html) to see an example of how to use add_ipv6_subnet_cidr API.
    def add_ipv6_subnet_cidr(subnet_id, add_subnet_ipv6_cidr_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#add_ipv6_subnet_cidr.' if logger

      raise "Missing the required parameter 'subnet_id' when calling add_ipv6_subnet_cidr." if subnet_id.nil?
      raise "Missing the required parameter 'add_subnet_ipv6_cidr_details' when calling add_ipv6_subnet_cidr." if add_subnet_ipv6_cidr_details.nil?
      raise "Parameter value for 'subnet_id' must not be blank" if OCI::Internal::Util.blank_string?(subnet_id)

      path = '/subnets/{subnetId}/actions/addIpv6Cidr'.sub('{subnetId}', subnet_id.to_s)
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

      post_body = @api_client.object_to_http_body(add_subnet_ipv6_cidr_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#add_ipv6_subnet_cidr') do
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


    # Add an IPv6 CIDR to a VCN. The VCN size is always /56 and assigned by Oracle.
    # Once added the IPv6 CIDR block cannot be removed or modified.
    #
    # @param [String] vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [OCI::Core::Models::AddVcnIpv6CidrDetails] :add_vcn_ipv6_cidr_details Details object for adding an IPv6 VCN CIDR.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/add_ipv6_vcn_cidr.rb.html) to see an example of how to use add_ipv6_vcn_cidr API.
    def add_ipv6_vcn_cidr(vcn_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#add_ipv6_vcn_cidr.' if logger

      raise "Missing the required parameter 'vcn_id' when calling add_ipv6_vcn_cidr." if vcn_id.nil?
      raise "Parameter value for 'vcn_id' must not be blank" if OCI::Internal::Util.blank_string?(vcn_id)

      path = '/vcns/{vcnId}/actions/addIpv6Cidr'.sub('{vcnId}', vcn_id.to_s)
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

      post_body = @api_client.object_to_http_body(opts[:add_vcn_ipv6_cidr_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#add_ipv6_vcn_cidr') do
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
    # rubocop:disable Lint/UnusedMethodArgument


    # Adds one or more security rules to the specified network security group.
    #
    # @param [String] network_security_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the network security group.
    # @param [OCI::Core::Models::AddNetworkSecurityGroupSecurityRulesDetails] add_network_security_group_security_rules_details Request with one or more security rules to be associated with the network security group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::AddedNetworkSecurityGroupSecurityRules AddedNetworkSecurityGroupSecurityRules}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/add_network_security_group_security_rules.rb.html) to see an example of how to use add_network_security_group_security_rules API.
    def add_network_security_group_security_rules(network_security_group_id, add_network_security_group_security_rules_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#add_network_security_group_security_rules.' if logger

      raise "Missing the required parameter 'network_security_group_id' when calling add_network_security_group_security_rules." if network_security_group_id.nil?
      raise "Missing the required parameter 'add_network_security_group_security_rules_details' when calling add_network_security_group_security_rules." if add_network_security_group_security_rules_details.nil?
      raise "Parameter value for 'network_security_group_id' must not be blank" if OCI::Internal::Util.blank_string?(network_security_group_id)

      path = '/networkSecurityGroups/{networkSecurityGroupId}/actions/addSecurityRules'.sub('{networkSecurityGroupId}', network_security_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(add_network_security_group_security_rules_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#add_network_security_group_security_rules') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::AddedNetworkSecurityGroupSecurityRules'
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


    # Adds some or all of a CIDR block to a public IP pool.
    #
    # The CIDR block (or subrange) must not overlap with any other CIDR block already added to this or any other public IP pool.
    #
    # @param [String] public_ip_pool_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the public IP pool.
    # @param [OCI::Core::Models::AddPublicIpPoolCapacityDetails] add_public_ip_pool_capacity_details Byoip Range prefix and a cidr from it
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::PublicIpPool PublicIpPool}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/add_public_ip_pool_capacity.rb.html) to see an example of how to use add_public_ip_pool_capacity API.
    def add_public_ip_pool_capacity(public_ip_pool_id, add_public_ip_pool_capacity_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#add_public_ip_pool_capacity.' if logger

      raise "Missing the required parameter 'public_ip_pool_id' when calling add_public_ip_pool_capacity." if public_ip_pool_id.nil?
      raise "Missing the required parameter 'add_public_ip_pool_capacity_details' when calling add_public_ip_pool_capacity." if add_public_ip_pool_capacity_details.nil?
      raise "Parameter value for 'public_ip_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(public_ip_pool_id)

      path = '/publicIpPools/{publicIpPoolId}/actions/addCapacity'.sub('{publicIpPoolId}', public_ip_pool_id.to_s)
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

      post_body = @api_client.object_to_http_body(add_public_ip_pool_capacity_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#add_public_ip_pool_capacity') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PublicIpPool'
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


    # Adds a CIDR block to a VCN. The CIDR block you add:
    #
    # - Must be valid.
    # - Must not overlap with another CIDR block in the VCN, a CIDR block of a peered VCN, or the on-premises network CIDR block.
    # - Must not exceed the limit of CIDR blocks allowed per VCN.
    #
    # **Note:** Adding a CIDR block places your VCN in an updating state until the changes are complete. You cannot create or update the VCN's subnets, VLANs, LPGs, or route tables during this operation. The time to completion can take a few minutes. You can use the `GetWorkRequest` operation to check the status of the update.
    #
    # @param [String] vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @param [OCI::Core::Models::AddVcnCidrDetails] add_vcn_cidr_details Details object for deleting a VCN CIDR.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/add_vcn_cidr.rb.html) to see an example of how to use add_vcn_cidr API.
    def add_vcn_cidr(vcn_id, add_vcn_cidr_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#add_vcn_cidr.' if logger

      raise "Missing the required parameter 'vcn_id' when calling add_vcn_cidr." if vcn_id.nil?
      raise "Missing the required parameter 'add_vcn_cidr_details' when calling add_vcn_cidr." if add_vcn_cidr_details.nil?
      raise "Parameter value for 'vcn_id' must not be blank" if OCI::Internal::Util.blank_string?(vcn_id)

      path = '/vcns/{vcnId}/actions/addCidr'.sub('{vcnId}', vcn_id.to_s)
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

      post_body = @api_client.object_to_http_body(add_vcn_cidr_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#add_vcn_cidr') do
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


    # Begins BGP route advertisements for the BYOIP CIDR block you imported to the Oracle Cloud.
    # The `ByoipRange` resource must be in the PROVISIONED state before the BYOIP CIDR block routes can be advertised with BGP.
    #
    # @param [String] byoip_range_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the `ByoipRange` resource containing the BYOIP CIDR block.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/advertise_byoip_range.rb.html) to see an example of how to use advertise_byoip_range API.
    def advertise_byoip_range(byoip_range_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#advertise_byoip_range.' if logger

      raise "Missing the required parameter 'byoip_range_id' when calling advertise_byoip_range." if byoip_range_id.nil?
      raise "Parameter value for 'byoip_range_id' must not be blank" if OCI::Internal::Util.blank_string?(byoip_range_id)

      path = '/byoipRanges/{byoipRangeId}/actions/advertise'.sub('{byoipRangeId}', byoip_range_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#advertise_byoip_range') do
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


    # Adds the specified {Service} to the list of enabled
    # `Service` objects for the specified gateway. You must also set up a route rule with the
    # `cidrBlock` of the `Service` as the rule's destination and the service gateway as the rule's
    # target. See {RouteTable}.
    #
    # **Note:** The `AttachServiceId` operation is an easy way to add an individual `Service` to
    # the service gateway. Compare it with
    # {#update_service_gateway update_service_gateway}, which replaces
    # the entire existing list of enabled `Service` objects with the list that you provide in the
    # `Update` call.
    #
    # @param [String] service_gateway_id The service gateway's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Core::Models::ServiceIdRequestDetails] attach_service_details ServiceId of Service to be attached to a service gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::ServiceGateway ServiceGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/attach_service_id.rb.html) to see an example of how to use attach_service_id API.
    def attach_service_id(service_gateway_id, attach_service_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#attach_service_id.' if logger

      raise "Missing the required parameter 'service_gateway_id' when calling attach_service_id." if service_gateway_id.nil?
      raise "Missing the required parameter 'attach_service_details' when calling attach_service_id." if attach_service_details.nil?
      raise "Parameter value for 'service_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(service_gateway_id)

      path = '/serviceGateways/{serviceGatewayId}/actions/attachService'.sub('{serviceGatewayId}', service_gateway_id.to_s)
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

      post_body = @api_client.object_to_http_body(attach_service_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#attach_service_id') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::ServiceGateway'
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


    # Adds one or more customer public IP prefixes to the specified public virtual circuit.
    # Use this operation (and not {#update_virtual_circuit update_virtual_circuit})
    # to add prefixes to the virtual circuit. Oracle must verify the customer's ownership
    # of each prefix before traffic for that prefix will flow across the virtual circuit.
    #
    # @param [String] virtual_circuit_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the virtual circuit.
    # @param [OCI::Core::Models::BulkAddVirtualCircuitPublicPrefixesDetails] bulk_add_virtual_circuit_public_prefixes_details Request with publix prefixes to be added to the virtual circuit
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/bulk_add_virtual_circuit_public_prefixes.rb.html) to see an example of how to use bulk_add_virtual_circuit_public_prefixes API.
    def bulk_add_virtual_circuit_public_prefixes(virtual_circuit_id, bulk_add_virtual_circuit_public_prefixes_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#bulk_add_virtual_circuit_public_prefixes.' if logger

      raise "Missing the required parameter 'virtual_circuit_id' when calling bulk_add_virtual_circuit_public_prefixes." if virtual_circuit_id.nil?
      raise "Missing the required parameter 'bulk_add_virtual_circuit_public_prefixes_details' when calling bulk_add_virtual_circuit_public_prefixes." if bulk_add_virtual_circuit_public_prefixes_details.nil?
      raise "Parameter value for 'virtual_circuit_id' must not be blank" if OCI::Internal::Util.blank_string?(virtual_circuit_id)

      path = '/virtualCircuits/{virtualCircuitId}/actions/bulkAddPublicPrefixes'.sub('{virtualCircuitId}', virtual_circuit_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(bulk_add_virtual_circuit_public_prefixes_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#bulk_add_virtual_circuit_public_prefixes') do
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
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Removes one or more customer public IP prefixes from the specified public virtual circuit.
    # Use this operation (and not {#update_virtual_circuit update_virtual_circuit})
    # to remove prefixes from the virtual circuit. When the virtual circuit's state switches
    # back to PROVISIONED, Oracle stops advertising the specified prefixes across the connection.
    #
    # @param [String] virtual_circuit_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the virtual circuit.
    # @param [OCI::Core::Models::BulkDeleteVirtualCircuitPublicPrefixesDetails] bulk_delete_virtual_circuit_public_prefixes_details Request with public prefixes to be deleted from the virtual circuit.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/bulk_delete_virtual_circuit_public_prefixes.rb.html) to see an example of how to use bulk_delete_virtual_circuit_public_prefixes API.
    def bulk_delete_virtual_circuit_public_prefixes(virtual_circuit_id, bulk_delete_virtual_circuit_public_prefixes_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#bulk_delete_virtual_circuit_public_prefixes.' if logger

      raise "Missing the required parameter 'virtual_circuit_id' when calling bulk_delete_virtual_circuit_public_prefixes." if virtual_circuit_id.nil?
      raise "Missing the required parameter 'bulk_delete_virtual_circuit_public_prefixes_details' when calling bulk_delete_virtual_circuit_public_prefixes." if bulk_delete_virtual_circuit_public_prefixes_details.nil?
      raise "Parameter value for 'virtual_circuit_id' must not be blank" if OCI::Internal::Util.blank_string?(virtual_circuit_id)

      path = '/virtualCircuits/{virtualCircuitId}/actions/bulkDeletePublicPrefixes'.sub('{virtualCircuitId}', virtual_circuit_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(bulk_delete_virtual_circuit_public_prefixes_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#bulk_delete_virtual_circuit_public_prefixes') do
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
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a BYOIP CIDR block to a different compartment. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] byoip_range_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the `ByoipRange` resource containing the BYOIP CIDR block.
    # @param [OCI::Core::Models::ChangeByoipRangeCompartmentDetails] change_byoip_range_compartment_details Request to change the compartment of a BYOIP CIDR block.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_byoip_range_compartment.rb.html) to see an example of how to use change_byoip_range_compartment API.
    def change_byoip_range_compartment(byoip_range_id, change_byoip_range_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_byoip_range_compartment.' if logger

      raise "Missing the required parameter 'byoip_range_id' when calling change_byoip_range_compartment." if byoip_range_id.nil?
      raise "Missing the required parameter 'change_byoip_range_compartment_details' when calling change_byoip_range_compartment." if change_byoip_range_compartment_details.nil?
      raise "Parameter value for 'byoip_range_id' must not be blank" if OCI::Internal::Util.blank_string?(byoip_range_id)

      path = '/byoipRanges/{byoipRangeId}/actions/changeCompartment'.sub('{byoipRangeId}', byoip_range_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_byoip_range_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_byoip_range_compartment') do
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


    # Moves a capture filter to a new compartment in the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] capture_filter_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the capture filter.
    # @param [OCI::Core::Models::ChangeCaptureFilterCompartmentDetails] change_capture_filter_compartment_details Request to change the compartment of a VTAP.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_capture_filter_compartment.rb.html) to see an example of how to use change_capture_filter_compartment API.
    def change_capture_filter_compartment(capture_filter_id, change_capture_filter_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_capture_filter_compartment.' if logger

      raise "Missing the required parameter 'capture_filter_id' when calling change_capture_filter_compartment." if capture_filter_id.nil?
      raise "Missing the required parameter 'change_capture_filter_compartment_details' when calling change_capture_filter_compartment." if change_capture_filter_compartment_details.nil?
      raise "Parameter value for 'capture_filter_id' must not be blank" if OCI::Internal::Util.blank_string?(capture_filter_id)

      path = '/captureFilters/{captureFilterId}/actions/changeCompartment'.sub('{captureFilterId}', capture_filter_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_capture_filter_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_capture_filter_compartment') do
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


    # Moves a CPE object into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] cpe_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the CPE.
    # @param [OCI::Core::Models::ChangeCpeCompartmentDetails] change_cpe_compartment_details Request to change the compartment of a CPE.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_cpe_compartment.rb.html) to see an example of how to use change_cpe_compartment API.
    def change_cpe_compartment(cpe_id, change_cpe_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_cpe_compartment.' if logger

      raise "Missing the required parameter 'cpe_id' when calling change_cpe_compartment." if cpe_id.nil?
      raise "Missing the required parameter 'change_cpe_compartment_details' when calling change_cpe_compartment." if change_cpe_compartment_details.nil?
      raise "Parameter value for 'cpe_id' must not be blank" if OCI::Internal::Util.blank_string?(cpe_id)

      path = '/cpes/{cpeId}/actions/changeCompartment'.sub('{cpeId}', cpe_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_cpe_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_cpe_compartment') do
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


    # Moves a cross-connect into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] cross_connect_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the cross-connect.
    # @param [OCI::Core::Models::ChangeCrossConnectCompartmentDetails] change_cross_connect_compartment_details Request to change the compartment of a Cross Connect.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_cross_connect_compartment.rb.html) to see an example of how to use change_cross_connect_compartment API.
    def change_cross_connect_compartment(cross_connect_id, change_cross_connect_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_cross_connect_compartment.' if logger

      raise "Missing the required parameter 'cross_connect_id' when calling change_cross_connect_compartment." if cross_connect_id.nil?
      raise "Missing the required parameter 'change_cross_connect_compartment_details' when calling change_cross_connect_compartment." if change_cross_connect_compartment_details.nil?
      raise "Parameter value for 'cross_connect_id' must not be blank" if OCI::Internal::Util.blank_string?(cross_connect_id)

      path = '/crossConnects/{crossConnectId}/actions/changeCompartment'.sub('{crossConnectId}', cross_connect_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_cross_connect_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_cross_connect_compartment') do
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


    # Moves a cross-connect group into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] cross_connect_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the cross-connect group.
    # @param [OCI::Core::Models::ChangeCrossConnectGroupCompartmentDetails] change_cross_connect_group_compartment_details Request to change the compartment of a Cross Connect Group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_cross_connect_group_compartment.rb.html) to see an example of how to use change_cross_connect_group_compartment API.
    def change_cross_connect_group_compartment(cross_connect_group_id, change_cross_connect_group_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_cross_connect_group_compartment.' if logger

      raise "Missing the required parameter 'cross_connect_group_id' when calling change_cross_connect_group_compartment." if cross_connect_group_id.nil?
      raise "Missing the required parameter 'change_cross_connect_group_compartment_details' when calling change_cross_connect_group_compartment." if change_cross_connect_group_compartment_details.nil?
      raise "Parameter value for 'cross_connect_group_id' must not be blank" if OCI::Internal::Util.blank_string?(cross_connect_group_id)

      path = '/crossConnectGroups/{crossConnectGroupId}/actions/changeCompartment'.sub('{crossConnectGroupId}', cross_connect_group_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_cross_connect_group_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_cross_connect_group_compartment') do
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


    # Moves a set of DHCP options into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] dhcp_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the set of DHCP options.
    # @param [OCI::Core::Models::ChangeDhcpOptionsCompartmentDetails] change_dhcp_options_compartment_details Request to change the compartment of a set of DHCP Options.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_dhcp_options_compartment.rb.html) to see an example of how to use change_dhcp_options_compartment API.
    def change_dhcp_options_compartment(dhcp_id, change_dhcp_options_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_dhcp_options_compartment.' if logger

      raise "Missing the required parameter 'dhcp_id' when calling change_dhcp_options_compartment." if dhcp_id.nil?
      raise "Missing the required parameter 'change_dhcp_options_compartment_details' when calling change_dhcp_options_compartment." if change_dhcp_options_compartment_details.nil?
      raise "Parameter value for 'dhcp_id' must not be blank" if OCI::Internal::Util.blank_string?(dhcp_id)

      path = '/dhcps/{dhcpId}/actions/changeCompartment'.sub('{dhcpId}', dhcp_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_dhcp_options_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_dhcp_options_compartment') do
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


    # Moves a DRG into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] drg_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG.
    # @param [OCI::Core::Models::ChangeDrgCompartmentDetails] change_drg_compartment_details Request to change the compartment of a DRG.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_drg_compartment.rb.html) to see an example of how to use change_drg_compartment API.
    def change_drg_compartment(drg_id, change_drg_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_drg_compartment.' if logger

      raise "Missing the required parameter 'drg_id' when calling change_drg_compartment." if drg_id.nil?
      raise "Missing the required parameter 'change_drg_compartment_details' when calling change_drg_compartment." if change_drg_compartment_details.nil?
      raise "Parameter value for 'drg_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_id)

      path = '/drgs/{drgId}/actions/changeCompartment'.sub('{drgId}', drg_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_drg_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_drg_compartment') do
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


    # Moves an internet gateway into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] ig_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the internet gateway.
    # @param [OCI::Core::Models::ChangeInternetGatewayCompartmentDetails] change_internet_gateway_compartment_details Request to change the compartment of an internet gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_internet_gateway_compartment.rb.html) to see an example of how to use change_internet_gateway_compartment API.
    def change_internet_gateway_compartment(ig_id, change_internet_gateway_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_internet_gateway_compartment.' if logger

      raise "Missing the required parameter 'ig_id' when calling change_internet_gateway_compartment." if ig_id.nil?
      raise "Missing the required parameter 'change_internet_gateway_compartment_details' when calling change_internet_gateway_compartment." if change_internet_gateway_compartment_details.nil?
      raise "Parameter value for 'ig_id' must not be blank" if OCI::Internal::Util.blank_string?(ig_id)

      path = '/internetGateways/{igId}/actions/changeCompartment'.sub('{igId}', ig_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_internet_gateway_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_internet_gateway_compartment') do
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


    # Moves an IPSec connection into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [OCI::Core::Models::ChangeIPSecConnectionCompartmentDetails] change_ip_sec_connection_compartment_details Request to change the compartment of a IPSec connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_ip_sec_connection_compartment.rb.html) to see an example of how to use change_ip_sec_connection_compartment API.
    def change_ip_sec_connection_compartment(ipsc_id, change_ip_sec_connection_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_ip_sec_connection_compartment.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling change_ip_sec_connection_compartment." if ipsc_id.nil?
      raise "Missing the required parameter 'change_ip_sec_connection_compartment_details' when calling change_ip_sec_connection_compartment." if change_ip_sec_connection_compartment_details.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)

      path = '/ipsecConnections/{ipscId}/actions/changeCompartment'.sub('{ipscId}', ipsc_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_ip_sec_connection_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_ip_sec_connection_compartment') do
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


    # Moves a local peering gateway into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] local_peering_gateway_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the local peering gateway.
    # @param [OCI::Core::Models::ChangeLocalPeeringGatewayCompartmentDetails] change_local_peering_gateway_compartment_details Request to change the compartment of a given local peering gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_local_peering_gateway_compartment.rb.html) to see an example of how to use change_local_peering_gateway_compartment API.
    def change_local_peering_gateway_compartment(local_peering_gateway_id, change_local_peering_gateway_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_local_peering_gateway_compartment.' if logger

      raise "Missing the required parameter 'local_peering_gateway_id' when calling change_local_peering_gateway_compartment." if local_peering_gateway_id.nil?
      raise "Missing the required parameter 'change_local_peering_gateway_compartment_details' when calling change_local_peering_gateway_compartment." if change_local_peering_gateway_compartment_details.nil?
      raise "Parameter value for 'local_peering_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(local_peering_gateway_id)

      path = '/localPeeringGateways/{localPeeringGatewayId}/actions/changeCompartment'.sub('{localPeeringGatewayId}', local_peering_gateway_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_local_peering_gateway_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_local_peering_gateway_compartment') do
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


    # Moves a NAT gateway into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] nat_gateway_id The NAT gateway's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Core::Models::ChangeNatGatewayCompartmentDetails] change_nat_gateway_compartment_details Request to change the compartment of a given NAT Gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_nat_gateway_compartment.rb.html) to see an example of how to use change_nat_gateway_compartment API.
    def change_nat_gateway_compartment(nat_gateway_id, change_nat_gateway_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_nat_gateway_compartment.' if logger

      raise "Missing the required parameter 'nat_gateway_id' when calling change_nat_gateway_compartment." if nat_gateway_id.nil?
      raise "Missing the required parameter 'change_nat_gateway_compartment_details' when calling change_nat_gateway_compartment." if change_nat_gateway_compartment_details.nil?
      raise "Parameter value for 'nat_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(nat_gateway_id)

      path = '/natGateways/{natGatewayId}/actions/changeCompartment'.sub('{natGatewayId}', nat_gateway_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_nat_gateway_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_nat_gateway_compartment') do
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


    # Moves a network security group into a different compartment within the same tenancy. For
    # information about moving resources between compartments, see [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] network_security_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the network security group.
    # @param [OCI::Core::Models::ChangeNetworkSecurityGroupCompartmentDetails] change_network_security_group_compartment_details Request to change the compartment of a network security group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_network_security_group_compartment.rb.html) to see an example of how to use change_network_security_group_compartment API.
    def change_network_security_group_compartment(network_security_group_id, change_network_security_group_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_network_security_group_compartment.' if logger

      raise "Missing the required parameter 'network_security_group_id' when calling change_network_security_group_compartment." if network_security_group_id.nil?
      raise "Missing the required parameter 'change_network_security_group_compartment_details' when calling change_network_security_group_compartment." if change_network_security_group_compartment_details.nil?
      raise "Parameter value for 'network_security_group_id' must not be blank" if OCI::Internal::Util.blank_string?(network_security_group_id)

      path = '/networkSecurityGroups/{networkSecurityGroupId}/actions/changeCompartment'.sub('{networkSecurityGroupId}', network_security_group_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_network_security_group_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_network_security_group_compartment') do
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


    # Moves a public IP into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # This operation applies only to reserved public IPs. Ephemeral public IPs always belong to the
    # same compartment as their VNIC and move accordingly.
    #
    # @param [String] public_ip_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the public IP.
    # @param [OCI::Core::Models::ChangePublicIpCompartmentDetails] change_public_ip_compartment_details Request to change the compartment of a Public IP.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_public_ip_compartment.rb.html) to see an example of how to use change_public_ip_compartment API.
    def change_public_ip_compartment(public_ip_id, change_public_ip_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_public_ip_compartment.' if logger

      raise "Missing the required parameter 'public_ip_id' when calling change_public_ip_compartment." if public_ip_id.nil?
      raise "Missing the required parameter 'change_public_ip_compartment_details' when calling change_public_ip_compartment." if change_public_ip_compartment_details.nil?
      raise "Parameter value for 'public_ip_id' must not be blank" if OCI::Internal::Util.blank_string?(public_ip_id)

      path = '/publicIps/{publicIpId}/actions/changeCompartment'.sub('{publicIpId}', public_ip_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_public_ip_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_public_ip_compartment') do
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


    # Moves a public IP pool to a different compartment. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] public_ip_pool_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the public IP pool.
    # @param [OCI::Core::Models::ChangePublicIpPoolCompartmentDetails] change_public_ip_pool_compartment_details Request to change the compartment of a public IP pool.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_public_ip_pool_compartment.rb.html) to see an example of how to use change_public_ip_pool_compartment API.
    def change_public_ip_pool_compartment(public_ip_pool_id, change_public_ip_pool_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_public_ip_pool_compartment.' if logger

      raise "Missing the required parameter 'public_ip_pool_id' when calling change_public_ip_pool_compartment." if public_ip_pool_id.nil?
      raise "Missing the required parameter 'change_public_ip_pool_compartment_details' when calling change_public_ip_pool_compartment." if change_public_ip_pool_compartment_details.nil?
      raise "Parameter value for 'public_ip_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(public_ip_pool_id)

      path = '/publicIpPools/{publicIpPoolId}/actions/changeCompartment'.sub('{publicIpPoolId}', public_ip_pool_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_public_ip_pool_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_public_ip_pool_compartment') do
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


    # Moves a remote peering connection (RPC) into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] remote_peering_connection_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the remote peering connection (RPC).
    # @param [OCI::Core::Models::ChangeRemotePeeringConnectionCompartmentDetails] change_remote_peering_connection_compartment_details Request to change the compartment of a remote peering connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_remote_peering_connection_compartment.rb.html) to see an example of how to use change_remote_peering_connection_compartment API.
    def change_remote_peering_connection_compartment(remote_peering_connection_id, change_remote_peering_connection_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_remote_peering_connection_compartment.' if logger

      raise "Missing the required parameter 'remote_peering_connection_id' when calling change_remote_peering_connection_compartment." if remote_peering_connection_id.nil?
      raise "Missing the required parameter 'change_remote_peering_connection_compartment_details' when calling change_remote_peering_connection_compartment." if change_remote_peering_connection_compartment_details.nil?
      raise "Parameter value for 'remote_peering_connection_id' must not be blank" if OCI::Internal::Util.blank_string?(remote_peering_connection_id)

      path = '/remotePeeringConnections/{remotePeeringConnectionId}/actions/changeCompartment'.sub('{remotePeeringConnectionId}', remote_peering_connection_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_remote_peering_connection_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_remote_peering_connection_compartment') do
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


    # Moves a route table into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] rt_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the route table.
    # @param [OCI::Core::Models::ChangeRouteTableCompartmentDetails] change_route_table_compartment_details Request to change the compartment of a given route table.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_route_table_compartment.rb.html) to see an example of how to use change_route_table_compartment API.
    def change_route_table_compartment(rt_id, change_route_table_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_route_table_compartment.' if logger

      raise "Missing the required parameter 'rt_id' when calling change_route_table_compartment." if rt_id.nil?
      raise "Missing the required parameter 'change_route_table_compartment_details' when calling change_route_table_compartment." if change_route_table_compartment_details.nil?
      raise "Parameter value for 'rt_id' must not be blank" if OCI::Internal::Util.blank_string?(rt_id)

      path = '/routeTables/{rtId}/actions/changeCompartment'.sub('{rtId}', rt_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_route_table_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_route_table_compartment') do
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


    # Moves a security list into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] security_list_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the security list.
    # @param [OCI::Core::Models::ChangeSecurityListCompartmentDetails] change_security_list_compartment_details Request to change the compartment of a given security list.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_security_list_compartment.rb.html) to see an example of how to use change_security_list_compartment API.
    def change_security_list_compartment(security_list_id, change_security_list_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_security_list_compartment.' if logger

      raise "Missing the required parameter 'security_list_id' when calling change_security_list_compartment." if security_list_id.nil?
      raise "Missing the required parameter 'change_security_list_compartment_details' when calling change_security_list_compartment." if change_security_list_compartment_details.nil?
      raise "Parameter value for 'security_list_id' must not be blank" if OCI::Internal::Util.blank_string?(security_list_id)

      path = '/securityLists/{securityListId}/actions/changeCompartment'.sub('{securityListId}', security_list_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_security_list_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_security_list_compartment') do
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


    # Moves a service gateway into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] service_gateway_id The service gateway's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Core::Models::ChangeServiceGatewayCompartmentDetails] change_service_gateway_compartment_details Request to change the compartment of a given Service Gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_service_gateway_compartment.rb.html) to see an example of how to use change_service_gateway_compartment API.
    def change_service_gateway_compartment(service_gateway_id, change_service_gateway_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_service_gateway_compartment.' if logger

      raise "Missing the required parameter 'service_gateway_id' when calling change_service_gateway_compartment." if service_gateway_id.nil?
      raise "Missing the required parameter 'change_service_gateway_compartment_details' when calling change_service_gateway_compartment." if change_service_gateway_compartment_details.nil?
      raise "Parameter value for 'service_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(service_gateway_id)

      path = '/serviceGateways/{serviceGatewayId}/actions/changeCompartment'.sub('{serviceGatewayId}', service_gateway_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_service_gateway_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_service_gateway_compartment') do
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


    # Moves a subnet into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] subnet_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the subnet.
    # @param [OCI::Core::Models::ChangeSubnetCompartmentDetails] change_subnet_compartment_details Request to change the compartment of a given subnet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_subnet_compartment.rb.html) to see an example of how to use change_subnet_compartment API.
    def change_subnet_compartment(subnet_id, change_subnet_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_subnet_compartment.' if logger

      raise "Missing the required parameter 'subnet_id' when calling change_subnet_compartment." if subnet_id.nil?
      raise "Missing the required parameter 'change_subnet_compartment_details' when calling change_subnet_compartment." if change_subnet_compartment_details.nil?
      raise "Parameter value for 'subnet_id' must not be blank" if OCI::Internal::Util.blank_string?(subnet_id)

      path = '/subnets/{subnetId}/actions/changeCompartment'.sub('{subnetId}', subnet_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_subnet_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_subnet_compartment') do
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


    # Moves a VCN into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @param [OCI::Core::Models::ChangeVcnCompartmentDetails] change_vcn_compartment_details Request to change the compartment of a given VCN.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_vcn_compartment.rb.html) to see an example of how to use change_vcn_compartment API.
    def change_vcn_compartment(vcn_id, change_vcn_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_vcn_compartment.' if logger

      raise "Missing the required parameter 'vcn_id' when calling change_vcn_compartment." if vcn_id.nil?
      raise "Missing the required parameter 'change_vcn_compartment_details' when calling change_vcn_compartment." if change_vcn_compartment_details.nil?
      raise "Parameter value for 'vcn_id' must not be blank" if OCI::Internal::Util.blank_string?(vcn_id)

      path = '/vcns/{vcnId}/actions/changeCompartment'.sub('{vcnId}', vcn_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_vcn_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_vcn_compartment') do
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


    # Moves a virtual circuit into a different compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] virtual_circuit_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the virtual circuit.
    # @param [OCI::Core::Models::ChangeVirtualCircuitCompartmentDetails] change_virtual_circuit_compartment_details Request to change the compartment of a virtual circuit.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_virtual_circuit_compartment.rb.html) to see an example of how to use change_virtual_circuit_compartment API.
    def change_virtual_circuit_compartment(virtual_circuit_id, change_virtual_circuit_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_virtual_circuit_compartment.' if logger

      raise "Missing the required parameter 'virtual_circuit_id' when calling change_virtual_circuit_compartment." if virtual_circuit_id.nil?
      raise "Missing the required parameter 'change_virtual_circuit_compartment_details' when calling change_virtual_circuit_compartment." if change_virtual_circuit_compartment_details.nil?
      raise "Parameter value for 'virtual_circuit_id' must not be blank" if OCI::Internal::Util.blank_string?(virtual_circuit_id)

      path = '/virtualCircuits/{virtualCircuitId}/actions/changeCompartment'.sub('{virtualCircuitId}', virtual_circuit_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_virtual_circuit_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_virtual_circuit_compartment') do
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


    # Moves a VLAN into a different compartment within the same tenancy.
    # For information about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] vlan_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VLAN.
    # @param [OCI::Core::Models::ChangeVlanCompartmentDetails] change_vlan_compartment_details Request to change the compartment of a given VLAN.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_vlan_compartment.rb.html) to see an example of how to use change_vlan_compartment API.
    def change_vlan_compartment(vlan_id, change_vlan_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_vlan_compartment.' if logger

      raise "Missing the required parameter 'vlan_id' when calling change_vlan_compartment." if vlan_id.nil?
      raise "Missing the required parameter 'change_vlan_compartment_details' when calling change_vlan_compartment." if change_vlan_compartment_details.nil?
      raise "Parameter value for 'vlan_id' must not be blank" if OCI::Internal::Util.blank_string?(vlan_id)

      path = '/vlans/{vlanId}/actions/changeCompartment'.sub('{vlanId}', vlan_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_vlan_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_vlan_compartment') do
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


    # Moves a VTAP to a new compartment within the same tenancy. For information
    # about moving resources between compartments, see
    # [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes).
    #
    # @param [String] vtap_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VTAP.
    # @param [OCI::Core::Models::ChangeVtapCompartmentDetails] change_vtap_compartment_details Request to change the compartment that contains a VTAP.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/change_vtap_compartment.rb.html) to see an example of how to use change_vtap_compartment API.
    def change_vtap_compartment(vtap_id, change_vtap_compartment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#change_vtap_compartment.' if logger

      raise "Missing the required parameter 'vtap_id' when calling change_vtap_compartment." if vtap_id.nil?
      raise "Missing the required parameter 'change_vtap_compartment_details' when calling change_vtap_compartment." if change_vtap_compartment_details.nil?
      raise "Parameter value for 'vtap_id' must not be blank" if OCI::Internal::Util.blank_string?(vtap_id)

      path = '/vtaps/{vtapId}/actions/changeCompartment'.sub('{vtapId}', vtap_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_vtap_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#change_vtap_compartment') do
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
    # rubocop:disable Lint/UnusedMethodArgument


    # Connects this local peering gateway (LPG) to another one in the same region.
    #
    # This operation must be called by the VCN administrator who is designated as
    # the *requestor* in the peering relationship. The *acceptor* must implement
    # an Identity and Access Management (IAM) policy that gives the requestor permission
    # to connect to LPGs in the acceptor's compartment. Without that permission, this
    # operation will fail. For more information, see
    # [VCN Peering](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/VCNpeering.htm).
    #
    # @param [String] local_peering_gateway_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the local peering gateway.
    # @param [OCI::Core::Models::ConnectLocalPeeringGatewaysDetails] connect_local_peering_gateways_details Details regarding the local peering gateway to connect.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/connect_local_peering_gateways.rb.html) to see an example of how to use connect_local_peering_gateways API.
    def connect_local_peering_gateways(local_peering_gateway_id, connect_local_peering_gateways_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#connect_local_peering_gateways.' if logger

      raise "Missing the required parameter 'local_peering_gateway_id' when calling connect_local_peering_gateways." if local_peering_gateway_id.nil?
      raise "Missing the required parameter 'connect_local_peering_gateways_details' when calling connect_local_peering_gateways." if connect_local_peering_gateways_details.nil?
      raise "Parameter value for 'local_peering_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(local_peering_gateway_id)

      path = '/localPeeringGateways/{localPeeringGatewayId}/actions/connect'.sub('{localPeeringGatewayId}', local_peering_gateway_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(connect_local_peering_gateways_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#connect_local_peering_gateways') do
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
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Connects this RPC to another one in a different region.
    #
    # This operation must be called by the VCN administrator who is designated as
    # the *requestor* in the peering relationship. The *acceptor* must implement
    # an Identity and Access Management (IAM) policy that gives the requestor permission
    # to connect to RPCs in the acceptor's compartment. Without that permission, this
    # operation will fail. For more information, see
    # [VCN Peering](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/VCNpeering.htm).
    #
    # @param [String] remote_peering_connection_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the remote peering connection (RPC).
    # @param [OCI::Core::Models::ConnectRemotePeeringConnectionsDetails] connect_remote_peering_connections_details Details to connect peering connection with peering connection from remote region
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/connect_remote_peering_connections.rb.html) to see an example of how to use connect_remote_peering_connections API.
    def connect_remote_peering_connections(remote_peering_connection_id, connect_remote_peering_connections_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#connect_remote_peering_connections.' if logger

      raise "Missing the required parameter 'remote_peering_connection_id' when calling connect_remote_peering_connections." if remote_peering_connection_id.nil?
      raise "Missing the required parameter 'connect_remote_peering_connections_details' when calling connect_remote_peering_connections." if connect_remote_peering_connections_details.nil?
      raise "Parameter value for 'remote_peering_connection_id' must not be blank" if OCI::Internal::Util.blank_string?(remote_peering_connection_id)

      path = '/remotePeeringConnections/{remotePeeringConnectionId}/actions/connect'.sub('{remotePeeringConnectionId}', remote_peering_connection_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(connect_remote_peering_connections_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#connect_remote_peering_connections') do
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
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a subrange of the BYOIP CIDR block.
    #
    # @param [OCI::Core::Models::CreateByoipRangeDetails] create_byoip_range_details Details needed to create a BYOIP CIDR block subrange.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::ByoipRange ByoipRange}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_byoip_range.rb.html) to see an example of how to use create_byoip_range API.
    def create_byoip_range(create_byoip_range_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_byoip_range.' if logger

      raise "Missing the required parameter 'create_byoip_range_details' when calling create_byoip_range." if create_byoip_range_details.nil?

      path = '/byoipRanges'
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

      post_body = @api_client.object_to_http_body(create_byoip_range_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_byoip_range') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::ByoipRange'
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


    # Creates a virtual test access point (VTAP) capture filter in the specified compartment.
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains
    # the VTAP. For more information about compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm).
    # For information about OCIDs, see [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # You may optionally specify a *display name* for the VTAP, otherwise a default is provided.
    # It does not have to be unique, and you can change it.
    #
    # @param [OCI::Core::Models::CreateCaptureFilterDetails] create_capture_filter_details Details for creating a capture filter.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::CaptureFilter CaptureFilter}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_capture_filter.rb.html) to see an example of how to use create_capture_filter API.
    def create_capture_filter(create_capture_filter_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_capture_filter.' if logger

      raise "Missing the required parameter 'create_capture_filter_details' when calling create_capture_filter." if create_capture_filter_details.nil?

      path = '/captureFilters'
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

      post_body = @api_client.object_to_http_body(create_capture_filter_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_capture_filter') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::CaptureFilter'
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


    # Creates a new virtual customer-premises equipment (CPE) object in the specified compartment. For
    # more information, see [Site-to-Site VPN Overview](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/overviewIPsec.htm).
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment where you want
    # the CPE to reside. Notice that the CPE doesn't have to be in the same compartment as the IPSec
    # connection or other Networking Service components. If you're not sure which compartment to
    # use, put the CPE in the same compartment as the DRG. For more information about
    # compartments and access control, see [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm).
    # For information about OCIDs, see [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # You must provide the public IP address of your on-premises router. See
    # [CPE Configuration](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/configuringCPE.htm).
    #
    # You may optionally specify a *display name* for the CPE, otherwise a default is provided. It does not have to
    # be unique, and you can change it. Avoid entering confidential information.
    #
    # @param [OCI::Core::Models::CreateCpeDetails] create_cpe_details Details for creating a CPE.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Cpe Cpe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_cpe.rb.html) to see an example of how to use create_cpe API.
    def create_cpe(create_cpe_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_cpe.' if logger

      raise "Missing the required parameter 'create_cpe_details' when calling create_cpe." if create_cpe_details.nil?

      path = '/cpes'
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

      post_body = @api_client.object_to_http_body(create_cpe_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_cpe') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Cpe'
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


    # Creates a new cross-connect. Oracle recommends you create each cross-connect in a
    # {CrossConnectGroup} so you can use link aggregation
    # with the connection.
    #
    # After creating the `CrossConnect` object, you need to go the FastConnect location
    # and request to have the physical cable installed. For more information, see
    # [FastConnect Overview](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/fastconnect.htm).
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the
    # compartment where you want the cross-connect to reside. If you're
    # not sure which compartment to use, put the cross-connect in the
    # same compartment with your VCN. For more information about
    # compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm).
    # For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # You may optionally specify a *display name* for the cross-connect.
    # It does not have to be unique, and you can change it. Avoid entering confidential information.
    #
    # @param [OCI::Core::Models::CreateCrossConnectDetails] create_cross_connect_details Details to create a CrossConnect
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::CrossConnect CrossConnect}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_cross_connect.rb.html) to see an example of how to use create_cross_connect API.
    def create_cross_connect(create_cross_connect_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_cross_connect.' if logger

      raise "Missing the required parameter 'create_cross_connect_details' when calling create_cross_connect." if create_cross_connect_details.nil?

      path = '/crossConnects'
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

      post_body = @api_client.object_to_http_body(create_cross_connect_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_cross_connect') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::CrossConnect'
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


    # Creates a new cross-connect group to use with Oracle Cloud Infrastructure
    # FastConnect. For more information, see
    # [FastConnect Overview](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/fastconnect.htm).
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the
    # compartment where you want the cross-connect group to reside. If you're
    # not sure which compartment to use, put the cross-connect group in the
    # same compartment with your VCN. For more information about
    # compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm).
    # For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # You may optionally specify a *display name* for the cross-connect group.
    # It does not have to be unique, and you can change it. Avoid entering confidential information.
    #
    # @param [OCI::Core::Models::CreateCrossConnectGroupDetails] create_cross_connect_group_details Details to create a CrossConnectGroup
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::CrossConnectGroup CrossConnectGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_cross_connect_group.rb.html) to see an example of how to use create_cross_connect_group API.
    def create_cross_connect_group(create_cross_connect_group_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_cross_connect_group.' if logger

      raise "Missing the required parameter 'create_cross_connect_group_details' when calling create_cross_connect_group." if create_cross_connect_group_details.nil?

      path = '/crossConnectGroups'
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

      post_body = @api_client.object_to_http_body(create_cross_connect_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_cross_connect_group') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::CrossConnectGroup'
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


    # Creates a new set of DHCP options for the specified VCN. For more information, see
    # {DhcpOptions}.
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment where you want the set of
    # DHCP options to reside. Notice that the set of options doesn't have to be in the same compartment as the VCN,
    # subnets, or other Networking Service components. If you're not sure which compartment to use, put the set
    # of DHCP options in the same compartment as the VCN. For more information about compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm). For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # You may optionally specify a *display name* for the set of DHCP options, otherwise a default is provided.
    # It does not have to be unique, and you can change it. Avoid entering confidential information.
    #
    # @param [OCI::Core::Models::CreateDhcpDetails] create_dhcp_details Request object for creating a new set of DHCP options.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::DhcpOptions DhcpOptions}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_dhcp_options.rb.html) to see an example of how to use create_dhcp_options API.
    def create_dhcp_options(create_dhcp_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_dhcp_options.' if logger

      raise "Missing the required parameter 'create_dhcp_details' when calling create_dhcp_options." if create_dhcp_details.nil?

      path = '/dhcps'
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

      post_body = @api_client.object_to_http_body(create_dhcp_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_dhcp_options') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DhcpOptions'
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


    # Creates a new dynamic routing gateway (DRG) in the specified compartment. For more information,
    # see [Dynamic Routing Gateways (DRGs)](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingDRGs.htm).
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment where you want
    # the DRG to reside. Notice that the DRG doesn't have to be in the same compartment as the VCN,
    # the DRG attachment, or other Networking Service components. If you're not sure which compartment
    # to use, put the DRG in the same compartment as the VCN. For more information about compartments
    # and access control, see [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm).
    # For information about OCIDs, see [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # You may optionally specify a *display name* for the DRG, otherwise a default is provided.
    # It does not have to be unique, and you can change it. Avoid entering confidential information.
    #
    # @param [OCI::Core::Models::CreateDrgDetails] create_drg_details Details for creating a DRG.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Drg Drg}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_drg.rb.html) to see an example of how to use create_drg API.
    def create_drg(create_drg_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_drg.' if logger

      raise "Missing the required parameter 'create_drg_details' when calling create_drg." if create_drg_details.nil?

      path = '/drgs'
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

      post_body = @api_client.object_to_http_body(create_drg_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_drg') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Drg'
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


    # Attaches the specified DRG to the specified network resource. A VCN can be attached to only one DRG
    # at a time, but a DRG can be attached to more than one VCN. The response includes a `DrgAttachment`
    # object with its own [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm). For more information about DRGs, see
    # [Dynamic Routing Gateways (DRGs)](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingDRGs.htm).
    #
    # You may optionally specify a *display name* for the attachment, otherwise a default is provided.
    # It does not have to be unique, and you can change it. Avoid entering confidential information.
    #
    # For the purposes of access control, the DRG attachment is automatically placed into the currently selected compartment.
    # For more information about compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm).
    #
    # @param [OCI::Core::Models::CreateDrgAttachmentDetails] create_drg_attachment_details Details for creating a `DrgAttachment`.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::DrgAttachment DrgAttachment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_drg_attachment.rb.html) to see an example of how to use create_drg_attachment API.
    def create_drg_attachment(create_drg_attachment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_drg_attachment.' if logger

      raise "Missing the required parameter 'create_drg_attachment_details' when calling create_drg_attachment." if create_drg_attachment_details.nil?

      path = '/drgAttachments'
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

      post_body = @api_client.object_to_http_body(create_drg_attachment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_drg_attachment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DrgAttachment'
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


    # Creates a new route distribution for the specified DRG.
    # Assign the route distribution as an import distribution to a DRG route table using the `UpdateDrgRouteTable` or `CreateDrgRouteTable` operations.
    # Assign the route distribution as an export distribution to a DRG attachment
    # using the `UpdateDrgAttachment` or `CreateDrgAttachment` operations.
    #
    # @param [OCI::Core::Models::CreateDrgRouteDistributionDetails] create_drg_route_distribution_details Details for creating a route distribution.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::DrgRouteDistribution DrgRouteDistribution}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_drg_route_distribution.rb.html) to see an example of how to use create_drg_route_distribution API.
    def create_drg_route_distribution(create_drg_route_distribution_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_drg_route_distribution.' if logger

      raise "Missing the required parameter 'create_drg_route_distribution_details' when calling create_drg_route_distribution." if create_drg_route_distribution_details.nil?

      path = '/drgRouteDistributions'
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

      post_body = @api_client.object_to_http_body(create_drg_route_distribution_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_drg_route_distribution') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DrgRouteDistribution'
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


    # Creates a new DRG route table for the specified DRG. Assign the DRG route table to a DRG attachment
    # using the `UpdateDrgAttachment` or `CreateDrgAttachment` operations.
    #
    # @param [OCI::Core::Models::CreateDrgRouteTableDetails] create_drg_route_table_details Details for creating a DRG route table.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::DrgRouteTable DrgRouteTable}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_drg_route_table.rb.html) to see an example of how to use create_drg_route_table API.
    def create_drg_route_table(create_drg_route_table_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_drg_route_table.' if logger

      raise "Missing the required parameter 'create_drg_route_table_details' when calling create_drg_route_table." if create_drg_route_table_details.nil?

      path = '/drgRouteTables'
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

      post_body = @api_client.object_to_http_body(create_drg_route_table_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_drg_route_table') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DrgRouteTable'
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


    # Creates a new internet gateway for the specified VCN. For more information, see
    # [Access to the Internet](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingIGs.htm).
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment where you want the Internet
    # Gateway to reside. Notice that the internet gateway doesn't have to be in the same compartment as the VCN or
    # other Networking Service components. If you're not sure which compartment to use, put the Internet
    # Gateway in the same compartment with the VCN. For more information about compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm).
    #
    # You may optionally specify a *display name* for the internet gateway, otherwise a default is provided. It
    # does not have to be unique, and you can change it. Avoid entering confidential information.
    #
    # For traffic to flow between a subnet and an internet gateway, you must create a route rule accordingly in
    # the subnet's route table (for example, 0.0.0.0/0 > internet gateway). See
    # {#update_route_table update_route_table}.
    #
    # You must specify whether the internet gateway is enabled when you create it. If it's disabled, that means no
    # traffic will flow to/from the internet even if there's a route rule that enables that traffic. You can later
    # use {#update_internet_gateway update_internet_gateway} to easily disable/enable
    # the gateway without changing the route rule.
    #
    # @param [OCI::Core::Models::CreateInternetGatewayDetails] create_internet_gateway_details Details for creating a new internet gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::InternetGateway InternetGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_internet_gateway.rb.html) to see an example of how to use create_internet_gateway API.
    def create_internet_gateway(create_internet_gateway_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_internet_gateway.' if logger

      raise "Missing the required parameter 'create_internet_gateway_details' when calling create_internet_gateway." if create_internet_gateway_details.nil?

      path = '/internetGateways'
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

      post_body = @api_client.object_to_http_body(create_internet_gateway_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_internet_gateway') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InternetGateway'
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


    # Creates a new IPSec connection between the specified DRG and CPE. For more information, see
    # [Site-to-Site VPN Overview](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/overviewIPsec.htm).
    #
    # If you configure at least one tunnel to use static routing, then in the request you must provide
    # at least one valid static route (you're allowed a maximum of 10). For example: 10.0.0.0/16.
    # If you configure both tunnels to use BGP dynamic routing, you can provide an empty list for
    # the static routes. For more information, see the important note in
    # {IPSecConnection}.
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment where you want the
    # IPSec connection to reside. Notice that the IPSec connection doesn't have to be in the same compartment
    # as the DRG, CPE, or other Networking Service components. If you're not sure which compartment to
    # use, put the IPSec connection in the same compartment as the DRG. For more information about
    # compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm).
    #
    # You may optionally specify a *display name* for the IPSec connection, otherwise a default is provided.
    # It does not have to be unique, and you can change it. Avoid entering confidential information.
    #
    # After creating the IPSec connection, you need to configure your on-premises router
    # with tunnel-specific information. For tunnel status and the required configuration information, see:
    #
    #   * {IPSecConnectionTunnel}
    #   * {IPSecConnectionTunnelSharedSecret}
    #
    # For each tunnel, you need the IP address of Oracle's VPN headend and the shared secret
    # (that is, the pre-shared key). For more information, see
    # [CPE Configuration](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/configuringCPE.htm).
    #
    # @param [OCI::Core::Models::CreateIPSecConnectionDetails] create_ip_sec_connection_details Details for creating an `IPSecConnection`.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::IPSecConnection IPSecConnection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_ip_sec_connection.rb.html) to see an example of how to use create_ip_sec_connection API.
    def create_ip_sec_connection(create_ip_sec_connection_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_ip_sec_connection.' if logger

      raise "Missing the required parameter 'create_ip_sec_connection_details' when calling create_ip_sec_connection." if create_ip_sec_connection_details.nil?

      path = '/ipsecConnections'
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

      post_body = @api_client.object_to_http_body(create_ip_sec_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_ip_sec_connection') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::IPSecConnection'
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


    # Creates an IPv6 for the specified VNIC.
    #
    # @param [OCI::Core::Models::CreateIpv6Details] create_ipv6_details Create IPv6 details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Ipv6 Ipv6}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_ipv6.rb.html) to see an example of how to use create_ipv6 API.
    def create_ipv6(create_ipv6_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_ipv6.' if logger

      raise "Missing the required parameter 'create_ipv6_details' when calling create_ipv6." if create_ipv6_details.nil?

      path = '/ipv6'
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

      post_body = @api_client.object_to_http_body(create_ipv6_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_ipv6') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Ipv6'
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


    # Creates a new local peering gateway (LPG) for the specified VCN.
    #
    # @param [OCI::Core::Models::CreateLocalPeeringGatewayDetails] create_local_peering_gateway_details Details for creating a new local peering gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::LocalPeeringGateway LocalPeeringGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_local_peering_gateway.rb.html) to see an example of how to use create_local_peering_gateway API.
    def create_local_peering_gateway(create_local_peering_gateway_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_local_peering_gateway.' if logger

      raise "Missing the required parameter 'create_local_peering_gateway_details' when calling create_local_peering_gateway." if create_local_peering_gateway_details.nil?

      path = '/localPeeringGateways'
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

      post_body = @api_client.object_to_http_body(create_local_peering_gateway_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_local_peering_gateway') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::LocalPeeringGateway'
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


    # Creates a new NAT gateway for the specified VCN. You must also set up a route rule with the
    # NAT gateway as the rule's target. See {RouteTable}.
    #
    # @param [OCI::Core::Models::CreateNatGatewayDetails] create_nat_gateway_details Details for creating a NAT gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::NatGateway NatGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_nat_gateway.rb.html) to see an example of how to use create_nat_gateway API.
    def create_nat_gateway(create_nat_gateway_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_nat_gateway.' if logger

      raise "Missing the required parameter 'create_nat_gateway_details' when calling create_nat_gateway." if create_nat_gateway_details.nil?

      path = '/natGateways'
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

      post_body = @api_client.object_to_http_body(create_nat_gateway_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_nat_gateway') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::NatGateway'
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


    # Creates a new network security group for the specified VCN.
    #
    # @param [OCI::Core::Models::CreateNetworkSecurityGroupDetails] create_network_security_group_details Details for creating a network security group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::NetworkSecurityGroup NetworkSecurityGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_network_security_group.rb.html) to see an example of how to use create_network_security_group API.
    def create_network_security_group(create_network_security_group_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_network_security_group.' if logger

      raise "Missing the required parameter 'create_network_security_group_details' when calling create_network_security_group." if create_network_security_group_details.nil?

      path = '/networkSecurityGroups'
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

      post_body = @api_client.object_to_http_body(create_network_security_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_network_security_group') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::NetworkSecurityGroup'
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


    # Creates a secondary private IP for the specified VNIC.
    # For more information about secondary private IPs, see
    # [IP Addresses](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingIPaddresses.htm).
    #
    # @param [OCI::Core::Models::CreatePrivateIpDetails] create_private_ip_details Create private IP details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::PrivateIp PrivateIp}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_private_ip.rb.html) to see an example of how to use create_private_ip API.
    def create_private_ip(create_private_ip_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_private_ip.' if logger

      raise "Missing the required parameter 'create_private_ip_details' when calling create_private_ip." if create_private_ip_details.nil?

      path = '/privateIps'
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

      post_body = @api_client.object_to_http_body(create_private_ip_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_private_ip') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PrivateIp'
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


    # Creates a public IP. Use the `lifetime` property to specify whether it's an ephemeral or
    # reserved public IP. For information about limits on how many you can create, see
    # [Public IP Addresses](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingpublicIPs.htm).
    #
    # * **For an ephemeral public IP assigned to a private IP:** You must also specify a `privateIpId`
    # with the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the primary private IP you want to assign the public IP to. The public IP is
    # created in the same availability domain as the private IP. An ephemeral public IP must always be
    # assigned to a private IP, and only to the *primary* private IP on a VNIC, not a secondary
    # private IP. Exception: If you create a {NatGateway}, Oracle
    # automatically assigns the NAT gateway a regional ephemeral public IP that you cannot remove.
    #
    # * **For a reserved public IP:** You may also optionally assign the public IP to a private
    # IP by specifying `privateIpId`. Or you can later assign the public IP with
    # {#update_public_ip update_public_ip}.
    #
    # **Note:** When assigning a public IP to a private IP, the private IP must not already have
    # a public IP with `lifecycleState` = ASSIGNING or ASSIGNED. If it does, an error is returned.
    #
    # Also, for reserved public IPs, the optional assignment part of this operation is
    # asynchronous. Poll the public IP's `lifecycleState` to determine if the assignment
    # succeeded.
    #
    # @param [OCI::Core::Models::CreatePublicIpDetails] create_public_ip_details Create public IP details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::PublicIp PublicIp}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_public_ip.rb.html) to see an example of how to use create_public_ip API.
    def create_public_ip(create_public_ip_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_public_ip.' if logger

      raise "Missing the required parameter 'create_public_ip_details' when calling create_public_ip." if create_public_ip_details.nil?

      path = '/publicIps'
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

      post_body = @api_client.object_to_http_body(create_public_ip_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_public_ip') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PublicIp'
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


    # Creates a public IP pool.
    #
    # @param [OCI::Core::Models::CreatePublicIpPoolDetails] create_public_ip_pool_details Create Public Ip Pool details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::PublicIpPool PublicIpPool}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_public_ip_pool.rb.html) to see an example of how to use create_public_ip_pool API.
    def create_public_ip_pool(create_public_ip_pool_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_public_ip_pool.' if logger

      raise "Missing the required parameter 'create_public_ip_pool_details' when calling create_public_ip_pool." if create_public_ip_pool_details.nil?

      path = '/publicIpPools'
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

      post_body = @api_client.object_to_http_body(create_public_ip_pool_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_public_ip_pool') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PublicIpPool'
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


    # Creates a new remote peering connection (RPC) for the specified DRG.
    #
    # @param [OCI::Core::Models::CreateRemotePeeringConnectionDetails] create_remote_peering_connection_details Request to create peering connection to remote region
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::RemotePeeringConnection RemotePeeringConnection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_remote_peering_connection.rb.html) to see an example of how to use create_remote_peering_connection API.
    def create_remote_peering_connection(create_remote_peering_connection_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_remote_peering_connection.' if logger

      raise "Missing the required parameter 'create_remote_peering_connection_details' when calling create_remote_peering_connection." if create_remote_peering_connection_details.nil?

      path = '/remotePeeringConnections'
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

      post_body = @api_client.object_to_http_body(create_remote_peering_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_remote_peering_connection') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::RemotePeeringConnection'
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


    # Creates a new route table for the specified VCN. In the request you must also include at least one route
    # rule for the new route table. For information on the number of rules you can have in a route table, see
    # [Service Limits](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/servicelimits.htm). For general information about route
    # tables in your VCN and the types of targets you can use in route rules,
    # see [Route Tables](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingroutetables.htm).
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment where you want the route
    # table to reside. Notice that the route table doesn't have to be in the same compartment as the VCN, subnets,
    # or other Networking Service components. If you're not sure which compartment to use, put the route
    # table in the same compartment as the VCN. For more information about compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm). For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # You may optionally specify a *display name* for the route table, otherwise a default is provided.
    # It does not have to be unique, and you can change it. Avoid entering confidential information.
    #
    # @param [OCI::Core::Models::CreateRouteTableDetails] create_route_table_details Details for creating a new route table.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::RouteTable RouteTable}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_route_table.rb.html) to see an example of how to use create_route_table API.
    def create_route_table(create_route_table_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_route_table.' if logger

      raise "Missing the required parameter 'create_route_table_details' when calling create_route_table." if create_route_table_details.nil?

      path = '/routeTables'
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

      post_body = @api_client.object_to_http_body(create_route_table_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_route_table') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::RouteTable'
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


    # Creates a new security list for the specified VCN. For more information
    # about security lists, see [Security Lists](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/securitylists.htm).
    # For information on the number of rules you can have in a security list, see
    # [Service Limits](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/servicelimits.htm).
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment where you want the security
    # list to reside. Notice that the security list doesn't have to be in the same compartment as the VCN, subnets,
    # or other Networking Service components. If you're not sure which compartment to use, put the security
    # list in the same compartment as the VCN. For more information about compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm). For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # You may optionally specify a *display name* for the security list, otherwise a default is provided.
    # It does not have to be unique, and you can change it. Avoid entering confidential information.
    #
    # @param [OCI::Core::Models::CreateSecurityListDetails] create_security_list_details Details regarding the security list to create.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::SecurityList SecurityList}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_security_list.rb.html) to see an example of how to use create_security_list API.
    def create_security_list(create_security_list_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_security_list.' if logger

      raise "Missing the required parameter 'create_security_list_details' when calling create_security_list." if create_security_list_details.nil?

      path = '/securityLists'
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

      post_body = @api_client.object_to_http_body(create_security_list_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_security_list') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::SecurityList'
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


    # Creates a new service gateway in the specified compartment.
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment where you want
    # the service gateway to reside. For more information about compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm).
    # For information about OCIDs, see [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # You may optionally specify a *display name* for the service gateway, otherwise a default is provided.
    # It does not have to be unique, and you can change it. Avoid entering confidential information.
    #
    # @param [OCI::Core::Models::CreateServiceGatewayDetails] create_service_gateway_details Details for creating a service gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::ServiceGateway ServiceGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_service_gateway.rb.html) to see an example of how to use create_service_gateway API.
    def create_service_gateway(create_service_gateway_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_service_gateway.' if logger

      raise "Missing the required parameter 'create_service_gateway_details' when calling create_service_gateway." if create_service_gateway_details.nil?

      path = '/serviceGateways'
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

      post_body = @api_client.object_to_http_body(create_service_gateway_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_service_gateway') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::ServiceGateway'
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


    # Creates a new subnet in the specified VCN. You can't change the size of the subnet after creation,
    # so it's important to think about the size of subnets you need before creating them.
    # For more information, see [VCNs and Subnets](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingVCNs.htm).
    # For information on the number of subnets you can have in a VCN, see
    # [Service Limits](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/servicelimits.htm).
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment where you want the subnet
    # to reside. Notice that the subnet doesn't have to be in the same compartment as the VCN, route tables, or
    # other Networking Service components. If you're not sure which compartment to use, put the subnet in
    # the same compartment as the VCN. For more information about compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm). For information about OCIDs,
    # see [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # You may optionally associate a route table with the subnet. If you don't, the subnet will use the
    # VCN's default route table. For more information about route tables, see
    # [Route Tables](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingroutetables.htm).
    #
    # You may optionally associate a security list with the subnet. If you don't, the subnet will use the
    # VCN's default security list. For more information about security lists, see
    # [Security Lists](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/securitylists.htm).
    #
    # You may optionally associate a set of DHCP options with the subnet. If you don't, the subnet will use the
    # VCN's default set. For more information about DHCP options, see
    # [DHCP Options](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingDHCP.htm).
    #
    # You may optionally specify a *display name* for the subnet, otherwise a default is provided.
    # It does not have to be unique, and you can change it. Avoid entering confidential information.
    #
    # You can also add a DNS label for the subnet, which is required if you want the Internet and
    # VCN Resolver to resolve hostnames for instances in the subnet. For more information, see
    # [DNS in Your Virtual Cloud Network](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/dns.htm).
    #
    # @param [OCI::Core::Models::CreateSubnetDetails] create_subnet_details Details for creating a subnet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Subnet Subnet}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_subnet.rb.html) to see an example of how to use create_subnet API.
    def create_subnet(create_subnet_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_subnet.' if logger

      raise "Missing the required parameter 'create_subnet_details' when calling create_subnet." if create_subnet_details.nil?

      path = '/subnets'
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

      post_body = @api_client.object_to_http_body(create_subnet_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_subnet') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Subnet'
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


    # Creates a new virtual cloud network (VCN). For more information, see
    # [VCNs and Subnets](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingVCNs.htm).
    #
    # For the VCN, you specify a list of one or more IPv4 CIDR blocks that meet the following criteria:
    #
    # - The CIDR blocks must be valid.
    # - They must not overlap with each other or with the on-premises network CIDR block.
    # - The number of CIDR blocks does not exceed the limit of CIDR blocks allowed per VCN.
    #
    # For a CIDR block, Oracle recommends that you use one of the private IP address ranges specified in [RFC 1918](https://tools.ietf.org/html/rfc1918) (10.0.0.0/8, 172.16/12, and 192.168/16). Example:
    # 172.16.0.0/16. The CIDR blocks can range from /16 to /30.
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment where you want the VCN to
    # reside. Consult an Oracle Cloud Infrastructure administrator in your organization if you're not sure which
    # compartment to use. Notice that the VCN doesn't have to be in the same compartment as the subnets or other
    # Networking Service components. For more information about compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm). For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # You may optionally specify a *display name* for the VCN, otherwise a default is provided. It does not have to
    # be unique, and you can change it. Avoid entering confidential information.
    #
    # You can also add a DNS label for the VCN, which is required if you want the instances to use the
    # Interent and VCN Resolver option for DNS in the VCN. For more information, see
    # [DNS in Your Virtual Cloud Network](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/dns.htm).
    #
    # The VCN automatically comes with a default route table, default security list, and default set of DHCP options.
    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for each is returned in the response. You can't delete these default objects, but you can change their
    # contents (that is, change the route rules, security list rules, and so on).
    #
    # The VCN and subnets you create are not accessible until you attach an internet gateway or set up a Site-to-Site VPN
    # or FastConnect. For more information, see
    # [Overview of the Networking Service](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/overview.htm).
    #
    # @param [OCI::Core::Models::CreateVcnDetails] create_vcn_details Details for creating a new VCN.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Vcn Vcn}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_vcn.rb.html) to see an example of how to use create_vcn API.
    def create_vcn(create_vcn_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_vcn.' if logger

      raise "Missing the required parameter 'create_vcn_details' when calling create_vcn." if create_vcn_details.nil?

      path = '/vcns'
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

      post_body = @api_client.object_to_http_body(create_vcn_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_vcn') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Vcn'
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


    # Creates a new virtual circuit to use with Oracle Cloud
    # Infrastructure FastConnect. For more information, see
    # [FastConnect Overview](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/fastconnect.htm).
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the
    # compartment where you want the virtual circuit to reside. If you're
    # not sure which compartment to use, put the virtual circuit in the
    # same compartment with the DRG it's using. For more information about
    # compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm).
    # For information about OCIDs, see
    # [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # You may optionally specify a *display name* for the virtual circuit.
    # It does not have to be unique, and you can change it. Avoid entering confidential information.
    #
    # **Important:** When creating a virtual circuit, you specify a DRG for
    # the traffic to flow through. Make sure you attach the DRG to your
    # VCN and confirm the VCN's routing sends traffic to the DRG. Otherwise
    # traffic will not flow. For more information, see
    # [Route Tables](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingroutetables.htm).
    #
    # @param [OCI::Core::Models::CreateVirtualCircuitDetails] create_virtual_circuit_details Details to create a VirtualCircuit.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::VirtualCircuit VirtualCircuit}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_virtual_circuit.rb.html) to see an example of how to use create_virtual_circuit API.
    def create_virtual_circuit(create_virtual_circuit_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_virtual_circuit.' if logger

      raise "Missing the required parameter 'create_virtual_circuit_details' when calling create_virtual_circuit." if create_virtual_circuit_details.nil?

      path = '/virtualCircuits'
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

      post_body = @api_client.object_to_http_body(create_virtual_circuit_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_virtual_circuit') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::VirtualCircuit'
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


    # Creates a VLAN in the specified VCN and the specified compartment.
    #
    # @param [OCI::Core::Models::CreateVlanDetails] create_vlan_details Details for creating a VLAN
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Vlan Vlan}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_vlan.rb.html) to see an example of how to use create_vlan API.
    def create_vlan(create_vlan_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_vlan.' if logger

      raise "Missing the required parameter 'create_vlan_details' when calling create_vlan." if create_vlan_details.nil?

      path = '/vlans'
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

      post_body = @api_client.object_to_http_body(create_vlan_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_vlan') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Vlan'
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


    # Creates a virtual test access point (VTAP) in the specified compartment.
    #
    # For the purposes of access control, you must provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains the VTAP.
    # For more information about compartments and access control, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm).
    # For information about OCIDs, see [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # You may optionally specify a *display name* for the VTAP, otherwise a default is provided.
    # It does not have to be unique, and you can change it.
    #
    # @param [OCI::Core::Models::CreateVtapDetails] create_vtap_details Details used to create a VTAP.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Vtap Vtap}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/create_vtap.rb.html) to see an example of how to use create_vtap API.
    def create_vtap(create_vtap_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#create_vtap.' if logger

      raise "Missing the required parameter 'create_vtap_details' when calling create_vtap." if create_vtap_details.nil?

      path = '/vtaps'
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

      post_body = @api_client.object_to_http_body(create_vtap_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#create_vtap') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Vtap'
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


    # Deletes the specified `ByoipRange` resource.
    # The resource must be in one of the following states: CREATING, PROVISIONED, ACTIVE, or FAILED.
    # It must not have any subranges currently allocated to a PublicIpPool object or the deletion will fail.
    # You must specify the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # If the `ByoipRange` resource is currently in the PROVISIONED or ACTIVE state, it will be de-provisioned and then deleted.
    #
    # @param [String] byoip_range_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the `ByoipRange` resource containing the BYOIP CIDR block.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_byoip_range.rb.html) to see an example of how to use delete_byoip_range API.
    def delete_byoip_range(byoip_range_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_byoip_range.' if logger

      raise "Missing the required parameter 'byoip_range_id' when calling delete_byoip_range." if byoip_range_id.nil?
      raise "Parameter value for 'byoip_range_id' must not be blank" if OCI::Internal::Util.blank_string?(byoip_range_id)

      path = '/byoipRanges/{byoipRangeId}'.sub('{byoipRangeId}', byoip_range_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_byoip_range') do
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


    # Deletes the specified VTAP capture filter. This is an asynchronous operation. The VTAP capture filter's `lifecycleState` will
    # change to TERMINATING temporarily until the VTAP capture filter is completely removed.
    #
    # @param [String] capture_filter_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the capture filter.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_capture_filter.rb.html) to see an example of how to use delete_capture_filter API.
    def delete_capture_filter(capture_filter_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_capture_filter.' if logger

      raise "Missing the required parameter 'capture_filter_id' when calling delete_capture_filter." if capture_filter_id.nil?
      raise "Parameter value for 'capture_filter_id' must not be blank" if OCI::Internal::Util.blank_string?(capture_filter_id)

      path = '/captureFilters/{captureFilterId}'.sub('{captureFilterId}', capture_filter_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_capture_filter') do
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


    # Deletes the specified CPE object. The CPE must not be connected to a DRG. This is an asynchronous
    # operation. The CPE's `lifecycleState` will change to TERMINATING temporarily until the CPE is completely
    # removed.
    #
    # @param [String] cpe_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the CPE.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_cpe.rb.html) to see an example of how to use delete_cpe API.
    def delete_cpe(cpe_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_cpe.' if logger

      raise "Missing the required parameter 'cpe_id' when calling delete_cpe." if cpe_id.nil?
      raise "Parameter value for 'cpe_id' must not be blank" if OCI::Internal::Util.blank_string?(cpe_id)

      path = '/cpes/{cpeId}'.sub('{cpeId}', cpe_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_cpe') do
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


    # Deletes the specified cross-connect. It must not be mapped to a
    # {VirtualCircuit}.
    #
    # @param [String] cross_connect_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the cross-connect.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_cross_connect.rb.html) to see an example of how to use delete_cross_connect API.
    def delete_cross_connect(cross_connect_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_cross_connect.' if logger

      raise "Missing the required parameter 'cross_connect_id' when calling delete_cross_connect." if cross_connect_id.nil?
      raise "Parameter value for 'cross_connect_id' must not be blank" if OCI::Internal::Util.blank_string?(cross_connect_id)

      path = '/crossConnects/{crossConnectId}'.sub('{crossConnectId}', cross_connect_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_cross_connect') do
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


    # Deletes the specified cross-connect group. It must not contain any
    # cross-connects, and it cannot be mapped to a
    # {VirtualCircuit}.
    #
    # @param [String] cross_connect_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the cross-connect group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_cross_connect_group.rb.html) to see an example of how to use delete_cross_connect_group API.
    def delete_cross_connect_group(cross_connect_group_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_cross_connect_group.' if logger

      raise "Missing the required parameter 'cross_connect_group_id' when calling delete_cross_connect_group." if cross_connect_group_id.nil?
      raise "Parameter value for 'cross_connect_group_id' must not be blank" if OCI::Internal::Util.blank_string?(cross_connect_group_id)

      path = '/crossConnectGroups/{crossConnectGroupId}'.sub('{crossConnectGroupId}', cross_connect_group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_cross_connect_group') do
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


    # Deletes the specified set of DHCP options, but only if it's not associated with a subnet. You can't delete a
    # VCN's default set of DHCP options.
    #
    # This is an asynchronous operation. The state of the set of options will switch to TERMINATING temporarily
    # until the set is completely removed.
    #
    # @param [String] dhcp_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the set of DHCP options.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_dhcp_options.rb.html) to see an example of how to use delete_dhcp_options API.
    def delete_dhcp_options(dhcp_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_dhcp_options.' if logger

      raise "Missing the required parameter 'dhcp_id' when calling delete_dhcp_options." if dhcp_id.nil?
      raise "Parameter value for 'dhcp_id' must not be blank" if OCI::Internal::Util.blank_string?(dhcp_id)

      path = '/dhcps/{dhcpId}'.sub('{dhcpId}', dhcp_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_dhcp_options') do
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


    # Deletes the specified DRG. The DRG must not be attached to a VCN or be connected to your on-premise
    # network. Also, there must not be a route table that lists the DRG as a target. This is an asynchronous
    # operation. The DRG's `lifecycleState` will change to TERMINATING temporarily until the DRG is completely
    # removed.
    #
    # @param [String] drg_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_drg.rb.html) to see an example of how to use delete_drg API.
    def delete_drg(drg_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_drg.' if logger

      raise "Missing the required parameter 'drg_id' when calling delete_drg." if drg_id.nil?
      raise "Parameter value for 'drg_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_id)

      path = '/drgs/{drgId}'.sub('{drgId}', drg_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_drg') do
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


    # Detaches a DRG from a network resource by deleting the corresponding `DrgAttachment` resource. This is an asynchronous
    # operation. The attachment's `lifecycleState` will temporarily change to DETACHING until the attachment
    # is completely removed.
    #
    # @param [String] drg_attachment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_drg_attachment.rb.html) to see an example of how to use delete_drg_attachment API.
    def delete_drg_attachment(drg_attachment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_drg_attachment.' if logger

      raise "Missing the required parameter 'drg_attachment_id' when calling delete_drg_attachment." if drg_attachment_id.nil?
      raise "Parameter value for 'drg_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_attachment_id)

      path = '/drgAttachments/{drgAttachmentId}'.sub('{drgAttachmentId}', drg_attachment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_drg_attachment') do
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


    # Deletes the specified route distribution. You can't delete a route distribution currently in use by a DRG attachment or DRG route table.
    #
    # Remove the DRG route distribution from a DRG attachment or DRG route table by using the \"RemoveExportDrgRouteDistribution\" or \"RemoveImportDrgRouteDistribution' operations.
    #
    # @param [String] drg_route_distribution_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the route distribution.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_drg_route_distribution.rb.html) to see an example of how to use delete_drg_route_distribution API.
    def delete_drg_route_distribution(drg_route_distribution_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_drg_route_distribution.' if logger

      raise "Missing the required parameter 'drg_route_distribution_id' when calling delete_drg_route_distribution." if drg_route_distribution_id.nil?
      raise "Parameter value for 'drg_route_distribution_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_distribution_id)

      path = '/drgRouteDistributions/{drgRouteDistributionId}'.sub('{drgRouteDistributionId}', drg_route_distribution_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_drg_route_distribution') do
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


    # Deletes the specified DRG route table. There must not be any DRG attachments assigned.
    #
    # @param [String] drg_route_table_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG route table.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_drg_route_table.rb.html) to see an example of how to use delete_drg_route_table API.
    def delete_drg_route_table(drg_route_table_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_drg_route_table.' if logger

      raise "Missing the required parameter 'drg_route_table_id' when calling delete_drg_route_table." if drg_route_table_id.nil?
      raise "Parameter value for 'drg_route_table_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_table_id)

      path = '/drgRouteTables/{drgRouteTableId}'.sub('{drgRouteTableId}', drg_route_table_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_drg_route_table') do
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


    # Deletes the specified internet gateway. The internet gateway does not have to be disabled, but
    # there must not be a route table that lists it as a target.
    #
    # This is an asynchronous operation. The gateway's `lifecycleState` will change to TERMINATING temporarily
    # until the gateway is completely removed.
    #
    # @param [String] ig_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the internet gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_internet_gateway.rb.html) to see an example of how to use delete_internet_gateway API.
    def delete_internet_gateway(ig_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_internet_gateway.' if logger

      raise "Missing the required parameter 'ig_id' when calling delete_internet_gateway." if ig_id.nil?
      raise "Parameter value for 'ig_id' must not be blank" if OCI::Internal::Util.blank_string?(ig_id)

      path = '/internetGateways/{igId}'.sub('{igId}', ig_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_internet_gateway') do
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


    # Deletes the specified IPSec connection. If your goal is to disable the Site-to-Site VPN between your VCN and
    # on-premises network, it's easiest to simply detach the DRG but keep all the Site-to-Site VPN components intact.
    # If you were to delete all the components and then later need to create an Site-to-Site VPN again, you would
    # need to configure your on-premises router again with the new information returned from
    # {#create_ip_sec_connection create_ip_sec_connection}.
    #
    # This is an asynchronous operation. The connection's `lifecycleState` will change to TERMINATING temporarily
    # until the connection is completely removed.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_ip_sec_connection.rb.html) to see an example of how to use delete_ip_sec_connection API.
    def delete_ip_sec_connection(ipsc_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_ip_sec_connection.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling delete_ip_sec_connection." if ipsc_id.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)

      path = '/ipsecConnections/{ipscId}'.sub('{ipscId}', ipsc_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_ip_sec_connection') do
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


    # Unassigns and deletes the specified IPv6. You must specify the object's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # The IPv6 address is returned to the subnet's pool of available addresses.
    #
    # @param [String] ipv6_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPv6.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_ipv6.rb.html) to see an example of how to use delete_ipv6 API.
    def delete_ipv6(ipv6_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_ipv6.' if logger

      raise "Missing the required parameter 'ipv6_id' when calling delete_ipv6." if ipv6_id.nil?
      raise "Parameter value for 'ipv6_id' must not be blank" if OCI::Internal::Util.blank_string?(ipv6_id)

      path = '/ipv6/{ipv6Id}'.sub('{ipv6Id}', ipv6_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_ipv6') do
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


    # Deletes the specified local peering gateway (LPG).
    #
    # This is an asynchronous operation; the local peering gateway's `lifecycleState` changes to TERMINATING temporarily
    # until the local peering gateway is completely removed.
    #
    # @param [String] local_peering_gateway_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the local peering gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_local_peering_gateway.rb.html) to see an example of how to use delete_local_peering_gateway API.
    def delete_local_peering_gateway(local_peering_gateway_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_local_peering_gateway.' if logger

      raise "Missing the required parameter 'local_peering_gateway_id' when calling delete_local_peering_gateway." if local_peering_gateway_id.nil?
      raise "Parameter value for 'local_peering_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(local_peering_gateway_id)

      path = '/localPeeringGateways/{localPeeringGatewayId}'.sub('{localPeeringGatewayId}', local_peering_gateway_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_local_peering_gateway') do
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


    # Deletes the specified NAT gateway. The NAT gateway does not have to be disabled, but there
    # must not be a route rule that lists the NAT gateway as a target.
    #
    # This is an asynchronous operation. The NAT gateway's `lifecycleState` will change to
    # TERMINATING temporarily until the NAT gateway is completely removed.
    #
    # @param [String] nat_gateway_id The NAT gateway's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_nat_gateway.rb.html) to see an example of how to use delete_nat_gateway API.
    def delete_nat_gateway(nat_gateway_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_nat_gateway.' if logger

      raise "Missing the required parameter 'nat_gateway_id' when calling delete_nat_gateway." if nat_gateway_id.nil?
      raise "Parameter value for 'nat_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(nat_gateway_id)

      path = '/natGateways/{natGatewayId}'.sub('{natGatewayId}', nat_gateway_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_nat_gateway') do
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


    # Deletes the specified network security group. The group must not contain any VNICs.
    #
    # To get a list of the VNICs in a network security group, use
    # {#list_network_security_group_vnics list_network_security_group_vnics}.
    # Each returned {NetworkSecurityGroupVnic} object
    # contains both the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VNIC and the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VNIC's parent resource (for example,
    # the Compute instance that the VNIC is attached to).
    #
    # @param [String] network_security_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the network security group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_network_security_group.rb.html) to see an example of how to use delete_network_security_group API.
    def delete_network_security_group(network_security_group_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_network_security_group.' if logger

      raise "Missing the required parameter 'network_security_group_id' when calling delete_network_security_group." if network_security_group_id.nil?
      raise "Parameter value for 'network_security_group_id' must not be blank" if OCI::Internal::Util.blank_string?(network_security_group_id)

      path = '/networkSecurityGroups/{networkSecurityGroupId}'.sub('{networkSecurityGroupId}', network_security_group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_network_security_group') do
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


    # Unassigns and deletes the specified private IP. You must
    # specify the object's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm). The private IP address is returned to
    # the subnet's pool of available addresses.
    #
    # This operation cannot be used with primary private IPs, which are
    # automatically unassigned and deleted when the VNIC is terminated.
    #
    # **Important:** If a secondary private IP is the
    # [target of a route rule](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingroutetables.htm#privateip),
    # unassigning it from the VNIC causes that route rule to blackhole and the traffic
    # will be dropped.
    #
    # @param [String] private_ip_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the private IP or IPv6.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_private_ip.rb.html) to see an example of how to use delete_private_ip API.
    def delete_private_ip(private_ip_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_private_ip.' if logger

      raise "Missing the required parameter 'private_ip_id' when calling delete_private_ip." if private_ip_id.nil?
      raise "Parameter value for 'private_ip_id' must not be blank" if OCI::Internal::Util.blank_string?(private_ip_id)

      path = '/privateIps/{privateIpId}'.sub('{privateIpId}', private_ip_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_private_ip') do
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


    # Unassigns and deletes the specified public IP (either ephemeral or reserved).
    # You must specify the object's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm). The public IP address is returned to the
    # Oracle Cloud Infrastructure public IP pool.
    #
    # **Note:** You cannot update, unassign, or delete the public IP that Oracle automatically
    # assigned to an entity for you (such as a load balancer or NAT gateway). The public IP is
    # automatically deleted if the assigned entity is terminated.
    #
    # For an assigned reserved public IP, the initial unassignment portion of this operation
    # is asynchronous. Poll the public IP's `lifecycleState` to determine
    # if the operation succeeded.
    #
    # If you want to simply unassign a reserved public IP and return it to your pool
    # of reserved public IPs, instead use
    # {#update_public_ip update_public_ip}.
    #
    # @param [String] public_ip_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the public IP.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_public_ip.rb.html) to see an example of how to use delete_public_ip API.
    def delete_public_ip(public_ip_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_public_ip.' if logger

      raise "Missing the required parameter 'public_ip_id' when calling delete_public_ip." if public_ip_id.nil?
      raise "Parameter value for 'public_ip_id' must not be blank" if OCI::Internal::Util.blank_string?(public_ip_id)

      path = '/publicIps/{publicIpId}'.sub('{publicIpId}', public_ip_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_public_ip') do
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


    # Deletes the specified public IP pool.
    # To delete a public IP pool it must not have any active IP address allocations.
    # You must specify the object's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) when deleting an IP pool.
    #
    # @param [String] public_ip_pool_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the public IP pool.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_public_ip_pool.rb.html) to see an example of how to use delete_public_ip_pool API.
    def delete_public_ip_pool(public_ip_pool_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_public_ip_pool.' if logger

      raise "Missing the required parameter 'public_ip_pool_id' when calling delete_public_ip_pool." if public_ip_pool_id.nil?
      raise "Parameter value for 'public_ip_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(public_ip_pool_id)

      path = '/publicIpPools/{publicIpPoolId}'.sub('{publicIpPoolId}', public_ip_pool_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_public_ip_pool') do
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


    # Deletes the remote peering connection (RPC).
    #
    # This is an asynchronous operation; the RPC's `lifecycleState` changes to TERMINATING temporarily
    # until the RPC is completely removed.
    #
    # @param [String] remote_peering_connection_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the remote peering connection (RPC).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_remote_peering_connection.rb.html) to see an example of how to use delete_remote_peering_connection API.
    def delete_remote_peering_connection(remote_peering_connection_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_remote_peering_connection.' if logger

      raise "Missing the required parameter 'remote_peering_connection_id' when calling delete_remote_peering_connection." if remote_peering_connection_id.nil?
      raise "Parameter value for 'remote_peering_connection_id' must not be blank" if OCI::Internal::Util.blank_string?(remote_peering_connection_id)

      path = '/remotePeeringConnections/{remotePeeringConnectionId}'.sub('{remotePeeringConnectionId}', remote_peering_connection_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_remote_peering_connection') do
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


    # Deletes the specified route table, but only if it's not associated with a subnet. You can't delete a
    # VCN's default route table.
    #
    # This is an asynchronous operation. The route table's `lifecycleState` will change to TERMINATING temporarily
    # until the route table is completely removed.
    #
    # @param [String] rt_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the route table.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_route_table.rb.html) to see an example of how to use delete_route_table API.
    def delete_route_table(rt_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_route_table.' if logger

      raise "Missing the required parameter 'rt_id' when calling delete_route_table." if rt_id.nil?
      raise "Parameter value for 'rt_id' must not be blank" if OCI::Internal::Util.blank_string?(rt_id)

      path = '/routeTables/{rtId}'.sub('{rtId}', rt_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_route_table') do
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


    # Deletes the specified security list, but only if it's not associated with a subnet. You can't delete
    # a VCN's default security list.
    #
    # This is an asynchronous operation. The security list's `lifecycleState` will change to TERMINATING temporarily
    # until the security list is completely removed.
    #
    # @param [String] security_list_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the security list.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_security_list.rb.html) to see an example of how to use delete_security_list API.
    def delete_security_list(security_list_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_security_list.' if logger

      raise "Missing the required parameter 'security_list_id' when calling delete_security_list." if security_list_id.nil?
      raise "Parameter value for 'security_list_id' must not be blank" if OCI::Internal::Util.blank_string?(security_list_id)

      path = '/securityLists/{securityListId}'.sub('{securityListId}', security_list_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_security_list') do
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


    # Deletes the specified service gateway. There must not be a route table that lists the service
    # gateway as a target.
    #
    # @param [String] service_gateway_id The service gateway's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_service_gateway.rb.html) to see an example of how to use delete_service_gateway API.
    def delete_service_gateway(service_gateway_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_service_gateway.' if logger

      raise "Missing the required parameter 'service_gateway_id' when calling delete_service_gateway." if service_gateway_id.nil?
      raise "Parameter value for 'service_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(service_gateway_id)

      path = '/serviceGateways/{serviceGatewayId}'.sub('{serviceGatewayId}', service_gateway_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_service_gateway') do
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


    # Deletes the specified subnet, but only if there are no instances in the subnet. This is an asynchronous
    # operation. The subnet's `lifecycleState` will change to TERMINATING temporarily. If there are any
    # instances in the subnet, the state will instead change back to AVAILABLE.
    #
    # @param [String] subnet_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the subnet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_subnet.rb.html) to see an example of how to use delete_subnet API.
    def delete_subnet(subnet_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_subnet.' if logger

      raise "Missing the required parameter 'subnet_id' when calling delete_subnet." if subnet_id.nil?
      raise "Parameter value for 'subnet_id' must not be blank" if OCI::Internal::Util.blank_string?(subnet_id)

      path = '/subnets/{subnetId}'.sub('{subnetId}', subnet_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_subnet') do
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


    # Deletes the specified VCN. The VCN must be empty and have no attached gateways. This is an asynchronous
    # operation. The VCN's `lifecycleState` will change to TERMINATING temporarily until the VCN is completely
    # removed.
    #
    # @param [String] vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_vcn.rb.html) to see an example of how to use delete_vcn API.
    def delete_vcn(vcn_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_vcn.' if logger

      raise "Missing the required parameter 'vcn_id' when calling delete_vcn." if vcn_id.nil?
      raise "Parameter value for 'vcn_id' must not be blank" if OCI::Internal::Util.blank_string?(vcn_id)

      path = '/vcns/{vcnId}'.sub('{vcnId}', vcn_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_vcn') do
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


    # Deletes the specified virtual circuit.
    #
    # **Important:** If you're using FastConnect via a provider,
    # make sure to also terminate the connection with
    # the provider, or else the provider may continue to bill you.
    #
    # @param [String] virtual_circuit_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the virtual circuit.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_virtual_circuit.rb.html) to see an example of how to use delete_virtual_circuit API.
    def delete_virtual_circuit(virtual_circuit_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_virtual_circuit.' if logger

      raise "Missing the required parameter 'virtual_circuit_id' when calling delete_virtual_circuit." if virtual_circuit_id.nil?
      raise "Parameter value for 'virtual_circuit_id' must not be blank" if OCI::Internal::Util.blank_string?(virtual_circuit_id)

      path = '/virtualCircuits/{virtualCircuitId}'.sub('{virtualCircuitId}', virtual_circuit_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_virtual_circuit') do
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


    # Deletes the specified VLAN, but only if there are no VNICs in the VLAN.
    #
    # @param [String] vlan_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VLAN.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_vlan.rb.html) to see an example of how to use delete_vlan API.
    def delete_vlan(vlan_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_vlan.' if logger

      raise "Missing the required parameter 'vlan_id' when calling delete_vlan." if vlan_id.nil?
      raise "Parameter value for 'vlan_id' must not be blank" if OCI::Internal::Util.blank_string?(vlan_id)

      path = '/vlans/{vlanId}'.sub('{vlanId}', vlan_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_vlan') do
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


    # Deletes the specified VTAP. This is an asynchronous operation. The VTAP's `lifecycleState` will change to
    # TERMINATING temporarily until the VTAP is completely removed.
    #
    # @param [String] vtap_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VTAP.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/delete_vtap.rb.html) to see an example of how to use delete_vtap API.
    def delete_vtap(vtap_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#delete_vtap.' if logger

      raise "Missing the required parameter 'vtap_id' when calling delete_vtap." if vtap_id.nil?
      raise "Parameter value for 'vtap_id' must not be blank" if OCI::Internal::Util.blank_string?(vtap_id)

      path = '/vtaps/{vtapId}'.sub('{vtapId}', vtap_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#delete_vtap') do
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


    # Removes the specified {Service} from the list of enabled
    # `Service` objects for the specified gateway. You do not need to remove any route
    # rules that specify this `Service` object's `cidrBlock` as the destination CIDR. However, consider
    # removing the rules if your intent is to permanently disable use of the `Service` through this
    # service gateway.
    #
    # **Note:** The `DetachServiceId` operation is an easy way to remove an individual `Service` from
    # the service gateway. Compare it with
    # {#update_service_gateway update_service_gateway}, which replaces
    # the entire existing list of enabled `Service` objects with the list that you provide in the
    # `Update` call. `UpdateServiceGateway` also lets you block all traffic through the service
    # gateway without having to remove each of the individual `Service` objects.
    #
    # @param [String] service_gateway_id The service gateway's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Core::Models::ServiceIdRequestDetails] detach_service_details ServiceId of Service to be detached from a service gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::ServiceGateway ServiceGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/detach_service_id.rb.html) to see an example of how to use detach_service_id API.
    def detach_service_id(service_gateway_id, detach_service_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#detach_service_id.' if logger

      raise "Missing the required parameter 'service_gateway_id' when calling detach_service_id." if service_gateway_id.nil?
      raise "Missing the required parameter 'detach_service_details' when calling detach_service_id." if detach_service_details.nil?
      raise "Parameter value for 'service_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(service_gateway_id)

      path = '/serviceGateways/{serviceGatewayId}/actions/detachService'.sub('{serviceGatewayId}', service_gateway_id.to_s)
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

      post_body = @api_client.object_to_http_body(detach_service_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#detach_service_id') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::ServiceGateway'
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


    # Returns a complete list of DRG attachments that belong to a particular DRG.
    #
    # @param [String] drg_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
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
    # @option opts [String] :attachment_type The type for the network resource attached to the DRG. (default to VCN)
    #   Allowed values are: VCN, VIRTUAL_CIRCUIT, REMOTE_PEERING_CONNECTION, IPSEC_TUNNEL, ALL
    # @option opts [BOOLEAN] :is_cross_tenancy Whether the DRG attachment lives in a different tenancy than the DRG. (default to false)
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::DrgAttachmentInfo DrgAttachmentInfo}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_all_drg_attachments.rb.html) to see an example of how to use get_all_drg_attachments API.
    def get_all_drg_attachments(drg_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_all_drg_attachments.' if logger

      raise "Missing the required parameter 'drg_id' when calling get_all_drg_attachments." if drg_id.nil?

      if opts[:attachment_type] && !%w[VCN VIRTUAL_CIRCUIT REMOTE_PEERING_CONNECTION IPSEC_TUNNEL ALL].include?(opts[:attachment_type])
        raise 'Invalid value for "attachment_type", must be one of VCN, VIRTUAL_CIRCUIT, REMOTE_PEERING_CONNECTION, IPSEC_TUNNEL, ALL.'
      end
      raise "Parameter value for 'drg_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_id)

      path = '/drgs/{drgId}/actions/getAllDrgAttachments'.sub('{drgId}', drg_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:attachmentType] = opts[:attachment_type] if opts[:attachment_type]
      query_params[:isCrossTenancy] = opts[:is_cross_tenancy] if !opts[:is_cross_tenancy].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_all_drg_attachments') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::DrgAttachmentInfo>'
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


    # The parameters allowed for IKE IPSec tunnels.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::AllowedIkeIPSecParameters AllowedIkeIPSecParameters}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_allowed_ike_ip_sec_parameters.rb.html) to see an example of how to use get_allowed_ike_ip_sec_parameters API.
    def get_allowed_ike_ip_sec_parameters(opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_allowed_ike_ip_sec_parameters.' if logger


      path = '/ipsecAlgorithms'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_allowed_ike_ip_sec_parameters') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::AllowedIkeIPSecParameters'
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


    # Gets the `ByoipRange` resource. You must specify the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # @param [String] byoip_range_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the `ByoipRange` resource containing the BYOIP CIDR block.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::ByoipRange ByoipRange}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_byoip_range.rb.html) to see an example of how to use get_byoip_range API.
    def get_byoip_range(byoip_range_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_byoip_range.' if logger

      raise "Missing the required parameter 'byoip_range_id' when calling get_byoip_range." if byoip_range_id.nil?
      raise "Parameter value for 'byoip_range_id' must not be blank" if OCI::Internal::Util.blank_string?(byoip_range_id)

      path = '/byoipRanges/{byoipRangeId}'.sub('{byoipRangeId}', byoip_range_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_byoip_range') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::ByoipRange'
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


    # Gets information about the specified VTAP capture filter.
    # @param [String] capture_filter_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the capture filter.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::CaptureFilter CaptureFilter}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_capture_filter.rb.html) to see an example of how to use get_capture_filter API.
    def get_capture_filter(capture_filter_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_capture_filter.' if logger

      raise "Missing the required parameter 'capture_filter_id' when calling get_capture_filter." if capture_filter_id.nil?
      raise "Parameter value for 'capture_filter_id' must not be blank" if OCI::Internal::Util.blank_string?(capture_filter_id)

      path = '/captureFilters/{captureFilterId}'.sub('{captureFilterId}', capture_filter_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_capture_filter') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::CaptureFilter'
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


    # Gets the specified CPE's information.
    # @param [String] cpe_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the CPE.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::Cpe Cpe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_cpe.rb.html) to see an example of how to use get_cpe API.
    def get_cpe(cpe_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_cpe.' if logger

      raise "Missing the required parameter 'cpe_id' when calling get_cpe." if cpe_id.nil?
      raise "Parameter value for 'cpe_id' must not be blank" if OCI::Internal::Util.blank_string?(cpe_id)

      path = '/cpes/{cpeId}'.sub('{cpeId}', cpe_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_cpe') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Cpe'
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


    # Renders a set of CPE configuration content that can help a network engineer configure the actual
    # CPE device (for example, a hardware router) represented by the specified {Cpe}
    # object.
    #
    # The rendered content is specific to the type of CPE device (for example, Cisco ASA). Therefore the
    # {Cpe} must have the CPE's device type specified by the `cpeDeviceShapeId`
    # attribute. The content optionally includes answers that the customer provides (see
    # {#update_tunnel_cpe_device_config update_tunnel_cpe_device_config}),
    # merged with a template of other information specific to the CPE device type.
    #
    # The operation returns configuration information for *all* of the
    # {IPSecConnection} objects that use the specified CPE.
    # Here are similar operations:
    #
    #   * {#get_ipsec_cpe_device_config_content get_ipsec_cpe_device_config_content}
    #   returns CPE configuration content for all IPSec tunnels in a single IPSec connection.
    #   * {#get_tunnel_cpe_device_config_content get_tunnel_cpe_device_config_content}
    #   returns CPE configuration content for a specific IPSec tunnel in an IPSec connection.
    #
    # @param [String] cpe_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the CPE.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_cpe_device_config_content.rb.html) to see an example of how to use get_cpe_device_config_content API.
    def get_cpe_device_config_content(cpe_id, opts = {}, &block)
      logger.debug 'Calling operation VirtualNetworkClient#get_cpe_device_config_content.' if logger

      raise "Missing the required parameter 'cpe_id' when calling get_cpe_device_config_content." if cpe_id.nil?
      raise "Parameter value for 'cpe_id' must not be blank" if OCI::Internal::Util.blank_string?(cpe_id)

      path = '/cpes/{cpeId}/cpeConfigContent'.sub('{cpeId}', cpe_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'text/plain; charset&#x3D;utf-8'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_cpe_device_config_content') do
        if !block.nil?
          @api_client.call_api(
            :GET,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'Stream',
            &block
          )
        elsif opts[:response_target]
          if opts[:response_target].respond_to? :write
            @api_client.call_api(
              :GET,
              path,
              endpoint,
              header_params: header_params,
              query_params: query_params,
              operation_signing_strategy: operation_signing_strategy,
              body: post_body,
              return_type: 'Stream',
              &proc { |chunk, _response| opts[:response_target].write(chunk) }
            )
          elsif opts[:response_target].is_a?(String)
            File.open(opts[:response_target], 'wb') do |output|
              return @api_client.call_api(
                :GET,
                path,
                endpoint,
                header_params: header_params,
                query_params: query_params,
                operation_signing_strategy: operation_signing_strategy,
                body: post_body,
                return_type: 'Stream',
                &proc { |chunk, _response| output.write(chunk) }
              )
            end
          end
        else
          @api_client.call_api(
            :GET,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'String'
          )
        end
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the detailed information about the specified CPE device type. This might include a set of questions
    # that are specific to the particular CPE device type. The customer must supply answers to those questions
    # (see {#update_tunnel_cpe_device_config update_tunnel_cpe_device_config}).
    # The service merges the answers with a template of other information for the CPE device type. The following
    # operations return the merged content:
    #
    #   * {#get_cpe_device_config_content get_cpe_device_config_content}
    #   * {#get_ipsec_cpe_device_config_content get_ipsec_cpe_device_config_content}
    #   * {#get_tunnel_cpe_device_config_content get_tunnel_cpe_device_config_content}
    #
    # @param [String] cpe_device_shape_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the CPE device shape.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::CpeDeviceShapeDetail CpeDeviceShapeDetail}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_cpe_device_shape.rb.html) to see an example of how to use get_cpe_device_shape API.
    def get_cpe_device_shape(cpe_device_shape_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_cpe_device_shape.' if logger

      raise "Missing the required parameter 'cpe_device_shape_id' when calling get_cpe_device_shape." if cpe_device_shape_id.nil?
      raise "Parameter value for 'cpe_device_shape_id' must not be blank" if OCI::Internal::Util.blank_string?(cpe_device_shape_id)

      path = '/cpeDeviceShapes/{cpeDeviceShapeId}'.sub('{cpeDeviceShapeId}', cpe_device_shape_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_cpe_device_shape') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::CpeDeviceShapeDetail'
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


    # Gets the specified cross-connect's information.
    # @param [String] cross_connect_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the cross-connect.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::CrossConnect CrossConnect}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_cross_connect.rb.html) to see an example of how to use get_cross_connect API.
    def get_cross_connect(cross_connect_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_cross_connect.' if logger

      raise "Missing the required parameter 'cross_connect_id' when calling get_cross_connect." if cross_connect_id.nil?
      raise "Parameter value for 'cross_connect_id' must not be blank" if OCI::Internal::Util.blank_string?(cross_connect_id)

      path = '/crossConnects/{crossConnectId}'.sub('{crossConnectId}', cross_connect_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_cross_connect') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::CrossConnect'
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


    # Gets the specified cross-connect group's information.
    # @param [String] cross_connect_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the cross-connect group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::CrossConnectGroup CrossConnectGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_cross_connect_group.rb.html) to see an example of how to use get_cross_connect_group API.
    def get_cross_connect_group(cross_connect_group_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_cross_connect_group.' if logger

      raise "Missing the required parameter 'cross_connect_group_id' when calling get_cross_connect_group." if cross_connect_group_id.nil?
      raise "Parameter value for 'cross_connect_group_id' must not be blank" if OCI::Internal::Util.blank_string?(cross_connect_group_id)

      path = '/crossConnectGroups/{crossConnectGroupId}'.sub('{crossConnectGroupId}', cross_connect_group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_cross_connect_group') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::CrossConnectGroup'
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


    # Gets the Letter of Authority for the specified cross-connect.
    # @param [String] cross_connect_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the cross-connect.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::LetterOfAuthority LetterOfAuthority}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_cross_connect_letter_of_authority.rb.html) to see an example of how to use get_cross_connect_letter_of_authority API.
    def get_cross_connect_letter_of_authority(cross_connect_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_cross_connect_letter_of_authority.' if logger

      raise "Missing the required parameter 'cross_connect_id' when calling get_cross_connect_letter_of_authority." if cross_connect_id.nil?
      raise "Parameter value for 'cross_connect_id' must not be blank" if OCI::Internal::Util.blank_string?(cross_connect_id)

      path = '/crossConnects/{crossConnectId}/letterOfAuthority'.sub('{crossConnectId}', cross_connect_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json, text/html'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_cross_connect_letter_of_authority') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::LetterOfAuthority'
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


    # Gets the status of the specified cross-connect.
    #
    # @param [String] cross_connect_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the cross-connect.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::CrossConnectStatus CrossConnectStatus}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_cross_connect_status.rb.html) to see an example of how to use get_cross_connect_status API.
    def get_cross_connect_status(cross_connect_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_cross_connect_status.' if logger

      raise "Missing the required parameter 'cross_connect_id' when calling get_cross_connect_status." if cross_connect_id.nil?
      raise "Parameter value for 'cross_connect_id' must not be blank" if OCI::Internal::Util.blank_string?(cross_connect_id)

      path = '/crossConnects/{crossConnectId}/status'.sub('{crossConnectId}', cross_connect_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_cross_connect_status') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::CrossConnectStatus'
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


    # Gets the specified set of DHCP options.
    # @param [String] dhcp_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the set of DHCP options.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::DhcpOptions DhcpOptions}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_dhcp_options.rb.html) to see an example of how to use get_dhcp_options API.
    def get_dhcp_options(dhcp_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_dhcp_options.' if logger

      raise "Missing the required parameter 'dhcp_id' when calling get_dhcp_options." if dhcp_id.nil?
      raise "Parameter value for 'dhcp_id' must not be blank" if OCI::Internal::Util.blank_string?(dhcp_id)

      path = '/dhcps/{dhcpId}'.sub('{dhcpId}', dhcp_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_dhcp_options') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DhcpOptions'
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


    # Gets the specified DRG's information.
    # @param [String] drg_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::Drg Drg}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_drg.rb.html) to see an example of how to use get_drg API.
    def get_drg(drg_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_drg.' if logger

      raise "Missing the required parameter 'drg_id' when calling get_drg." if drg_id.nil?
      raise "Parameter value for 'drg_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_id)

      path = '/drgs/{drgId}'.sub('{drgId}', drg_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_drg') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Drg'
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


    # Gets the `DrgAttachment` resource.
    # @param [String] drg_attachment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::DrgAttachment DrgAttachment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_drg_attachment.rb.html) to see an example of how to use get_drg_attachment API.
    def get_drg_attachment(drg_attachment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_drg_attachment.' if logger

      raise "Missing the required parameter 'drg_attachment_id' when calling get_drg_attachment." if drg_attachment_id.nil?
      raise "Parameter value for 'drg_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_attachment_id)

      path = '/drgAttachments/{drgAttachmentId}'.sub('{drgAttachmentId}', drg_attachment_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_drg_attachment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DrgAttachment'
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


    # Gets the redundancy status for the specified DRG. For more information, see
    # [Redundancy Remedies](https://docs.cloud.oracle.com/iaas/Content/Network/Troubleshoot/drgredundancy.htm).
    #
    # @param [String] drg_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::DrgRedundancyStatus DrgRedundancyStatus}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_drg_redundancy_status.rb.html) to see an example of how to use get_drg_redundancy_status API.
    def get_drg_redundancy_status(drg_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_drg_redundancy_status.' if logger

      raise "Missing the required parameter 'drg_id' when calling get_drg_redundancy_status." if drg_id.nil?
      raise "Parameter value for 'drg_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_id)

      path = '/drgs/{drgId}/redundancyStatus'.sub('{drgId}', drg_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_drg_redundancy_status') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DrgRedundancyStatus'
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


    # Gets the specified route distribution's information.
    # @param [String] drg_route_distribution_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the route distribution.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::DrgRouteDistribution DrgRouteDistribution}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_drg_route_distribution.rb.html) to see an example of how to use get_drg_route_distribution API.
    def get_drg_route_distribution(drg_route_distribution_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_drg_route_distribution.' if logger

      raise "Missing the required parameter 'drg_route_distribution_id' when calling get_drg_route_distribution." if drg_route_distribution_id.nil?
      raise "Parameter value for 'drg_route_distribution_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_distribution_id)

      path = '/drgRouteDistributions/{drgRouteDistributionId}'.sub('{drgRouteDistributionId}', drg_route_distribution_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_drg_route_distribution') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DrgRouteDistribution'
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


    # Gets the specified DRG route table's information.
    # @param [String] drg_route_table_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG route table.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::DrgRouteTable DrgRouteTable}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_drg_route_table.rb.html) to see an example of how to use get_drg_route_table API.
    def get_drg_route_table(drg_route_table_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_drg_route_table.' if logger

      raise "Missing the required parameter 'drg_route_table_id' when calling get_drg_route_table." if drg_route_table_id.nil?
      raise "Parameter value for 'drg_route_table_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_table_id)

      path = '/drgRouteTables/{drgRouteTableId}'.sub('{drgRouteTableId}', drg_route_table_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_drg_route_table') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DrgRouteTable'
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


    # Gets the specified provider service.
    # For more information, see [FastConnect Overview](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/fastconnect.htm).
    #
    # @param [String] provider_service_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the provider service.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::FastConnectProviderService FastConnectProviderService}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_fast_connect_provider_service.rb.html) to see an example of how to use get_fast_connect_provider_service API.
    def get_fast_connect_provider_service(provider_service_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_fast_connect_provider_service.' if logger

      raise "Missing the required parameter 'provider_service_id' when calling get_fast_connect_provider_service." if provider_service_id.nil?
      raise "Parameter value for 'provider_service_id' must not be blank" if OCI::Internal::Util.blank_string?(provider_service_id)

      path = '/fastConnectProviderServices/{providerServiceId}'.sub('{providerServiceId}', provider_service_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_fast_connect_provider_service') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::FastConnectProviderService'
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


    # Gets the specified provider service key's information. Use this operation to validate a
    # provider service key. An invalid key returns a 404 error.
    #
    # @param [String] provider_service_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the provider service.
    # @param [String] provider_service_key_name The provider service key that the provider gives you when you set up a virtual circuit connection
    #   from the provider to Oracle Cloud Infrastructure. You can set up that connection and get your
    #   provider service key at the provider's website or portal. For the portal location, see the `description`
    #   attribute of the {FastConnectProviderService}.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::FastConnectProviderServiceKey FastConnectProviderServiceKey}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_fast_connect_provider_service_key.rb.html) to see an example of how to use get_fast_connect_provider_service_key API.
    def get_fast_connect_provider_service_key(provider_service_id, provider_service_key_name, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_fast_connect_provider_service_key.' if logger

      raise "Missing the required parameter 'provider_service_id' when calling get_fast_connect_provider_service_key." if provider_service_id.nil?
      raise "Missing the required parameter 'provider_service_key_name' when calling get_fast_connect_provider_service_key." if provider_service_key_name.nil?
      raise "Parameter value for 'provider_service_id' must not be blank" if OCI::Internal::Util.blank_string?(provider_service_id)
      raise "Parameter value for 'provider_service_key_name' must not be blank" if OCI::Internal::Util.blank_string?(provider_service_key_name)

      path = '/fastConnectProviderServices/{providerServiceId}/providerServiceKeys/{providerServiceKeyName}'.sub('{providerServiceId}', provider_service_id.to_s).sub('{providerServiceKeyName}', provider_service_key_name.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_fast_connect_provider_service_key') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::FastConnectProviderServiceKey'
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


    # Gets the specified internet gateway's information.
    # @param [String] ig_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the internet gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::InternetGateway InternetGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_internet_gateway.rb.html) to see an example of how to use get_internet_gateway API.
    def get_internet_gateway(ig_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_internet_gateway.' if logger

      raise "Missing the required parameter 'ig_id' when calling get_internet_gateway." if ig_id.nil?
      raise "Parameter value for 'ig_id' must not be blank" if OCI::Internal::Util.blank_string?(ig_id)

      path = '/internetGateways/{igId}'.sub('{igId}', ig_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_internet_gateway') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InternetGateway'
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


    # Gets the specified IPSec connection's basic information, including the static routes for the
    # on-premises router. If you want the status of the connection (whether it's up or down), use
    # {#get_ip_sec_connection_tunnel get_ip_sec_connection_tunnel}.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::IPSecConnection IPSecConnection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_ip_sec_connection.rb.html) to see an example of how to use get_ip_sec_connection API.
    def get_ip_sec_connection(ipsc_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_ip_sec_connection.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling get_ip_sec_connection." if ipsc_id.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)

      path = '/ipsecConnections/{ipscId}'.sub('{ipscId}', ipsc_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_ip_sec_connection') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::IPSecConnection'
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


    # Deprecated. To get tunnel information, instead use:
    #
    # * {#get_ip_sec_connection_tunnel get_ip_sec_connection_tunnel}
    # * {#get_ip_sec_connection_tunnel_shared_secret get_ip_sec_connection_tunnel_shared_secret}
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::IPSecConnectionDeviceConfig IPSecConnectionDeviceConfig}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_ip_sec_connection_device_config.rb.html) to see an example of how to use get_ip_sec_connection_device_config API.
    def get_ip_sec_connection_device_config(ipsc_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_ip_sec_connection_device_config.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling get_ip_sec_connection_device_config." if ipsc_id.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)

      path = '/ipsecConnections/{ipscId}/deviceConfig'.sub('{ipscId}', ipsc_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_ip_sec_connection_device_config') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::IPSecConnectionDeviceConfig'
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


    # Deprecated. To get the tunnel status, instead use
    # {#get_ip_sec_connection_tunnel get_ip_sec_connection_tunnel}.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::IPSecConnectionDeviceStatus IPSecConnectionDeviceStatus}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_ip_sec_connection_device_status.rb.html) to see an example of how to use get_ip_sec_connection_device_status API.
    def get_ip_sec_connection_device_status(ipsc_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_ip_sec_connection_device_status.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling get_ip_sec_connection_device_status." if ipsc_id.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)

      path = '/ipsecConnections/{ipscId}/deviceStatus'.sub('{ipscId}', ipsc_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_ip_sec_connection_device_status') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::IPSecConnectionDeviceStatus'
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


    # Gets the specified tunnel's information. The resulting object does not include the tunnel's
    # shared secret (pre-shared key). To retrieve that, use
    # {#get_ip_sec_connection_tunnel_shared_secret get_ip_sec_connection_tunnel_shared_secret}.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [String] tunnel_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the tunnel.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::IPSecConnectionTunnel IPSecConnectionTunnel}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_ip_sec_connection_tunnel.rb.html) to see an example of how to use get_ip_sec_connection_tunnel API.
    def get_ip_sec_connection_tunnel(ipsc_id, tunnel_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_ip_sec_connection_tunnel.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling get_ip_sec_connection_tunnel." if ipsc_id.nil?
      raise "Missing the required parameter 'tunnel_id' when calling get_ip_sec_connection_tunnel." if tunnel_id.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)
      raise "Parameter value for 'tunnel_id' must not be blank" if OCI::Internal::Util.blank_string?(tunnel_id)

      path = '/ipsecConnections/{ipscId}/tunnels/{tunnelId}'.sub('{ipscId}', ipsc_id.to_s).sub('{tunnelId}', tunnel_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_ip_sec_connection_tunnel') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::IPSecConnectionTunnel'
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


    # Gets the identified error for the specified IPSec tunnel ID.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [String] tunnel_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the tunnel.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::IPSecConnectionTunnelErrorDetails IPSecConnectionTunnelErrorDetails}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_ip_sec_connection_tunnel_error.rb.html) to see an example of how to use get_ip_sec_connection_tunnel_error API.
    def get_ip_sec_connection_tunnel_error(ipsc_id, tunnel_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_ip_sec_connection_tunnel_error.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling get_ip_sec_connection_tunnel_error." if ipsc_id.nil?
      raise "Missing the required parameter 'tunnel_id' when calling get_ip_sec_connection_tunnel_error." if tunnel_id.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)
      raise "Parameter value for 'tunnel_id' must not be blank" if OCI::Internal::Util.blank_string?(tunnel_id)

      path = '/ipsecConnections/{ipscId}/tunnels/{tunnelId}/error'.sub('{ipscId}', ipsc_id.to_s).sub('{tunnelId}', tunnel_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_ip_sec_connection_tunnel_error') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::IPSecConnectionTunnelErrorDetails'
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


    # Gets the specified tunnel's shared secret (pre-shared key). To get other information
    # about the tunnel, use {#get_ip_sec_connection_tunnel get_ip_sec_connection_tunnel}.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [String] tunnel_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the tunnel.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::IPSecConnectionTunnelSharedSecret IPSecConnectionTunnelSharedSecret}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_ip_sec_connection_tunnel_shared_secret.rb.html) to see an example of how to use get_ip_sec_connection_tunnel_shared_secret API.
    def get_ip_sec_connection_tunnel_shared_secret(ipsc_id, tunnel_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_ip_sec_connection_tunnel_shared_secret.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling get_ip_sec_connection_tunnel_shared_secret." if ipsc_id.nil?
      raise "Missing the required parameter 'tunnel_id' when calling get_ip_sec_connection_tunnel_shared_secret." if tunnel_id.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)
      raise "Parameter value for 'tunnel_id' must not be blank" if OCI::Internal::Util.blank_string?(tunnel_id)

      path = '/ipsecConnections/{ipscId}/tunnels/{tunnelId}/sharedSecret'.sub('{ipscId}', ipsc_id.to_s).sub('{tunnelId}', tunnel_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_ip_sec_connection_tunnel_shared_secret') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::IPSecConnectionTunnelSharedSecret'
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


    # Renders a set of CPE configuration content for the specified IPSec connection (for all the
    # tunnels in the connection). The content helps a network engineer configure the actual CPE
    # device (for example, a hardware router) that the specified IPSec connection terminates on.
    #
    # The rendered content is specific to the type of CPE device (for example, Cisco ASA). Therefore the
    # {Cpe} used by the specified {IPSecConnection}
    # must have the CPE's device type specified by the `cpeDeviceShapeId` attribute. The content
    # optionally includes answers that the customer provides (see
    # {#update_tunnel_cpe_device_config update_tunnel_cpe_device_config}),
    # merged with a template of other information specific to the CPE device type.
    #
    # The operation returns configuration information for all tunnels in the single specified
    # {IPSecConnection} object. Here are other similar
    # operations:
    #
    #   * {#get_tunnel_cpe_device_config_content get_tunnel_cpe_device_config_content}
    #   returns CPE configuration content for a specific tunnel within an IPSec connection.
    #   * {#get_cpe_device_config_content get_cpe_device_config_content}
    #   returns CPE configuration content for *all* IPSec connections that use a specific CPE.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_ipsec_cpe_device_config_content.rb.html) to see an example of how to use get_ipsec_cpe_device_config_content API.
    def get_ipsec_cpe_device_config_content(ipsc_id, opts = {}, &block)
      logger.debug 'Calling operation VirtualNetworkClient#get_ipsec_cpe_device_config_content.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling get_ipsec_cpe_device_config_content." if ipsc_id.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)

      path = '/ipsecConnections/{ipscId}/cpeConfigContent'.sub('{ipscId}', ipsc_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'text/plain; charset&#x3D;utf-8'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_ipsec_cpe_device_config_content') do
        if !block.nil?
          @api_client.call_api(
            :GET,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'Stream',
            &block
          )
        elsif opts[:response_target]
          if opts[:response_target].respond_to? :write
            @api_client.call_api(
              :GET,
              path,
              endpoint,
              header_params: header_params,
              query_params: query_params,
              operation_signing_strategy: operation_signing_strategy,
              body: post_body,
              return_type: 'Stream',
              &proc { |chunk, _response| opts[:response_target].write(chunk) }
            )
          elsif opts[:response_target].is_a?(String)
            File.open(opts[:response_target], 'wb') do |output|
              return @api_client.call_api(
                :GET,
                path,
                endpoint,
                header_params: header_params,
                query_params: query_params,
                operation_signing_strategy: operation_signing_strategy,
                body: post_body,
                return_type: 'Stream',
                &proc { |chunk, _response| output.write(chunk) }
              )
            end
          end
        else
          @api_client.call_api(
            :GET,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'String'
          )
        end
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the specified IPv6. You must specify the object's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # Alternatively, you can get the object by using
    # {#list_ipv6s list_ipv6s}
    # with the IPv6 address (for example, 2001:0db8:0123:1111:98fe:dcba:9876:4321) and subnet [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # @param [String] ipv6_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPv6.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Ipv6 Ipv6}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_ipv6.rb.html) to see an example of how to use get_ipv6 API.
    def get_ipv6(ipv6_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_ipv6.' if logger

      raise "Missing the required parameter 'ipv6_id' when calling get_ipv6." if ipv6_id.nil?
      raise "Parameter value for 'ipv6_id' must not be blank" if OCI::Internal::Util.blank_string?(ipv6_id)

      path = '/ipv6/{ipv6Id}'.sub('{ipv6Id}', ipv6_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_ipv6') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Ipv6'
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


    # Gets the specified local peering gateway's information.
    # @param [String] local_peering_gateway_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the local peering gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::LocalPeeringGateway LocalPeeringGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_local_peering_gateway.rb.html) to see an example of how to use get_local_peering_gateway API.
    def get_local_peering_gateway(local_peering_gateway_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_local_peering_gateway.' if logger

      raise "Missing the required parameter 'local_peering_gateway_id' when calling get_local_peering_gateway." if local_peering_gateway_id.nil?
      raise "Parameter value for 'local_peering_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(local_peering_gateway_id)

      path = '/localPeeringGateways/{localPeeringGatewayId}'.sub('{localPeeringGatewayId}', local_peering_gateway_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_local_peering_gateway') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::LocalPeeringGateway'
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


    # Gets the specified NAT gateway's information.
    # @param [String] nat_gateway_id The NAT gateway's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::NatGateway NatGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_nat_gateway.rb.html) to see an example of how to use get_nat_gateway API.
    def get_nat_gateway(nat_gateway_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_nat_gateway.' if logger

      raise "Missing the required parameter 'nat_gateway_id' when calling get_nat_gateway." if nat_gateway_id.nil?
      raise "Parameter value for 'nat_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(nat_gateway_id)

      path = '/natGateways/{natGatewayId}'.sub('{natGatewayId}', nat_gateway_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_nat_gateway') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::NatGateway'
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


    # Gets the specified network security group's information.
    #
    # To list the VNICs in an NSG, see
    # {#list_network_security_group_vnics list_network_security_group_vnics}.
    #
    # To list the security rules in an NSG, see
    # {#list_network_security_group_security_rules list_network_security_group_security_rules}.
    #
    # @param [String] network_security_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the network security group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::NetworkSecurityGroup NetworkSecurityGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_network_security_group.rb.html) to see an example of how to use get_network_security_group API.
    def get_network_security_group(network_security_group_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_network_security_group.' if logger

      raise "Missing the required parameter 'network_security_group_id' when calling get_network_security_group." if network_security_group_id.nil?
      raise "Parameter value for 'network_security_group_id' must not be blank" if OCI::Internal::Util.blank_string?(network_security_group_id)

      path = '/networkSecurityGroups/{networkSecurityGroupId}'.sub('{networkSecurityGroupId}', network_security_group_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_network_security_group') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::NetworkSecurityGroup'
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


    # Gets a virtual networking topology for the current region.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :access_level Valid values are `ANY` and `ACCESSIBLE`. The default is `ANY`.
    #   Setting this to `ACCESSIBLE` returns only compartments for which a
    #   user has INSPECT permissions, either directly or indirectly (permissions can be on a
    #   resource in a subcompartment). A restricted set of fields is returned for compartments in which a user has
    #   indirect INSPECT permissions.
    #
    #   When set to `ANY` permissions are not checked.
    #
    #   Allowed values are: ANY, ACCESSIBLE
    # @option opts [BOOLEAN] :query_compartment_subtree When set to true, the hierarchy of compartments is traversed
    #   and the specified compartment and its subcompartments are
    #   inspected depending on the the setting of `accessLevel`.
    #   Default is false.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_none_match For querying if there is a cached value on the server. The If-None-Match HTTP request header
    #   makes the request conditional. For GET and HEAD methods, the server will send back the requested
    #   resource, with a 200 status, only if it doesn't have an ETag matching the given ones.
    #   For other methods, the request will be processed only if the eventually existing resource's
    #   ETag doesn't match any of the values listed.
    #
    # @option opts [String] :cache_control The Cache-Control HTTP header holds directives (instructions)
    #   for caching in both requests and responses.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::NetworkingTopology NetworkingTopology}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_networking_topology.rb.html) to see an example of how to use get_networking_topology API.
    def get_networking_topology(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_networking_topology.' if logger

      raise "Missing the required parameter 'compartment_id' when calling get_networking_topology." if compartment_id.nil?

      if opts[:access_level] && !%w[ANY ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of ANY, ACCESSIBLE.'
      end

      path = '/networkingTopology'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:queryCompartmentSubtree] = opts[:query_compartment_subtree] if !opts[:query_compartment_subtree].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'cache-control'] = opts[:cache_control] if opts[:cache_control]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_networking_topology') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::NetworkingTopology'
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


    # Gets the specified private IP. You must specify the object's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # Alternatively, you can get the object by using
    # {#list_private_ips list_private_ips}
    # with the private IP address (for example, 10.0.3.3) and subnet [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # @param [String] private_ip_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the private IP or IPv6.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::PrivateIp PrivateIp}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_private_ip.rb.html) to see an example of how to use get_private_ip API.
    def get_private_ip(private_ip_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_private_ip.' if logger

      raise "Missing the required parameter 'private_ip_id' when calling get_private_ip." if private_ip_id.nil?
      raise "Parameter value for 'private_ip_id' must not be blank" if OCI::Internal::Util.blank_string?(private_ip_id)

      path = '/privateIps/{privateIpId}'.sub('{privateIpId}', private_ip_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_private_ip') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PrivateIp'
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


    # Gets the specified public IP. You must specify the object's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # Alternatively, you can get the object by using {#get_public_ip_by_ip_address get_public_ip_by_ip_address}
    # with the public IP address (for example, 203.0.113.2).
    #
    # Or you can use {#get_public_ip_by_private_ip_id get_public_ip_by_private_ip_id}
    # with the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the private IP that the public IP is assigned to.
    #
    # **Note:** If you're fetching a reserved public IP that is in the process of being
    # moved to a different private IP, the service returns the public IP object with
    # `lifecycleState` = ASSIGNING and `assignedEntityId` = [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the target private IP.
    #
    # @param [String] public_ip_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the public IP.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::PublicIp PublicIp}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_public_ip.rb.html) to see an example of how to use get_public_ip API.
    def get_public_ip(public_ip_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_public_ip.' if logger

      raise "Missing the required parameter 'public_ip_id' when calling get_public_ip." if public_ip_id.nil?
      raise "Parameter value for 'public_ip_id' must not be blank" if OCI::Internal::Util.blank_string?(public_ip_id)

      path = '/publicIps/{publicIpId}'.sub('{publicIpId}', public_ip_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_public_ip') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PublicIp'
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


    # Gets the public IP based on the public IP address (for example, 203.0.113.2).
    #
    # **Note:** If you're fetching a reserved public IP that is in the process of being
    # moved to a different private IP, the service returns the public IP object with
    # `lifecycleState` = ASSIGNING and `assignedEntityId` = [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the target private IP.
    #
    # @param [OCI::Core::Models::GetPublicIpByIpAddressDetails] get_public_ip_by_ip_address_details IP address details for fetching the public IP.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::PublicIp PublicIp}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_public_ip_by_ip_address.rb.html) to see an example of how to use get_public_ip_by_ip_address API.
    def get_public_ip_by_ip_address(get_public_ip_by_ip_address_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_public_ip_by_ip_address.' if logger

      raise "Missing the required parameter 'get_public_ip_by_ip_address_details' when calling get_public_ip_by_ip_address." if get_public_ip_by_ip_address_details.nil?

      path = '/publicIps/actions/getByIpAddress'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(get_public_ip_by_ip_address_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_public_ip_by_ip_address') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PublicIp'
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


    # Gets the public IP assigned to the specified private IP. You must specify the OCID
    # of the private IP. If no public IP is assigned, a 404 is returned.
    #
    # **Note:** If you're fetching a reserved public IP that is in the process of being
    # moved to a different private IP, and you provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the original private
    # IP, this operation returns a 404. If you instead provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the target
    # private IP, or if you instead call
    # {#get_public_ip get_public_ip} or
    # {#get_public_ip_by_ip_address get_public_ip_by_ip_address}, the
    # service returns the public IP object with `lifecycleState` = ASSIGNING and
    # `assignedEntityId` = [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the target private IP.
    #
    # @param [OCI::Core::Models::GetPublicIpByPrivateIpIdDetails] get_public_ip_by_private_ip_id_details Private IP details for fetching the public IP.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::PublicIp PublicIp}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_public_ip_by_private_ip_id.rb.html) to see an example of how to use get_public_ip_by_private_ip_id API.
    def get_public_ip_by_private_ip_id(get_public_ip_by_private_ip_id_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_public_ip_by_private_ip_id.' if logger

      raise "Missing the required parameter 'get_public_ip_by_private_ip_id_details' when calling get_public_ip_by_private_ip_id." if get_public_ip_by_private_ip_id_details.nil?

      path = '/publicIps/actions/getByPrivateIpId'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(get_public_ip_by_private_ip_id_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_public_ip_by_private_ip_id') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PublicIp'
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


    # Gets the specified `PublicIpPool` object. You must specify the object's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # @param [String] public_ip_pool_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the public IP pool.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::PublicIpPool PublicIpPool}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_public_ip_pool.rb.html) to see an example of how to use get_public_ip_pool API.
    def get_public_ip_pool(public_ip_pool_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_public_ip_pool.' if logger

      raise "Missing the required parameter 'public_ip_pool_id' when calling get_public_ip_pool." if public_ip_pool_id.nil?
      raise "Parameter value for 'public_ip_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(public_ip_pool_id)

      path = '/publicIpPools/{publicIpPoolId}'.sub('{publicIpPoolId}', public_ip_pool_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_public_ip_pool') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PublicIpPool'
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


    # Get the specified remote peering connection's information.
    #
    # @param [String] remote_peering_connection_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the remote peering connection (RPC).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::RemotePeeringConnection RemotePeeringConnection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_remote_peering_connection.rb.html) to see an example of how to use get_remote_peering_connection API.
    def get_remote_peering_connection(remote_peering_connection_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_remote_peering_connection.' if logger

      raise "Missing the required parameter 'remote_peering_connection_id' when calling get_remote_peering_connection." if remote_peering_connection_id.nil?
      raise "Parameter value for 'remote_peering_connection_id' must not be blank" if OCI::Internal::Util.blank_string?(remote_peering_connection_id)

      path = '/remotePeeringConnections/{remotePeeringConnectionId}'.sub('{remotePeeringConnectionId}', remote_peering_connection_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_remote_peering_connection') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::RemotePeeringConnection'
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


    # Gets the specified route table's information.
    # @param [String] rt_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the route table.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::RouteTable RouteTable}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_route_table.rb.html) to see an example of how to use get_route_table API.
    def get_route_table(rt_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_route_table.' if logger

      raise "Missing the required parameter 'rt_id' when calling get_route_table." if rt_id.nil?
      raise "Parameter value for 'rt_id' must not be blank" if OCI::Internal::Util.blank_string?(rt_id)

      path = '/routeTables/{rtId}'.sub('{rtId}', rt_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_route_table') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::RouteTable'
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


    # Gets the specified security list's information.
    # @param [String] security_list_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the security list.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::SecurityList SecurityList}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_security_list.rb.html) to see an example of how to use get_security_list API.
    def get_security_list(security_list_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_security_list.' if logger

      raise "Missing the required parameter 'security_list_id' when calling get_security_list." if security_list_id.nil?
      raise "Parameter value for 'security_list_id' must not be blank" if OCI::Internal::Util.blank_string?(security_list_id)

      path = '/securityLists/{securityListId}'.sub('{securityListId}', security_list_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_security_list') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::SecurityList'
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


    # Gets the specified {Service} object.
    #
    # @param [String] service_id The service's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::Service Service}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_service.rb.html) to see an example of how to use get_service API.
    def get_service(service_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_service.' if logger

      raise "Missing the required parameter 'service_id' when calling get_service." if service_id.nil?
      raise "Parameter value for 'service_id' must not be blank" if OCI::Internal::Util.blank_string?(service_id)

      path = '/services/{serviceId}'.sub('{serviceId}', service_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_service') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Service'
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


    # Gets the specified service gateway's information.
    # @param [String] service_gateway_id The service gateway's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::ServiceGateway ServiceGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_service_gateway.rb.html) to see an example of how to use get_service_gateway API.
    def get_service_gateway(service_gateway_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_service_gateway.' if logger

      raise "Missing the required parameter 'service_gateway_id' when calling get_service_gateway." if service_gateway_id.nil?
      raise "Parameter value for 'service_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(service_gateway_id)

      path = '/serviceGateways/{serviceGatewayId}'.sub('{serviceGatewayId}', service_gateway_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_service_gateway') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::ServiceGateway'
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


    # Gets the specified subnet's information.
    # @param [String] subnet_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the subnet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::Subnet Subnet}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_subnet.rb.html) to see an example of how to use get_subnet API.
    def get_subnet(subnet_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_subnet.' if logger

      raise "Missing the required parameter 'subnet_id' when calling get_subnet." if subnet_id.nil?
      raise "Parameter value for 'subnet_id' must not be blank" if OCI::Internal::Util.blank_string?(subnet_id)

      path = '/subnets/{subnetId}'.sub('{subnetId}', subnet_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_subnet') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Subnet'
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


    # Gets a topology for a given subnet.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] subnet_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the subnet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :access_level Valid values are `ANY` and `ACCESSIBLE`. The default is `ANY`.
    #   Setting this to `ACCESSIBLE` returns only compartments for which a
    #   user has INSPECT permissions, either directly or indirectly (permissions can be on a
    #   resource in a subcompartment). A restricted set of fields is returned for compartments in which a user has
    #   indirect INSPECT permissions.
    #
    #   When set to `ANY` permissions are not checked.
    #
    #   Allowed values are: ANY, ACCESSIBLE
    # @option opts [BOOLEAN] :query_compartment_subtree When set to true, the hierarchy of compartments is traversed
    #   and the specified compartment and its subcompartments are
    #   inspected depending on the the setting of `accessLevel`.
    #   Default is false.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_none_match For querying if there is a cached value on the server. The If-None-Match HTTP request header
    #   makes the request conditional. For GET and HEAD methods, the server will send back the requested
    #   resource, with a 200 status, only if it doesn't have an ETag matching the given ones.
    #   For other methods, the request will be processed only if the eventually existing resource's
    #   ETag doesn't match any of the values listed.
    #
    # @option opts [String] :cache_control The Cache-Control HTTP header holds directives (instructions)
    #   for caching in both requests and responses.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::SubnetTopology SubnetTopology}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_subnet_topology.rb.html) to see an example of how to use get_subnet_topology API.
    def get_subnet_topology(compartment_id, subnet_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_subnet_topology.' if logger

      raise "Missing the required parameter 'compartment_id' when calling get_subnet_topology." if compartment_id.nil?
      raise "Missing the required parameter 'subnet_id' when calling get_subnet_topology." if subnet_id.nil?

      if opts[:access_level] && !%w[ANY ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of ANY, ACCESSIBLE.'
      end

      path = '/subnetTopology'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:subnetId] = subnet_id
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:queryCompartmentSubtree] = opts[:query_compartment_subtree] if !opts[:query_compartment_subtree].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'cache-control'] = opts[:cache_control] if opts[:cache_control]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_subnet_topology') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::SubnetTopology'
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


    # Gets the set of CPE configuration answers for the tunnel, which the customer provided in
    # {#update_tunnel_cpe_device_config update_tunnel_cpe_device_config}.
    # To get the full set of content for the tunnel (any answers merged with the template of other
    # information specific to the CPE device type), use
    # {#get_tunnel_cpe_device_config_content get_tunnel_cpe_device_config_content}.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [String] tunnel_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the tunnel.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::TunnelCpeDeviceConfig TunnelCpeDeviceConfig}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_tunnel_cpe_device_config.rb.html) to see an example of how to use get_tunnel_cpe_device_config API.
    def get_tunnel_cpe_device_config(ipsc_id, tunnel_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_tunnel_cpe_device_config.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling get_tunnel_cpe_device_config." if ipsc_id.nil?
      raise "Missing the required parameter 'tunnel_id' when calling get_tunnel_cpe_device_config." if tunnel_id.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)
      raise "Parameter value for 'tunnel_id' must not be blank" if OCI::Internal::Util.blank_string?(tunnel_id)

      path = '/ipsecConnections/{ipscId}/tunnels/{tunnelId}/tunnelDeviceConfig'.sub('{ipscId}', ipsc_id.to_s).sub('{tunnelId}', tunnel_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_tunnel_cpe_device_config') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::TunnelCpeDeviceConfig'
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


    # Renders a set of CPE configuration content for the specified IPSec tunnel. The content helps a
    # network engineer configure the actual CPE device (for example, a hardware router) that the specified
    # IPSec tunnel terminates on.
    #
    # The rendered content is specific to the type of CPE device (for example, Cisco ASA). Therefore the
    # {Cpe} used by the specified {IPSecConnection}
    # must have the CPE's device type specified by the `cpeDeviceShapeId` attribute. The content
    # optionally includes answers that the customer provides (see
    # {#update_tunnel_cpe_device_config update_tunnel_cpe_device_config}),
    # merged with a template of other information specific to the CPE device type.
    #
    # The operation returns configuration information for only the specified IPSec tunnel.
    # Here are other similar operations:
    #
    #   * {#get_ipsec_cpe_device_config_content get_ipsec_cpe_device_config_content}
    #   returns CPE configuration content for all tunnels in a single IPSec connection.
    #   * {#get_cpe_device_config_content get_cpe_device_config_content}
    #   returns CPE configuration content for *all* IPSec connections that use a specific CPE.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [String] tunnel_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the tunnel.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String, IO] :response_target Streaming http body into a file (specified by file name or File object) or IO object if the block is not given
    # @option [Block] &block Streaming http body to the block
    # @return [Response] A Response object with data of type String if response_target and block are not given, otherwise with nil data
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_tunnel_cpe_device_config_content.rb.html) to see an example of how to use get_tunnel_cpe_device_config_content API.
    def get_tunnel_cpe_device_config_content(ipsc_id, tunnel_id, opts = {}, &block)
      logger.debug 'Calling operation VirtualNetworkClient#get_tunnel_cpe_device_config_content.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling get_tunnel_cpe_device_config_content." if ipsc_id.nil?
      raise "Missing the required parameter 'tunnel_id' when calling get_tunnel_cpe_device_config_content." if tunnel_id.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)
      raise "Parameter value for 'tunnel_id' must not be blank" if OCI::Internal::Util.blank_string?(tunnel_id)

      path = '/ipsecConnections/{ipscId}/tunnels/{tunnelId}/tunnelDeviceConfig/content'.sub('{ipscId}', ipsc_id.to_s).sub('{tunnelId}', tunnel_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = opts[:accept] if opts[:accept]
      header_params[:accept] ||= 'text/plain; charset&#x3D;utf-8'
      header_params[:'accept-encoding'] = opts[:accept_encoding] if opts[:accept_encoding]
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_tunnel_cpe_device_config_content') do
        if !block.nil?
          @api_client.call_api(
            :GET,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'Stream',
            &block
          )
        elsif opts[:response_target]
          if opts[:response_target].respond_to? :write
            @api_client.call_api(
              :GET,
              path,
              endpoint,
              header_params: header_params,
              query_params: query_params,
              operation_signing_strategy: operation_signing_strategy,
              body: post_body,
              return_type: 'Stream',
              &proc { |chunk, _response| opts[:response_target].write(chunk) }
            )
          elsif opts[:response_target].is_a?(String)
            File.open(opts[:response_target], 'wb') do |output|
              return @api_client.call_api(
                :GET,
                path,
                endpoint,
                header_params: header_params,
                query_params: query_params,
                operation_signing_strategy: operation_signing_strategy,
                body: post_body,
                return_type: 'Stream',
                &proc { |chunk, _response| output.write(chunk) }
              )
            end
          end
        else
          @api_client.call_api(
            :GET,
            path,
            endpoint,
            header_params: header_params,
            query_params: query_params,
            operation_signing_strategy: operation_signing_strategy,
            body: post_body,
            return_type: 'String'
          )
        end
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Returns the DRG upgrade status. The status can be not updated, in progress, or updated. Also indicates how much of the upgrade is completed.
    #
    # @param [String] drg_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::UpgradeStatus UpgradeStatus}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_upgrade_status.rb.html) to see an example of how to use get_upgrade_status API.
    def get_upgrade_status(drg_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_upgrade_status.' if logger

      raise "Missing the required parameter 'drg_id' when calling get_upgrade_status." if drg_id.nil?
      raise "Parameter value for 'drg_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_id)

      path = '/drgs/{drgId}/actions/upgradeStatus'.sub('{drgId}', drg_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_upgrade_status') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::UpgradeStatus'
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


    # Gets the specified VCN's information.
    # @param [String] vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::Vcn Vcn}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_vcn.rb.html) to see an example of how to use get_vcn API.
    def get_vcn(vcn_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_vcn.' if logger

      raise "Missing the required parameter 'vcn_id' when calling get_vcn." if vcn_id.nil?
      raise "Parameter value for 'vcn_id' must not be blank" if OCI::Internal::Util.blank_string?(vcn_id)

      path = '/vcns/{vcnId}'.sub('{vcnId}', vcn_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_vcn') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Vcn'
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


    # Get the associated DNS resolver information with a vcn
    # @param [String] vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::VcnDnsResolverAssociation VcnDnsResolverAssociation}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_vcn_dns_resolver_association.rb.html) to see an example of how to use get_vcn_dns_resolver_association API.
    def get_vcn_dns_resolver_association(vcn_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_vcn_dns_resolver_association.' if logger

      raise "Missing the required parameter 'vcn_id' when calling get_vcn_dns_resolver_association." if vcn_id.nil?
      raise "Parameter value for 'vcn_id' must not be blank" if OCI::Internal::Util.blank_string?(vcn_id)

      path = '/vcns/{vcnId}/dnsResolverAssociation'.sub('{vcnId}', vcn_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_vcn_dns_resolver_association') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::VcnDnsResolverAssociation'
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


    # Gets a virtual network topology for a given VCN.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [String] vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :access_level Valid values are `ANY` and `ACCESSIBLE`. The default is `ANY`.
    #   Setting this to `ACCESSIBLE` returns only compartments for which a
    #   user has INSPECT permissions, either directly or indirectly (permissions can be on a
    #   resource in a subcompartment). A restricted set of fields is returned for compartments in which a user has
    #   indirect INSPECT permissions.
    #
    #   When set to `ANY` permissions are not checked.
    #
    #   Allowed values are: ANY, ACCESSIBLE
    # @option opts [BOOLEAN] :query_compartment_subtree When set to true, the hierarchy of compartments is traversed
    #   and the specified compartment and its subcompartments are
    #   inspected depending on the the setting of `accessLevel`.
    #   Default is false.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_none_match For querying if there is a cached value on the server. The If-None-Match HTTP request header
    #   makes the request conditional. For GET and HEAD methods, the server will send back the requested
    #   resource, with a 200 status, only if it doesn't have an ETag matching the given ones.
    #   For other methods, the request will be processed only if the eventually existing resource's
    #   ETag doesn't match any of the values listed.
    #
    # @option opts [String] :cache_control The Cache-Control HTTP header holds directives (instructions)
    #   for caching in both requests and responses.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::VcnTopology VcnTopology}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_vcn_topology.rb.html) to see an example of how to use get_vcn_topology API.
    def get_vcn_topology(compartment_id, vcn_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_vcn_topology.' if logger

      raise "Missing the required parameter 'compartment_id' when calling get_vcn_topology." if compartment_id.nil?
      raise "Missing the required parameter 'vcn_id' when calling get_vcn_topology." if vcn_id.nil?

      if opts[:access_level] && !%w[ANY ACCESSIBLE].include?(opts[:access_level])
        raise 'Invalid value for "access_level", must be one of ANY, ACCESSIBLE.'
      end

      path = '/vcnTopology'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:vcnId] = vcn_id
      query_params[:accessLevel] = opts[:access_level] if opts[:access_level]
      query_params[:queryCompartmentSubtree] = opts[:query_compartment_subtree] if !opts[:query_compartment_subtree].nil?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'cache-control'] = opts[:cache_control] if opts[:cache_control]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_vcn_topology') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::VcnTopology'
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


    # Gets the specified virtual circuit's information.
    # @param [String] virtual_circuit_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the virtual circuit.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::VirtualCircuit VirtualCircuit}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_virtual_circuit.rb.html) to see an example of how to use get_virtual_circuit API.
    def get_virtual_circuit(virtual_circuit_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_virtual_circuit.' if logger

      raise "Missing the required parameter 'virtual_circuit_id' when calling get_virtual_circuit." if virtual_circuit_id.nil?
      raise "Parameter value for 'virtual_circuit_id' must not be blank" if OCI::Internal::Util.blank_string?(virtual_circuit_id)

      path = '/virtualCircuits/{virtualCircuitId}'.sub('{virtualCircuitId}', virtual_circuit_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_virtual_circuit') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::VirtualCircuit'
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


    # Gets the specified VLAN's information.
    # @param [String] vlan_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VLAN.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Vlan Vlan}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_vlan.rb.html) to see an example of how to use get_vlan API.
    def get_vlan(vlan_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_vlan.' if logger

      raise "Missing the required parameter 'vlan_id' when calling get_vlan." if vlan_id.nil?
      raise "Parameter value for 'vlan_id' must not be blank" if OCI::Internal::Util.blank_string?(vlan_id)

      path = '/vlans/{vlanId}'.sub('{vlanId}', vlan_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_vlan') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Vlan'
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


    # Gets the information for the specified virtual network interface card (VNIC).
    # You can get the VNIC [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) from the
    # {#list_vnic_attachments list_vnic_attachments}
    # operation.
    #
    # @param [String] vnic_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VNIC.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::Vnic Vnic}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_vnic.rb.html) to see an example of how to use get_vnic API.
    def get_vnic(vnic_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_vnic.' if logger

      raise "Missing the required parameter 'vnic_id' when calling get_vnic." if vnic_id.nil?
      raise "Parameter value for 'vnic_id' must not be blank" if OCI::Internal::Util.blank_string?(vnic_id)

      path = '/vnics/{vnicId}'.sub('{vnicId}', vnic_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_vnic') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Vnic'
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


    # Gets the specified `Vtap` resource.
    # @param [String] vtap_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VTAP.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Vtap Vtap}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/get_vtap.rb.html) to see an example of how to use get_vtap API.
    def get_vtap(vtap_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#get_vtap.' if logger

      raise "Missing the required parameter 'vtap_id' when calling get_vtap." if vtap_id.nil?
      raise "Parameter value for 'vtap_id' must not be blank" if OCI::Internal::Util.blank_string?(vtap_id)

      path = '/vtaps/{vtapId}'.sub('{vtapId}', vtap_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#get_vtap') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Vtap'
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


    # Lists the regions that support remote VCN peering (which is peering across regions).
    # For more information, see [VCN Peering](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/VCNpeering.htm).
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::PeerRegionForRemotePeering PeerRegionForRemotePeering}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_allowed_peer_regions_for_remote_peering.rb.html) to see an example of how to use list_allowed_peer_regions_for_remote_peering API.
    def list_allowed_peer_regions_for_remote_peering(opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_allowed_peer_regions_for_remote_peering.' if logger


      path = '/allowedPeerRegionsForRemotePeering'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_allowed_peer_regions_for_remote_peering') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::PeerRegionForRemotePeering>'
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


    # Lists the subranges of a BYOIP CIDR block currently allocated to an IP pool.
    # Each `ByoipAllocatedRange` object also lists the IP pool where it is allocated.
    #
    # @param [String] byoip_range_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the `ByoipRange` resource containing the BYOIP CIDR block.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
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
    # @return [Response] A Response object with data of type {OCI::Core::Models::ByoipAllocatedRangeCollection ByoipAllocatedRangeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_byoip_allocated_ranges.rb.html) to see an example of how to use list_byoip_allocated_ranges API.
    def list_byoip_allocated_ranges(byoip_range_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_byoip_allocated_ranges.' if logger

      raise "Missing the required parameter 'byoip_range_id' when calling list_byoip_allocated_ranges." if byoip_range_id.nil?
      raise "Parameter value for 'byoip_range_id' must not be blank" if OCI::Internal::Util.blank_string?(byoip_range_id)

      path = '/byoipRanges/{byoipRangeId}/byoipAllocatedRanges'.sub('{byoipRangeId}', byoip_range_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_byoip_allocated_ranges') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::ByoipAllocatedRangeCollection'
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


    # Lists the `ByoipRange` resources in the specified compartment.
    # You can filter the list using query parameters.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle state name exactly.
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
    # @return [Response] A Response object with data of type {OCI::Core::Models::ByoipRangeCollection ByoipRangeCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_byoip_ranges.rb.html) to see an example of how to use list_byoip_ranges API.
    def list_byoip_ranges(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_byoip_ranges.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_byoip_ranges." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/byoipRanges'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_byoip_ranges') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::ByoipRangeCollection'
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


    # Lists the capture filters in the specified compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given capture filter lifecycle state.
    #   The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::CaptureFilter CaptureFilter}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_capture_filters.rb.html) to see an example of how to use list_capture_filters API.
    def list_capture_filters(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_capture_filters.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_capture_filters." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::CaptureFilter::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::CaptureFilter::LIFECYCLE_STATE_ENUM.'
      end

      path = '/captureFilters'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_capture_filters') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::CaptureFilter>'
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


    # Lists the CPE device types that the Networking service provides CPE configuration
    # content for (example: Cisco ASA). The content helps a network engineer configure
    # the actual CPE device represented by a {Cpe} object.
    #
    # If you want to generate CPE configuration content for one of the returned CPE device types,
    # ensure that the {Cpe} object's `cpeDeviceShapeId` attribute is set
    # to the CPE device type's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) (returned by this operation).
    #
    # For information about generating CPE configuration content, see these operations:
    #
    #   * {#get_cpe_device_config_content get_cpe_device_config_content}
    #   * {#get_ipsec_cpe_device_config_content get_ipsec_cpe_device_config_content}
    #   * {#get_tunnel_cpe_device_config_content get_tunnel_cpe_device_config_content}
    #
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
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::CpeDeviceShapeSummary CpeDeviceShapeSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_cpe_device_shapes.rb.html) to see an example of how to use list_cpe_device_shapes API.
    def list_cpe_device_shapes(opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_cpe_device_shapes.' if logger


      path = '/cpeDeviceShapes'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_cpe_device_shapes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::CpeDeviceShapeSummary>'
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


    # Lists the customer-premises equipment objects (CPEs) in the specified compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::Cpe Cpe}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_cpes.rb.html) to see an example of how to use list_cpes API.
    def list_cpes(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_cpes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_cpes." if compartment_id.nil?

      path = '/cpes'
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_cpes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::Cpe>'
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


    # Lists the cross-connect groups in the specified compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle
    #   state. The value is case insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::CrossConnectGroup CrossConnectGroup}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_cross_connect_groups.rb.html) to see an example of how to use list_cross_connect_groups API.
    def list_cross_connect_groups(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_cross_connect_groups.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_cross_connect_groups." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::CrossConnectGroup::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::CrossConnectGroup::LIFECYCLE_STATE_ENUM.'
      end

      path = '/crossConnectGroups'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_cross_connect_groups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::CrossConnectGroup>'
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


    # Lists the available FastConnect locations for cross-connect installation. You need
    # this information so you can specify your desired location when you create a cross-connect.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::CrossConnectLocation CrossConnectLocation}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_cross_connect_locations.rb.html) to see an example of how to use list_cross_connect_locations API.
    def list_cross_connect_locations(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_cross_connect_locations.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_cross_connect_locations." if compartment_id.nil?

      path = '/crossConnectLocations'
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_cross_connect_locations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::CrossConnectLocation>'
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


    # Lists the Cross Connect mapping Details for the specified
    # virtual circuit.
    #
    # @param [String] virtual_circuit_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the virtual circuit.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::CrossConnectMappingDetailsCollection CrossConnectMappingDetailsCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_cross_connect_mappings.rb.html) to see an example of how to use list_cross_connect_mappings API.
    def list_cross_connect_mappings(virtual_circuit_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_cross_connect_mappings.' if logger

      raise "Missing the required parameter 'virtual_circuit_id' when calling list_cross_connect_mappings." if virtual_circuit_id.nil?
      raise "Parameter value for 'virtual_circuit_id' must not be blank" if OCI::Internal::Util.blank_string?(virtual_circuit_id)

      path = '/virtualCircuits/{virtualCircuitId}/crossConnectMappings'.sub('{virtualCircuitId}', virtual_circuit_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_cross_connect_mappings') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::CrossConnectMappingDetailsCollection'
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


    # Lists the cross-connects in the specified compartment. You can filter the list
    # by specifying the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of a cross-connect group.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :cross_connect_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the cross-connect group.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle
    #   state. The value is case insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::CrossConnect CrossConnect}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_cross_connects.rb.html) to see an example of how to use list_cross_connects API.
    def list_cross_connects(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_cross_connects.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_cross_connects." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::CrossConnect::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::CrossConnect::LIFECYCLE_STATE_ENUM.'
      end

      path = '/crossConnects'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:crossConnectGroupId] = opts[:cross_connect_group_id] if opts[:cross_connect_group_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_cross_connects') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::CrossConnect>'
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


    # Lists the available port speeds for cross-connects. You need this information
    # so you can specify your desired port speed (that is, shape) when you create a
    # cross-connect.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::CrossConnectPortSpeedShape CrossConnectPortSpeedShape}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_crossconnect_port_speed_shapes.rb.html) to see an example of how to use list_crossconnect_port_speed_shapes API.
    def list_crossconnect_port_speed_shapes(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_crossconnect_port_speed_shapes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_crossconnect_port_speed_shapes." if compartment_id.nil?

      path = '/crossConnectPortSpeedShapes'
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_crossconnect_port_speed_shapes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::CrossConnectPortSpeedShape>'
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


    # Lists the sets of DHCP options in the specified VCN and specified compartment.
    # If the VCN ID is not provided, then the list includes the sets of DHCP options from all VCNs in the specified compartment.
    # The response includes the default set of options that automatically comes with each VCN,
    # plus any other sets you've created.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle
    #   state. The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::DhcpOptions DhcpOptions}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_dhcp_options.rb.html) to see an example of how to use list_dhcp_options API.
    def list_dhcp_options(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_dhcp_options.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_dhcp_options." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::DhcpOptions::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::DhcpOptions::LIFECYCLE_STATE_ENUM.'
      end

      path = '/dhcps'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_dhcp_options') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::DhcpOptions>'
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


    # Lists the `DrgAttachment` resource for the specified compartment. You can filter the
    # results by DRG, attached network, attachment type, DRG route table or
    # VCN route table.
    #
    # The LIST API lists DRG attachments by attachment type. It will default to list VCN attachments,
    # but you may request to list ALL attachments of ALL types.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @option opts [String] :drg_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG.
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
    # @option opts [String] :network_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the resource (virtual circuit, VCN, IPSec tunnel, or remote peering connection) attached to the DRG.
    # @option opts [String] :attachment_type The type for the network resource attached to the DRG. (default to VCN)
    #   Allowed values are: VCN, VIRTUAL_CIRCUIT, REMOTE_PEERING_CONNECTION, IPSEC_TUNNEL, ALL
    # @option opts [String] :drg_route_table_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG route table assigned to the DRG attachment.
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle
    #   state. The value is case insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::DrgAttachment DrgAttachment}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_drg_attachments.rb.html) to see an example of how to use list_drg_attachments API.
    def list_drg_attachments(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_drg_attachments.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_drg_attachments." if compartment_id.nil?

      if opts[:attachment_type] && !%w[VCN VIRTUAL_CIRCUIT REMOTE_PEERING_CONNECTION IPSEC_TUNNEL ALL].include?(opts[:attachment_type])
        raise 'Invalid value for "attachment_type", must be one of VCN, VIRTUAL_CIRCUIT, REMOTE_PEERING_CONNECTION, IPSEC_TUNNEL, ALL.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::DrgAttachment::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::DrgAttachment::LIFECYCLE_STATE_ENUM.'
      end

      path = '/drgAttachments'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]
      query_params[:drgId] = opts[:drg_id] if opts[:drg_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:networkId] = opts[:network_id] if opts[:network_id]
      query_params[:attachmentType] = opts[:attachment_type] if opts[:attachment_type]
      query_params[:drgRouteTableId] = opts[:drg_route_table_id] if opts[:drg_route_table_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_drg_attachments') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::DrgAttachment>'
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


    # Lists the statements for the specified route distribution.
    # @param [String] drg_route_distribution_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the route distribution.
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
    # @option opts [String] :sort_by The field to sort by.
    #   Allowed values are: TIMECREATED
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The DISPLAYNAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::DrgRouteDistributionStatement DrgRouteDistributionStatement}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_drg_route_distribution_statements.rb.html) to see an example of how to use list_drg_route_distribution_statements API.
    def list_drg_route_distribution_statements(drg_route_distribution_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_drg_route_distribution_statements.' if logger

      raise "Missing the required parameter 'drg_route_distribution_id' when calling list_drg_route_distribution_statements." if drg_route_distribution_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'drg_route_distribution_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_distribution_id)

      path = '/drgRouteDistributions/{drgRouteDistributionId}/drgRouteDistributionStatements'.sub('{drgRouteDistributionId}', drg_route_distribution_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_drg_route_distribution_statements') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::DrgRouteDistributionStatement>'
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


    # Lists the route distributions in the specified DRG.
    #
    # To retrieve the statements in a distribution, use the
    # ListDrgRouteDistributionStatements operation.
    #
    # @param [String] drg_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :lifecycle_state A filter that only returns resources that match the specified lifecycle
    #   state. The value is case insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::DrgRouteDistribution DrgRouteDistribution}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_drg_route_distributions.rb.html) to see an example of how to use list_drg_route_distributions API.
    def list_drg_route_distributions(drg_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_drg_route_distributions.' if logger

      raise "Missing the required parameter 'drg_id' when calling list_drg_route_distributions." if drg_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::DrgRouteDistribution::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::DrgRouteDistribution::LIFECYCLE_STATE_ENUM.'
      end

      path = '/drgRouteDistributions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:drgId] = drg_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_drg_route_distributions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::DrgRouteDistribution>'
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


    # Lists the route rules in the specified DRG route table.
    # @param [String] drg_route_table_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG route table.
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
    # @option opts [String] :route_type Static routes are specified through the DRG route table API.
    #   Dynamic routes are learned by the DRG from the DRG attachments through various routing protocols.
    #
    #   Allowed values are: STATIC, DYNAMIC
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::DrgRouteRule DrgRouteRule}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_drg_route_rules.rb.html) to see an example of how to use list_drg_route_rules API.
    def list_drg_route_rules(drg_route_table_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_drg_route_rules.' if logger

      raise "Missing the required parameter 'drg_route_table_id' when calling list_drg_route_rules." if drg_route_table_id.nil?

      if opts[:route_type] && !%w[STATIC DYNAMIC].include?(opts[:route_type])
        raise 'Invalid value for "route_type", must be one of STATIC, DYNAMIC.'
      end
      raise "Parameter value for 'drg_route_table_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_table_id)

      path = '/drgRouteTables/{drgRouteTableId}/drgRouteRules'.sub('{drgRouteTableId}', drg_route_table_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:routeType] = opts[:route_type] if opts[:route_type]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_drg_route_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::DrgRouteRule>'
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


    # Lists the DRG route tables for the specified DRG.
    #
    # Use the `ListDrgRouteRules` operation to retrieve the route rules in a table.
    #
    # @param [String] drg_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :import_drg_route_distribution_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the import route distribution.
    #
    # @option opts [String] :lifecycle_state A filter that only returns matches for the specified lifecycle
    #   state. The value is case insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::DrgRouteTable DrgRouteTable}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_drg_route_tables.rb.html) to see an example of how to use list_drg_route_tables API.
    def list_drg_route_tables(drg_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_drg_route_tables.' if logger

      raise "Missing the required parameter 'drg_id' when calling list_drg_route_tables." if drg_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::DrgRouteTable::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::DrgRouteTable::LIFECYCLE_STATE_ENUM.'
      end

      path = '/drgRouteTables'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:drgId] = drg_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:importDrgRouteDistributionId] = opts[:import_drg_route_distribution_id] if opts[:import_drg_route_distribution_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_drg_route_tables') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::DrgRouteTable>'
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


    # Lists the DRGs in the specified compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::Drg Drg}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_drgs.rb.html) to see an example of how to use list_drgs API.
    def list_drgs(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_drgs.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_drgs." if compartment_id.nil?

      path = '/drgs'
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_drgs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::Drg>'
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


    # Lists the service offerings from supported providers. You need this
    # information so you can specify your desired provider and service
    # offering when you create a virtual circuit.
    #
    # For the compartment ID, provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of your tenancy (the root compartment).
    #
    # For more information, see [FastConnect Overview](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/fastconnect.htm).
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::FastConnectProviderService FastConnectProviderService}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_fast_connect_provider_services.rb.html) to see an example of how to use list_fast_connect_provider_services API.
    def list_fast_connect_provider_services(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_fast_connect_provider_services.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_fast_connect_provider_services." if compartment_id.nil?

      path = '/fastConnectProviderServices'
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_fast_connect_provider_services') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::FastConnectProviderService>'
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


    # Gets the list of available virtual circuit bandwidth levels for a provider.
    # You need this information so you can specify your desired bandwidth level (shape) when you create a virtual circuit.
    #
    # For more information about virtual circuits, see [FastConnect Overview](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/fastconnect.htm).
    #
    # @param [String] provider_service_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the provider service.
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::VirtualCircuitBandwidthShape VirtualCircuitBandwidthShape}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_fast_connect_provider_virtual_circuit_bandwidth_shapes.rb.html) to see an example of how to use list_fast_connect_provider_virtual_circuit_bandwidth_shapes API.
    def list_fast_connect_provider_virtual_circuit_bandwidth_shapes(provider_service_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_fast_connect_provider_virtual_circuit_bandwidth_shapes.' if logger

      raise "Missing the required parameter 'provider_service_id' when calling list_fast_connect_provider_virtual_circuit_bandwidth_shapes." if provider_service_id.nil?
      raise "Parameter value for 'provider_service_id' must not be blank" if OCI::Internal::Util.blank_string?(provider_service_id)

      path = '/fastConnectProviderServices/{providerServiceId}/virtualCircuitBandwidthShapes'.sub('{providerServiceId}', provider_service_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_fast_connect_provider_virtual_circuit_bandwidth_shapes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::VirtualCircuitBandwidthShape>'
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


    # Lists the internet gateways in the specified VCN and the specified compartment.
    # If the VCN ID is not provided, then the list includes the internet gateways from all VCNs in the specified compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle
    #   state. The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::InternetGateway InternetGateway}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_internet_gateways.rb.html) to see an example of how to use list_internet_gateways API.
    def list_internet_gateways(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_internet_gateways.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_internet_gateways." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::InternetGateway::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::InternetGateway::LIFECYCLE_STATE_ENUM.'
      end

      path = '/internetGateways'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_internet_gateways') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::InternetGateway>'
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


    # The routes advertised to the on-premises network and the routes received from the on-premises network.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [String] tunnel_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the tunnel.
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
    # @option opts [String] :advertiser Specifies the advertiser of the routes. If set to `ORACLE`, this returns only the
    #   routes advertised by Oracle. When set to `CUSTOMER`, this returns only the
    #   routes advertised by the CPE.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::TunnelRouteSummary TunnelRouteSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_ip_sec_connection_tunnel_routes.rb.html) to see an example of how to use list_ip_sec_connection_tunnel_routes API.
    def list_ip_sec_connection_tunnel_routes(ipsc_id, tunnel_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_ip_sec_connection_tunnel_routes.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling list_ip_sec_connection_tunnel_routes." if ipsc_id.nil?
      raise "Missing the required parameter 'tunnel_id' when calling list_ip_sec_connection_tunnel_routes." if tunnel_id.nil?

      if opts[:advertiser] && !OCI::Core::Models::TunnelRouteSummary::ADVERTISER_ENUM.include?(opts[:advertiser])
        raise 'Invalid value for "advertiser", must be one of the values in OCI::Core::Models::TunnelRouteSummary::ADVERTISER_ENUM.'
      end
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)
      raise "Parameter value for 'tunnel_id' must not be blank" if OCI::Internal::Util.blank_string?(tunnel_id)

      path = '/ipsecConnections/{ipscId}/tunnels/{tunnelId}/routes'.sub('{ipscId}', ipsc_id.to_s).sub('{tunnelId}', tunnel_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:advertiser] = opts[:advertiser] if opts[:advertiser]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_ip_sec_connection_tunnel_routes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::TunnelRouteSummary>'
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


    # Lists the tunnel security associations information for the specified IPSec tunnel ID.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [String] tunnel_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the tunnel.
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::TunnelSecurityAssociationSummary TunnelSecurityAssociationSummary}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_ip_sec_connection_tunnel_security_associations.rb.html) to see an example of how to use list_ip_sec_connection_tunnel_security_associations API.
    def list_ip_sec_connection_tunnel_security_associations(ipsc_id, tunnel_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_ip_sec_connection_tunnel_security_associations.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling list_ip_sec_connection_tunnel_security_associations." if ipsc_id.nil?
      raise "Missing the required parameter 'tunnel_id' when calling list_ip_sec_connection_tunnel_security_associations." if tunnel_id.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)
      raise "Parameter value for 'tunnel_id' must not be blank" if OCI::Internal::Util.blank_string?(tunnel_id)

      path = '/ipsecConnections/{ipscId}/tunnels/{tunnelId}/tunnelSecurityAssociations'.sub('{ipscId}', ipsc_id.to_s).sub('{tunnelId}', tunnel_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_ip_sec_connection_tunnel_security_associations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::TunnelSecurityAssociationSummary>'
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


    # Lists the tunnel information for the specified IPSec connection.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::IPSecConnectionTunnel IPSecConnectionTunnel}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_ip_sec_connection_tunnels.rb.html) to see an example of how to use list_ip_sec_connection_tunnels API.
    def list_ip_sec_connection_tunnels(ipsc_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_ip_sec_connection_tunnels.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling list_ip_sec_connection_tunnels." if ipsc_id.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)

      path = '/ipsecConnections/{ipscId}/tunnels'.sub('{ipscId}', ipsc_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_ip_sec_connection_tunnels') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::IPSecConnectionTunnel>'
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


    # Lists the IPSec connections for the specified compartment. You can filter the
    # results by DRG or CPE.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :drg_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG.
    # @option opts [String] :cpe_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the CPE.
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::IPSecConnection IPSecConnection}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_ip_sec_connections.rb.html) to see an example of how to use list_ip_sec_connections API.
    def list_ip_sec_connections(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_ip_sec_connections.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_ip_sec_connections." if compartment_id.nil?

      path = '/ipsecConnections'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:drgId] = opts[:drg_id] if opts[:drg_id]
      query_params[:cpeId] = opts[:cpe_id] if opts[:cpe_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_ip_sec_connections') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::IPSecConnection>'
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


    # Lists the {Ipv6} objects based
    # on one of these filters:
    #
    #   * Subnet [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #   * VNIC [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #   * Both IPv6 address and subnet OCID: This lets you get an `Ipv6` object based on its private
    #   IPv6 address (for example, 2001:0db8:0123:1111:abcd:ef01:2345:6789) and not its [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm). For comparison,
    #   {#get_ipv6 get_ipv6} requires the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
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
    # @option opts [String] :ip_address An IP address. This could be either IPv4 or IPv6, depending on the resource.
    #   Example: `10.0.3.3`
    #
    # @option opts [String] :subnet_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the subnet.
    # @option opts [String] :vnic_id The OCID of the VNIC.
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::Ipv6 Ipv6}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_ipv6s.rb.html) to see an example of how to use list_ipv6s API.
    def list_ipv6s(opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_ipv6s.' if logger


      path = '/ipv6'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:ipAddress] = opts[:ip_address] if opts[:ip_address]
      query_params[:subnetId] = opts[:subnet_id] if opts[:subnet_id]
      query_params[:vnicId] = opts[:vnic_id] if opts[:vnic_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_ipv6s') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::Ipv6>'
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


    # Lists the local peering gateways (LPGs) for the specified VCN and specified compartment.
    # If the VCN ID is not provided, then the list includes the LPGs from all VCNs in the specified compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @option opts [String] :vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::LocalPeeringGateway LocalPeeringGateway}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_local_peering_gateways.rb.html) to see an example of how to use list_local_peering_gateways API.
    def list_local_peering_gateways(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_local_peering_gateways.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_local_peering_gateways." if compartment_id.nil?

      path = '/localPeeringGateways'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_local_peering_gateways') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::LocalPeeringGateway>'
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


    # Lists the NAT gateways in the specified compartment. You may optionally specify a VCN OCID
    # to filter the results by VCN.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle
    #   state. The value is case insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::NatGateway NatGateway}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_nat_gateways.rb.html) to see an example of how to use list_nat_gateways API.
    def list_nat_gateways(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_nat_gateways.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_nat_gateways." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::NatGateway::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::NatGateway::LIFECYCLE_STATE_ENUM.'
      end

      path = '/natGateways'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_nat_gateways') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::NatGateway>'
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


    # Lists the security rules in the specified network security group.
    #
    # @param [String] network_security_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the network security group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :direction Direction of the security rule. Set to `EGRESS` for rules that allow outbound IP packets,
    #   or `INGRESS` for rules that allow inbound IP packets.
    #
    #   Allowed values are: EGRESS, INGRESS
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
    # @option opts [String] :sort_by The field to sort by.
    #   Allowed values are: TIMECREATED
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The DISPLAYNAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::SecurityRule SecurityRule}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_network_security_group_security_rules.rb.html) to see an example of how to use list_network_security_group_security_rules API.
    def list_network_security_group_security_rules(network_security_group_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_network_security_group_security_rules.' if logger

      raise "Missing the required parameter 'network_security_group_id' when calling list_network_security_group_security_rules." if network_security_group_id.nil?

      if opts[:direction] && !%w[EGRESS INGRESS].include?(opts[:direction])
        raise 'Invalid value for "direction", must be one of EGRESS, INGRESS.'
      end

      if opts[:sort_by] && !%w[TIMECREATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'network_security_group_id' must not be blank" if OCI::Internal::Util.blank_string?(network_security_group_id)

      path = '/networkSecurityGroups/{networkSecurityGroupId}/securityRules'.sub('{networkSecurityGroupId}', network_security_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:direction] = opts[:direction] if opts[:direction]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_network_security_group_security_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::SecurityRule>'
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


    # Lists the VNICs in the specified network security group.
    #
    # @param [String] network_security_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the network security group.
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
    # @option opts [String] :sort_by The field to sort by.
    #   Allowed values are: TIMEASSOCIATED
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The DISPLAYNAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::NetworkSecurityGroupVnic NetworkSecurityGroupVnic}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_network_security_group_vnics.rb.html) to see an example of how to use list_network_security_group_vnics API.
    def list_network_security_group_vnics(network_security_group_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_network_security_group_vnics.' if logger

      raise "Missing the required parameter 'network_security_group_id' when calling list_network_security_group_vnics." if network_security_group_id.nil?

      if opts[:sort_by] && !%w[TIMEASSOCIATED].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMEASSOCIATED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end
      raise "Parameter value for 'network_security_group_id' must not be blank" if OCI::Internal::Util.blank_string?(network_security_group_id)

      path = '/networkSecurityGroups/{networkSecurityGroupId}/vnics'.sub('{networkSecurityGroupId}', network_security_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_network_security_group_vnics') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::NetworkSecurityGroupVnic>'
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


    # Lists either the network security groups in the specified compartment, or those associated with the specified VLAN.
    # You must specify either a `vlanId` or a `compartmentId`, but not both. If you specify a `vlanId`, all other parameters are ignored.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @option opts [String] :vlan_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VLAN.
    # @option opts [String] :vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle
    #   state. The value is case insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::NetworkSecurityGroup NetworkSecurityGroup}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_network_security_groups.rb.html) to see an example of how to use list_network_security_groups API.
    def list_network_security_groups(opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_network_security_groups.' if logger


      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::NetworkSecurityGroup::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::NetworkSecurityGroup::LIFECYCLE_STATE_ENUM.'
      end

      path = '/networkSecurityGroups'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:vlanId] = opts[:vlan_id] if opts[:vlan_id]
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_network_security_groups') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::NetworkSecurityGroup>'
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


    # Lists the {PrivateIp} objects based
    # on one of these filters:
    #
    #   - Subnet [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #   - VNIC [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #   - Both private IP address and subnet OCID: This lets
    #   you get a `privateIP` object based on its private IP
    #   address (for example, 10.0.3.3) and not its [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm). For comparison,
    #   {#get_private_ip get_private_ip}
    #   requires the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # If you're listing all the private IPs associated with a given subnet
    # or VNIC, the response includes both primary and secondary private IPs.
    #
    # If you are an Oracle Cloud VMware Solution customer and have VLANs
    # in your VCN, you can filter the list by VLAN [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm). See {Vlan}.
    #
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
    # @option opts [String] :ip_address An IP address. This could be either IPv4 or IPv6, depending on the resource.
    #   Example: `10.0.3.3`
    #
    # @option opts [String] :subnet_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the subnet.
    # @option opts [String] :vnic_id The OCID of the VNIC.
    # @option opts [String] :vlan_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VLAN.
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::PrivateIp PrivateIp}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_private_ips.rb.html) to see an example of how to use list_private_ips API.
    def list_private_ips(opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_private_ips.' if logger


      path = '/privateIps'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:ipAddress] = opts[:ip_address] if opts[:ip_address]
      query_params[:subnetId] = opts[:subnet_id] if opts[:subnet_id]
      query_params[:vnicId] = opts[:vnic_id] if opts[:vnic_id]
      query_params[:vlanId] = opts[:vlan_id] if opts[:vlan_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_private_ips') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::PrivateIp>'
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


    # Lists the public IP pools in the specified compartment.
    # You can filter the list using query parameters.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    #
    # @option opts [String] :byoip_range_id A filter to return only resources that match the given BYOIP CIDR block.
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
    # @return [Response] A Response object with data of type {OCI::Core::Models::PublicIpPoolCollection PublicIpPoolCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_public_ip_pools.rb.html) to see an example of how to use list_public_ip_pools API.
    def list_public_ip_pools(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_public_ip_pools.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_public_ip_pools." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/publicIpPools'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:byoipRangeId] = opts[:byoip_range_id] if opts[:byoip_range_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_public_ip_pools') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PublicIpPoolCollection'
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


    # Lists the {PublicIp} objects
    # in the specified compartment. You can filter the list by using query parameters.
    #
    # To list your reserved public IPs:
    #   * Set `scope` = `REGION`  (required)
    #   * Leave the `availabilityDomain` parameter empty
    #   * Set `lifetime` = `RESERVED`
    #
    # To list the ephemeral public IPs assigned to a regional entity such as a NAT gateway:
    #   * Set `scope` = `REGION`  (required)
    #   * Leave the `availabilityDomain` parameter empty
    #   * Set `lifetime` = `EPHEMERAL`
    #
    # To list the ephemeral public IPs assigned to private IPs:
    #   * Set `scope` = `AVAILABILITY_DOMAIN` (required)
    #   * Set the `availabilityDomain` parameter to the desired availability domain (required)
    #   * Set `lifetime` = `EPHEMERAL`
    #
    # **Note:** An ephemeral public IP assigned to a private IP
    # is always in the same availability domain and compartment as the private IP.
    #
    # @param [String] scope Whether the public IP is regional or specific to a particular availability domain.
    #
    #   * `REGION`: The public IP exists within a region and is assigned to a regional entity
    #   (such as a {NatGateway}), or can be assigned to a private IP
    #   in any availability domain in the region. Reserved public IPs have `scope` = `REGION`, as do
    #   ephemeral public IPs assigned to a regional entity.
    #
    #   * `AVAILABILITY_DOMAIN`: The public IP exists within the availability domain of the entity
    #   it's assigned to, which is specified by the `availabilityDomain` property of the public IP object.
    #   Ephemeral public IPs that are assigned to private IPs have `scope` = `AVAILABILITY_DOMAIN`.
    #
    #   Allowed values are: REGION, AVAILABILITY_DOMAIN
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @option opts [String] :availability_domain The name of the availability domain.
    #
    #   Example: `Uocm:PHX-AD-1`
    #
    # @option opts [String] :lifetime A filter to return only public IPs that match given lifetime.
    #
    #   Allowed values are: EPHEMERAL, RESERVED
    # @option opts [String] :public_ip_pool_id A filter to return only resources that belong to the given public IP pool.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::PublicIp PublicIp}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_public_ips.rb.html) to see an example of how to use list_public_ips API.
    def list_public_ips(scope, compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_public_ips.' if logger

      raise "Missing the required parameter 'scope' when calling list_public_ips." if scope.nil?
      unless %w[REGION AVAILABILITY_DOMAIN].include?(scope)
        raise "Invalid value for 'scope', must be one of REGION, AVAILABILITY_DOMAIN."
      end
      raise "Missing the required parameter 'compartment_id' when calling list_public_ips." if compartment_id.nil?

      if opts[:lifetime] && !%w[EPHEMERAL RESERVED].include?(opts[:lifetime])
        raise 'Invalid value for "lifetime", must be one of EPHEMERAL, RESERVED.'
      end

      path = '/publicIps'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:scope] = scope
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]
      query_params[:lifetime] = opts[:lifetime] if opts[:lifetime]
      query_params[:publicIpPoolId] = opts[:public_ip_pool_id] if opts[:public_ip_pool_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_public_ips') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::PublicIp>'
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


    # Lists the remote peering connections (RPCs) for the specified DRG and compartment
    # (the RPC's compartment).
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :drg_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG.
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::RemotePeeringConnection RemotePeeringConnection}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_remote_peering_connections.rb.html) to see an example of how to use list_remote_peering_connections API.
    def list_remote_peering_connections(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_remote_peering_connections.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_remote_peering_connections." if compartment_id.nil?

      path = '/remotePeeringConnections'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:drgId] = opts[:drg_id] if opts[:drg_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_remote_peering_connections') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::RemotePeeringConnection>'
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


    # Lists the route tables in the specified VCN and specified compartment.
    # If the VCN ID is not provided, then the list includes the route tables from all VCNs in the specified compartment.
    # The response includes the default route table that automatically comes with
    # each VCN in the specified compartment, plus any route tables you've created.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @option opts [String] :vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle
    #   state. The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::RouteTable RouteTable}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_route_tables.rb.html) to see an example of how to use list_route_tables API.
    def list_route_tables(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_route_tables.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_route_tables." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::RouteTable::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::RouteTable::LIFECYCLE_STATE_ENUM.'
      end

      path = '/routeTables'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_route_tables') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::RouteTable>'
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


    # Lists the security lists in the specified VCN and compartment.
    # If the VCN ID is not provided, then the list includes the security lists from all VCNs in the specified compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @option opts [String] :vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle
    #   state. The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::SecurityList SecurityList}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_security_lists.rb.html) to see an example of how to use list_security_lists API.
    def list_security_lists(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_security_lists.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_security_lists." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::SecurityList::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::SecurityList::LIFECYCLE_STATE_ENUM.'
      end

      path = '/securityLists'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_security_lists') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::SecurityList>'
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


    # Lists the service gateways in the specified compartment. You may optionally specify a VCN OCID
    # to filter the results by VCN.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
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
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given lifecycle
    #   state. The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::ServiceGateway ServiceGateway}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_service_gateways.rb.html) to see an example of how to use list_service_gateways API.
    def list_service_gateways(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_service_gateways.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_service_gateways." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::ServiceGateway::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::ServiceGateway::LIFECYCLE_STATE_ENUM.'
      end

      path = '/serviceGateways'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_service_gateways') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::ServiceGateway>'
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


    # Lists the available {Service} objects that you can enable for a
    # service gateway in this region.
    #
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::Service Service}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_services.rb.html) to see an example of how to use list_services API.
    def list_services(opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_services.' if logger


      path = '/services'
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_services') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::Service>'
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


    # Lists the subnets in the specified VCN and the specified compartment.
    # If the VCN ID is not provided, then the list includes the subnets from all VCNs in the specified compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @option opts [String] :vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle
    #   state. The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::Subnet Subnet}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_subnets.rb.html) to see an example of how to use list_subnets API.
    def list_subnets(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_subnets.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_subnets." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::Subnet::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::Subnet::LIFECYCLE_STATE_ENUM.'
      end

      path = '/subnets'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_subnets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::Subnet>'
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


    # Lists the virtual cloud networks (VCNs) in the specified compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle
    #   state. The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::Vcn Vcn}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_vcns.rb.html) to see an example of how to use list_vcns API.
    def list_vcns(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_vcns.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_vcns." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::Vcn::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::Vcn::LIFECYCLE_STATE_ENUM.'
      end

      path = '/vcns'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_vcns') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::Vcn>'
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


    # The deprecated operation lists available bandwidth levels for virtual circuits. For the compartment ID, provide the [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of your tenancy (the root compartment).
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::VirtualCircuitBandwidthShape VirtualCircuitBandwidthShape}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_virtual_circuit_bandwidth_shapes.rb.html) to see an example of how to use list_virtual_circuit_bandwidth_shapes API.
    def list_virtual_circuit_bandwidth_shapes(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_virtual_circuit_bandwidth_shapes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_virtual_circuit_bandwidth_shapes." if compartment_id.nil?

      path = '/virtualCircuitBandwidthShapes'
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_virtual_circuit_bandwidth_shapes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::VirtualCircuitBandwidthShape>'
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


    # Lists the public IP prefixes and their details for the specified
    # public virtual circuit.
    #
    # @param [String] virtual_circuit_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the virtual circuit.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :verification_state A filter to only return resources that match the given verification
    #   state.
    #
    #   The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::VirtualCircuitPublicPrefix VirtualCircuitPublicPrefix}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_virtual_circuit_public_prefixes.rb.html) to see an example of how to use list_virtual_circuit_public_prefixes API.
    def list_virtual_circuit_public_prefixes(virtual_circuit_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_virtual_circuit_public_prefixes.' if logger

      raise "Missing the required parameter 'virtual_circuit_id' when calling list_virtual_circuit_public_prefixes." if virtual_circuit_id.nil?

      if opts[:verification_state] && !OCI::Core::Models::VirtualCircuitPublicPrefix::VERIFICATION_STATE_ENUM.include?(opts[:verification_state])
        raise 'Invalid value for "verification_state", must be one of the values in OCI::Core::Models::VirtualCircuitPublicPrefix::VERIFICATION_STATE_ENUM.'
      end
      raise "Parameter value for 'virtual_circuit_id' must not be blank" if OCI::Internal::Util.blank_string?(virtual_circuit_id)

      path = '/virtualCircuits/{virtualCircuitId}/publicPrefixes'.sub('{virtualCircuitId}', virtual_circuit_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:verificationState] = opts[:verification_state] if opts[:verification_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_virtual_circuit_public_prefixes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::VirtualCircuitPublicPrefix>'
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


    # Lists the virtual circuits in the specified compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :lifecycle_state A filter to return only resources that match the specified lifecycle
    #   state. The value is case insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::VirtualCircuit VirtualCircuit}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_virtual_circuits.rb.html) to see an example of how to use list_virtual_circuits API.
    def list_virtual_circuits(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_virtual_circuits.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_virtual_circuits." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::VirtualCircuit::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::VirtualCircuit::LIFECYCLE_STATE_ENUM.'
      end

      path = '/virtualCircuits'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_virtual_circuits') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::VirtualCircuit>'
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


    # Lists the VLANs in the specified VCN and the specified compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
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
    # @option opts [String] :vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle
    #   state. The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::Vlan Vlan}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_vlans.rb.html) to see an example of how to use list_vlans API.
    def list_vlans(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_vlans.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_vlans." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::Vlan::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::Vlan::LIFECYCLE_STATE_ENUM.'
      end

      path = '/vlans'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_vlans') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::Vlan>'
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


    # Lists the virtual test access points (VTAPs) in the specified compartment.
    #
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @option opts [String] :source The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VTAP source.
    # @option opts [String] :target_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VTAP target.
    # @option opts [String] :target_ip The IP address of the VTAP target.
    # @option opts [BOOLEAN] :is_vtap_enabled Indicates whether to list all VTAPs or only running VTAPs.
    #
    #   * When `FALSE`, lists ALL running and stopped VTAPs.
    #   * When `TRUE`, lists only running VTAPs (VTAPs where isVtapEnabled = `TRUE`).
    #    (default to false)
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
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    #
    # @option opts [String] :lifecycle_state A filter to return only resources that match the given VTAP administrative lifecycle state.
    #   The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::Vtap Vtap}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/list_vtaps.rb.html) to see an example of how to use list_vtaps API.
    def list_vtaps(compartment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#list_vtaps.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_vtaps." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::Vtap::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::Vtap::LIFECYCLE_STATE_ENUM.'
      end

      path = '/vtaps'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:vcnId] = opts[:vcn_id] if opts[:vcn_id]
      query_params[:source] = opts[:source] if opts[:source]
      query_params[:targetId] = opts[:target_id] if opts[:target_id]
      query_params[:targetIp] = opts[:target_ip] if opts[:target_ip]
      query_params[:isVtapEnabled] = opts[:is_vtap_enabled] if !opts[:is_vtap_enabled].nil?
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#list_vtaps') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::Vtap>'
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


    # Updates the specified CIDR block of a VCN. The new CIDR IP range must meet the following criteria:
    #
    # - Must be valid.
    # - Must not overlap with another CIDR block in the VCN, a CIDR block of a peered VCN, or the on-premises network CIDR block.
    # - Must not exceed the limit of CIDR blocks allowed per VCN.
    # - Must include IP addresses from the original CIDR block that are used in the VCN's existing route rules.
    # - No IP address in an existing subnet should be outside of the new CIDR block range.
    #
    # **Note:** Modifying a CIDR block places your VCN in an updating state until the changes are complete. You cannot create or update the VCN's subnets, VLANs, LPGs, or route tables during this operation. The time to completion can vary depending on the size of your network. Updating a small network could take about a minute, and updating a large network could take up to an hour. You can use the `GetWorkRequest` operation to check the status of the update.
    #
    # @param [String] vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @param [OCI::Core::Models::ModifyVcnCidrDetails] modify_vcn_cidr_details Details object for updating a VCN CIDR.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/modify_vcn_cidr.rb.html) to see an example of how to use modify_vcn_cidr API.
    def modify_vcn_cidr(vcn_id, modify_vcn_cidr_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#modify_vcn_cidr.' if logger

      raise "Missing the required parameter 'vcn_id' when calling modify_vcn_cidr." if vcn_id.nil?
      raise "Missing the required parameter 'modify_vcn_cidr_details' when calling modify_vcn_cidr." if modify_vcn_cidr_details.nil?
      raise "Parameter value for 'vcn_id' must not be blank" if OCI::Internal::Util.blank_string?(vcn_id)

      path = '/vcns/{vcnId}/actions/modifyCidr'.sub('{vcnId}', vcn_id.to_s)
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

      post_body = @api_client.object_to_http_body(modify_vcn_cidr_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#modify_vcn_cidr') do
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
    # rubocop:disable Lint/UnusedMethodArgument


    # Removes one or more route distribution statements from the specified route distribution's map.
    #
    # @param [String] drg_route_distribution_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the route distribution.
    # @param [OCI::Core::Models::RemoveDrgRouteDistributionStatementsDetails] remove_drg_route_distribution_statements_details Request with one or more route distribution statements to remove from the route distribution.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/remove_drg_route_distribution_statements.rb.html) to see an example of how to use remove_drg_route_distribution_statements API.
    def remove_drg_route_distribution_statements(drg_route_distribution_id, remove_drg_route_distribution_statements_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#remove_drg_route_distribution_statements.' if logger

      raise "Missing the required parameter 'drg_route_distribution_id' when calling remove_drg_route_distribution_statements." if drg_route_distribution_id.nil?
      raise "Missing the required parameter 'remove_drg_route_distribution_statements_details' when calling remove_drg_route_distribution_statements." if remove_drg_route_distribution_statements_details.nil?
      raise "Parameter value for 'drg_route_distribution_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_distribution_id)

      path = '/drgRouteDistributions/{drgRouteDistributionId}/actions/removeDrgRouteDistributionStatements'.sub('{drgRouteDistributionId}', drg_route_distribution_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(remove_drg_route_distribution_statements_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#remove_drg_route_distribution_statements') do
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
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Removes one or more route rules from the specified DRG route table.
    #
    # @param [String] drg_route_table_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG route table.
    # @param [OCI::Core::Models::RemoveDrgRouteRulesDetails] remove_drg_route_rules_details Request to remove one or more route rules in the DRG route table.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/remove_drg_route_rules.rb.html) to see an example of how to use remove_drg_route_rules API.
    def remove_drg_route_rules(drg_route_table_id, remove_drg_route_rules_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#remove_drg_route_rules.' if logger

      raise "Missing the required parameter 'drg_route_table_id' when calling remove_drg_route_rules." if drg_route_table_id.nil?
      raise "Missing the required parameter 'remove_drg_route_rules_details' when calling remove_drg_route_rules." if remove_drg_route_rules_details.nil?
      raise "Parameter value for 'drg_route_table_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_table_id)

      path = '/drgRouteTables/{drgRouteTableId}/actions/removeDrgRouteRules'.sub('{drgRouteTableId}', drg_route_table_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(remove_drg_route_rules_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#remove_drg_route_rules') do
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
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Removes the export route distribution from the DRG attachment so no routes are advertised to it.
    #
    # @param [String] drg_attachment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::DrgAttachment DrgAttachment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/remove_export_drg_route_distribution.rb.html) to see an example of how to use remove_export_drg_route_distribution API.
    def remove_export_drg_route_distribution(drg_attachment_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#remove_export_drg_route_distribution.' if logger

      raise "Missing the required parameter 'drg_attachment_id' when calling remove_export_drg_route_distribution." if drg_attachment_id.nil?
      raise "Parameter value for 'drg_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_attachment_id)

      path = '/drgAttachments/{drgAttachmentId}/actions/removeExportDrgRouteDistribution'.sub('{drgAttachmentId}', drg_attachment_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#remove_export_drg_route_distribution') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DrgAttachment'
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


    # Removes the import route distribution from the DRG route table so no routes are imported
    # into it.
    #
    # @param [String] drg_route_table_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG route table.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::DrgRouteTable DrgRouteTable}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/remove_import_drg_route_distribution.rb.html) to see an example of how to use remove_import_drg_route_distribution API.
    def remove_import_drg_route_distribution(drg_route_table_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#remove_import_drg_route_distribution.' if logger

      raise "Missing the required parameter 'drg_route_table_id' when calling remove_import_drg_route_distribution." if drg_route_table_id.nil?
      raise "Parameter value for 'drg_route_table_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_table_id)

      path = '/drgRouteTables/{drgRouteTableId}/actions/removeImportDrgRouteDistribution'.sub('{drgRouteTableId}', drg_route_table_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#remove_import_drg_route_distribution') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DrgRouteTable'
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


    # Remove an IPv6 CIDR from a subnet. At least one IPv6 CIDR should remain.
    #
    # @param [String] subnet_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the subnet.
    # @param [OCI::Core::Models::RemoveSubnetIpv6CidrDetails] remove_subnet_ipv6_cidr_details Details object for removing an IPv6 SUBNET CIDR.
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
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/remove_ipv6_subnet_cidr.rb.html) to see an example of how to use remove_ipv6_subnet_cidr API.
    def remove_ipv6_subnet_cidr(subnet_id, remove_subnet_ipv6_cidr_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#remove_ipv6_subnet_cidr.' if logger

      raise "Missing the required parameter 'subnet_id' when calling remove_ipv6_subnet_cidr." if subnet_id.nil?
      raise "Missing the required parameter 'remove_subnet_ipv6_cidr_details' when calling remove_ipv6_subnet_cidr." if remove_subnet_ipv6_cidr_details.nil?
      raise "Parameter value for 'subnet_id' must not be blank" if OCI::Internal::Util.blank_string?(subnet_id)

      path = '/subnets/{subnetId}/actions/removeIpv6Cidr'.sub('{subnetId}', subnet_id.to_s)
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

      post_body = @api_client.object_to_http_body(remove_subnet_ipv6_cidr_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#remove_ipv6_subnet_cidr') do
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


    # Removing an existing IPv6 CIDR from a VCN.
    #
    # @param [String] vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [OCI::Core::Models::RemoveVcnIpv6CidrDetails] :remove_vcn_ipv6_cidr_details Details object for removing a VCN ipv6 CIDR.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/remove_ipv6_vcn_cidr.rb.html) to see an example of how to use remove_ipv6_vcn_cidr API.
    def remove_ipv6_vcn_cidr(vcn_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#remove_ipv6_vcn_cidr.' if logger

      raise "Missing the required parameter 'vcn_id' when calling remove_ipv6_vcn_cidr." if vcn_id.nil?
      raise "Parameter value for 'vcn_id' must not be blank" if OCI::Internal::Util.blank_string?(vcn_id)

      path = '/vcns/{vcnId}/actions/removeIpv6Cidr'.sub('{vcnId}', vcn_id.to_s)
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

      post_body = @api_client.object_to_http_body(opts[:remove_vcn_ipv6_cidr_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#remove_ipv6_vcn_cidr') do
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
    # rubocop:disable Lint/UnusedMethodArgument


    # Removes one or more security rules from the specified network security group.
    #
    # @param [String] network_security_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the network security group.
    # @param [OCI::Core::Models::RemoveNetworkSecurityGroupSecurityRulesDetails] remove_network_security_group_security_rules_details Request with one or more security rules associated with the network security group that
    #   will be removed.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/remove_network_security_group_security_rules.rb.html) to see an example of how to use remove_network_security_group_security_rules API.
    def remove_network_security_group_security_rules(network_security_group_id, remove_network_security_group_security_rules_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#remove_network_security_group_security_rules.' if logger

      raise "Missing the required parameter 'network_security_group_id' when calling remove_network_security_group_security_rules." if network_security_group_id.nil?
      raise "Missing the required parameter 'remove_network_security_group_security_rules_details' when calling remove_network_security_group_security_rules." if remove_network_security_group_security_rules_details.nil?
      raise "Parameter value for 'network_security_group_id' must not be blank" if OCI::Internal::Util.blank_string?(network_security_group_id)

      path = '/networkSecurityGroups/{networkSecurityGroupId}/actions/removeSecurityRules'.sub('{networkSecurityGroupId}', network_security_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(remove_network_security_group_security_rules_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#remove_network_security_group_security_rules') do
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
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Removes a CIDR block from the referenced public IP pool.
    #
    # @param [String] public_ip_pool_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the public IP pool.
    # @param [OCI::Core::Models::RemovePublicIpPoolCapacityDetails] remove_public_ip_pool_capacity_details The CIDR block to remove from the IP pool.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::PublicIpPool PublicIpPool}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/remove_public_ip_pool_capacity.rb.html) to see an example of how to use remove_public_ip_pool_capacity API.
    def remove_public_ip_pool_capacity(public_ip_pool_id, remove_public_ip_pool_capacity_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#remove_public_ip_pool_capacity.' if logger

      raise "Missing the required parameter 'public_ip_pool_id' when calling remove_public_ip_pool_capacity." if public_ip_pool_id.nil?
      raise "Missing the required parameter 'remove_public_ip_pool_capacity_details' when calling remove_public_ip_pool_capacity." if remove_public_ip_pool_capacity_details.nil?
      raise "Parameter value for 'public_ip_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(public_ip_pool_id)

      path = '/publicIpPools/{publicIpPoolId}/actions/removeCapacity'.sub('{publicIpPoolId}', public_ip_pool_id.to_s)
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

      post_body = @api_client.object_to_http_body(remove_public_ip_pool_capacity_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#remove_public_ip_pool_capacity') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PublicIpPool'
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


    # Removes a specified CIDR block from a VCN.
    #
    # **Notes:**
    # - You cannot remove a CIDR block if an IP address in its range is in use.
    # - Removing a CIDR block places your VCN in an updating state until the changes are complete. You cannot create or update the VCN's subnets, VLANs, LPGs, or route tables during this operation. The time to completion can take a few minutes. You can use the `GetWorkRequest` operation to check the status of the update.
    #
    # @param [String] vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @param [OCI::Core::Models::RemoveVcnCidrDetails] remove_vcn_cidr_details Details object for removing a VCN CIDR.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/remove_vcn_cidr.rb.html) to see an example of how to use remove_vcn_cidr API.
    def remove_vcn_cidr(vcn_id, remove_vcn_cidr_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#remove_vcn_cidr.' if logger

      raise "Missing the required parameter 'vcn_id' when calling remove_vcn_cidr." if vcn_id.nil?
      raise "Missing the required parameter 'remove_vcn_cidr_details' when calling remove_vcn_cidr." if remove_vcn_cidr_details.nil?
      raise "Parameter value for 'vcn_id' must not be blank" if OCI::Internal::Util.blank_string?(vcn_id)

      path = '/vcns/{vcnId}/actions/removeCidr'.sub('{vcnId}', vcn_id.to_s)
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

      post_body = @api_client.object_to_http_body(remove_vcn_cidr_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#remove_vcn_cidr') do
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


    # Updates the tags or display name associated to the specified BYOIP CIDR block.
    #
    # @param [String] byoip_range_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the `ByoipRange` resource containing the BYOIP CIDR block.
    # @param [OCI::Core::Models::UpdateByoipRangeDetails] update_byoip_range_details Byoip Range details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::ByoipRange ByoipRange}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_byoip_range.rb.html) to see an example of how to use update_byoip_range API.
    def update_byoip_range(byoip_range_id, update_byoip_range_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_byoip_range.' if logger

      raise "Missing the required parameter 'byoip_range_id' when calling update_byoip_range." if byoip_range_id.nil?
      raise "Missing the required parameter 'update_byoip_range_details' when calling update_byoip_range." if update_byoip_range_details.nil?
      raise "Parameter value for 'byoip_range_id' must not be blank" if OCI::Internal::Util.blank_string?(byoip_range_id)

      path = '/byoipRanges/{byoipRangeId}'.sub('{byoipRangeId}', byoip_range_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_byoip_range_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_byoip_range') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::ByoipRange'
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


    # Updates the specified VTAP capture filter's display name or tags.
    #
    # @param [String] capture_filter_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the capture filter.
    # @param [OCI::Core::Models::UpdateCaptureFilterDetails] update_capture_filter_details Details object for updating a VTAP.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::CaptureFilter CaptureFilter}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_capture_filter.rb.html) to see an example of how to use update_capture_filter API.
    def update_capture_filter(capture_filter_id, update_capture_filter_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_capture_filter.' if logger

      raise "Missing the required parameter 'capture_filter_id' when calling update_capture_filter." if capture_filter_id.nil?
      raise "Missing the required parameter 'update_capture_filter_details' when calling update_capture_filter." if update_capture_filter_details.nil?
      raise "Parameter value for 'capture_filter_id' must not be blank" if OCI::Internal::Util.blank_string?(capture_filter_id)

      path = '/captureFilters/{captureFilterId}'.sub('{captureFilterId}', capture_filter_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_capture_filter_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_capture_filter') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::CaptureFilter'
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


    # Updates the specified CPE's display name or tags.
    # Avoid entering confidential information.
    #
    # @param [String] cpe_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the CPE.
    # @param [OCI::Core::Models::UpdateCpeDetails] update_cpe_details Details object for updating a CPE.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Cpe Cpe}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_cpe.rb.html) to see an example of how to use update_cpe API.
    def update_cpe(cpe_id, update_cpe_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_cpe.' if logger

      raise "Missing the required parameter 'cpe_id' when calling update_cpe." if cpe_id.nil?
      raise "Missing the required parameter 'update_cpe_details' when calling update_cpe." if update_cpe_details.nil?
      raise "Parameter value for 'cpe_id' must not be blank" if OCI::Internal::Util.blank_string?(cpe_id)

      path = '/cpes/{cpeId}'.sub('{cpeId}', cpe_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_cpe_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_cpe') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Cpe'
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


    # Updates the specified cross-connect.
    # @param [String] cross_connect_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the cross-connect.
    # @param [OCI::Core::Models::UpdateCrossConnectDetails] update_cross_connect_details Update CrossConnect fields.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::CrossConnect CrossConnect}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_cross_connect.rb.html) to see an example of how to use update_cross_connect API.
    def update_cross_connect(cross_connect_id, update_cross_connect_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_cross_connect.' if logger

      raise "Missing the required parameter 'cross_connect_id' when calling update_cross_connect." if cross_connect_id.nil?
      raise "Missing the required parameter 'update_cross_connect_details' when calling update_cross_connect." if update_cross_connect_details.nil?
      raise "Parameter value for 'cross_connect_id' must not be blank" if OCI::Internal::Util.blank_string?(cross_connect_id)

      path = '/crossConnects/{crossConnectId}'.sub('{crossConnectId}', cross_connect_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_cross_connect_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_cross_connect') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::CrossConnect'
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


    # Updates the specified cross-connect group's display name.
    # Avoid entering confidential information.
    #
    # @param [String] cross_connect_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the cross-connect group.
    # @param [OCI::Core::Models::UpdateCrossConnectGroupDetails] update_cross_connect_group_details Update CrossConnectGroup fields
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::CrossConnectGroup CrossConnectGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_cross_connect_group.rb.html) to see an example of how to use update_cross_connect_group API.
    def update_cross_connect_group(cross_connect_group_id, update_cross_connect_group_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_cross_connect_group.' if logger

      raise "Missing the required parameter 'cross_connect_group_id' when calling update_cross_connect_group." if cross_connect_group_id.nil?
      raise "Missing the required parameter 'update_cross_connect_group_details' when calling update_cross_connect_group." if update_cross_connect_group_details.nil?
      raise "Parameter value for 'cross_connect_group_id' must not be blank" if OCI::Internal::Util.blank_string?(cross_connect_group_id)

      path = '/crossConnectGroups/{crossConnectGroupId}'.sub('{crossConnectGroupId}', cross_connect_group_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_cross_connect_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_cross_connect_group') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::CrossConnectGroup'
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


    # Updates the specified set of DHCP options. You can update the display name or the options
    # themselves. Avoid entering confidential information.
    #
    # Note that the `options` object you provide replaces the entire existing set of options.
    #
    # @param [String] dhcp_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the set of DHCP options.
    # @param [OCI::Core::Models::UpdateDhcpDetails] update_dhcp_details Request object for updating a set of DHCP options.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::DhcpOptions DhcpOptions}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_dhcp_options.rb.html) to see an example of how to use update_dhcp_options API.
    def update_dhcp_options(dhcp_id, update_dhcp_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_dhcp_options.' if logger

      raise "Missing the required parameter 'dhcp_id' when calling update_dhcp_options." if dhcp_id.nil?
      raise "Missing the required parameter 'update_dhcp_details' when calling update_dhcp_options." if update_dhcp_details.nil?
      raise "Parameter value for 'dhcp_id' must not be blank" if OCI::Internal::Util.blank_string?(dhcp_id)

      path = '/dhcps/{dhcpId}'.sub('{dhcpId}', dhcp_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_dhcp_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_dhcp_options') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DhcpOptions'
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


    # Updates the specified DRG's display name or tags. Avoid entering confidential information.
    #
    # @param [String] drg_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG.
    # @param [OCI::Core::Models::UpdateDrgDetails] update_drg_details Details object for updating a DRG.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Drg Drg}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_drg.rb.html) to see an example of how to use update_drg API.
    def update_drg(drg_id, update_drg_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_drg.' if logger

      raise "Missing the required parameter 'drg_id' when calling update_drg." if drg_id.nil?
      raise "Missing the required parameter 'update_drg_details' when calling update_drg." if update_drg_details.nil?
      raise "Parameter value for 'drg_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_id)

      path = '/drgs/{drgId}'.sub('{drgId}', drg_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_drg_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_drg') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Drg'
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


    # Updates the display name and routing information for the specified `DrgAttachment`.
    # Avoid entering confidential information.
    #
    # @param [String] drg_attachment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG attachment.
    # @param [OCI::Core::Models::UpdateDrgAttachmentDetails] update_drg_attachment_details Details object for updating a `DrgAttachment`.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::DrgAttachment DrgAttachment}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_drg_attachment.rb.html) to see an example of how to use update_drg_attachment API.
    def update_drg_attachment(drg_attachment_id, update_drg_attachment_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_drg_attachment.' if logger

      raise "Missing the required parameter 'drg_attachment_id' when calling update_drg_attachment." if drg_attachment_id.nil?
      raise "Missing the required parameter 'update_drg_attachment_details' when calling update_drg_attachment." if update_drg_attachment_details.nil?
      raise "Parameter value for 'drg_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_attachment_id)

      path = '/drgAttachments/{drgAttachmentId}'.sub('{drgAttachmentId}', drg_attachment_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_drg_attachment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_drg_attachment') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DrgAttachment'
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


    # Updates the specified route distribution
    #
    # @param [String] drg_route_distribution_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the route distribution.
    # @param [OCI::Core::Models::UpdateDrgRouteDistributionDetails] update_drg_route_distribution_details Details object for updating a route distribution
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::DrgRouteDistribution DrgRouteDistribution}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_drg_route_distribution.rb.html) to see an example of how to use update_drg_route_distribution API.
    def update_drg_route_distribution(drg_route_distribution_id, update_drg_route_distribution_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_drg_route_distribution.' if logger

      raise "Missing the required parameter 'drg_route_distribution_id' when calling update_drg_route_distribution." if drg_route_distribution_id.nil?
      raise "Missing the required parameter 'update_drg_route_distribution_details' when calling update_drg_route_distribution." if update_drg_route_distribution_details.nil?
      raise "Parameter value for 'drg_route_distribution_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_distribution_id)

      path = '/drgRouteDistributions/{drgRouteDistributionId}'.sub('{drgRouteDistributionId}', drg_route_distribution_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_drg_route_distribution_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_drg_route_distribution') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DrgRouteDistribution'
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


    # Updates one or more route distribution statements in the specified route distribution.
    #
    # @param [String] drg_route_distribution_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the route distribution.
    # @param [OCI::Core::Models::UpdateDrgRouteDistributionStatementsDetails] update_drg_route_distribution_statements_details Request to update one or more route distribution statements in the route distribution.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::DrgRouteDistributionStatement DrgRouteDistributionStatement}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_drg_route_distribution_statements.rb.html) to see an example of how to use update_drg_route_distribution_statements API.
    def update_drg_route_distribution_statements(drg_route_distribution_id, update_drg_route_distribution_statements_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_drg_route_distribution_statements.' if logger

      raise "Missing the required parameter 'drg_route_distribution_id' when calling update_drg_route_distribution_statements." if drg_route_distribution_id.nil?
      raise "Missing the required parameter 'update_drg_route_distribution_statements_details' when calling update_drg_route_distribution_statements." if update_drg_route_distribution_statements_details.nil?
      raise "Parameter value for 'drg_route_distribution_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_distribution_id)

      path = '/drgRouteDistributions/{drgRouteDistributionId}/actions/updateDrgRouteDistributionStatements'.sub('{drgRouteDistributionId}', drg_route_distribution_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_drg_route_distribution_statements_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_drg_route_distribution_statements') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::DrgRouteDistributionStatement>'
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


    # Updates one or more route rules in the specified DRG route table.
    #
    # @param [String] drg_route_table_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG route table.
    # @param [OCI::Core::Models::UpdateDrgRouteRulesDetails] update_drg_route_rules_details Request to update one or more route rules in the DRG route table.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::DrgRouteRule DrgRouteRule}>
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_drg_route_rules.rb.html) to see an example of how to use update_drg_route_rules API.
    def update_drg_route_rules(drg_route_table_id, update_drg_route_rules_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_drg_route_rules.' if logger

      raise "Missing the required parameter 'drg_route_table_id' when calling update_drg_route_rules." if drg_route_table_id.nil?
      raise "Missing the required parameter 'update_drg_route_rules_details' when calling update_drg_route_rules." if update_drg_route_rules_details.nil?
      raise "Parameter value for 'drg_route_table_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_table_id)

      path = '/drgRouteTables/{drgRouteTableId}/actions/updateDrgRouteRules'.sub('{drgRouteTableId}', drg_route_table_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_drg_route_rules_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_drg_route_rules') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::DrgRouteRule>'
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


    # Updates the specified DRG route table.
    #
    # @param [String] drg_route_table_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG route table.
    # @param [OCI::Core::Models::UpdateDrgRouteTableDetails] update_drg_route_table_details Details object used to updating a DRG route table.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::DrgRouteTable DrgRouteTable}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_drg_route_table.rb.html) to see an example of how to use update_drg_route_table API.
    def update_drg_route_table(drg_route_table_id, update_drg_route_table_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_drg_route_table.' if logger

      raise "Missing the required parameter 'drg_route_table_id' when calling update_drg_route_table." if drg_route_table_id.nil?
      raise "Missing the required parameter 'update_drg_route_table_details' when calling update_drg_route_table." if update_drg_route_table_details.nil?
      raise "Parameter value for 'drg_route_table_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_route_table_id)

      path = '/drgRouteTables/{drgRouteTableId}'.sub('{drgRouteTableId}', drg_route_table_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_drg_route_table_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_drg_route_table') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::DrgRouteTable'
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


    # Updates the specified internet gateway. You can disable/enable it, or change its display name
    # or tags. Avoid entering confidential information.
    #
    # If the gateway is disabled, that means no traffic will flow to/from the internet even if there's
    # a route rule that enables that traffic.
    #
    # @param [String] ig_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the internet gateway.
    # @param [OCI::Core::Models::UpdateInternetGatewayDetails] update_internet_gateway_details Details for updating the internet gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::InternetGateway InternetGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_internet_gateway.rb.html) to see an example of how to use update_internet_gateway API.
    def update_internet_gateway(ig_id, update_internet_gateway_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_internet_gateway.' if logger

      raise "Missing the required parameter 'ig_id' when calling update_internet_gateway." if ig_id.nil?
      raise "Missing the required parameter 'update_internet_gateway_details' when calling update_internet_gateway." if update_internet_gateway_details.nil?
      raise "Parameter value for 'ig_id' must not be blank" if OCI::Internal::Util.blank_string?(ig_id)

      path = '/internetGateways/{igId}'.sub('{igId}', ig_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_internet_gateway_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_internet_gateway') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InternetGateway'
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


    # Updates the specified IPSec connection.
    #
    # To update an individual IPSec tunnel's attributes, use
    # {#update_ip_sec_connection_tunnel update_ip_sec_connection_tunnel}.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [OCI::Core::Models::UpdateIPSecConnectionDetails] update_ip_sec_connection_details Details object for updating an IPSec connection.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::IPSecConnection IPSecConnection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_ip_sec_connection.rb.html) to see an example of how to use update_ip_sec_connection API.
    def update_ip_sec_connection(ipsc_id, update_ip_sec_connection_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_ip_sec_connection.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling update_ip_sec_connection." if ipsc_id.nil?
      raise "Missing the required parameter 'update_ip_sec_connection_details' when calling update_ip_sec_connection." if update_ip_sec_connection_details.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)

      path = '/ipsecConnections/{ipscId}'.sub('{ipscId}', ipsc_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_ip_sec_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_ip_sec_connection') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::IPSecConnection'
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


    # Updates the specified tunnel. This operation lets you change tunnel attributes such as the
    # routing type (BGP dynamic routing or static routing). Here are some important notes:
    #
    #   * If you change the tunnel's routing type or BGP session configuration, the tunnel will go
    #     down while it's reprovisioned.
    #
    #   * If you want to switch the tunnel's `routing` from `STATIC` to `BGP`, make sure the tunnel's
    #     BGP session configuration attributes have been set ({#bgp_session_info bgp_session_info}).
    #
    #   * If you want to switch the tunnel's `routing` from `BGP` to `STATIC`, make sure the
    #     {IPSecConnection} already has at least one valid CIDR
    #     static route.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [String] tunnel_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the tunnel.
    # @param [OCI::Core::Models::UpdateIPSecConnectionTunnelDetails] update_ip_sec_connection_tunnel_details Details object for updating a IPSecConnection tunnel's details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::IPSecConnectionTunnel IPSecConnectionTunnel}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_ip_sec_connection_tunnel.rb.html) to see an example of how to use update_ip_sec_connection_tunnel API.
    def update_ip_sec_connection_tunnel(ipsc_id, tunnel_id, update_ip_sec_connection_tunnel_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_ip_sec_connection_tunnel.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling update_ip_sec_connection_tunnel." if ipsc_id.nil?
      raise "Missing the required parameter 'tunnel_id' when calling update_ip_sec_connection_tunnel." if tunnel_id.nil?
      raise "Missing the required parameter 'update_ip_sec_connection_tunnel_details' when calling update_ip_sec_connection_tunnel." if update_ip_sec_connection_tunnel_details.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)
      raise "Parameter value for 'tunnel_id' must not be blank" if OCI::Internal::Util.blank_string?(tunnel_id)

      path = '/ipsecConnections/{ipscId}/tunnels/{tunnelId}'.sub('{ipscId}', ipsc_id.to_s).sub('{tunnelId}', tunnel_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_ip_sec_connection_tunnel_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_ip_sec_connection_tunnel') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::IPSecConnectionTunnel'
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


    # Updates the shared secret (pre-shared key) for the specified tunnel.
    #
    # **Important:** If you change the shared secret, the tunnel will go down while it's reprovisioned.
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [String] tunnel_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the tunnel.
    # @param [OCI::Core::Models::UpdateIPSecConnectionTunnelSharedSecretDetails] update_ip_sec_connection_tunnel_shared_secret_details Details object for updating a IPSec connection tunnel's sharedSecret.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::IPSecConnectionTunnelSharedSecret IPSecConnectionTunnelSharedSecret}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_ip_sec_connection_tunnel_shared_secret.rb.html) to see an example of how to use update_ip_sec_connection_tunnel_shared_secret API.
    def update_ip_sec_connection_tunnel_shared_secret(ipsc_id, tunnel_id, update_ip_sec_connection_tunnel_shared_secret_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_ip_sec_connection_tunnel_shared_secret.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling update_ip_sec_connection_tunnel_shared_secret." if ipsc_id.nil?
      raise "Missing the required parameter 'tunnel_id' when calling update_ip_sec_connection_tunnel_shared_secret." if tunnel_id.nil?
      raise "Missing the required parameter 'update_ip_sec_connection_tunnel_shared_secret_details' when calling update_ip_sec_connection_tunnel_shared_secret." if update_ip_sec_connection_tunnel_shared_secret_details.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)
      raise "Parameter value for 'tunnel_id' must not be blank" if OCI::Internal::Util.blank_string?(tunnel_id)

      path = '/ipsecConnections/{ipscId}/tunnels/{tunnelId}/sharedSecret'.sub('{ipscId}', ipsc_id.to_s).sub('{tunnelId}', tunnel_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_ip_sec_connection_tunnel_shared_secret_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_ip_sec_connection_tunnel_shared_secret') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::IPSecConnectionTunnelSharedSecret'
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


    # Updates the specified IPv6. You must specify the object's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # Use this operation if you want to:
    #
    #   * Move an IPv6 to a different VNIC in the same subnet.
    #   * Enable/disable internet access for an IPv6.
    #   * Change the display name for an IPv6.
    #   * Update resource tags for an IPv6.
    #
    # @param [String] ipv6_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPv6.
    # @param [OCI::Core::Models::UpdateIpv6Details] update_ipv6_details IPv6 details to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Ipv6 Ipv6}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_ipv6.rb.html) to see an example of how to use update_ipv6 API.
    def update_ipv6(ipv6_id, update_ipv6_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_ipv6.' if logger

      raise "Missing the required parameter 'ipv6_id' when calling update_ipv6." if ipv6_id.nil?
      raise "Missing the required parameter 'update_ipv6_details' when calling update_ipv6." if update_ipv6_details.nil?
      raise "Parameter value for 'ipv6_id' must not be blank" if OCI::Internal::Util.blank_string?(ipv6_id)

      path = '/ipv6/{ipv6Id}'.sub('{ipv6Id}', ipv6_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_ipv6_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_ipv6') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Ipv6'
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


    # Updates the specified local peering gateway (LPG).
    #
    # @param [String] local_peering_gateway_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the local peering gateway.
    # @param [OCI::Core::Models::UpdateLocalPeeringGatewayDetails] update_local_peering_gateway_details Details object for updating a local peering gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::LocalPeeringGateway LocalPeeringGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_local_peering_gateway.rb.html) to see an example of how to use update_local_peering_gateway API.
    def update_local_peering_gateway(local_peering_gateway_id, update_local_peering_gateway_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_local_peering_gateway.' if logger

      raise "Missing the required parameter 'local_peering_gateway_id' when calling update_local_peering_gateway." if local_peering_gateway_id.nil?
      raise "Missing the required parameter 'update_local_peering_gateway_details' when calling update_local_peering_gateway." if update_local_peering_gateway_details.nil?
      raise "Parameter value for 'local_peering_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(local_peering_gateway_id)

      path = '/localPeeringGateways/{localPeeringGatewayId}'.sub('{localPeeringGatewayId}', local_peering_gateway_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_local_peering_gateway_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_local_peering_gateway') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::LocalPeeringGateway'
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


    # Updates the specified NAT gateway.
    #
    # @param [String] nat_gateway_id The NAT gateway's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Core::Models::UpdateNatGatewayDetails] update_nat_gateway_details Details object for updating a NAT gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::NatGateway NatGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_nat_gateway.rb.html) to see an example of how to use update_nat_gateway API.
    def update_nat_gateway(nat_gateway_id, update_nat_gateway_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_nat_gateway.' if logger

      raise "Missing the required parameter 'nat_gateway_id' when calling update_nat_gateway." if nat_gateway_id.nil?
      raise "Missing the required parameter 'update_nat_gateway_details' when calling update_nat_gateway." if update_nat_gateway_details.nil?
      raise "Parameter value for 'nat_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(nat_gateway_id)

      path = '/natGateways/{natGatewayId}'.sub('{natGatewayId}', nat_gateway_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_nat_gateway_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_nat_gateway') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::NatGateway'
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


    # Updates the specified network security group.
    #
    # To add or remove an existing VNIC from the group, use
    # {#update_vnic update_vnic}.
    #
    # To add a VNIC to the group *when you create the VNIC*, specify the NSG's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) during creation.
    # For example, see the `nsgIds` attribute in {#create_vnic_details create_vnic_details}.
    #
    # To add or remove security rules from the group, use
    # {#add_network_security_group_security_rules add_network_security_group_security_rules}
    # or
    # {#remove_network_security_group_security_rules remove_network_security_group_security_rules}.
    #
    # To edit the contents of existing security rules in the group, use
    # {#update_network_security_group_security_rules update_network_security_group_security_rules}.
    #
    # @param [String] network_security_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the network security group.
    # @param [OCI::Core::Models::UpdateNetworkSecurityGroupDetails] update_network_security_group_details Details object for updating a network security group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::NetworkSecurityGroup NetworkSecurityGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_network_security_group.rb.html) to see an example of how to use update_network_security_group API.
    def update_network_security_group(network_security_group_id, update_network_security_group_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_network_security_group.' if logger

      raise "Missing the required parameter 'network_security_group_id' when calling update_network_security_group." if network_security_group_id.nil?
      raise "Missing the required parameter 'update_network_security_group_details' when calling update_network_security_group." if update_network_security_group_details.nil?
      raise "Parameter value for 'network_security_group_id' must not be blank" if OCI::Internal::Util.blank_string?(network_security_group_id)

      path = '/networkSecurityGroups/{networkSecurityGroupId}'.sub('{networkSecurityGroupId}', network_security_group_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_network_security_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_network_security_group') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::NetworkSecurityGroup'
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


    # Updates one or more security rules in the specified network security group.
    #
    # @param [String] network_security_group_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the network security group.
    # @param [OCI::Core::Models::UpdateNetworkSecurityGroupSecurityRulesDetails] update_network_security_group_security_rules_details Request with one or more security rules associated with the network security group that
    #   will be updated.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::UpdatedNetworkSecurityGroupSecurityRules UpdatedNetworkSecurityGroupSecurityRules}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_network_security_group_security_rules.rb.html) to see an example of how to use update_network_security_group_security_rules API.
    def update_network_security_group_security_rules(network_security_group_id, update_network_security_group_security_rules_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_network_security_group_security_rules.' if logger

      raise "Missing the required parameter 'network_security_group_id' when calling update_network_security_group_security_rules." if network_security_group_id.nil?
      raise "Missing the required parameter 'update_network_security_group_security_rules_details' when calling update_network_security_group_security_rules." if update_network_security_group_security_rules_details.nil?
      raise "Parameter value for 'network_security_group_id' must not be blank" if OCI::Internal::Util.blank_string?(network_security_group_id)

      path = '/networkSecurityGroups/{networkSecurityGroupId}/actions/updateSecurityRules'.sub('{networkSecurityGroupId}', network_security_group_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_network_security_group_security_rules_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_network_security_group_security_rules') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::UpdatedNetworkSecurityGroupSecurityRules'
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


    # Updates the specified private IP. You must specify the object's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # Use this operation if you want to:
    #
    #   - Move a secondary private IP to a different VNIC in the same subnet.
    #   - Change the display name for a secondary private IP.
    #   - Change the hostname for a secondary private IP.
    #
    # This operation cannot be used with primary private IPs.
    # To update the hostname for the primary IP on a VNIC, use
    # {#update_vnic update_vnic}.
    #
    # @param [String] private_ip_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the private IP or IPv6.
    # @param [OCI::Core::Models::UpdatePrivateIpDetails] update_private_ip_details Private IP details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::PrivateIp PrivateIp}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_private_ip.rb.html) to see an example of how to use update_private_ip API.
    def update_private_ip(private_ip_id, update_private_ip_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_private_ip.' if logger

      raise "Missing the required parameter 'private_ip_id' when calling update_private_ip." if private_ip_id.nil?
      raise "Missing the required parameter 'update_private_ip_details' when calling update_private_ip." if update_private_ip_details.nil?
      raise "Parameter value for 'private_ip_id' must not be blank" if OCI::Internal::Util.blank_string?(private_ip_id)

      path = '/privateIps/{privateIpId}'.sub('{privateIpId}', private_ip_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_private_ip_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_private_ip') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PrivateIp'
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


    # Updates the specified public IP. You must specify the object's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm). Use this operation if you want to:
    #
    # * Assign a reserved public IP in your pool to a private IP.
    # * Move a reserved public IP to a different private IP.
    # * Unassign a reserved public IP from a private IP (which returns it to your pool
    # of reserved public IPs).
    # * Change the display name or tags for a public IP.
    #
    # Assigning, moving, and unassigning a reserved public IP are asynchronous
    # operations. Poll the public IP's `lifecycleState` to determine if the operation
    # succeeded.
    #
    # **Note:** When moving a reserved public IP, the target private IP
    # must not already have a public IP with `lifecycleState` = ASSIGNING or ASSIGNED. If it
    # does, an error is returned. Also, the initial unassignment from the original
    # private IP always succeeds, but the assignment to the target private IP is asynchronous and
    # could fail silently (for example, if the target private IP is deleted or has a different public IP
    # assigned to it in the interim). If that occurs, the public IP remains unassigned and its
    # `lifecycleState` switches to AVAILABLE (it is not reassigned to its original private IP).
    # You must poll the public IP's `lifecycleState` to determine if the move succeeded.
    #
    # Regarding ephemeral public IPs:
    #
    # * If you want to assign an ephemeral public IP to a primary private IP, use
    # {#create_public_ip create_public_ip}.
    # * You can't move an ephemeral public IP to a different private IP.
    # * If you want to unassign an ephemeral public IP from its private IP, use
    # {#delete_public_ip delete_public_ip}, which
    # unassigns and deletes the ephemeral public IP.
    #
    # **Note:** If a public IP is assigned to a secondary private
    # IP (see {PrivateIp}), and you move that secondary
    # private IP to another VNIC, the public IP moves with it.
    #
    # **Note:** There's a limit to the number of {PublicIp}
    # a VNIC or instance can have. If you try to move a reserved public IP
    # to a VNIC or instance that has already reached its public IP limit, an error is
    # returned. For information about the public IP limits, see
    # [Public IP Addresses](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingpublicIPs.htm).
    #
    # @param [String] public_ip_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the public IP.
    # @param [OCI::Core::Models::UpdatePublicIpDetails] update_public_ip_details Public IP details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::PublicIp PublicIp}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_public_ip.rb.html) to see an example of how to use update_public_ip API.
    def update_public_ip(public_ip_id, update_public_ip_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_public_ip.' if logger

      raise "Missing the required parameter 'public_ip_id' when calling update_public_ip." if public_ip_id.nil?
      raise "Missing the required parameter 'update_public_ip_details' when calling update_public_ip." if update_public_ip_details.nil?
      raise "Parameter value for 'public_ip_id' must not be blank" if OCI::Internal::Util.blank_string?(public_ip_id)

      path = '/publicIps/{publicIpId}'.sub('{publicIpId}', public_ip_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_public_ip_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_public_ip') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PublicIp'
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


    # Updates the specified public IP pool.
    #
    # @param [String] public_ip_pool_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the public IP pool.
    # @param [OCI::Core::Models::UpdatePublicIpPoolDetails] update_public_ip_pool_details Public IP pool details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::PublicIpPool PublicIpPool}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_public_ip_pool.rb.html) to see an example of how to use update_public_ip_pool API.
    def update_public_ip_pool(public_ip_pool_id, update_public_ip_pool_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_public_ip_pool.' if logger

      raise "Missing the required parameter 'public_ip_pool_id' when calling update_public_ip_pool." if public_ip_pool_id.nil?
      raise "Missing the required parameter 'update_public_ip_pool_details' when calling update_public_ip_pool." if update_public_ip_pool_details.nil?
      raise "Parameter value for 'public_ip_pool_id' must not be blank" if OCI::Internal::Util.blank_string?(public_ip_pool_id)

      path = '/publicIpPools/{publicIpPoolId}'.sub('{publicIpPoolId}', public_ip_pool_id.to_s)
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
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_public_ip_pool_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_public_ip_pool') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::PublicIpPool'
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


    # Updates the specified remote peering connection (RPC).
    #
    # @param [String] remote_peering_connection_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the remote peering connection (RPC).
    # @param [OCI::Core::Models::UpdateRemotePeeringConnectionDetails] update_remote_peering_connection_details Request to the update the peering connection to remote region
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::RemotePeeringConnection RemotePeeringConnection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_remote_peering_connection.rb.html) to see an example of how to use update_remote_peering_connection API.
    def update_remote_peering_connection(remote_peering_connection_id, update_remote_peering_connection_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_remote_peering_connection.' if logger

      raise "Missing the required parameter 'remote_peering_connection_id' when calling update_remote_peering_connection." if remote_peering_connection_id.nil?
      raise "Missing the required parameter 'update_remote_peering_connection_details' when calling update_remote_peering_connection." if update_remote_peering_connection_details.nil?
      raise "Parameter value for 'remote_peering_connection_id' must not be blank" if OCI::Internal::Util.blank_string?(remote_peering_connection_id)

      path = '/remotePeeringConnections/{remotePeeringConnectionId}'.sub('{remotePeeringConnectionId}', remote_peering_connection_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_remote_peering_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_remote_peering_connection') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::RemotePeeringConnection'
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


    # Updates the specified route table's display name or route rules.
    # Avoid entering confidential information.
    #
    # Note that the `routeRules` object you provide replaces the entire existing set of rules.
    #
    # @param [String] rt_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the route table.
    # @param [OCI::Core::Models::UpdateRouteTableDetails] update_route_table_details Details object for updating a route table.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::RouteTable RouteTable}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_route_table.rb.html) to see an example of how to use update_route_table API.
    def update_route_table(rt_id, update_route_table_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_route_table.' if logger

      raise "Missing the required parameter 'rt_id' when calling update_route_table." if rt_id.nil?
      raise "Missing the required parameter 'update_route_table_details' when calling update_route_table." if update_route_table_details.nil?
      raise "Parameter value for 'rt_id' must not be blank" if OCI::Internal::Util.blank_string?(rt_id)

      path = '/routeTables/{rtId}'.sub('{rtId}', rt_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_route_table_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_route_table') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::RouteTable'
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


    # Updates the specified security list's display name or rules.
    # Avoid entering confidential information.
    #
    # Note that the `egressSecurityRules` or `ingressSecurityRules` objects you provide replace the entire
    # existing objects.
    #
    # @param [String] security_list_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the security list.
    # @param [OCI::Core::Models::UpdateSecurityListDetails] update_security_list_details Updated details for the security list.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::SecurityList SecurityList}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_security_list.rb.html) to see an example of how to use update_security_list API.
    def update_security_list(security_list_id, update_security_list_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_security_list.' if logger

      raise "Missing the required parameter 'security_list_id' when calling update_security_list." if security_list_id.nil?
      raise "Missing the required parameter 'update_security_list_details' when calling update_security_list." if update_security_list_details.nil?
      raise "Parameter value for 'security_list_id' must not be blank" if OCI::Internal::Util.blank_string?(security_list_id)

      path = '/securityLists/{securityListId}'.sub('{securityListId}', security_list_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_security_list_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_security_list') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::SecurityList'
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


    # Updates the specified service gateway. The information you provide overwrites the existing
    # attributes of the gateway.
    #
    # @param [String] service_gateway_id The service gateway's [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @param [OCI::Core::Models::UpdateServiceGatewayDetails] update_service_gateway_details Details object for updating a service gateway.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::ServiceGateway ServiceGateway}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_service_gateway.rb.html) to see an example of how to use update_service_gateway API.
    def update_service_gateway(service_gateway_id, update_service_gateway_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_service_gateway.' if logger

      raise "Missing the required parameter 'service_gateway_id' when calling update_service_gateway." if service_gateway_id.nil?
      raise "Missing the required parameter 'update_service_gateway_details' when calling update_service_gateway." if update_service_gateway_details.nil?
      raise "Parameter value for 'service_gateway_id' must not be blank" if OCI::Internal::Util.blank_string?(service_gateway_id)

      path = '/serviceGateways/{serviceGatewayId}'.sub('{serviceGatewayId}', service_gateway_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_service_gateway_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_service_gateway') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::ServiceGateway'
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


    # Updates the specified subnet.
    #
    # @param [String] subnet_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the subnet.
    # @param [OCI::Core::Models::UpdateSubnetDetails] update_subnet_details Details object for updating a subnet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Subnet Subnet}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_subnet.rb.html) to see an example of how to use update_subnet API.
    def update_subnet(subnet_id, update_subnet_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_subnet.' if logger

      raise "Missing the required parameter 'subnet_id' when calling update_subnet." if subnet_id.nil?
      raise "Missing the required parameter 'update_subnet_details' when calling update_subnet." if update_subnet_details.nil?
      raise "Parameter value for 'subnet_id' must not be blank" if OCI::Internal::Util.blank_string?(subnet_id)

      path = '/subnets/{subnetId}'.sub('{subnetId}', subnet_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_subnet_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_subnet') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Subnet'
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


    # Creates or updates the set of CPE configuration answers for the specified tunnel.
    # The answers correlate to the questions that are specific to the CPE device type (see the
    # `parameters` attribute of {CpeDeviceShapeDetail}).
    #
    # @param [String] ipsc_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the IPSec connection.
    # @param [String] tunnel_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the tunnel.
    # @param [OCI::Core::Models::UpdateTunnelCpeDeviceConfigDetails] update_tunnel_cpe_device_config_details Request to input the tunnel's cpe configuration parameters
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::TunnelCpeDeviceConfig TunnelCpeDeviceConfig}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_tunnel_cpe_device_config.rb.html) to see an example of how to use update_tunnel_cpe_device_config API.
    def update_tunnel_cpe_device_config(ipsc_id, tunnel_id, update_tunnel_cpe_device_config_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_tunnel_cpe_device_config.' if logger

      raise "Missing the required parameter 'ipsc_id' when calling update_tunnel_cpe_device_config." if ipsc_id.nil?
      raise "Missing the required parameter 'tunnel_id' when calling update_tunnel_cpe_device_config." if tunnel_id.nil?
      raise "Missing the required parameter 'update_tunnel_cpe_device_config_details' when calling update_tunnel_cpe_device_config." if update_tunnel_cpe_device_config_details.nil?
      raise "Parameter value for 'ipsc_id' must not be blank" if OCI::Internal::Util.blank_string?(ipsc_id)
      raise "Parameter value for 'tunnel_id' must not be blank" if OCI::Internal::Util.blank_string?(tunnel_id)

      path = '/ipsecConnections/{ipscId}/tunnels/{tunnelId}/tunnelDeviceConfig'.sub('{ipscId}', ipsc_id.to_s).sub('{tunnelId}', tunnel_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_tunnel_cpe_device_config_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_tunnel_cpe_device_config') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::TunnelCpeDeviceConfig'
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


    # Updates the specified VCN.
    #
    # @param [String] vcn_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VCN.
    # @param [OCI::Core::Models::UpdateVcnDetails] update_vcn_details Details object for updating a VCN.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Vcn Vcn}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_vcn.rb.html) to see an example of how to use update_vcn API.
    def update_vcn(vcn_id, update_vcn_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_vcn.' if logger

      raise "Missing the required parameter 'vcn_id' when calling update_vcn." if vcn_id.nil?
      raise "Missing the required parameter 'update_vcn_details' when calling update_vcn." if update_vcn_details.nil?
      raise "Parameter value for 'vcn_id' must not be blank" if OCI::Internal::Util.blank_string?(vcn_id)

      path = '/vcns/{vcnId}'.sub('{vcnId}', vcn_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_vcn_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_vcn') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Vcn'
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


    # Updates the specified virtual circuit. This can be called by
    # either the customer who owns the virtual circuit, or the
    # provider (when provisioning or de-provisioning the virtual
    # circuit from their end). The documentation for
    # {#update_virtual_circuit_details update_virtual_circuit_details}
    # indicates who can update each property of the virtual circuit.
    #
    # **Important:** If the virtual circuit is working and in the
    # PROVISIONED state, updating any of the network-related properties
    # (such as the DRG being used, the BGP ASN, and so on) will cause the virtual
    # circuit's state to switch to PROVISIONING and the related BGP
    # session to go down. After Oracle re-provisions the virtual circuit,
    # its state will return to PROVISIONED. Make sure you confirm that
    # the associated BGP session is back up. For more information
    # about the various states and how to test connectivity, see
    # [FastConnect Overview](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/fastconnect.htm).
    #
    # To change the list of public IP prefixes for a public virtual circuit,
    # use {#bulk_add_virtual_circuit_public_prefixes bulk_add_virtual_circuit_public_prefixes}
    # and
    # {#bulk_delete_virtual_circuit_public_prefixes bulk_delete_virtual_circuit_public_prefixes}.
    # Updating the list of prefixes does NOT cause the BGP session to go down. However,
    # Oracle must verify the customer's ownership of each added prefix before
    # traffic for that prefix will flow across the virtual circuit.
    #
    # @param [String] virtual_circuit_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the virtual circuit.
    # @param [OCI::Core::Models::UpdateVirtualCircuitDetails] update_virtual_circuit_details Update VirtualCircuit fields.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::VirtualCircuit VirtualCircuit}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_virtual_circuit.rb.html) to see an example of how to use update_virtual_circuit API.
    def update_virtual_circuit(virtual_circuit_id, update_virtual_circuit_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_virtual_circuit.' if logger

      raise "Missing the required parameter 'virtual_circuit_id' when calling update_virtual_circuit." if virtual_circuit_id.nil?
      raise "Missing the required parameter 'update_virtual_circuit_details' when calling update_virtual_circuit." if update_virtual_circuit_details.nil?
      raise "Parameter value for 'virtual_circuit_id' must not be blank" if OCI::Internal::Util.blank_string?(virtual_circuit_id)

      path = '/virtualCircuits/{virtualCircuitId}'.sub('{virtualCircuitId}', virtual_circuit_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_virtual_circuit_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_virtual_circuit') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::VirtualCircuit'
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


    # Updates the specified VLAN. Note that this operation might require changes to all
    # the VNICs in the VLAN, which can take a while. The VLAN will be in the UPDATING state until the changes are complete.
    #
    # @param [String] vlan_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VLAN.
    # @param [OCI::Core::Models::UpdateVlanDetails] update_vlan_details Details object for updating a subnet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Vlan Vlan}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_vlan.rb.html) to see an example of how to use update_vlan API.
    def update_vlan(vlan_id, update_vlan_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_vlan.' if logger

      raise "Missing the required parameter 'vlan_id' when calling update_vlan." if vlan_id.nil?
      raise "Missing the required parameter 'update_vlan_details' when calling update_vlan." if update_vlan_details.nil?
      raise "Parameter value for 'vlan_id' must not be blank" if OCI::Internal::Util.blank_string?(vlan_id)

      path = '/vlans/{vlanId}'.sub('{vlanId}', vlan_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_vlan_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_vlan') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Vlan'
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


    # Updates the specified VNIC.
    #
    # @param [String] vnic_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VNIC.
    # @param [OCI::Core::Models::UpdateVnicDetails] update_vnic_details Details object for updating a VNIC.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Vnic Vnic}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_vnic.rb.html) to see an example of how to use update_vnic API.
    def update_vnic(vnic_id, update_vnic_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_vnic.' if logger

      raise "Missing the required parameter 'vnic_id' when calling update_vnic." if vnic_id.nil?
      raise "Missing the required parameter 'update_vnic_details' when calling update_vnic." if update_vnic_details.nil?
      raise "Parameter value for 'vnic_id' must not be blank" if OCI::Internal::Util.blank_string?(vnic_id)

      path = '/vnics/{vnicId}'.sub('{vnicId}', vnic_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_vnic_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_vnic') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Vnic'
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


    # Updates the specified VTAP's display name or tags.
    #
    # @param [String] vtap_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the VTAP.
    # @param [OCI::Core::Models::UpdateVtapDetails] update_vtap_details Details object for updating a VTAP.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource. The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Vtap Vtap}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/update_vtap.rb.html) to see an example of how to use update_vtap API.
    def update_vtap(vtap_id, update_vtap_details, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#update_vtap.' if logger

      raise "Missing the required parameter 'vtap_id' when calling update_vtap." if vtap_id.nil?
      raise "Missing the required parameter 'update_vtap_details' when calling update_vtap." if update_vtap_details.nil?
      raise "Parameter value for 'vtap_id' must not be blank" if OCI::Internal::Util.blank_string?(vtap_id)

      path = '/vtaps/{vtapId}'.sub('{vtapId}', vtap_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_vtap_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#update_vtap') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Vtap'
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


    # Upgrades the DRG. After upgrade, you can control routing inside your DRG
    # via DRG attachments, route distributions, and DRG route tables.
    #
    # @param [String] drg_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the DRG.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
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
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/upgrade_drg.rb.html) to see an example of how to use upgrade_drg API.
    def upgrade_drg(drg_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#upgrade_drg.' if logger

      raise "Missing the required parameter 'drg_id' when calling upgrade_drg." if drg_id.nil?
      raise "Parameter value for 'drg_id' must not be blank" if OCI::Internal::Util.blank_string?(drg_id)

      path = '/drgs/{drgId}/actions/upgrade'.sub('{drgId}', drg_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#upgrade_drg') do
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


    # Submits the BYOIP CIDR block you are importing for validation. Do not submit to Oracle for validation if you have not already
    # modified the information for the BYOIP CIDR block with your Regional Internet Registry. See [To import a CIDR block](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/BYOIP.htm#import_cidr) for details.
    #
    # @param [String] byoip_range_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the `ByoipRange` resource containing the BYOIP CIDR block.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/validate_byoip_range.rb.html) to see an example of how to use validate_byoip_range API.
    def validate_byoip_range(byoip_range_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#validate_byoip_range.' if logger

      raise "Missing the required parameter 'byoip_range_id' when calling validate_byoip_range." if byoip_range_id.nil?
      raise "Parameter value for 'byoip_range_id' must not be blank" if OCI::Internal::Util.blank_string?(byoip_range_id)

      path = '/byoipRanges/{byoipRangeId}/actions/validate'.sub('{byoipRangeId}', byoip_range_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#validate_byoip_range') do
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


    # Withdraws BGP route advertisement for the BYOIP CIDR block.
    #
    # @param [String] byoip_range_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the `ByoipRange` resource containing the BYOIP CIDR block.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/core/withdraw_byoip_range.rb.html) to see an example of how to use withdraw_byoip_range API.
    def withdraw_byoip_range(byoip_range_id, opts = {})
      logger.debug 'Calling operation VirtualNetworkClient#withdraw_byoip_range.' if logger

      raise "Missing the required parameter 'byoip_range_id' when calling withdraw_byoip_range." if byoip_range_id.nil?
      raise "Parameter value for 'byoip_range_id' must not be blank" if OCI::Internal::Util.blank_string?(byoip_range_id)

      path = '/byoipRanges/{byoipRangeId}/actions/withdraw'.sub('{byoipRangeId}', byoip_range_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'VirtualNetworkClient#withdraw_byoip_range') do
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

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)

      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
