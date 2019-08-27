# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A description of the DTS API
  class Dts::TransferPackageClient
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


    # Creates a new TransferPackageClient.
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
      logger.info "TransferPackageClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://datatransfer.{region}.{secondLevelDomain}') + '/20171001'
      logger.info "TransferPackageClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Attaches Devices to a Transfer Package
    # @param [String] id ID of the Transfer Job
    # @param [String] transfer_package_label Label of the Transfer Package
    # @param [OCI::Dts::Models::AttachDevicesDetails] attach_devices_details Labels of Transfer Devices to attach
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type nil
    def attach_devices_to_transfer_package(id, transfer_package_label, attach_devices_details, opts = {})
      logger.debug 'Calling operation TransferPackageClient#attach_devices_to_transfer_package.' if logger

      raise "Missing the required parameter 'id' when calling attach_devices_to_transfer_package." if id.nil?
      raise "Missing the required parameter 'transfer_package_label' when calling attach_devices_to_transfer_package." if transfer_package_label.nil?
      raise "Missing the required parameter 'attach_devices_details' when calling attach_devices_to_transfer_package." if attach_devices_details.nil?
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)
      raise "Parameter value for 'transfer_package_label' must not be blank" if OCI::Internal::Util.blank_string?(transfer_package_label)

      path = '/transferJobs/{id}/transferPackages/{transferPackageLabel}/actions/attachDevices'.sub('{id}', id.to_s).sub('{transferPackageLabel}', transfer_package_label.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(attach_devices_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferPackageClient#attach_devices_to_transfer_package') do
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


    # Create a new Transfer Package
    # @param [String] id ID of the Transfer Job
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token
    # @option opts [OCI::Dts::Models::CreateTransferPackageDetails] :create_transfer_package_details Creates a New Transfer Package
    # @return [Response] A Response object with data of type {OCI::Dts::Models::TransferPackage TransferPackage}
    def create_transfer_package(id, opts = {})
      logger.debug 'Calling operation TransferPackageClient#create_transfer_package.' if logger

      raise "Missing the required parameter 'id' when calling create_transfer_package." if id.nil?
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)

      path = '/transferJobs/{id}/transferPackages'.sub('{id}', id.to_s)
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

      post_body = @api_client.object_to_http_body(opts[:create_transfer_package_details])

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferPackageClient#create_transfer_package') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dts::Models::TransferPackage'
        )
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


    # deletes a transfer Package
    # @param [String] id ID of the Transfer Job
    # @param [String] transfer_package_label Label of the Transfer Package
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type nil
    def delete_transfer_package(id, transfer_package_label, opts = {})
      logger.debug 'Calling operation TransferPackageClient#delete_transfer_package.' if logger

      raise "Missing the required parameter 'id' when calling delete_transfer_package." if id.nil?
      raise "Missing the required parameter 'transfer_package_label' when calling delete_transfer_package." if transfer_package_label.nil?
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)
      raise "Parameter value for 'transfer_package_label' must not be blank" if OCI::Internal::Util.blank_string?(transfer_package_label)

      path = '/transferJobs/{id}/transferPackages/{transferPackageLabel}'.sub('{id}', id.to_s).sub('{transferPackageLabel}', transfer_package_label.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferPackageClient#delete_transfer_package') do
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


    # Detaches Devices from a Transfer Package
    # @param [String] id ID of the Transfer Job
    # @param [String] transfer_package_label Label of the Transfer Package
    # @param [OCI::Dts::Models::DetachDevicesDetails] detach_devices_details Labels of Transfer Devices to detach
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type nil
    def detach_devices_from_transfer_package(id, transfer_package_label, detach_devices_details, opts = {})
      logger.debug 'Calling operation TransferPackageClient#detach_devices_from_transfer_package.' if logger

      raise "Missing the required parameter 'id' when calling detach_devices_from_transfer_package." if id.nil?
      raise "Missing the required parameter 'transfer_package_label' when calling detach_devices_from_transfer_package." if transfer_package_label.nil?
      raise "Missing the required parameter 'detach_devices_details' when calling detach_devices_from_transfer_package." if detach_devices_details.nil?
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)
      raise "Parameter value for 'transfer_package_label' must not be blank" if OCI::Internal::Util.blank_string?(transfer_package_label)

      path = '/transferJobs/{id}/transferPackages/{transferPackageLabel}/actions/detachDevices'.sub('{id}', id.to_s).sub('{transferPackageLabel}', transfer_package_label.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(detach_devices_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferPackageClient#detach_devices_from_transfer_package') do
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


    # Describes a transfer package in detail
    # @param [String] id ID of the Transfer Job
    # @param [String] transfer_package_label Label of the Transfer Package
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @return [Response] A Response object with data of type {OCI::Dts::Models::TransferPackage TransferPackage}
    def get_transfer_package(id, transfer_package_label, opts = {})
      logger.debug 'Calling operation TransferPackageClient#get_transfer_package.' if logger

      raise "Missing the required parameter 'id' when calling get_transfer_package." if id.nil?
      raise "Missing the required parameter 'transfer_package_label' when calling get_transfer_package." if transfer_package_label.nil?
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)
      raise "Parameter value for 'transfer_package_label' must not be blank" if OCI::Internal::Util.blank_string?(transfer_package_label)

      path = '/transferJobs/{id}/transferPackages/{transferPackageLabel}'.sub('{id}', id.to_s).sub('{transferPackageLabel}', transfer_package_label.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferPackageClient#get_transfer_package') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dts::Models::TransferPackage'
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


    # Lists Transfer Packages associated with a transferJob
    # @param [String] id ID of the Transfer Job
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state filtering by lifecycleState
    #   Allowed values are: PREPARING, SHIPPING, RECEIVED, PROCESSING, PROCESSED, RETURNED, DELETED, CANCELLED, CANCELLED_RETURNED
    # @option opts [String] :display_name filtering by displayName
    # @return [Response] A Response object with data of type {OCI::Dts::Models::MultipleTransferPackages MultipleTransferPackages}
    def list_transfer_packages(id, opts = {})
      logger.debug 'Calling operation TransferPackageClient#list_transfer_packages.' if logger

      raise "Missing the required parameter 'id' when calling list_transfer_packages." if id.nil?

      if opts[:lifecycle_state] && !%w[PREPARING SHIPPING RECEIVED PROCESSING PROCESSED RETURNED DELETED CANCELLED CANCELLED_RETURNED].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of PREPARING, SHIPPING, RECEIVED, PROCESSING, PROCESSED, RETURNED, DELETED, CANCELLED, CANCELLED_RETURNED.'
      end
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)

      path = '/transferJobs/{id}/transferPackages'.sub('{id}', id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferPackageClient#list_transfer_packages') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dts::Models::MultipleTransferPackages'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a Transfer Package
    # @param [String] id ID of the Transfer Job
    # @param [String] transfer_package_label Label of the Transfer Package
    # @param [OCI::Dts::Models::UpdateTransferPackageDetails] update_transfer_package_details fields to update
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The entity tag to match. Optional, if set, the update will be successful only if the
    #   object's tag matches the tag specified in the request.
    #
    # @return [Response] A Response object with data of type {OCI::Dts::Models::TransferPackage TransferPackage}
    def update_transfer_package(id, transfer_package_label, update_transfer_package_details, opts = {})
      logger.debug 'Calling operation TransferPackageClient#update_transfer_package.' if logger

      raise "Missing the required parameter 'id' when calling update_transfer_package." if id.nil?
      raise "Missing the required parameter 'transfer_package_label' when calling update_transfer_package." if transfer_package_label.nil?
      raise "Missing the required parameter 'update_transfer_package_details' when calling update_transfer_package." if update_transfer_package_details.nil?
      raise "Parameter value for 'id' must not be blank" if OCI::Internal::Util.blank_string?(id)
      raise "Parameter value for 'transfer_package_label' must not be blank" if OCI::Internal::Util.blank_string?(transfer_package_label)

      path = '/transferJobs/{id}/transferPackages/{transferPackageLabel}'.sub('{id}', id.to_s).sub('{transferPackageLabel}', transfer_package_label.to_s)
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

      post_body = @api_client.object_to_http_body(update_transfer_package_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'TransferPackageClient#update_transfer_package') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Dts::Models::TransferPackage'
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
