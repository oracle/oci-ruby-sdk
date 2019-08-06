# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # API for the DNS service. Use this API to manage DNS zones, records, and other DNS resources.
  # For more information, see [Overview of the DNS Service](/iaas/Content/DNS/Concepts/dnszonemanagement.htm).
  class Dns::DnsClient
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


    # Creates a new DnsClient.
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
        @endpoint = endpoint + '/20180115'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "DnsClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://dns.{region}.{secondLevelDomain}') + '/20180115'
      logger.info "DnsClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a steering policy into a different compartment. When provided, If-Match is checked against ETag values of the resource.
    # @param [String] steering_policy_id The OCID of the target steering policy.
    # @param [OCI::Dns::Models::ChangeSteeringPolicyCompartmentDetails] change_steering_policy_compartment_details Details for moving a steering policy into a different compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original creation
    #   request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def change_steering_policy_compartment(steering_policy_id, change_steering_policy_compartment_details, opts = {})
      logger.debug 'Calling operation DnsClient#change_steering_policy_compartment.' if logger

      raise "Missing the required parameter 'steering_policy_id' when calling change_steering_policy_compartment." if steering_policy_id.nil?
      raise "Missing the required parameter 'change_steering_policy_compartment_details' when calling change_steering_policy_compartment." if change_steering_policy_compartment_details.nil?
      raise "Parameter value for 'steering_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_id)

      path = '/steeringPolicies/{steeringPolicyId}/actions/changeCompartment'.sub('{steeringPolicyId}', steering_policy_id.to_s)
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
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_steering_policy_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#change_steering_policy_compartment') do
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


    # Moves a zone into a different compartment. When provided, If-Match is checked against ETag values of the resource.
    # **Note:** All SteeringPolicyAttachment objects associated with this zone will also be moved into the provided compartment.
    # @param [String] zone_id The OCID of the target zone.
    # @param [OCI::Dns::Models::ChangeZoneCompartmentDetails] change_zone_compartment_details Details for moving a zone into a different compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original creation
    #   request may be rejected).
    #
    # @return [Response] A Response object with data of type nil
    def change_zone_compartment(zone_id, change_zone_compartment_details, opts = {})
      logger.debug 'Calling operation DnsClient#change_zone_compartment.' if logger

      raise "Missing the required parameter 'zone_id' when calling change_zone_compartment." if zone_id.nil?
      raise "Missing the required parameter 'change_zone_compartment_details' when calling change_zone_compartment." if change_zone_compartment_details.nil?
      raise "Parameter value for 'zone_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_id)

      path = '/zones/{zoneId}/actions/changeCompartment'.sub('{zoneId}', zone_id.to_s)
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
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(change_zone_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#change_zone_compartment') do
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


    # Creates a new steering policy in the specified compartment. For more information on
    # creating policies with templates, see [Traffic Management API Guide](https://docs.cloud.oracle.com/iaas/Content/TrafficManagement/Concepts/trafficmanagementapi.htm).
    #
    # @param [OCI::Dns::Models::CreateSteeringPolicyDetails] create_steering_policy_details Details for creating a new steering policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original creation
    #   request may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::SteeringPolicy SteeringPolicy}
    def create_steering_policy(create_steering_policy_details, opts = {})
      logger.debug 'Calling operation DnsClient#create_steering_policy.' if logger

      raise "Missing the required parameter 'create_steering_policy_details' when calling create_steering_policy." if create_steering_policy_details.nil?

      path = '/steeringPolicies'
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

      post_body = @api_client.object_to_http_body(create_steering_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#create_steering_policy') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::SteeringPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new attachment between a steering policy and a domain, giving the
    # policy permission to answer queries for the specified domain. A steering policy must
    # be attached to a domain for the policy to answer DNS queries for that domain.
    #
    # For the purposes of access control, the attachment is automatically placed
    # into the same compartment as the domain's zone.
    #
    # @param [OCI::Dns::Models::CreateSteeringPolicyAttachmentDetails] create_steering_policy_attachment_details Details for creating a new steering policy attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case
    #   of a timeout or server error without risk of executing that same action
    #   again. Retry tokens expire after 24 hours, but can be invalidated before
    #   then due to conflicting operations (for example, if a resource has been
    #   deleted and purged from the system, then a retry of the original creation
    #   request may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::SteeringPolicyAttachment SteeringPolicyAttachment}
    def create_steering_policy_attachment(create_steering_policy_attachment_details, opts = {})
      logger.debug 'Calling operation DnsClient#create_steering_policy_attachment.' if logger

      raise "Missing the required parameter 'create_steering_policy_attachment_details' when calling create_steering_policy_attachment." if create_steering_policy_attachment_details.nil?

      path = '/steeringPolicyAttachments'
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

      post_body = @api_client.object_to_http_body(create_steering_policy_attachment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#create_steering_policy_attachment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::SteeringPolicyAttachment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new zone in the specified compartment. The `compartmentId`
    # query parameter is required if the `Content-Type` header for the
    # request is `text/dns`.
    #
    # @param [OCI::Dns::Models::CreateZoneDetails] create_zone_details Details for creating a new zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::Zone Zone}
    def create_zone(create_zone_details, opts = {})
      logger.debug 'Calling operation DnsClient#create_zone.' if logger

      raise "Missing the required parameter 'create_zone_details' when calling create_zone." if create_zone_details.nil?

      path = '/zones'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(create_zone_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#create_zone') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::Zone'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes all records at the specified zone and domain.
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type nil
    def delete_domain_records(zone_name_or_id, domain, opts = {})
      logger.debug 'Calling operation DnsClient#delete_domain_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling delete_domain_records." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling delete_domain_records." if domain.nil?
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)

      path = '/zones/{zoneNameOrId}/records/{domain}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#delete_domain_records') do
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


    # Deletes all records in the specified RRSet.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [String] rtype The type of the target RRSet within the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type nil
    def delete_rr_set(zone_name_or_id, domain, rtype, opts = {})
      logger.debug 'Calling operation DnsClient#delete_rr_set.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling delete_rr_set." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling delete_rr_set." if domain.nil?
      raise "Missing the required parameter 'rtype' when calling delete_rr_set." if rtype.nil?
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)
      raise "Parameter value for 'rtype' must not be blank" if OCI::Internal::Util.blank_string?(rtype)

      path = '/zones/{zoneNameOrId}/records/{domain}/{rtype}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s).sub('{rtype}', rtype.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#delete_rr_set') do
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


    # Deletes the specified steering policy.
    # A `204` response indicates that the delete has been successful.
    # Deletion will fail if the policy is attached to any zones. To detach a
    # policy from a zone, see `DeleteSteeringPolicyAttachment`.
    #
    # @param [String] steering_policy_id The OCID of the target steering policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @return [Response] A Response object with data of type nil
    def delete_steering_policy(steering_policy_id, opts = {})
      logger.debug 'Calling operation DnsClient#delete_steering_policy.' if logger

      raise "Missing the required parameter 'steering_policy_id' when calling delete_steering_policy." if steering_policy_id.nil?
      raise "Parameter value for 'steering_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_id)

      path = '/steeringPolicies/{steeringPolicyId}'.sub('{steeringPolicyId}', steering_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#delete_steering_policy') do
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


    # Deletes the specified steering policy attachment.
    # A `204` response indicates that the delete has been successful.
    #
    # @param [String] steering_policy_attachment_id The OCID of the target steering policy attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @return [Response] A Response object with data of type nil
    def delete_steering_policy_attachment(steering_policy_attachment_id, opts = {})
      logger.debug 'Calling operation DnsClient#delete_steering_policy_attachment.' if logger

      raise "Missing the required parameter 'steering_policy_attachment_id' when calling delete_steering_policy_attachment." if steering_policy_attachment_id.nil?
      raise "Parameter value for 'steering_policy_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_attachment_id)

      path = '/steeringPolicyAttachments/{steeringPolicyAttachmentId}'.sub('{steeringPolicyAttachmentId}', steering_policy_attachment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#delete_steering_policy_attachment') do
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


    # Deletes the specified zone and all its steering policy attachments.
    # A `204` response indicates that zone has been successfully deleted.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type nil
    def delete_zone(zone_name_or_id, opts = {})
      logger.debug 'Calling operation DnsClient#delete_zone.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling delete_zone." if zone_name_or_id.nil?
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)

      path = '/zones/{zoneNameOrId}'.sub('{zoneNameOrId}', zone_name_or_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#delete_zone') do
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


    # Gets a list of all records at the specified zone and domain.
    # The results are sorted by `rtype` in alphabetical order by default. You
    # can optionally filter and/or sort the results using the listed parameters.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :zone_version The version of the zone for which data is requested.
    #
    # @option opts [String] :rtype Search by record type.
    #   Will match any record whose [type](https://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml#dns-parameters-4) (case-insensitive) equals the provided value.
    #
    # @option opts [String] :sort_by The field by which to sort records. (default to rtype)
    #   Allowed values are: rtype, ttl
    # @option opts [String] :sort_order The order to sort the resources.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    def get_domain_records(zone_name_or_id, domain, opts = {})
      logger.debug 'Calling operation DnsClient#get_domain_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling get_domain_records." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling get_domain_records." if domain.nil?

      if opts[:sort_by] && !%w[rtype ttl].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of rtype, ttl.'
      end

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)

      path = '/zones/{zoneNameOrId}/records/{domain}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:zoneVersion] = opts[:zone_version] if opts[:zone_version]
      query_params[:rtype] = opts[:rtype] if opts[:rtype]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_domain_records') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all records in the specified RRSet. The results are
    # sorted by `recordHash` by default.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [String] rtype The type of the target RRSet within the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :zone_version The version of the zone for which data is requested.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RRSet RRSet}
    def get_rr_set(zone_name_or_id, domain, rtype, opts = {})
      logger.debug 'Calling operation DnsClient#get_rr_set.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling get_rr_set." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling get_rr_set." if domain.nil?
      raise "Missing the required parameter 'rtype' when calling get_rr_set." if rtype.nil?
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)
      raise "Parameter value for 'rtype' must not be blank" if OCI::Internal::Util.blank_string?(rtype)

      path = '/zones/{zoneNameOrId}/records/{domain}/{rtype}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s).sub('{rtype}', rtype.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:zoneVersion] = opts[:zone_version] if opts[:zone_version]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_rr_set') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RRSet'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified steering policy.
    #
    # @param [String] steering_policy_id The OCID of the target steering policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::SteeringPolicy SteeringPolicy}
    def get_steering_policy(steering_policy_id, opts = {})
      logger.debug 'Calling operation DnsClient#get_steering_policy.' if logger

      raise "Missing the required parameter 'steering_policy_id' when calling get_steering_policy." if steering_policy_id.nil?
      raise "Parameter value for 'steering_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_id)

      path = '/steeringPolicies/{steeringPolicyId}'.sub('{steeringPolicyId}', steering_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_steering_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::SteeringPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified steering policy attachment.
    #
    # @param [String] steering_policy_attachment_id The OCID of the target steering policy attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::SteeringPolicyAttachment SteeringPolicyAttachment}
    def get_steering_policy_attachment(steering_policy_attachment_id, opts = {})
      logger.debug 'Calling operation DnsClient#get_steering_policy_attachment.' if logger

      raise "Missing the required parameter 'steering_policy_attachment_id' when calling get_steering_policy_attachment." if steering_policy_attachment_id.nil?
      raise "Parameter value for 'steering_policy_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_attachment_id)

      path = '/steeringPolicyAttachments/{steeringPolicyAttachmentId}'.sub('{steeringPolicyAttachmentId}', steering_policy_attachment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_steering_policy_attachment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::SteeringPolicyAttachment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets information about the specified zone, including its creation date,
    # zone type, and serial.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::Zone Zone}
    def get_zone(zone_name_or_id, opts = {})
      logger.debug 'Calling operation DnsClient#get_zone.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling get_zone." if zone_name_or_id.nil?
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)

      path = '/zones/{zoneNameOrId}'.sub('{zoneNameOrId}', zone_name_or_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_zone') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::Zone'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets all records in the specified zone. The results are
    # sorted by `domain` in alphabetical order by default. For more
    # information about records, see [Resource Record (RR) TYPEs](https://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml#dns-parameters-4).
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_none_match The `If-None-Match` header field makes the request method conditional on
    #   the absence of any current representation of the target resource, when
    #   the field-value is `*`, or having a selected representation with an
    #   entity-tag that does not match any of those listed in the field-value.
    #
    # @option opts [String] :if_modified_since The `If-Modified-Since` header field makes a GET or HEAD request method
    #   conditional on the selected representation's modification date being more
    #   recent than the date provided in the field-value.  Transfer of the
    #   selected representation's data is avoided if that data has not changed.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :zone_version The version of the zone for which data is requested.
    #
    # @option opts [String] :domain Search by domain.
    #   Will match any record whose domain (case-insensitive) equals the provided value.
    #
    # @option opts [String] :domain_contains Search by domain.
    #   Will match any record whose domain (case-insensitive) contains the provided value.
    #
    # @option opts [String] :rtype Search by record type.
    #   Will match any record whose [type](https://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml#dns-parameters-4) (case-insensitive) equals the provided value.
    #
    # @option opts [String] :sort_by The field by which to sort records. (default to domain)
    #   Allowed values are: domain, rtype, ttl
    # @option opts [String] :sort_order The order to sort the resources.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    def get_zone_records(zone_name_or_id, opts = {})
      logger.debug 'Calling operation DnsClient#get_zone_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling get_zone_records." if zone_name_or_id.nil?

      if opts[:sort_by] && !%w[domain rtype ttl].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of domain, rtype, ttl.'
      end

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)

      path = '/zones/{zoneNameOrId}/records'.sub('{zoneNameOrId}', zone_name_or_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:zoneVersion] = opts[:zone_version] if opts[:zone_version]
      query_params[:domain] = opts[:domain] if opts[:domain]
      query_params[:domainContains] = opts[:domain_contains] if opts[:domain_contains]
      query_params[:rtype] = opts[:rtype] if opts[:rtype]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-none-match'] = opts[:if_none_match] if opts[:if_none_match]
      header_params[:'if-modified-since'] = opts[:if_modified_since] if opts[:if_modified_since]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#get_zone_records') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all steering policies in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment the resource belongs to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :id The OCID of a resource.
    # @option opts [String] :display_name The displayName of a resource.
    # @option opts [String] :display_name_contains The partial displayName of a resource. Will match any resource whose name
    #   (case-insensitive) contains the provided value.
    #
    # @option opts [String] :health_check_monitor_id Search by health check monitor OCID.
    #   Will match any resource whose health check monitor ID matches the provided value.
    #
    # @option opts [DateTime] :time_created_greater_than_or_equal_to An [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) timestamp that states
    #   all returned resources were created on or after the indicated time.
    #
    # @option opts [DateTime] :time_created_less_than An [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) timestamp that states
    #   all returned resources were created before the indicated time.
    #
    # @option opts [String] :template Search by steering template type.
    #   Will match any resource whose template type matches the provided value.
    #
    # @option opts [String] :lifecycle_state The state of a resource.
    # @option opts [String] :sort_by The field by which to sort steering policies. If unspecified, defaults to `timeCreated`. (default to timeCreated)
    #   Allowed values are: displayName, timeCreated, template
    # @option opts [String] :sort_order The order to sort the resources.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Dns::Models::SteeringPolicySummary SteeringPolicySummary}>
    def list_steering_policies(compartment_id, opts = {})
      logger.debug 'Calling operation DnsClient#list_steering_policies.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_steering_policies." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Dns::Models::SteeringPolicySummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Dns::Models::SteeringPolicySummary::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated template].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated, template.'
      end

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end

      path = '/steeringPolicies'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:displayNameContains] = opts[:display_name_contains] if opts[:display_name_contains]
      query_params[:healthCheckMonitorId] = opts[:health_check_monitor_id] if opts[:health_check_monitor_id]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:template] = opts[:template] if opts[:template]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#list_steering_policies') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Dns::Models::SteeringPolicySummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the steering policy attachments in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment the resource belongs to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :id The OCID of a resource.
    # @option opts [String] :display_name The displayName of a resource.
    # @option opts [String] :steering_policy_id Search by steering policy OCID.
    #   Will match any resource whose steering policy ID matches the provided value.
    #
    # @option opts [String] :zone_id Search by zone OCID.
    #   Will match any resource whose zone ID matches the provided value.
    #
    # @option opts [String] :domain Search by domain.
    #   Will match any record whose domain (case-insensitive) equals the provided value.
    #
    # @option opts [String] :domain_contains Search by domain.
    #   Will match any record whose domain (case-insensitive) contains the provided value.
    #
    # @option opts [DateTime] :time_created_greater_than_or_equal_to An [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) timestamp that states
    #   all returned resources were created on or after the indicated time.
    #
    # @option opts [DateTime] :time_created_less_than An [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) timestamp that states
    #   all returned resources were created before the indicated time.
    #
    # @option opts [String] :lifecycle_state The state of a resource.
    # @option opts [String] :sort_by The field by which to sort steering policy attachments. If unspecified, defaults to `timeCreated`. (default to timeCreated)
    #   Allowed values are: displayName, timeCreated, domainName
    # @option opts [String] :sort_order The order to sort the resources.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Dns::Models::SteeringPolicyAttachmentSummary SteeringPolicyAttachmentSummary}>
    def list_steering_policy_attachments(compartment_id, opts = {})
      logger.debug 'Calling operation DnsClient#list_steering_policy_attachments.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_steering_policy_attachments." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::Dns::Models::SteeringPolicyAttachmentSummary::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Dns::Models::SteeringPolicyAttachmentSummary::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_by] && !%w[displayName timeCreated domainName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of displayName, timeCreated, domainName.'
      end

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end

      path = '/steeringPolicyAttachments'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:steeringPolicyId] = opts[:steering_policy_id] if opts[:steering_policy_id]
      query_params[:zoneId] = opts[:zone_id] if opts[:zone_id]
      query_params[:domain] = opts[:domain] if opts[:domain]
      query_params[:domainContains] = opts[:domain_contains] if opts[:domain_contains]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#list_steering_policy_attachments') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Dns::Models::SteeringPolicyAttachmentSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all zones in the specified compartment. The collection
    # can be filtered by name, time created, and zone type.
    #
    # @param [String] compartment_id The OCID of the compartment the resource belongs to.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return in a page of the collection.
    #    (default to 50)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :name A case-sensitive filter for zone names.
    #   Will match any zone with a name that equals the provided value.
    #
    # @option opts [String] :name_contains Search by zone name.
    #   Will match any zone whose name (case-insensitive) contains the provided value.
    #
    # @option opts [String] :zone_type Search by zone type, `PRIMARY` or `SECONDARY`.
    #   Will match any zone whose type equals the provided value.
    #
    #   Allowed values are: PRIMARY, SECONDARY
    # @option opts [DateTime] :time_created_greater_than_or_equal_to An [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) timestamp that states
    #   all returned resources were created on or after the indicated time.
    #
    # @option opts [DateTime] :time_created_less_than An [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) timestamp that states
    #   all returned resources were created before the indicated time.
    #
    # @option opts [String] :lifecycle_state The state of a resource.
    #   Allowed values are: ACTIVE, CREATING, DELETED, DELETING, FAILED
    # @option opts [String] :sort_by The field by which to sort zones. (default to timeCreated)
    #   Allowed values are: name, zoneType, timeCreated
    # @option opts [String] :sort_order The order to sort the resources.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Dns::Models::ZoneSummary ZoneSummary}>
    def list_zones(compartment_id, opts = {})
      logger.debug 'Calling operation DnsClient#list_zones.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_zones." if compartment_id.nil?

      if opts[:zone_type] && !%w[PRIMARY SECONDARY].include?(opts[:zone_type])
        raise 'Invalid value for "zone_type", must be one of PRIMARY, SECONDARY.'
      end

      if opts[:lifecycle_state] && !%w[ACTIVE CREATING DELETED DELETING FAILED].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of ACTIVE, CREATING, DELETED, DELETING, FAILED.'
      end

      if opts[:sort_by] && !%w[name zoneType timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of name, zoneType, timeCreated.'
      end

      if opts[:sort_order] && !OCI::Dns::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::Dns::Models::SORT_ORDER_ENUM.'
      end

      path = '/zones'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:name] = opts[:name] if opts[:name]
      query_params[:nameContains] = opts[:name_contains] if opts[:name_contains]
      query_params[:zoneType] = opts[:zone_type] if opts[:zone_type]
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#list_zones') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Dns::Models::ZoneSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates records in the specified zone at a domain. You can update
    # one record or all records for the specified zone depending on the changes
    # provided in the request body. You can also add or remove records using this
    # function.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [OCI::Dns::Models::PatchDomainRecordsDetails] patch_domain_records_details Operations describing how to modify the collection of records.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    def patch_domain_records(zone_name_or_id, domain, patch_domain_records_details, opts = {})
      logger.debug 'Calling operation DnsClient#patch_domain_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling patch_domain_records." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling patch_domain_records." if domain.nil?
      raise "Missing the required parameter 'patch_domain_records_details' when calling patch_domain_records." if patch_domain_records_details.nil?
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)

      path = '/zones/{zoneNameOrId}/records/{domain}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(patch_domain_records_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#patch_domain_records') do
        @api_client.call_api(
          :PATCH,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates records in the specified RRSet.
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [String] rtype The type of the target RRSet within the target zone.
    # @param [OCI::Dns::Models::PatchRRSetDetails] patch_rr_set_details Operations describing how to modify the collection of records.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    def patch_rr_set(zone_name_or_id, domain, rtype, patch_rr_set_details, opts = {})
      logger.debug 'Calling operation DnsClient#patch_rr_set.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling patch_rr_set." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling patch_rr_set." if domain.nil?
      raise "Missing the required parameter 'rtype' when calling patch_rr_set." if rtype.nil?
      raise "Missing the required parameter 'patch_rr_set_details' when calling patch_rr_set." if patch_rr_set_details.nil?
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)
      raise "Parameter value for 'rtype' must not be blank" if OCI::Internal::Util.blank_string?(rtype)

      path = '/zones/{zoneNameOrId}/records/{domain}/{rtype}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s).sub('{rtype}', rtype.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(patch_rr_set_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#patch_rr_set') do
        @api_client.call_api(
          :PATCH,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a collection of records in the specified zone. You can update
    # one record or all records for the specified zone depending on the
    # changes provided in the request body. You can also add or remove records
    # using this function.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [OCI::Dns::Models::PatchZoneRecordsDetails] patch_zone_records_details The operations describing how to modify the collection of records.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    def patch_zone_records(zone_name_or_id, patch_zone_records_details, opts = {})
      logger.debug 'Calling operation DnsClient#patch_zone_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling patch_zone_records." if zone_name_or_id.nil?
      raise "Missing the required parameter 'patch_zone_records_details' when calling patch_zone_records." if patch_zone_records_details.nil?
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)

      path = '/zones/{zoneNameOrId}/records'.sub('{zoneNameOrId}', zone_name_or_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(patch_zone_records_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#patch_zone_records') do
        @api_client.call_api(
          :PATCH,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Replaces records in the specified zone at a domain with the records
    # specified in the request body. If a specified record does not exist,
    # it will be created. If the record exists, then it will be updated to
    # represent the record in the body of the request. If a record in the zone
    # does not exist in the request body, the record will be removed from the
    # zone.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [OCI::Dns::Models::UpdateDomainRecordsDetails] update_domain_records_details A full list of records for the domain.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    def update_domain_records(zone_name_or_id, domain, update_domain_records_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_domain_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling update_domain_records." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling update_domain_records." if domain.nil?
      raise "Missing the required parameter 'update_domain_records_details' when calling update_domain_records." if update_domain_records_details.nil?
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)

      path = '/zones/{zoneNameOrId}/records/{domain}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_domain_records_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_domain_records') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Replaces records in the specified RRSet.
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [String] domain The target fully-qualified domain name (FQDN) within the target zone.
    # @param [String] rtype The type of the target RRSet within the target zone.
    # @param [OCI::Dns::Models::UpdateRRSetDetails] update_rr_set_details A full list of records for the RRSet.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    def update_rr_set(zone_name_or_id, domain, rtype, update_rr_set_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_rr_set.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling update_rr_set." if zone_name_or_id.nil?
      raise "Missing the required parameter 'domain' when calling update_rr_set." if domain.nil?
      raise "Missing the required parameter 'rtype' when calling update_rr_set." if rtype.nil?
      raise "Missing the required parameter 'update_rr_set_details' when calling update_rr_set." if update_rr_set_details.nil?
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)
      raise "Parameter value for 'domain' must not be blank" if OCI::Internal::Util.blank_string?(domain)
      raise "Parameter value for 'rtype' must not be blank" if OCI::Internal::Util.blank_string?(rtype)

      path = '/zones/{zoneNameOrId}/records/{domain}/{rtype}'.sub('{zoneNameOrId}', zone_name_or_id.to_s).sub('{domain}', domain.to_s).sub('{rtype}', rtype.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_rr_set_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_rr_set') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the configuration of the specified steering policy.
    #
    # @param [String] steering_policy_id The OCID of the target steering policy.
    # @param [OCI::Dns::Models::UpdateSteeringPolicyDetails] update_steering_policy_details New data for the steering policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::SteeringPolicy SteeringPolicy}
    def update_steering_policy(steering_policy_id, update_steering_policy_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_steering_policy.' if logger

      raise "Missing the required parameter 'steering_policy_id' when calling update_steering_policy." if steering_policy_id.nil?
      raise "Missing the required parameter 'update_steering_policy_details' when calling update_steering_policy." if update_steering_policy_details.nil?
      raise "Parameter value for 'steering_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_id)

      path = '/steeringPolicies/{steeringPolicyId}'.sub('{steeringPolicyId}', steering_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_steering_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_steering_policy') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::SteeringPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified steering policy attachment with your new information.
    #
    # @param [String] steering_policy_attachment_id The OCID of the target steering policy attachment.
    # @param [OCI::Dns::Models::UpdateSteeringPolicyAttachmentDetails] update_steering_policy_attachment_details New data for the steering policy attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @return [Response] A Response object with data of type {OCI::Dns::Models::SteeringPolicyAttachment SteeringPolicyAttachment}
    def update_steering_policy_attachment(steering_policy_attachment_id, update_steering_policy_attachment_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_steering_policy_attachment.' if logger

      raise "Missing the required parameter 'steering_policy_attachment_id' when calling update_steering_policy_attachment." if steering_policy_attachment_id.nil?
      raise "Missing the required parameter 'update_steering_policy_attachment_details' when calling update_steering_policy_attachment." if update_steering_policy_attachment_details.nil?
      raise "Parameter value for 'steering_policy_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(steering_policy_attachment_id)

      path = '/steeringPolicyAttachments/{steeringPolicyAttachmentId}'.sub('{steeringPolicyAttachmentId}', steering_policy_attachment_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_steering_policy_attachment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_steering_policy_attachment') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::SteeringPolicyAttachment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified secondary zone with your new external master
    # server information. For more information about secondary zone, see
    # [Manage DNS Service Zone](https://docs.cloud.oracle.com/iaas/Content/DNS/Tasks/managingdnszones.htm).
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [OCI::Dns::Models::UpdateZoneDetails] update_zone_details New data for the zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::Zone Zone}
    def update_zone(zone_name_or_id, update_zone_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_zone.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling update_zone." if zone_name_or_id.nil?
      raise "Missing the required parameter 'update_zone_details' when calling update_zone." if update_zone_details.nil?
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)

      path = '/zones/{zoneNameOrId}'.sub('{zoneNameOrId}', zone_name_or_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_zone_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_zone') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::Zone'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Replaces records in the specified zone with the records specified in the
    # request body. If a specified record does not exist, it will be created.
    # If the record exists, then it will be updated to represent the record in
    # the body of the request. If a record in the zone does not exist in the
    # request body, the record will be removed from the zone.
    #
    # @param [String] zone_name_or_id The name or OCID of the target zone.
    # @param [OCI::Dns::Models::UpdateZoneRecordsDetails] update_zone_records_details A full list of records for the zone.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The `If-Match` header field makes the request method conditional on the
    #   existence of at least one current representation of the target resource,
    #   when the field-value is `*`, or having a current representation of the
    #   target resource that has an entity-tag matching a member of the list of
    #   entity-tags provided in the field-value.
    #
    # @option opts [String] :if_unmodified_since The `If-Unmodified-Since` header field makes the request method
    #   conditional on the selected representation's last modification date being
    #   earlier than or equal to the date provided in the field-value.  This
    #   field accomplishes the same purpose as If-Match for cases where the user
    #   agent does not have an entity-tag for the representation.
    #
    # @option opts [String] :compartment_id The OCID of the compartment the resource belongs to.
    # @return [Response] A Response object with data of type {OCI::Dns::Models::RecordCollection RecordCollection}
    def update_zone_records(zone_name_or_id, update_zone_records_details, opts = {})
      logger.debug 'Calling operation DnsClient#update_zone_records.' if logger

      raise "Missing the required parameter 'zone_name_or_id' when calling update_zone_records." if zone_name_or_id.nil?
      raise "Missing the required parameter 'update_zone_records_details' when calling update_zone_records." if update_zone_records_details.nil?
      raise "Parameter value for 'zone_name_or_id' must not be blank" if OCI::Internal::Util.blank_string?(zone_name_or_id)

      path = '/zones/{zoneNameOrId}/records'.sub('{zoneNameOrId}', zone_name_or_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'if-unmodified-since'] = opts[:if_unmodified_since] if opts[:if_unmodified_since]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_zone_records_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'DnsClient#update_zone_records') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dns::Models::RecordCollection'
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
