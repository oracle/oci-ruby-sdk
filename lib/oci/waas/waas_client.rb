# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # OCI Web Application Acceleration and Security Services
  class Waas::WaasClient
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


    # Creates a new WaasClient.
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
        @endpoint = endpoint + '/20181116'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "WaasClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://waas.{region}.{secondLevelDomain}') + '/20181116'
      logger.info "WaasClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Accepts a list of recommended Web Application Firewall protection rules. Web Application Firewall protection rule recommendations are sets of rules generated by observed traffic patterns through the Web Application Firewall and are meant to optimize the Web Application Firewall's security profile. Only the rules specified in the request body will be updated; all other rules will remain unchanged.
    #
    # Use the `GET /waasPolicies/{waasPolicyId}/wafConfig/recommendations` method to view a list of recommended Web Application Firewall protection rules. For more information, see [WAF Protection Rules](https://docs.cloud.oracle.com/iaas/Content/WAF/Tasks/wafprotectionrules.htm).
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<String>] protection_rule_keys
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def accept_recommendations(waas_policy_id, protection_rule_keys, opts = {})
      logger.debug 'Calling operation WaasClient#accept_recommendations.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling accept_recommendations." if waas_policy_id.nil?
      raise "Missing the required parameter 'protection_rule_keys' when calling accept_recommendations." if protection_rule_keys.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/actions/acceptWafConfigRecommendations'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(protection_rule_keys)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#accept_recommendations') do
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


    # Cancels a specified work request.
    # @param [String] work_request_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the work request. This number is generated when work request is created.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def cancel_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation WaasClient#cancel_work_request.' if logger

      raise "Missing the required parameter 'work_request_id' when calling cancel_work_request." if work_request_id.nil?
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
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#cancel_work_request') do
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


    # Moves address list into a different compartment. When provided, If-Match is checked against ETag values of the address list.
    # @param [String] address_list_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the address list. This number is generated when the address list is added to the compartment.
    # @param [OCI::Waas::Models::ChangeAddressListCompartmentDetails] change_address_list_compartment_details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @return [Response] A Response object with data of type nil
    def change_address_list_compartment(address_list_id, change_address_list_compartment_details, opts = {})
      logger.debug 'Calling operation WaasClient#change_address_list_compartment.' if logger

      raise "Missing the required parameter 'address_list_id' when calling change_address_list_compartment." if address_list_id.nil?
      raise "Missing the required parameter 'change_address_list_compartment_details' when calling change_address_list_compartment." if change_address_list_compartment_details.nil?
      raise "Parameter value for 'address_list_id' must not be blank" if OCI::Internal::Util.blank_string?(address_list_id)

      path = '/addressLists/{addressListId}/actions/changeCompartment'.sub('{addressListId}', address_list_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_address_list_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#change_address_list_compartment') do
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


    # Moves certificate into a different compartment. When provided, If-Match is checked against ETag values of the certificate.
    # @param [String] certificate_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SSL certificate used in the WAAS policy. This number is generated when the certificate is added to the policy.
    # @param [OCI::Waas::Models::ChangeCertificateCompartmentDetails] change_certificate_compartment_details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @return [Response] A Response object with data of type nil
    def change_certificate_compartment(certificate_id, change_certificate_compartment_details, opts = {})
      logger.debug 'Calling operation WaasClient#change_certificate_compartment.' if logger

      raise "Missing the required parameter 'certificate_id' when calling change_certificate_compartment." if certificate_id.nil?
      raise "Missing the required parameter 'change_certificate_compartment_details' when calling change_certificate_compartment." if change_certificate_compartment_details.nil?
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)

      path = '/certificates/{certificateId}/actions/changeCompartment'.sub('{certificateId}', certificate_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_certificate_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#change_certificate_compartment') do
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


    # Moves Custom Protection rule into a different compartment. When provided, If-Match is checked against ETag values of the Custom Protection rule.
    # @param [String] custom_protection_rule_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Custom Protection rule. This number is generated when the Custom Protection rule is added to the compartment.
    # @param [OCI::Waas::Models::ChangeCustomProtectionRuleCompartmentDetails] change_custom_protection_rule_compartment_details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @return [Response] A Response object with data of type nil
    def change_custom_protection_rule_compartment(custom_protection_rule_id, change_custom_protection_rule_compartment_details, opts = {})
      logger.debug 'Calling operation WaasClient#change_custom_protection_rule_compartment.' if logger

      raise "Missing the required parameter 'custom_protection_rule_id' when calling change_custom_protection_rule_compartment." if custom_protection_rule_id.nil?
      raise "Missing the required parameter 'change_custom_protection_rule_compartment_details' when calling change_custom_protection_rule_compartment." if change_custom_protection_rule_compartment_details.nil?
      raise "Parameter value for 'custom_protection_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(custom_protection_rule_id)

      path = '/customProtectionRules/{customProtectionRuleId}/actions/changeCompartment'.sub('{customProtectionRuleId}', custom_protection_rule_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_custom_protection_rule_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#change_custom_protection_rule_compartment') do
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


    # Moves WAAS policy into a different compartment. When provided, If-Match is checked against ETag values of the WAAS policy.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::ChangeWaasPolicyCompartmentDetails] change_waas_policy_compartment_details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @return [Response] A Response object with data of type nil
    def change_waas_policy_compartment(waas_policy_id, change_waas_policy_compartment_details, opts = {})
      logger.debug 'Calling operation WaasClient#change_waas_policy_compartment.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling change_waas_policy_compartment." if waas_policy_id.nil?
      raise "Missing the required parameter 'change_waas_policy_compartment_details' when calling change_waas_policy_compartment." if change_waas_policy_compartment_details.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/actions/changeCompartment'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_waas_policy_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#change_waas_policy_compartment') do
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


    # Creates an address list in set compartment and allows it to be used in a WAAS policy.
    # For more information, see [WAF Settings](https://docs.cloud.oracle.com/iaas/Content/WAF/Tasks/wafsettings.htm).
    # @param [OCI::Waas::Models::CreateAddressListDetails] create_address_list_details The details of the address list resource to create.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::AddressList AddressList}
    def create_address_list(create_address_list_details, opts = {})
      logger.debug 'Calling operation WaasClient#create_address_list.' if logger

      raise "Missing the required parameter 'create_address_list_details' when calling create_address_list." if create_address_list_details.nil?

      path = '/addressLists'
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

      post_body = @api_client.object_to_http_body(create_address_list_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#create_address_list') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::AddressList'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Allows an SSL certificate to be added to a WAAS policy. The Web Application Firewall terminates SSL connections to inspect requests in runtime, and then re-encrypts requests before sending them to the origin for fulfillment.
    #
    # For more information, see [WAF Settings](https://docs.cloud.oracle.com/iaas/Content/WAF/Tasks/wafsettings.htm).
    # @param [OCI::Waas::Models::CreateCertificateDetails] create_certificate_details The details of the SSL certificate resource to create.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::Certificate Certificate}
    def create_certificate(create_certificate_details, opts = {})
      logger.debug 'Calling operation WaasClient#create_certificate.' if logger

      raise "Missing the required parameter 'create_certificate_details' when calling create_certificate." if create_certificate_details.nil?

      path = '/certificates'
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#create_certificate') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::Certificate'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new Custom Protection rule in the specified compartment.
    # @param [OCI::Waas::Models::CreateCustomProtectionRuleDetails] create_custom_protection_rule_details The details of the Custom Protection rule.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::CustomProtectionRule CustomProtectionRule}
    def create_custom_protection_rule(create_custom_protection_rule_details, opts = {})
      logger.debug 'Calling operation WaasClient#create_custom_protection_rule.' if logger

      raise "Missing the required parameter 'create_custom_protection_rule_details' when calling create_custom_protection_rule." if create_custom_protection_rule_details.nil?

      path = '/customProtectionRules'
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

      post_body = @api_client.object_to_http_body(create_custom_protection_rule_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#create_custom_protection_rule') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::CustomProtectionRule'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new Web Application Acceleration and Security (WAAS) policy in the specified compartment. A WAAS policy must be established before creating Web Application Firewall (WAF) rules. To use WAF rules, your web application's origin servers must defined in the `WaasPolicy` schema.
    #
    # A domain name must be specified when creating a WAAS policy. The domain name should be different from the origins specified in your `WaasPolicy`. Once domain name is entered and stored, it is unchangeable.
    #
    # Use the record data returned in the `cname` field of the `WaasPolicy` object to create a CNAME record in your DNS configuration that will direct your domain's traffic through the WAF.
    #
    # For the purposes of access control, you must provide the OCID of the compartment where you want the service to reside. For information about access control and compartments, see [Overview of the IAM Service](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/overview.htm).
    #
    # You must specify a display name and domain for the WAAS policy. The display name does not have to be unique and can be changed. The domain name should be different from every origin specified in `WaasPolicy`.
    #
    # All Oracle Cloud Infrastructure resources, including WAAS policies, receive a unique, Oracle-assigned ID called an Oracle Cloud Identifier (OCID). When a resource is created, you can find its OCID in the response. You can also retrieve a resource's OCID by using a list API operation for that resource type, or by viewing the resource in the Console. Fore more information, see [Resource Identifiers](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    #
    # **Note:** After sending the POST request, the new object's state will temporarily be `CREATING`. Ensure that the resource's state has changed to `ACTIVE` before use.
    # @param [OCI::Waas::Models::CreateWaasPolicyDetails] create_waas_policy_details The details of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @return [Response] A Response object with data of type nil
    def create_waas_policy(create_waas_policy_details, opts = {})
      logger.debug 'Calling operation WaasClient#create_waas_policy.' if logger

      raise "Missing the required parameter 'create_waas_policy_details' when calling create_waas_policy." if create_waas_policy_details.nil?

      path = '/waasPolicies'
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

      post_body = @api_client.object_to_http_body(create_waas_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#create_waas_policy') do
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


    # Deletes the address list from the compartment if it is not used.
    # @param [String] address_list_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the address list. This number is generated when the address list is added to the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def delete_address_list(address_list_id, opts = {})
      logger.debug 'Calling operation WaasClient#delete_address_list.' if logger

      raise "Missing the required parameter 'address_list_id' when calling delete_address_list." if address_list_id.nil?
      raise "Parameter value for 'address_list_id' must not be blank" if OCI::Internal::Util.blank_string?(address_list_id)

      path = '/addressLists/{addressListId}'.sub('{addressListId}', address_list_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#delete_address_list') do
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


    # Deletes an SSL certificate from the WAAS service.
    # @param [String] certificate_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SSL certificate used in the WAAS policy. This number is generated when the certificate is added to the policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def delete_certificate(certificate_id, opts = {})
      logger.debug 'Calling operation WaasClient#delete_certificate.' if logger

      raise "Missing the required parameter 'certificate_id' when calling delete_certificate." if certificate_id.nil?
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)

      path = '/certificates/{certificateId}'.sub('{certificateId}', certificate_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#delete_certificate') do
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


    # Deletes a Custom Protection rule.
    # @param [String] custom_protection_rule_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Custom Protection rule. This number is generated when the Custom Protection rule is added to the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def delete_custom_protection_rule(custom_protection_rule_id, opts = {})
      logger.debug 'Calling operation WaasClient#delete_custom_protection_rule.' if logger

      raise "Missing the required parameter 'custom_protection_rule_id' when calling delete_custom_protection_rule." if custom_protection_rule_id.nil?
      raise "Parameter value for 'custom_protection_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(custom_protection_rule_id)

      path = '/customProtectionRules/{customProtectionRuleId}'.sub('{customProtectionRuleId}', custom_protection_rule_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#delete_custom_protection_rule') do
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


    # Deletes a policy.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def delete_waas_policy(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#delete_waas_policy.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling delete_waas_policy." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#delete_waas_policy') do
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


    # Gets the details of an address list.
    # @param [String] address_list_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the address list. This number is generated when the address list is added to the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::AddressList AddressList}
    def get_address_list(address_list_id, opts = {})
      logger.debug 'Calling operation WaasClient#get_address_list.' if logger

      raise "Missing the required parameter 'address_list_id' when calling get_address_list." if address_list_id.nil?
      raise "Parameter value for 'address_list_id' must not be blank" if OCI::Internal::Util.blank_string?(address_list_id)

      path = '/addressLists/{addressListId}'.sub('{addressListId}', address_list_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#get_address_list') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::AddressList'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of an SSL certificate.
    # @param [String] certificate_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SSL certificate used in the WAAS policy. This number is generated when the certificate is added to the policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::Certificate Certificate}
    def get_certificate(certificate_id, opts = {})
      logger.debug 'Calling operation WaasClient#get_certificate.' if logger

      raise "Missing the required parameter 'certificate_id' when calling get_certificate." if certificate_id.nil?
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)

      path = '/certificates/{certificateId}'.sub('{certificateId}', certificate_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#get_certificate') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::Certificate'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of a Custom Protection rule.
    # @param [String] custom_protection_rule_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Custom Protection rule. This number is generated when the Custom Protection rule is added to the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::CustomProtectionRule CustomProtectionRule}
    def get_custom_protection_rule(custom_protection_rule_id, opts = {})
      logger.debug 'Calling operation WaasClient#get_custom_protection_rule.' if logger

      raise "Missing the required parameter 'custom_protection_rule_id' when calling get_custom_protection_rule." if custom_protection_rule_id.nil?
      raise "Parameter value for 'custom_protection_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(custom_protection_rule_id)

      path = '/customProtectionRules/{customProtectionRuleId}'.sub('{customProtectionRuleId}', custom_protection_rule_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#get_custom_protection_rule') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::CustomProtectionRule'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the device fingerprint challenge settings in the Web Application Firewall configuration for a WAAS policy.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::DeviceFingerprintChallenge DeviceFingerprintChallenge}
    def get_device_fingerprint_challenge(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#get_device_fingerprint_challenge.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling get_device_fingerprint_challenge." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/deviceFingerprintChallenge'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#get_device_fingerprint_challenge') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::DeviceFingerprintChallenge'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the human interaction challenge settings in the Web Application Firewall configuration for a WAAS policy.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::HumanInteractionChallenge HumanInteractionChallenge}
    def get_human_interaction_challenge(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#get_human_interaction_challenge.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling get_human_interaction_challenge." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/humanInteractionChallenge'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#get_human_interaction_challenge') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::HumanInteractionChallenge'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the JavaScript challenge settings in the Web Application Firewall configuration for a WAAS policy.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::JsChallenge JsChallenge}
    def get_js_challenge(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#get_js_challenge.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling get_js_challenge." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/jsChallenge'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#get_js_challenge') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::JsChallenge'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the configuration of a WAAS policy.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::PolicyConfig PolicyConfig}
    def get_policy_config(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#get_policy_config.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling get_policy_config." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/policyConfig'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#get_policy_config') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::PolicyConfig'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of a protection rule in the Web Application Firewall configuration for a WAAS policy.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [String] protection_rule_key The protection rule key.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::ProtectionRule ProtectionRule}
    def get_protection_rule(waas_policy_id, protection_rule_key, opts = {})
      logger.debug 'Calling operation WaasClient#get_protection_rule.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling get_protection_rule." if waas_policy_id.nil?
      raise "Missing the required parameter 'protection_rule_key' when calling get_protection_rule." if protection_rule_key.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)
      raise "Parameter value for 'protection_rule_key' must not be blank" if OCI::Internal::Util.blank_string?(protection_rule_key)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/protectionRules/{protectionRuleKey}'.sub('{waasPolicyId}', waas_policy_id.to_s).sub('{protectionRuleKey}', protection_rule_key.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#get_protection_rule') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::ProtectionRule'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the protection settings in the Web Application Firewall configuration for a WAAS policy.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::ProtectionSettings ProtectionSettings}
    def get_protection_settings(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#get_protection_settings.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling get_protection_settings." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/protectionSettings'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#get_protection_settings') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::ProtectionSettings'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of a WAAS policy.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::WaasPolicy WaasPolicy}
    def get_waas_policy(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#get_waas_policy.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling get_waas_policy." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#get_waas_policy') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::WaasPolicy'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the address rate limiting settings of the Web Application Firewall configuration for a WAAS policy.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::AddressRateLimiting AddressRateLimiting}
    def get_waf_address_rate_limiting(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#get_waf_address_rate_limiting.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling get_waf_address_rate_limiting." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/addressRateLimiting'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#get_waf_address_rate_limiting') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::AddressRateLimiting'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the Web Application Firewall configuration details for a WAAS policy.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::WafConfig WafConfig}
    def get_waf_config(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#get_waf_config.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling get_waf_config." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#get_waf_config') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::WafConfig'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the details of a specified work request.
    # @param [String] work_request_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the work request. This number is generated when work request is created.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::WorkRequest WorkRequest}
    def get_work_request(work_request_id, opts = {})
      logger.debug 'Calling operation WaasClient#get_work_request.' if logger

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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#get_work_request') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::WorkRequest'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the currently configured access rules for the Web Application Firewall configuration of a specified WAAS policy.
    # The order of the access rules is important. The rules will be checked in the order they are specified and the first matching rule will be used.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::AccessRule AccessRule}>
    def list_access_rules(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_access_rules.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_access_rules." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/accessRules'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_access_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::AccessRule>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of address lists that can be used in a WAAS policy.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment. This number is generated when the compartment is created.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @option opts [String] :sort_by The value by which address lists are sorted in a paginated 'List' call. If unspecified, defaults to `timeCreated`.
    #   Allowed values are: id, name, timeCreated
    # @option opts [String] :sort_order The value of the sorting direction of resources in a paginated 'List' call. If unspecified, defaults to `DESC`.
    #   Allowed values are: ASC, DESC
    # @option opts [Array<String>] :id Filter address lists using a list of address lists OCIDs.
    # @option opts [Array<String>] :name Filter address lists using a list of names.
    # @option opts [Array<String>] :lifecycle_state Filter address lists using a list of lifecycle states.
    #   Allowed values are: CREATING, ACTIVE, FAILED, UPDATING, DELETING, DELETED
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter that matches address lists created on or after the specified date-time.
    # @option opts [DateTime] :time_created_less_than A filter that matches address lists created before the specified date-time.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::AddressListSummary AddressListSummary}>
    def list_address_lists(compartment_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_address_lists.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_address_lists." if compartment_id.nil?

      if opts[:sort_by] && !%w[id name timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, name, timeCreated.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end


      lifecycle_state_allowable_values = %w[CREATING ACTIVE FAILED UPDATING DELETING DELETED]
      if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
        opts[:lifecycle_state].each do |val_to_check|
          unless lifecycle_state_allowable_values.include?(val_to_check)
            raise 'Invalid value for "lifecycle_state", must be one of CREATING, ACTIVE, FAILED, UPDATING, DELETING, DELETED.'
          end
        end
      end

      path = '/addressLists'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:name] = OCI::ApiClient.build_collection_params(opts[:name], :multi) if opts[:name] && !opts[:name].empty?
      query_params[:lifecycleState] = OCI::ApiClient.build_collection_params(opts[:lifecycle_state], :multi) if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_address_lists') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::AddressListSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the currently configured caching rules for the Web Application Firewall configuration of a specified WAAS policy.
    # The order of the caching rules is important. The rules will be checked in the order they are specified and the first matching rule will be used.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::CachingRuleSummary CachingRuleSummary}>
    def list_caching_rules(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_caching_rules.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_caching_rules." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/cachingRules'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_caching_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::CachingRuleSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the list of currently configured CAPTCHA challenges in the Web
    # Application Firewall configuration of a WAAS policy.
    #
    # The order of the CAPTCHA challenges is important. The URL for each
    # CAPTCHA will be checked in the order they are created.
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::Captcha Captcha}>
    def list_captchas(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_captchas.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_captchas." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/captchas'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_captchas') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::Captcha>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of SSL certificates that can be used in a WAAS policy.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment. This number is generated when the compartment is created.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @option opts [String] :sort_by The value by which certificate summaries are sorted in a paginated 'List' call. If unspecified, defaults to `timeCreated`.
    #   Allowed values are: id, compartmentId, displayName, notValidAfter, timeCreated
    # @option opts [String] :sort_order The value of the sorting direction of resources in a paginated 'List' call. If unspecified, defaults to `DESC`.
    #   Allowed values are: ASC, DESC
    # @option opts [Array<String>] :id Filter certificates using a list of certificates OCIDs.
    # @option opts [Array<String>] :display_name Filter certificates using a list of display names.
    # @option opts [Array<String>] :lifecycle_state Filter certificates using a list of lifecycle states.
    #   Allowed values are: CREATING, ACTIVE, FAILED, UPDATING, DELETING, DELETED
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter that matches certificates created on or after the specified date-time.
    # @option opts [DateTime] :time_created_less_than A filter that matches certificates created before the specified date-time.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::CertificateSummary CertificateSummary}>
    def list_certificates(compartment_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_certificates.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_certificates." if compartment_id.nil?

      if opts[:sort_by] && !%w[id compartmentId displayName notValidAfter timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, compartmentId, displayName, notValidAfter, timeCreated.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end


      lifecycle_state_allowable_values = %w[CREATING ACTIVE FAILED UPDATING DELETING DELETED]
      if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
        opts[:lifecycle_state].each do |val_to_check|
          unless lifecycle_state_allowable_values.include?(val_to_check)
            raise 'Invalid value for "lifecycle_state", must be one of CREATING, ACTIVE, FAILED, UPDATING, DELETING, DELETED.'
          end
        end
      end

      path = '/certificates'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:displayName] = OCI::ApiClient.build_collection_params(opts[:display_name], :multi) if opts[:display_name] && !opts[:display_name].empty?
      query_params[:lifecycleState] = OCI::ApiClient.build_collection_params(opts[:lifecycle_state], :multi) if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_certificates') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::CertificateSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of Custom Protection rules.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment. This number is generated when the compartment is created.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @option opts [String] :sort_by The value by which Custom Protection rules are sorted in a paginated 'List' call. If unspecified, defaults to `timeCreated`.
    #   Allowed values are: id, compartmentId, displayName, modSecurityRuleId, timeCreated
    # @option opts [String] :sort_order The value of the sorting direction of resources in a paginated 'List' call. If unspecified, defaults to `DESC`.
    #   Allowed values are: ASC, DESC
    # @option opts [Array<String>] :id Filter Custom Protection rules using a list of Custom Protection rules OCIDs.
    # @option opts [Array<String>] :display_name Filter Custom Protection rules using a list of display names.
    # @option opts [Array<String>] :lifecycle_state Filter Custom Protection rules using a list of lifecycle states.
    #   Allowed values are: CREATING, ACTIVE, FAILED, UPDATING, DELETING, DELETED
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter that matches Custom Protection rules created on or after the specified date-time.
    # @option opts [DateTime] :time_created_less_than A filter that matches Custom Protection rules created before the specified date-time.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::CustomProtectionRuleSummary CustomProtectionRuleSummary}>
    def list_custom_protection_rules(compartment_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_custom_protection_rules.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_custom_protection_rules." if compartment_id.nil?

      if opts[:sort_by] && !%w[id compartmentId displayName modSecurityRuleId timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, compartmentId, displayName, modSecurityRuleId, timeCreated.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end


      lifecycle_state_allowable_values = %w[CREATING ACTIVE FAILED UPDATING DELETING DELETED]
      if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
        opts[:lifecycle_state].each do |val_to_check|
          unless lifecycle_state_allowable_values.include?(val_to_check)
            raise 'Invalid value for "lifecycle_state", must be one of CREATING, ACTIVE, FAILED, UPDATING, DELETING, DELETED.'
          end
        end
      end

      path = '/customProtectionRules'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:displayName] = OCI::ApiClient.build_collection_params(opts[:display_name], :multi) if opts[:display_name] && !opts[:display_name].empty?
      query_params[:lifecycleState] = OCI::ApiClient.build_collection_params(opts[:lifecycle_state], :multi) if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_custom_protection_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::CustomProtectionRuleSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Return the list of the tenant's edge node subnets. Use these CIDR blocks to restrict incoming traffic to your origin. These subnets are owned by OCI and forward traffic to customer origins. They are not associated with specific regions or compartments.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @option opts [String] :sort_by The value by which edge node subnets are sorted in a paginated 'List' call. If unspecified, defaults to `timeModified`.
    #   Allowed values are: cidr, region, timeModified
    # @option opts [String] :sort_order The value of the sorting direction of resources in a paginated 'List' call. If unspecified, defaults to `DESC`.
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::EdgeSubnet EdgeSubnet}>
    def list_edge_subnets(opts = {})
      logger.debug 'Calling operation WaasClient#list_edge_subnets.' if logger


      if opts[:sort_by] && !%w[cidr region timeModified].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of cidr, region, timeModified.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/edgeSubnets'
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
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_edge_subnets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::EdgeSubnet>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the list of good bots defined in the Web Application Firewall configuration for a WAAS policy.
    #
    # The list is sorted by `key`, in ascending order.
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::GoodBot GoodBot}>
    def list_good_bots(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_good_bots.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_good_bots." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/goodBots'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_good_bots') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::GoodBot>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the list of available protection rules for a WAAS policy. Use the `GetWafConfig` operation to view a list of currently configured protection rules for the Web Application Firewall, or use the `ListRecommendations` operation to get a list of recommended protection rules for the Web Application Firewall.
    # The list is sorted by `key`, in ascending order.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @option opts [Array<String>] :mod_security_rule_id Filter rules using a list of ModSecurity rule IDs.
    # @option opts [Array<String>] :action Filter rules using a list of actions.
    #   Allowed values are: OFF, DETECT, BLOCK
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::ProtectionRule ProtectionRule}>
    def list_protection_rules(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_protection_rules.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_protection_rules." if waas_policy_id.nil?


      action_allowable_values = %w[OFF DETECT BLOCK]
      if opts[:action] && !opts[:action].empty?
        opts[:action].each do |val_to_check|
          unless action_allowable_values.include?(val_to_check)
            raise 'Invalid value for "action", must be one of OFF, DETECT, BLOCK.'
          end
        end
      end
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/protectionRules'.sub('{waasPolicyId}', waas_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:modSecurityRuleId] = OCI::ApiClient.build_collection_params(opts[:mod_security_rule_id], :multi) if opts[:mod_security_rule_id] && !opts[:mod_security_rule_id].empty?
      query_params[:action] = OCI::ApiClient.build_collection_params(opts[:action], :multi) if opts[:action] && !opts[:action].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_protection_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::ProtectionRule>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the list of recommended Web Application Firewall protection rules.
    #
    # Use the `POST /waasPolicies/{waasPolicyId}/actions/acceptWafConfigRecommendations` method to accept recommended Web Application Firewall protection rules. For more information, see [WAF Protection Rules](https://docs.cloud.oracle.com/iaas/Content/WAF/Tasks/wafprotectionrules.htm).
    # The list is sorted by `key`, in ascending order.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :recommended_action A filter that matches recommended protection rules based on the selected action. If unspecified, rules with any action type are returned.
    #   Allowed values are: DETECT, BLOCK
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::Recommendation Recommendation}>
    def list_recommendations(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_recommendations.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_recommendations." if waas_policy_id.nil?

      if opts[:recommended_action] && !%w[DETECT BLOCK].include?(opts[:recommended_action])
        raise 'Invalid value for "recommended_action", must be one of DETECT, BLOCK.'
      end
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/recommendations'.sub('{waasPolicyId}', waas_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:recommendedAction] = opts[:recommended_action] if opts[:recommended_action]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_recommendations') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::Recommendation>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the list of available web application threat intelligence feeds
    # and the actions set for each feed. The list is sorted by `key`,
    # in ascending order.
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::ThreatFeed ThreatFeed}>
    def list_threat_feeds(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_threat_feeds.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_threat_feeds." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/threatFeeds'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_threat_feeds') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::ThreatFeed>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of WAAS policies.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment. This number is generated when the compartment is created.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @option opts [String] :sort_by The value by which policies are sorted in a paginated 'List' call.  If unspecified, defaults to `timeCreated`.
    #   Allowed values are: id, displayName, timeCreated
    # @option opts [String] :sort_order The value of the sorting direction of resources in a paginated 'List' call. If unspecified, defaults to `DESC`.
    #   Allowed values are: ASC, DESC
    # @option opts [Array<String>] :id Filter policies using a list of policy OCIDs.
    # @option opts [Array<String>] :display_name Filter policies using a list of display names.
    # @option opts [Array<String>] :lifecycle_state Filter policies using a list of lifecycle states.
    #   Allowed values are: CREATING, ACTIVE, FAILED, UPDATING, DELETING, DELETED
    # @option opts [DateTime] :time_created_greater_than_or_equal_to A filter that matches policies created on or after the specified date and time.
    # @option opts [DateTime] :time_created_less_than A filter that matches policies created before the specified date-time.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::WaasPolicySummary WaasPolicySummary}>
    def list_waas_policies(compartment_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_waas_policies.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_waas_policies." if compartment_id.nil?

      if opts[:sort_by] && !%w[id displayName timeCreated].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, displayName, timeCreated.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end


      lifecycle_state_allowable_values = %w[CREATING ACTIVE FAILED UPDATING DELETING DELETED]
      if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
        opts[:lifecycle_state].each do |val_to_check|
          unless lifecycle_state_allowable_values.include?(val_to_check)
            raise 'Invalid value for "lifecycle_state", must be one of CREATING, ACTIVE, FAILED, UPDATING, DELETING, DELETED.'
          end
        end
      end

      path = '/waasPolicies'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:id] = OCI::ApiClient.build_collection_params(opts[:id], :multi) if opts[:id] && !opts[:id].empty?
      query_params[:displayName] = OCI::ApiClient.build_collection_params(opts[:display_name], :multi) if opts[:display_name] && !opts[:display_name].empty?
      query_params[:lifecycleState] = OCI::ApiClient.build_collection_params(opts[:lifecycle_state], :multi) if opts[:lifecycle_state] && !opts[:lifecycle_state].empty?
      query_params[:timeCreatedGreaterThanOrEqualTo] = opts[:time_created_greater_than_or_equal_to] if opts[:time_created_greater_than_or_equal_to]
      query_params[:timeCreatedLessThan] = opts[:time_created_less_than] if opts[:time_created_less_than]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_waas_policies') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::WaasPolicySummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the list of currently configured custom protection rules for a WAAS policy.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @option opts [Array<String>] :mod_security_rule_id Filter rules using a list of ModSecurity rule IDs.
    # @option opts [Array<String>] :action Filter rules using a list of actions.
    #   Allowed values are: DETECT, BLOCK
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::WaasPolicyCustomProtectionRuleSummary WaasPolicyCustomProtectionRuleSummary}>
    def list_waas_policy_custom_protection_rules(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_waas_policy_custom_protection_rules.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_waas_policy_custom_protection_rules." if waas_policy_id.nil?


      action_allowable_values = %w[DETECT BLOCK]
      if opts[:action] && !opts[:action].empty?
        opts[:action].each do |val_to_check|
          unless action_allowable_values.include?(val_to_check)
            raise 'Invalid value for "action", must be one of DETECT, BLOCK.'
          end
        end
      end
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/customProtectionRules'.sub('{waasPolicyId}', waas_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:modSecurityRuleId] = OCI::ApiClient.build_collection_params(opts[:mod_security_rule_id], :multi) if opts[:mod_security_rule_id] && !opts[:mod_security_rule_id].empty?
      query_params[:action] = OCI::ApiClient.build_collection_params(opts[:action], :multi) if opts[:action] && !opts[:action].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_waas_policy_custom_protection_rules') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::WaasPolicyCustomProtectionRuleSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the number of blocked requests by a Web Application Firewall feature in five minute blocks, sorted by `timeObserved` in ascending order (starting from oldest data).
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [DateTime] :time_observed_greater_than_or_equal_to A filter that limits returned events to those occurring on or after a date and time, specified in RFC 3339 format. If unspecified, defaults to 30 minutes before receipt of the request.
    # @option opts [DateTime] :time_observed_less_than A filter that limits returned events to those occurring before a date and time, specified in RFC 3339 format.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @option opts [Array<String>] :waf_feature Filter stats by the Web Application Firewall feature that triggered the block action. If unspecified, data for all WAF features will be returned.
    #   Allowed values are: PROTECTION_RULES, JS_CHALLENGE, ACCESS_RULES, THREAT_FEEDS, HUMAN_INTERACTION_CHALLENGE, DEVICE_FINGERPRINT_CHALLENGE, CAPTCHA, ADDRESS_RATE_LIMITING
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::WafBlockedRequest WafBlockedRequest}>
    def list_waf_blocked_requests(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_waf_blocked_requests.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_waf_blocked_requests." if waas_policy_id.nil?


      waf_feature_allowable_values = %w[PROTECTION_RULES JS_CHALLENGE ACCESS_RULES THREAT_FEEDS HUMAN_INTERACTION_CHALLENGE DEVICE_FINGERPRINT_CHALLENGE CAPTCHA ADDRESS_RATE_LIMITING]
      if opts[:waf_feature] && !opts[:waf_feature].empty?
        opts[:waf_feature].each do |val_to_check|
          unless waf_feature_allowable_values.include?(val_to_check)
            raise 'Invalid value for "waf_feature", must be one of PROTECTION_RULES, JS_CHALLENGE, ACCESS_RULES, THREAT_FEEDS, HUMAN_INTERACTION_CHALLENGE, DEVICE_FINGERPRINT_CHALLENGE, CAPTCHA, ADDRESS_RATE_LIMITING.'
          end
        end
      end
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/reports/waf/blocked'.sub('{waasPolicyId}', waas_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:timeObservedGreaterThanOrEqualTo] = opts[:time_observed_greater_than_or_equal_to] if opts[:time_observed_greater_than_or_equal_to]
      query_params[:timeObservedLessThan] = opts[:time_observed_less_than] if opts[:time_observed_less_than]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:wafFeature] = OCI::ApiClient.build_collection_params(opts[:waf_feature], :multi) if opts[:waf_feature] && !opts[:waf_feature].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_waf_blocked_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::WafBlockedRequest>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets structured Web Application Firewall event logs for a WAAS
    # policy. Sorted by the `timeObserved` in ascending order (starting from the
    # oldest recorded event).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `20`. (default to 20)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @option opts [DateTime] :time_observed_greater_than_or_equal_to A filter that matches log entries where the observed event occurred on or after a date and time specified in RFC 3339 format. If unspecified, defaults to two hours before receipt of the request.
    # @option opts [DateTime] :time_observed_less_than A filter that matches log entries where the observed event occurred before a date and time, specified in RFC 3339 format.
    # @option opts [String] :text_contains A full text search for logs.
    # @option opts [Array<String>] :access_rule_key Filters logs by access rule key.
    # @option opts [Array<String>] :action Filters logs by Web Application Firewall action.
    #   Allowed values are: BLOCK, DETECT, BYPASS, LOG, REDIRECTED
    # @option opts [Array<String>] :client_address Filters logs by client IP address.
    # @option opts [Array<String>] :country_code Filters logs by country code. Country codes are in ISO 3166-1 alpha-2 format. For a list of codes, see [ISO's website](https://www.iso.org/obp/ui/#search/code/).
    # @option opts [Array<String>] :country_name Filter logs by country name.
    # @option opts [Array<String>] :fingerprint Filter logs by device fingerprint.
    # @option opts [Array<String>] :http_method Filter logs by HTTP method.
    #   Allowed values are: OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
    # @option opts [Array<String>] :incident_key Filter logs by incident key.
    # @option opts [Array<String>] :log_type Filter by log type.
    #   Allowed values are: ACCESS, PROTECTION_RULES, JS_CHALLENGE, CAPTCHA, ACCESS_RULES, THREAT_FEEDS, HUMAN_INTERACTION_CHALLENGE, DEVICE_FINGERPRINT_CHALLENGE, ADDRESS_RATE_LIMITING
    # @option opts [Array<String>] :origin_address Filter by origin IP address.
    # @option opts [Array<String>] :referrer Filter by referrer.
    # @option opts [Array<String>] :request_url Filter by request URL.
    # @option opts [Array<Integer>] :response_code Filter by response code.
    # @option opts [Array<String>] :threat_feed_key Filter by threat feed key.
    # @option opts [Array<String>] :user_agent Filter by user agent.
    # @option opts [Array<String>] :protection_rule_key Filter by protection rule key.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::WafLog WafLog}>
    def list_waf_logs(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_waf_logs.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_waf_logs." if waas_policy_id.nil?


      action_allowable_values = %w[BLOCK DETECT BYPASS LOG REDIRECTED]
      if opts[:action] && !opts[:action].empty?
        opts[:action].each do |val_to_check|
          unless action_allowable_values.include?(val_to_check)
            raise 'Invalid value for "action", must be one of BLOCK, DETECT, BYPASS, LOG, REDIRECTED.'
          end
        end
      end


      http_method_allowable_values = %w[OPTIONS GET HEAD POST PUT DELETE TRACE CONNECT]
      if opts[:http_method] && !opts[:http_method].empty?
        opts[:http_method].each do |val_to_check|
          unless http_method_allowable_values.include?(val_to_check)
            raise 'Invalid value for "http_method", must be one of OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT.'
          end
        end
      end


      log_type_allowable_values = %w[ACCESS PROTECTION_RULES JS_CHALLENGE CAPTCHA ACCESS_RULES THREAT_FEEDS HUMAN_INTERACTION_CHALLENGE DEVICE_FINGERPRINT_CHALLENGE ADDRESS_RATE_LIMITING]
      if opts[:log_type] && !opts[:log_type].empty?
        opts[:log_type].each do |val_to_check|
          unless log_type_allowable_values.include?(val_to_check)
            raise 'Invalid value for "log_type", must be one of ACCESS, PROTECTION_RULES, JS_CHALLENGE, CAPTCHA, ACCESS_RULES, THREAT_FEEDS, HUMAN_INTERACTION_CHALLENGE, DEVICE_FINGERPRINT_CHALLENGE, ADDRESS_RATE_LIMITING.'
          end
        end
      end
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafLogs'.sub('{waasPolicyId}', waas_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:timeObservedGreaterThanOrEqualTo] = opts[:time_observed_greater_than_or_equal_to] if opts[:time_observed_greater_than_or_equal_to]
      query_params[:timeObservedLessThan] = opts[:time_observed_less_than] if opts[:time_observed_less_than]
      query_params[:textContains] = opts[:text_contains] if opts[:text_contains]
      query_params[:accessRuleKey] = OCI::ApiClient.build_collection_params(opts[:access_rule_key], :multi) if opts[:access_rule_key] && !opts[:access_rule_key].empty?
      query_params[:action] = OCI::ApiClient.build_collection_params(opts[:action], :multi) if opts[:action] && !opts[:action].empty?
      query_params[:clientAddress] = OCI::ApiClient.build_collection_params(opts[:client_address], :multi) if opts[:client_address] && !opts[:client_address].empty?
      query_params[:countryCode] = OCI::ApiClient.build_collection_params(opts[:country_code], :multi) if opts[:country_code] && !opts[:country_code].empty?
      query_params[:countryName] = OCI::ApiClient.build_collection_params(opts[:country_name], :multi) if opts[:country_name] && !opts[:country_name].empty?
      query_params[:fingerprint] = OCI::ApiClient.build_collection_params(opts[:fingerprint], :multi) if opts[:fingerprint] && !opts[:fingerprint].empty?
      query_params[:httpMethod] = OCI::ApiClient.build_collection_params(opts[:http_method], :multi) if opts[:http_method] && !opts[:http_method].empty?
      query_params[:incidentKey] = OCI::ApiClient.build_collection_params(opts[:incident_key], :multi) if opts[:incident_key] && !opts[:incident_key].empty?
      query_params[:logType] = OCI::ApiClient.build_collection_params(opts[:log_type], :multi) if opts[:log_type] && !opts[:log_type].empty?
      query_params[:originAddress] = OCI::ApiClient.build_collection_params(opts[:origin_address], :multi) if opts[:origin_address] && !opts[:origin_address].empty?
      query_params[:referrer] = OCI::ApiClient.build_collection_params(opts[:referrer], :multi) if opts[:referrer] && !opts[:referrer].empty?
      query_params[:requestUrl] = OCI::ApiClient.build_collection_params(opts[:request_url], :multi) if opts[:request_url] && !opts[:request_url].empty?
      query_params[:responseCode] = OCI::ApiClient.build_collection_params(opts[:response_code], :multi) if opts[:response_code] && !opts[:response_code].empty?
      query_params[:threatFeedKey] = OCI::ApiClient.build_collection_params(opts[:threat_feed_key], :multi) if opts[:threat_feed_key] && !opts[:threat_feed_key].empty?
      query_params[:userAgent] = OCI::ApiClient.build_collection_params(opts[:user_agent], :multi) if opts[:user_agent] && !opts[:user_agent].empty?
      query_params[:protectionRuleKey] = OCI::ApiClient.build_collection_params(opts[:protection_rule_key], :multi) if opts[:protection_rule_key] && !opts[:protection_rule_key].empty?

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_waf_logs') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::WafLog>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the number of requests managed by a Web Application Firewall
    # over a specified period of time, including blocked requests. Sorted
    # by `timeObserved` in ascending order (starting from oldest requests).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [DateTime] :time_observed_greater_than_or_equal_to A filter that limits returned events to those occurring on or after a date and time, specified in RFC 3339 format. If unspecified, defaults to 30 minutes before receipt of the request.
    # @option opts [DateTime] :time_observed_less_than A filter that limits returned events to those occurring before a date and time, specified in RFC 3339 format.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::WafRequest WafRequest}>
    def list_waf_requests(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_waf_requests.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_waf_requests." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/reports/waf/requests'.sub('{waasPolicyId}', waas_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:timeObservedGreaterThanOrEqualTo] = opts[:time_observed_greater_than_or_equal_to] if opts[:time_observed_greater_than_or_equal_to]
      query_params[:timeObservedLessThan] = opts[:time_observed_less_than] if opts[:time_observed_less_than]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_waf_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::WafRequest>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the Web Application Firewall traffic data for a WAAS policy.
    # Sorted by `timeObserved` in ascending order (starting from oldest data).
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [DateTime] :time_observed_greater_than_or_equal_to A filter that limits returned events to those occurring on or after a date and time, specified in RFC 3339 format. If unspecified, defaults to 30 minutes before receipt of the request.
    # @option opts [DateTime] :time_observed_less_than A filter that limits returned events to those occurring before a date and time, specified in RFC 3339 format.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::WafTrafficDatum WafTrafficDatum}>
    def list_waf_traffic(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_waf_traffic.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_waf_traffic." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/reports/waf/traffic'.sub('{waasPolicyId}', waas_policy_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:timeObservedGreaterThanOrEqualTo] = opts[:time_observed_greater_than_or_equal_to] if opts[:time_observed_greater_than_or_equal_to]
      query_params[:timeObservedLessThan] = opts[:time_observed_less_than] if opts[:time_observed_less_than]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_waf_traffic') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::WafTrafficDatum>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the list of whitelists defined in the Web Application Firewall configuration for a WAAS policy.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::Whitelist Whitelist}>
    def list_whitelists(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_whitelists.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_whitelists." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/whitelists'.sub('{waasPolicyId}', waas_policy_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_whitelists') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::Whitelist>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of subnets (CIDR notation) from which the WAAS EDGE may make requests. The subnets are owned by OCI and forward traffic to your origins. Allow traffic from these subnets to your origins. They are not associated with specific regions or compartments.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the policy.
    # @param [String] compartment_id The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment. This number is generated when the compartment is created.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated call. In unspecified, defaults to `10`. (default to 10)
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous paginated call.
    # @option opts [String] :sort_by The value by which work requests are sorted in a paginated 'List' call. If unspecified, defaults to `timeAccepted`.
    #   Allowed values are: id, status, timeAccepted, timeStarted, timeFinished, operationType
    # @option opts [String] :sort_order The value of the sorting direction of resources in a paginated 'List' call. If unspecified, defaults to `DESC`.
    #   Allowed values are: ASC, DESC
    # @return [Response] A Response object with data of type Array<{OCI::Waas::Models::WorkRequestSummary WorkRequestSummary}>
    def list_work_requests(waas_policy_id, compartment_id, opts = {})
      logger.debug 'Calling operation WaasClient#list_work_requests.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling list_work_requests." if waas_policy_id.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_work_requests." if compartment_id.nil?

      if opts[:sort_by] && !%w[id status timeAccepted timeStarted timeFinished operationType].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of id, status, timeAccepted, timeStarted, timeFinished, operationType.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/workRequests'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:waasPolicyId] = waas_policy_id
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#list_work_requests') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Waas::Models::WorkRequestSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Accepts a list of resources that will get it's cache purged. If resources property is not passed, then the entire cache for Web Application will be purged.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @option opts [OCI::Waas::Models::PurgeCache] :purge_cache
    # @return [Response] A Response object with data of type nil
    def purge_cache(waas_policy_id, opts = {})
      logger.debug 'Calling operation WaasClient#purge_cache.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling purge_cache." if waas_policy_id.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/actions/purgeCache'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(opts[:purge_cache])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#purge_cache') do
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


    # Updates the list of access rules in the Web Application Firewall configuration for a specified WAAS policy. Access rules allow explicit actions to be defined and executed for requests that meet various conditions. A rule action can be set to allow, detect, or block requests. The detect setting allows the request to pass through the Web Application Firewall and is tagged with a `DETECT` flag in the Web Application Firewall's log.
    #
    # This operation can create, delete, update, and/or reorder access rules depending on the structure of the request body.
    #
    # Access rules can be updated by changing the properties of the access rule object with the rule's key specified in the key field. Access rules can be reordered by changing the order of the access rules in the list when updating.
    #
    # Access rules can be created by adding a new access rule object to the list without a `key` property specified. A `key` will be generated for the new access rule upon update.
    #
    # Any existing access rules that are not specified with a `key` in the list of access rules will be deleted upon update.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::AccessRule>] access_rules
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_access_rules(waas_policy_id, access_rules, opts = {})
      logger.debug 'Calling operation WaasClient#update_access_rules.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_access_rules." if waas_policy_id.nil?
      raise "Missing the required parameter 'access_rules' when calling update_access_rules." if access_rules.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/accessRules'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(access_rules)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_access_rules') do
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


    # Updates the details of an address list. Only the fields specified in the request body will be updated; all other properties will remain unchanged.
    # @param [String] address_list_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the address list. This number is generated when the address list is added to the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @option opts [OCI::Waas::Models::UpdateAddressListDetails] :update_address_list_details The details of the address list to update.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::AddressList AddressList}
    def update_address_list(address_list_id, opts = {})
      logger.debug 'Calling operation WaasClient#update_address_list.' if logger

      raise "Missing the required parameter 'address_list_id' when calling update_address_list." if address_list_id.nil?
      raise "Parameter value for 'address_list_id' must not be blank" if OCI::Internal::Util.blank_string?(address_list_id)

      path = '/addressLists/{addressListId}'.sub('{addressListId}', address_list_id.to_s)
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

      post_body = @api_client.object_to_http_body(opts[:update_address_list_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_address_list') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::AddressList'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the configuration for each specified caching rule.
    # This operation can update or delete caching rules depending on the structure of the request body.
    # Caching rules can be updated by changing the properties of the caching rule object with the rule's key specified in the key field.
    # Any existing caching rules that are not specified with a key in the list of access rules will be deleted upon update.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::CachingRule>] caching_rules_details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_caching_rules(waas_policy_id, caching_rules_details, opts = {})
      logger.debug 'Calling operation WaasClient#update_caching_rules.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_caching_rules." if waas_policy_id.nil?
      raise "Missing the required parameter 'caching_rules_details' when calling update_caching_rules." if caching_rules_details.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/cachingRules'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(caching_rules_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_caching_rules') do
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


    # Updates the list of CAPTCHA challenges in the Web Application Firewall configuration for a WAAS policy.
    # This operation can create, update, or delete CAPTCHAs depending on the structure of the request body.
    # CAPTCHA challenges can be updated by changing the properties of the CAPTCHA object with the rule's key specified in the key field. CAPTCHA challenges can be reordered by changing the order of the CAPTCHA challenges in the list when updating.
    #
    # CAPTCHA challenges can be created by adding a new access rule object to the list without a `key` property specified. A `key` will be generated for the new CAPTCHA challenges upon update.
    #
    # Any existing CAPTCHA challenges that are not specified with a `key` in the list of CAPTCHA challenges will be deleted upon update.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::Captcha>] captchas A list of CAPTCHA details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_captchas(waas_policy_id, captchas, opts = {})
      logger.debug 'Calling operation WaasClient#update_captchas.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_captchas." if waas_policy_id.nil?
      raise "Missing the required parameter 'captchas' when calling update_captchas." if captchas.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/captchas'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(captchas)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_captchas') do
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


    # It is not possible to update a certificate, only create and delete. Therefore, this operation can only update the display name, freeform tags, and defined tags of a certificate.
    # @param [String] certificate_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SSL certificate used in the WAAS policy. This number is generated when the certificate is added to the policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @option opts [OCI::Waas::Models::UpdateCertificateDetails] :update_certificate_details The new display name, freeform tags, and defined tags to apply to a certificate.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::Certificate Certificate}
    def update_certificate(certificate_id, opts = {})
      logger.debug 'Calling operation WaasClient#update_certificate.' if logger

      raise "Missing the required parameter 'certificate_id' when calling update_certificate." if certificate_id.nil?
      raise "Parameter value for 'certificate_id' must not be blank" if OCI::Internal::Util.blank_string?(certificate_id)

      path = '/certificates/{certificateId}'.sub('{certificateId}', certificate_id.to_s)
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

      post_body = @api_client.object_to_http_body(opts[:update_certificate_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_certificate') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::Certificate'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the details of a Custom Protection rule. Only the fields specified in the request body will be updated; all other properties will remain unchanged.
    # @param [String] custom_protection_rule_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Custom Protection rule. This number is generated when the Custom Protection rule is added to the compartment.
    # @param [OCI::Waas::Models::UpdateCustomProtectionRuleDetails] update_custom_protection_rule_details The details of the Custom Protection rule to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type {OCI::Waas::Models::CustomProtectionRule CustomProtectionRule}
    def update_custom_protection_rule(custom_protection_rule_id, update_custom_protection_rule_details, opts = {})
      logger.debug 'Calling operation WaasClient#update_custom_protection_rule.' if logger

      raise "Missing the required parameter 'custom_protection_rule_id' when calling update_custom_protection_rule." if custom_protection_rule_id.nil?
      raise "Missing the required parameter 'update_custom_protection_rule_details' when calling update_custom_protection_rule." if update_custom_protection_rule_details.nil?
      raise "Parameter value for 'custom_protection_rule_id' must not be blank" if OCI::Internal::Util.blank_string?(custom_protection_rule_id)

      path = '/customProtectionRules/{customProtectionRuleId}'.sub('{customProtectionRuleId}', custom_protection_rule_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_custom_protection_rule_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_custom_protection_rule') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Waas::Models::CustomProtectionRule'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the Device Fingerprint Challenge (DFC) settings in the Web Application Firewall configuration for a policy. The DFC generates a hashed signature of both virtual and real browsers based on 50+ attributes. These proprietary signatures are then leveraged for real-time correlation to identify and block malicious bots.
    #
    # The signature is based on a library of attributes detected via JavaScript listeners; the attributes include OS, screen resolution, fonts, UserAgent, IP address, etc. We are constantly making improvements and considering new libraries to include in our DFC build. We can also exclude attributes from the signature as needed.
    #
    # DFC collects attributes to generate a hashed signature about a client \u2013 if a fingerprint is not possible, then it will result in a block or alert action. Actions can be enforced across multiple devices if they share they have the same fingerprint.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::DeviceFingerprintChallenge] update_device_fingerprint_challenge_details The device fingerprint challenge settings to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_device_fingerprint_challenge(waas_policy_id, update_device_fingerprint_challenge_details, opts = {})
      logger.debug 'Calling operation WaasClient#update_device_fingerprint_challenge.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_device_fingerprint_challenge." if waas_policy_id.nil?
      raise "Missing the required parameter 'update_device_fingerprint_challenge_details' when calling update_device_fingerprint_challenge." if update_device_fingerprint_challenge_details.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/deviceFingerprintChallenge'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_device_fingerprint_challenge_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_device_fingerprint_challenge') do
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


    # Updates the list of good bots in the Web Application Firewall configuration for a policy. Only the fields specified in the request body will be updated, all other configuration properties will remain unchanged.
    #
    # Good bots allows you to manage access for bots from known providers, such as Google or Baidu. For more information about good bots, see [Bot Management](https://docs.cloud.oracle.com/iaas/Content/WAF/Tasks/botmanagement.htm).
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::GoodBot>] good_bots
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_good_bots(waas_policy_id, good_bots, opts = {})
      logger.debug 'Calling operation WaasClient#update_good_bots.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_good_bots." if waas_policy_id.nil?
      raise "Missing the required parameter 'good_bots' when calling update_good_bots." if good_bots.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/goodBots'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(good_bots)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_good_bots') do
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


    # Updates the Human Interaction Challenge (HIC) settings in the Web Application Firewall configuration for a WAAS policy. HIC is a countermeasure that allows the proxy to check the user's browser for various behaviors that distinguish a human presence from a bot.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::HumanInteractionChallenge] update_human_interaction_challenge_details The human interaction challenge settings.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_human_interaction_challenge(waas_policy_id, update_human_interaction_challenge_details, opts = {})
      logger.debug 'Calling operation WaasClient#update_human_interaction_challenge.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_human_interaction_challenge." if waas_policy_id.nil?
      raise "Missing the required parameter 'update_human_interaction_challenge_details' when calling update_human_interaction_challenge." if update_human_interaction_challenge_details.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/humanInteractionChallenge'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_human_interaction_challenge_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_human_interaction_challenge') do
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


    # Updates the JavaScript challenge settings in the Web Application Firewall configuration for a WAAS policy. JavaScript Challenge validates that the client can accept JavaScript with a binary decision. For more information, see [Bot Management](https://docs.cloud.oracle.com/iaas/Content/WAF/Tasks/botmanagement.htm).
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::JsChallenge] update_js_challenge_details The JavaScript challenge settings to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_js_challenge(waas_policy_id, update_js_challenge_details, opts = {})
      logger.debug 'Calling operation WaasClient#update_js_challenge.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_js_challenge." if waas_policy_id.nil?
      raise "Missing the required parameter 'update_js_challenge_details' when calling update_js_challenge." if update_js_challenge_details.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/jsChallenge'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_js_challenge_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_js_challenge') do
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


    # Updates the configuration for a WAAS policy. Only the fields specified in the request body will be updated; all other properties will remain unchanged.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::PolicyConfig] update_policy_config_details The new configuration to apply to a WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_policy_config(waas_policy_id, update_policy_config_details, opts = {})
      logger.debug 'Calling operation WaasClient#update_policy_config.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_policy_config." if waas_policy_id.nil?
      raise "Missing the required parameter 'update_policy_config_details' when calling update_policy_config." if update_policy_config_details.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/policyConfig'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_policy_config_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_policy_config') do
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


    # Updates the action for each specified protection rule. Requests can either be allowed, blocked, or trigger an alert if they meet the parameters of an applied rule. For more information on protection rules, see [WAF Protection Rules](https://docs.cloud.oracle.com/iaas/Content/WAF/Tasks/wafprotectionrules.htm).
    # This operation can update or disable protection rules depending on the structure of the request body.
    # Protection rules can be updated by changing the properties of the protection rule object with the rule's key specified in the key field.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::ProtectionRuleAction>] protection_rules
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_protection_rules(waas_policy_id, protection_rules, opts = {})
      logger.debug 'Calling operation WaasClient#update_protection_rules.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_protection_rules." if waas_policy_id.nil?
      raise "Missing the required parameter 'protection_rules' when calling update_protection_rules." if protection_rules.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/protectionRules'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(protection_rules)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_protection_rules') do
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


    # Updates the protection settings in the Web Application Firewall configuration for a WAAS policy. Protection settings allow you define what action is taken when a request is blocked by the Web Application Firewall, such as returning a response code or block page. Only the fields specified in the request body will be updated; all other fields will remain unchanged.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::ProtectionSettings] update_protection_settings_details The details of the protection settings to be updated.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_protection_settings(waas_policy_id, update_protection_settings_details, opts = {})
      logger.debug 'Calling operation WaasClient#update_protection_settings.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_protection_settings." if waas_policy_id.nil?
      raise "Missing the required parameter 'update_protection_settings_details' when calling update_protection_settings." if update_protection_settings_details.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/protectionSettings'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_protection_settings_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_protection_settings') do
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


    # Updates the action to take when a request's IP address matches an address in the specified threat intelligence feed. Threat intelligence feeds are compiled lists of IP addresses with malicious reputations based on internet intelligence. Only the threat feeds specified in the request body will be updated; all other threat feeds will remain unchanged.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::ThreatFeedAction>] threat_feeds A list of threat feeds for which to update the actions.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_threat_feeds(waas_policy_id, threat_feeds, opts = {})
      logger.debug 'Calling operation WaasClient#update_threat_feeds.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_threat_feeds." if waas_policy_id.nil?
      raise "Missing the required parameter 'threat_feeds' when calling update_threat_feeds." if threat_feeds.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/threatFeeds'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(threat_feeds)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_threat_feeds') do
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


    # Updates the details of a WAAS policy, including origins and tags. Only the fields specified in the request body will be updated; all other properties will remain unchanged.
    # To update platform provided resources such as `GoodBots`, `ProtectionRules`, and `ThreatFeeds`, first retrieve the list of available resources with the related list operation such as `GetThreatFeeds` or `GetProtectionRules`.
    # The returned list will contain objects with `key` properties that can be used to update the resource during the `UpdateWaasPolicy` request.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::UpdateWaasPolicyDetails] update_waas_policy_details The details of the WAAS policy to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_waas_policy(waas_policy_id, update_waas_policy_details, opts = {})
      logger.debug 'Calling operation WaasClient#update_waas_policy.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_waas_policy." if waas_policy_id.nil?
      raise "Missing the required parameter 'update_waas_policy_details' when calling update_waas_policy." if update_waas_policy_details.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_waas_policy_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_waas_policy') do
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


    # Updates the action for each specified custom protection rule. Only the `DETECT` and `BLOCK` actions can be set. Disabled rules should not be included in the list. For more information on protection rules, see [WAF Protection Rules](https://docs.cloud.oracle.com/iaas/Content/WAF/Tasks/wafprotectionrules.htm).
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::CustomProtectionRuleSetting>] update_custom_protection_rules_details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_waas_policy_custom_protection_rules(waas_policy_id, update_custom_protection_rules_details, opts = {})
      logger.debug 'Calling operation WaasClient#update_waas_policy_custom_protection_rules.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_waas_policy_custom_protection_rules." if waas_policy_id.nil?
      raise "Missing the required parameter 'update_custom_protection_rules_details' when calling update_waas_policy_custom_protection_rules." if update_custom_protection_rules_details.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/customProtectionRules'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_custom_protection_rules_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_waas_policy_custom_protection_rules') do
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


    # Updates the address rate limiting settings in the Web Application Firewall configuration for a policy. Rate limiting allows you to configure a threshold for the number of requests from a unique IP address for the given period. You can also define the response code for the requests from the same address that exceed the threshold.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::AddressRateLimiting] update_waf_address_rate_limiting_details The address rate limiting settings.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_waf_address_rate_limiting(waas_policy_id, update_waf_address_rate_limiting_details, opts = {})
      logger.debug 'Calling operation WaasClient#update_waf_address_rate_limiting.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_waf_address_rate_limiting." if waas_policy_id.nil?
      raise "Missing the required parameter 'update_waf_address_rate_limiting_details' when calling update_waf_address_rate_limiting." if update_waf_address_rate_limiting_details.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/addressRateLimiting'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_waf_address_rate_limiting_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_waf_address_rate_limiting') do
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


    # Updates the Web Application Firewall configuration for a specified WAAS policy.
    #
    # To update platform provided resources such as `GoodBots`, `ProtectionRules`, and `ThreatFeeds`,
    # first retrieve the list of available resources with the related list operation, such as
    # `GetThreatFeeds` or `GetProtectionRules`.
    #
    # The returned list will contain objects with `key` properties that can be used to update the
    # resource during the `UpdateWafConfig` request.
    #
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [OCI::Waas::Models::WafConfig] update_waf_config_details The new Web Application Firewall configuration to apply to a WAAS policy.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_waf_config(waas_policy_id, update_waf_config_details, opts = {})
      logger.debug 'Calling operation WaasClient#update_waf_config.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_waf_config." if waas_policy_id.nil?
      raise "Missing the required parameter 'update_waf_config_details' when calling update_waf_config." if update_waf_config_details.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_waf_config_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_waf_config') do
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


    # Updates the list of IP addresses that bypass the Web Application Firewall for a WAAS policy. Supports both single IP addresses or subnet masks (CIDR notation).
    #
    # This operation can create, delete, update, and/or reorder whitelists depending on the structure of the request body.
    #
    # Whitelists can be updated by changing the properties of the whitelist object with the rule's key specified in the `key` field. Whitelists can be reordered by changing the order of the whitelists in the list of objects when updating.
    #
    # Whitelists can be created by adding a new whitelist object to the list without a `key` property specified. A `key` will be generated for the new whitelist upon update.
    #
    # Whitelists can be deleted by removing the existing whitelist object from the list. Any existing whitelists that are not specified with a `key` in the list of access rules will be deleted upon update.
    # @param [String] waas_policy_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the WAAS policy.
    # @param [Array<OCI::Waas::Models::OCI::Waas::Models::Whitelist>] whitelists
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about a particular request, please provide the request ID.
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or server error without risk of executing that same action again. Retry tokens expire after 24 hours, but can be invalidated before then due to conflicting operations
    #   *Example:* If a resource has been deleted and purged from the system, then a retry of the original delete request may be rejected.
    # @option opts [String] :if_match For optimistic concurrency control. In the `PUT` or `DELETE` call for a resource, set the `if-match` parameter to the value of the etag from a previous `GET` or `POST` response for that resource. The resource will be updated or deleted only if the etag provided matches the resource's current etag value.
    # @return [Response] A Response object with data of type nil
    def update_whitelists(waas_policy_id, whitelists, opts = {})
      logger.debug 'Calling operation WaasClient#update_whitelists.' if logger

      raise "Missing the required parameter 'waas_policy_id' when calling update_whitelists." if waas_policy_id.nil?
      raise "Missing the required parameter 'whitelists' when calling update_whitelists." if whitelists.nil?
      raise "Parameter value for 'waas_policy_id' must not be blank" if OCI::Internal::Util.blank_string?(waas_policy_id)

      path = '/waasPolicies/{waasPolicyId}/wafConfig/whitelists'.sub('{waasPolicyId}', waas_policy_id.to_s)
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

      post_body = @api_client.object_to_http_body(whitelists)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'WaasClient#update_whitelists') do
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
