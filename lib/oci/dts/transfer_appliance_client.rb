# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A description of the DTS API
  class Dts::TransferApplianceClient
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


    # Creates a new TransferApplianceClient.
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
        @endpoint = endpoint + '/20171001'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "TransferApplianceClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://datatransfer.{region}.{secondLevelDomain}') + '/20171001'
      logger.info "TransferApplianceClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Create a new Transfer Appliance
    # @param [String] id ID of the Transfer Job
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token
    # @option opts [OCI::Dts::Models::CreateTransferApplianceDetails] :create_transfer_appliance_details Creates a New Transfer Appliance
    # @return [Response] A Response object with data of type {OCI::Dts::Models::TransferAppliance TransferAppliance}
    def create_transfer_appliance(id, opts = {})
      logger.debug 'Calling operation TransferApplianceClient#create_transfer_appliance.' if logger

      raise "Missing the required parameter 'id' when calling create_transfer_appliance." if id.nil?
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)

      path = '/transferJobs/{id}/transferAppliances'.sub('{id}', id.to_s)
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

      post_body = @api_client.object_to_http_body(opts[:create_transfer_appliance_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferApplianceClient#create_transfer_appliance') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dts::Models::TransferAppliance'
        )
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


    # Creates an X.509 certificate from a public key
    # @param [String] id ID of the Transfer Job
    # @param [String] transfer_appliance_label Label of the Transfer Appliance
    # @param [OCI::Dts::Models::TransferAppliancePublicKey] admin_public_key
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Dts::Models::TransferApplianceCertificate TransferApplianceCertificate}
    def create_transfer_appliance_admin_credentials(id, transfer_appliance_label, admin_public_key, opts = {})
      logger.debug 'Calling operation TransferApplianceClient#create_transfer_appliance_admin_credentials.' if logger

      raise "Missing the required parameter 'id' when calling create_transfer_appliance_admin_credentials." if id.nil?
      raise "Missing the required parameter 'transfer_appliance_label' when calling create_transfer_appliance_admin_credentials." if transfer_appliance_label.nil?
      raise "Missing the required parameter 'admin_public_key' when calling create_transfer_appliance_admin_credentials." if admin_public_key.nil?
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)
      raise "Parameter value for 'transfer_appliance_label' must not be blank" if OCI::Internal::Util.blank_string?(transfer_appliance_label)

      path = '/transferJobs/{id}/transferAppliances/{transferApplianceLabel}/admin_credentials'.sub('{id}', id.to_s).sub('{transferApplianceLabel}', transfer_appliance_label.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(admin_public_key)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferApplianceClient#create_transfer_appliance_admin_credentials') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dts::Models::TransferApplianceCertificate'
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


    # deletes a transfer Appliance
    # @param [String] id ID of the Transfer Job
    # @param [String] transfer_appliance_label Label of the Transfer Appliance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type nil
    def delete_transfer_appliance(id, transfer_appliance_label, opts = {})
      logger.debug 'Calling operation TransferApplianceClient#delete_transfer_appliance.' if logger

      raise "Missing the required parameter 'id' when calling delete_transfer_appliance." if id.nil?
      raise "Missing the required parameter 'transfer_appliance_label' when calling delete_transfer_appliance." if transfer_appliance_label.nil?
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)
      raise "Parameter value for 'transfer_appliance_label' must not be blank" if OCI::Internal::Util.blank_string?(transfer_appliance_label)

      path = '/transferJobs/{id}/transferAppliances/{transferApplianceLabel}'.sub('{id}', id.to_s).sub('{transferApplianceLabel}', transfer_appliance_label.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferApplianceClient#delete_transfer_appliance') do
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
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Describes a transfer appliance in detail
    # @param [String] id ID of the Transfer Job
    # @param [String] transfer_appliance_label Label of the Transfer Appliance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Dts::Models::TransferAppliance TransferAppliance}
    def get_transfer_appliance(id, transfer_appliance_label, opts = {})
      logger.debug 'Calling operation TransferApplianceClient#get_transfer_appliance.' if logger

      raise "Missing the required parameter 'id' when calling get_transfer_appliance." if id.nil?
      raise "Missing the required parameter 'transfer_appliance_label' when calling get_transfer_appliance." if transfer_appliance_label.nil?
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)
      raise "Parameter value for 'transfer_appliance_label' must not be blank" if OCI::Internal::Util.blank_string?(transfer_appliance_label)

      path = '/transferJobs/{id}/transferAppliances/{transferApplianceLabel}'.sub('{id}', id.to_s).sub('{transferApplianceLabel}', transfer_appliance_label.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferApplianceClient#get_transfer_appliance') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dts::Models::TransferAppliance'
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


    # Gets the x.509 certificate for the Transfer Appliance's dedicated Certificate Authority (CA)
    # @param [String] id ID of the Transfer Job
    # @param [String] transfer_appliance_label Label of the Transfer Appliance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Dts::Models::TransferApplianceCertificate TransferApplianceCertificate}
    def get_transfer_appliance_certificate_authority_certificate(id, transfer_appliance_label, opts = {})
      logger.debug 'Calling operation TransferApplianceClient#get_transfer_appliance_certificate_authority_certificate.' if logger

      raise "Missing the required parameter 'id' when calling get_transfer_appliance_certificate_authority_certificate." if id.nil?
      raise "Missing the required parameter 'transfer_appliance_label' when calling get_transfer_appliance_certificate_authority_certificate." if transfer_appliance_label.nil?
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)
      raise "Parameter value for 'transfer_appliance_label' must not be blank" if OCI::Internal::Util.blank_string?(transfer_appliance_label)

      path = '/transferJobs/{id}/transferAppliances/{transferApplianceLabel}/certificate_authority_certificate'.sub('{id}', id.to_s).sub('{transferApplianceLabel}', transfer_appliance_label.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferApplianceClient#get_transfer_appliance_certificate_authority_certificate') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dts::Models::TransferApplianceCertificate'
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


    # Describes a transfer appliance encryptionPassphrase in detail
    # @param [String] id ID of the Transfer Job
    # @param [String] transfer_appliance_label Label of the Transfer Appliance
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Dts::Models::TransferApplianceEncryptionPassphrase TransferApplianceEncryptionPassphrase}
    def get_transfer_appliance_encryption_passphrase(id, transfer_appliance_label, opts = {})
      logger.debug 'Calling operation TransferApplianceClient#get_transfer_appliance_encryption_passphrase.' if logger

      raise "Missing the required parameter 'id' when calling get_transfer_appliance_encryption_passphrase." if id.nil?
      raise "Missing the required parameter 'transfer_appliance_label' when calling get_transfer_appliance_encryption_passphrase." if transfer_appliance_label.nil?
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)
      raise "Parameter value for 'transfer_appliance_label' must not be blank" if OCI::Internal::Util.blank_string?(transfer_appliance_label)

      path = '/transferJobs/{id}/transferAppliances/{transferApplianceLabel}/encryptionPassphrase'.sub('{id}', id.to_s).sub('{transferApplianceLabel}', transfer_appliance_label.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferApplianceClient#get_transfer_appliance_encryption_passphrase') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dts::Models::TransferApplianceEncryptionPassphrase'
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


    # Lists Transfer Appliances associated with a transferJob
    # @param [String] id ID of the Transfer Job
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state filtering by lifecycleState
    #   Allowed values are: REQUESTED, ORACLE_PREPARING, SHIPPING, DELIVERED, PREPARING, RETURN_SHIPPED, RETURN_SHIPPED_CANCELLED, ORACLE_RECEIVED, ORACLE_RECEIVED_CANCELLED, PROCESSING, COMPLETE, CUSTOMER_NEVER_RECEIVED, ORACLE_NEVER_RECEIVED, CUSTOMER_LOST, CANCELLED, DELETED, REJECTED, ERROR
    # @return [Response] A Response object with data of type {OCI::Dts::Models::MultipleTransferAppliances MultipleTransferAppliances}
    def list_transfer_appliances(id, opts = {})
      logger.debug 'Calling operation TransferApplianceClient#list_transfer_appliances.' if logger

      raise "Missing the required parameter 'id' when calling list_transfer_appliances." if id.nil?

      if opts[:lifecycle_state] && !%w[REQUESTED ORACLE_PREPARING SHIPPING DELIVERED PREPARING RETURN_SHIPPED RETURN_SHIPPED_CANCELLED ORACLE_RECEIVED ORACLE_RECEIVED_CANCELLED PROCESSING COMPLETE CUSTOMER_NEVER_RECEIVED ORACLE_NEVER_RECEIVED CUSTOMER_LOST CANCELLED DELETED REJECTED ERROR].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of REQUESTED, ORACLE_PREPARING, SHIPPING, DELIVERED, PREPARING, RETURN_SHIPPED, RETURN_SHIPPED_CANCELLED, ORACLE_RECEIVED, ORACLE_RECEIVED_CANCELLED, PROCESSING, COMPLETE, CUSTOMER_NEVER_RECEIVED, ORACLE_NEVER_RECEIVED, CUSTOMER_LOST, CANCELLED, DELETED, REJECTED, ERROR.'
      end
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)

      path = '/transferJobs/{id}/transferAppliances'.sub('{id}', id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferApplianceClient#list_transfer_appliances') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dts::Models::MultipleTransferAppliances'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a Transfer Appliance
    # @param [String] id ID of the Transfer Job
    # @param [String] transfer_appliance_label Label of the Transfer Appliance
    # @param [OCI::Dts::Models::UpdateTransferApplianceDetails] update_transfer_appliance_details fields to update
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag to match. Optional, if set, the update will be successful only if the
    #   object's tag matches the tag specified in the request.
    #
    # @return [Response] A Response object with data of type {OCI::Dts::Models::TransferAppliance TransferAppliance}
    def update_transfer_appliance(id, transfer_appliance_label, update_transfer_appliance_details, opts = {})
      logger.debug 'Calling operation TransferApplianceClient#update_transfer_appliance.' if logger

      raise "Missing the required parameter 'id' when calling update_transfer_appliance." if id.nil?
      raise "Missing the required parameter 'transfer_appliance_label' when calling update_transfer_appliance." if transfer_appliance_label.nil?
      raise "Missing the required parameter 'update_transfer_appliance_details' when calling update_transfer_appliance." if update_transfer_appliance_details.nil?
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)
      raise "Parameter value for 'transfer_appliance_label' must not be blank" if OCI::Internal::Util.blank_string?(transfer_appliance_label)

      path = '/transferJobs/{id}/transferAppliances/{transferApplianceLabel}'.sub('{id}', id.to_s).sub('{transferApplianceLabel}', transfer_appliance_label.to_s)
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

      post_body = @api_client.object_to_http_body(update_transfer_appliance_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferApplianceClient#update_transfer_appliance') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dts::Models::TransferAppliance'
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
