# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # APIs for Networking Service, Compute Service, and Block Volume Service.
  class Core::ComputeClient
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

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines


    # Creates a new ComputeClient.
    # If a config is not specified, then the global OCI.config will be used.
    #
    # A region must be specified in either the config or the region parameter. If specified
    # in both, then the region parameter will be used.
    #
    # @param [Config] config A Config object.
    # @param [String] region A region used to determine the service endpoint. This will usually
    #   correspond to a value in {OCI::Regions::REGION_ENUM}, but may be an arbitrary string.
    # @param [OCI::BaseSigner] signer A signer implementation which can be used by this client. If this is not provided then
    #   a signer will be constructed via the provided config. One use case of this parameter is instance principals authentication,
    #   so that the instance principals signer can be provided to the client
    # @param [OCI::ApiClientProxySettings] proxy_settings If your environment requires you to use a proxy server for outgoing HTTP requests
    #   the details for the proxy can be provided in this parameter
    # @param [OCI::Retry::RetryConfig] retry_config The retry configuration for this service client. This represents the default retry configuration to
    #   apply across all operations. This can be overridden on a per-operation basis. The default retry configuration value is `nil`, which means that an operation
    #   will not perform any retries
    def initialize(config: nil, region: nil, signer: nil, proxy_settings: nil, retry_config: nil)
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

      region ||= config.region
      region ||= signer.region if signer.respond_to?(:region)
      self.region = region
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint(@region, :ComputeClient) + '/20160918'
      logger.info "ComputeClient endpoint set to '#{endpoint}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Attaches the specified boot volume to the specified instance.
    #
    # @param [OCI::Core::Models::AttachBootVolumeDetails] attach_boot_volume_details Attach boot volume request
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::BootVolumeAttachment BootVolumeAttachment}
    def attach_boot_volume(attach_boot_volume_details, opts = {})
      logger.debug 'Calling operation ComputeClient#attach_boot_volume.' if logger

      raise "Missing the required parameter 'attach_boot_volume_details' when calling attach_boot_volume." if attach_boot_volume_details.nil?

      path = '/bootVolumeAttachments/'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(attach_boot_volume_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#attach_boot_volume') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::BootVolumeAttachment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a secondary VNIC and attaches it to the specified instance.
    # For more information about secondary VNICs, see
    # [Virtual Network Interface Cards (VNICs)](https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Tasks/managingVNICs.htm).
    #
    # @param [OCI::Core::Models::AttachVnicDetails] attach_vnic_details Attach VNIC details.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::VnicAttachment VnicAttachment}
    def attach_vnic(attach_vnic_details, opts = {})
      logger.debug 'Calling operation ComputeClient#attach_vnic.' if logger

      raise "Missing the required parameter 'attach_vnic_details' when calling attach_vnic." if attach_vnic_details.nil?

      path = '/vnicAttachments/'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(attach_vnic_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#attach_vnic') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::VnicAttachment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Attaches the specified storage volume to the specified instance.
    #
    # @param [OCI::Core::Models::AttachVolumeDetails] attach_volume_details Attach volume request
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::VolumeAttachment VolumeAttachment}
    def attach_volume(attach_volume_details, opts = {})
      logger.debug 'Calling operation ComputeClient#attach_volume.' if logger

      raise "Missing the required parameter 'attach_volume_details' when calling attach_volume." if attach_volume_details.nil?

      path = '/volumeAttachments/'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(attach_volume_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#attach_volume') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::VolumeAttachment'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Captures the most recent serial console data (up to a megabyte) for the
    # specified instance.
    #
    # The `CaptureConsoleHistory` operation works with the other console history operations
    # as described below.
    #
    # 1. Use `CaptureConsoleHistory` to request the capture of up to a megabyte of the
    # most recent console history. This call returns a `ConsoleHistory`
    # object. The object will have a state of REQUESTED.
    # 2. Wait for the capture operation to succeed by polling `GetConsoleHistory` with
    # the identifier of the console history metadata. The state of the
    # `ConsoleHistory` object will go from REQUESTED to GETTING-HISTORY and
    # then SUCCEEDED (or FAILED).
    # 3. Use `GetConsoleHistoryContent` to get the actual console history data (not the
    # metadata).
    # 4. Optionally, use `DeleteConsoleHistory` to delete the console history metadata
    # and the console history data.
    #
    # @param [OCI::Core::Models::CaptureConsoleHistoryDetails] capture_console_history_details Console history details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::ConsoleHistory ConsoleHistory}
    def capture_console_history(capture_console_history_details, opts = {})
      logger.debug 'Calling operation ComputeClient#capture_console_history.' if logger

      raise "Missing the required parameter 'capture_console_history_details' when calling capture_console_history." if capture_console_history_details.nil?

      path = '/instanceConsoleHistories/'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(capture_console_history_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#capture_console_history') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::ConsoleHistory'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a boot disk image for the specified instance or imports an exported image from the Oracle Cloud Infrastructure Object Storage service.
    #
    # When creating a new image, you must provide the OCID of the instance you want to use as the basis for the image, and
    # the OCID of the compartment containing that instance. For more information about images,
    # see [Managing Custom Images](https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Tasks/managingcustomimages.htm).
    #
    # When importing an exported image from Object Storage, you specify the source information
    # in {#image_source_details image_source_details}.
    #
    # When importing an image based on the namespace, bucket name, and object name,
    # use {#image_source_via_object_storage_tuple_details image_source_via_object_storage_tuple_details}.
    #
    # When importing an image based on the Object Storage URL, use
    # {#image_source_via_object_storage_uri_details image_source_via_object_storage_uri_details}.
    # See [Object Storage URLs](https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Tasks/imageimportexport.htm#URLs) and [pre-authenticated requests](https://docs.us-phoenix-1.oraclecloud.com/Content/Object/Tasks/managingaccess.htm#pre-auth)
    # for constructing URLs for image import/export.
    #
    # For more information about importing exported images, see
    # [Image Import/Export](https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Tasks/imageimportexport.htm).
    #
    # You may optionally specify a *display name* for the image, which is simply a friendly name or description.
    # It does not have to be unique, and you can change it. See {#update_image update_image}.
    # Avoid entering confidential information.
    #
    # @param [OCI::Core::Models::CreateImageDetails] create_image_details Image creation details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Image Image}
    def create_image(create_image_details, opts = {})
      logger.debug 'Calling operation ComputeClient#create_image.' if logger

      raise "Missing the required parameter 'create_image_details' when calling create_image." if create_image_details.nil?

      path = '/images'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_image_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#create_image') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Image'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new console connection to the specified instance.
    # Once the console connection has been created and is available,
    # you connect to the console using SSH.
    #
    # For more information about console access, see [Accessing the Console](https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/References/serialconsole.htm).
    #
    # @param [OCI::Core::Models::CreateInstanceConsoleConnectionDetails] create_instance_console_connection_details Request object for creating an InstanceConsoleConnection
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstanceConsoleConnection InstanceConsoleConnection}
    def create_instance_console_connection(create_instance_console_connection_details, opts = {})
      logger.debug 'Calling operation ComputeClient#create_instance_console_connection.' if logger

      raise "Missing the required parameter 'create_instance_console_connection_details' when calling create_instance_console_connection." if create_instance_console_connection_details.nil?

      path = '/instanceConsoleConnections'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_instance_console_connection_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#create_instance_console_connection') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstanceConsoleConnection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the specified console history metadata and the console history data.
    # @param [String] instance_console_history_id The OCID of the console history.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_console_history(instance_console_history_id, opts = {})
      logger.debug 'Calling operation ComputeClient#delete_console_history.' if logger

      raise "Missing the required parameter 'instance_console_history_id' when calling delete_console_history." if instance_console_history_id.nil?
      raise "Parameter value for 'instance_console_history_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_console_history_id)

      path = '/instanceConsoleHistories/{instanceConsoleHistoryId}'.sub('{instanceConsoleHistoryId}', instance_console_history_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#delete_console_history') do
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


    # Deletes an image.
    # @param [String] image_id The OCID of the image.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_image(image_id, opts = {})
      logger.debug 'Calling operation ComputeClient#delete_image.' if logger

      raise "Missing the required parameter 'image_id' when calling delete_image." if image_id.nil?
      raise "Parameter value for 'image_id' must not be blank" if OCI::Internal::Util.blank_string?(image_id)

      path = '/images/{imageId}'.sub('{imageId}', image_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#delete_image') do
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


    # Deletes the specified instance console connection.
    # @param [String] instance_console_connection_id The OCID of the intance console connection
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_instance_console_connection(instance_console_connection_id, opts = {})
      logger.debug 'Calling operation ComputeClient#delete_instance_console_connection.' if logger

      raise "Missing the required parameter 'instance_console_connection_id' when calling delete_instance_console_connection." if instance_console_connection_id.nil?
      raise "Parameter value for 'instance_console_connection_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_console_connection_id)

      path = '/instanceConsoleConnections/{instanceConsoleConnectionId}'.sub('{instanceConsoleConnectionId}', instance_console_connection_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#delete_instance_console_connection') do
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


    # Detaches a boot volume from an instance. You must specify the OCID of the boot volume attachment.
    #
    # This is an asynchronous operation. The attachment's `lifecycleState` will change to DETACHING temporarily
    # until the attachment is completely removed.
    #
    # @param [String] boot_volume_attachment_id The OCID of the boot volume attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def detach_boot_volume(boot_volume_attachment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#detach_boot_volume.' if logger

      raise "Missing the required parameter 'boot_volume_attachment_id' when calling detach_boot_volume." if boot_volume_attachment_id.nil?
      raise "Parameter value for 'boot_volume_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(boot_volume_attachment_id)

      path = '/bootVolumeAttachments/{bootVolumeAttachmentId}'.sub('{bootVolumeAttachmentId}', boot_volume_attachment_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#detach_boot_volume') do
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


    # Detaches and deletes the specified secondary VNIC.
    # This operation cannot be used on the instance's primary VNIC.
    # When you terminate an instance, all attached VNICs (primary
    # and secondary) are automatically detached and deleted.
    #
    # **Important:** If the VNIC has a
    # {PrivateIp} that is the
    # [target of a route rule](https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Tasks/managingroutetables.htm#privateip),
    # deleting the VNIC causes that route rule to blackhole and the traffic
    # will be dropped.
    #
    # @param [String] vnic_attachment_id The OCID of the VNIC attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def detach_vnic(vnic_attachment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#detach_vnic.' if logger

      raise "Missing the required parameter 'vnic_attachment_id' when calling detach_vnic." if vnic_attachment_id.nil?
      raise "Parameter value for 'vnic_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(vnic_attachment_id)

      path = '/vnicAttachments/{vnicAttachmentId}'.sub('{vnicAttachmentId}', vnic_attachment_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#detach_vnic') do
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


    # Detaches a storage volume from an instance. You must specify the OCID of the volume attachment.
    #
    # This is an asynchronous operation. The attachment's `lifecycleState` will change to DETACHING temporarily
    # until the attachment is completely removed.
    #
    # @param [String] volume_attachment_id The OCID of the volume attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def detach_volume(volume_attachment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#detach_volume.' if logger

      raise "Missing the required parameter 'volume_attachment_id' when calling detach_volume." if volume_attachment_id.nil?
      raise "Parameter value for 'volume_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(volume_attachment_id)

      path = '/volumeAttachments/{volumeAttachmentId}'.sub('{volumeAttachmentId}', volume_attachment_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#detach_volume') do
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


    # Exports the specified image to the Oracle Cloud Infrastructure Object Storage service. You can use the Object Storage URL,
    # or the namespace, bucket name, and object name when specifying the location to export to.
    #
    # For more information about exporting images, see [Image Import/Export](https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Tasks/imageimportexport.htm).
    #
    # To perform an image export, you need write access to the Object Storage bucket for the image,
    # see [Let Users Write Objects to Object Storage Buckets](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/commonpolicies.htm#Let4).
    #
    # See [Object Storage URLs](https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Tasks/imageimportexport.htm#URLs) and [pre-authenticated requests](https://docs.us-phoenix-1.oraclecloud.com/Content/Object/Tasks/managingaccess.htm#pre-auth)
    # for constructing URLs for image import/export.
    #
    # @param [String] image_id The OCID of the image.
    # @param [OCI::Core::Models::ExportImageDetails] export_image_details Details for the image export.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
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
    # @return [Response] A Response object with data of type {OCI::Core::Models::Image Image}
    def export_image(image_id, export_image_details, opts = {})
      logger.debug 'Calling operation ComputeClient#export_image.' if logger

      raise "Missing the required parameter 'image_id' when calling export_image." if image_id.nil?
      raise "Missing the required parameter 'export_image_details' when calling export_image." if export_image_details.nil?
      raise "Parameter value for 'image_id' must not be blank" if OCI::Internal::Util.blank_string?(image_id)

      path = '/images/{imageId}/actions/export'.sub('{imageId}', image_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(export_image_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#export_image') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Image'
        )
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


    # Gets information about the specified boot volume attachment.
    # @param [String] boot_volume_attachment_id The OCID of the boot volume attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::BootVolumeAttachment BootVolumeAttachment}
    def get_boot_volume_attachment(boot_volume_attachment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#get_boot_volume_attachment.' if logger

      raise "Missing the required parameter 'boot_volume_attachment_id' when calling get_boot_volume_attachment." if boot_volume_attachment_id.nil?
      raise "Parameter value for 'boot_volume_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(boot_volume_attachment_id)

      path = '/bootVolumeAttachments/{bootVolumeAttachmentId}'.sub('{bootVolumeAttachmentId}', boot_volume_attachment_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#get_boot_volume_attachment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::BootVolumeAttachment'
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


    # Shows the metadata for the specified console history.
    # See {#capture_console_history capture_console_history}
    # for details about using the console history operations.
    #
    # @param [String] instance_console_history_id The OCID of the console history.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::ConsoleHistory ConsoleHistory}
    def get_console_history(instance_console_history_id, opts = {})
      logger.debug 'Calling operation ComputeClient#get_console_history.' if logger

      raise "Missing the required parameter 'instance_console_history_id' when calling get_console_history." if instance_console_history_id.nil?
      raise "Parameter value for 'instance_console_history_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_console_history_id)

      path = '/instanceConsoleHistories/{instanceConsoleHistoryId}'.sub('{instanceConsoleHistoryId}', instance_console_history_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#get_console_history') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::ConsoleHistory'
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


    # Gets the actual console history data (not the metadata).
    # See {#capture_console_history capture_console_history}
    # for details about using the console history operations.
    #
    # @param [String] instance_console_history_id The OCID of the console history.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [Integer] :offset Offset of the snapshot data to retrieve.
    # @option opts [Integer] :length Length of the snapshot data to retrieve.
    # @return [Response] A Response object with data of type String
    def get_console_history_content(instance_console_history_id, opts = {})
      logger.debug 'Calling operation ComputeClient#get_console_history_content.' if logger

      raise "Missing the required parameter 'instance_console_history_id' when calling get_console_history_content." if instance_console_history_id.nil?
      raise "Parameter value for 'instance_console_history_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_console_history_id)

      path = '/instanceConsoleHistories/{instanceConsoleHistoryId}/data'.sub('{instanceConsoleHistoryId}', instance_console_history_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:offset] = opts[:offset] if opts[:offset]
      query_params[:length] = opts[:length] if opts[:length]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#get_console_history_content') do
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
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified image.
    # @param [String] image_id The OCID of the image.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::Image Image}
    def get_image(image_id, opts = {})
      logger.debug 'Calling operation ComputeClient#get_image.' if logger

      raise "Missing the required parameter 'image_id' when calling get_image." if image_id.nil?
      raise "Parameter value for 'image_id' must not be blank" if OCI::Internal::Util.blank_string?(image_id)

      path = '/images/{imageId}'.sub('{imageId}', image_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#get_image') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Image'
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


    # Gets information about the specified instance.
    # @param [String] instance_id The OCID of the instance.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::Instance Instance}
    def get_instance(instance_id, opts = {})
      logger.debug 'Calling operation ComputeClient#get_instance.' if logger

      raise "Missing the required parameter 'instance_id' when calling get_instance." if instance_id.nil?
      raise "Parameter value for 'instance_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_id)

      path = '/instances/{instanceId}'.sub('{instanceId}', instance_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#get_instance') do
        @api_client.call_api(
          :GET,
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
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets the specified instance console connection's information.
    # @param [String] instance_console_connection_id The OCID of the intance console connection
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstanceConsoleConnection InstanceConsoleConnection}
    def get_instance_console_connection(instance_console_connection_id, opts = {})
      logger.debug 'Calling operation ComputeClient#get_instance_console_connection.' if logger

      raise "Missing the required parameter 'instance_console_connection_id' when calling get_instance_console_connection." if instance_console_connection_id.nil?
      raise "Parameter value for 'instance_console_connection_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_console_connection_id)

      path = '/instanceConsoleConnections/{instanceConsoleConnectionId}'.sub('{instanceConsoleConnectionId}', instance_console_connection_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#get_instance_console_connection') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstanceConsoleConnection'
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


    # Gets the information for the specified VNIC attachment.
    #
    # @param [String] vnic_attachment_id The OCID of the VNIC attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::VnicAttachment VnicAttachment}
    def get_vnic_attachment(vnic_attachment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#get_vnic_attachment.' if logger

      raise "Missing the required parameter 'vnic_attachment_id' when calling get_vnic_attachment." if vnic_attachment_id.nil?
      raise "Parameter value for 'vnic_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(vnic_attachment_id)

      path = '/vnicAttachments/{vnicAttachmentId}'.sub('{vnicAttachmentId}', vnic_attachment_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#get_vnic_attachment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::VnicAttachment'
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


    # Gets information about the specified volume attachment.
    # @param [String] volume_attachment_id The OCID of the volume attachment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::VolumeAttachment VolumeAttachment}
    def get_volume_attachment(volume_attachment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#get_volume_attachment.' if logger

      raise "Missing the required parameter 'volume_attachment_id' when calling get_volume_attachment." if volume_attachment_id.nil?
      raise "Parameter value for 'volume_attachment_id' must not be blank" if OCI::Internal::Util.blank_string?(volume_attachment_id)

      path = '/volumeAttachments/{volumeAttachmentId}'.sub('{volumeAttachmentId}', volume_attachment_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#get_volume_attachment') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::VolumeAttachment'
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


    # Gets the generated credentials for the instance. Only works for instances that require password to log in (E.g. Windows).
    # For certain OS'es, users will be forced to change the initial credentials.
    #
    # @param [String] instance_id The OCID of the instance.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @return [Response] A Response object with data of type {OCI::Core::Models::InstanceCredentials InstanceCredentials}
    def get_windows_instance_initial_credentials(instance_id, opts = {})
      logger.debug 'Calling operation ComputeClient#get_windows_instance_initial_credentials.' if logger

      raise "Missing the required parameter 'instance_id' when calling get_windows_instance_initial_credentials." if instance_id.nil?
      raise "Parameter value for 'instance_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_id)

      path = '/instances/{instanceId}/initialCredentials'.sub('{instanceId}', instance_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#get_windows_instance_initial_credentials') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::InstanceCredentials'
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


    # Performs one of the power actions (start, stop, softreset, or reset)
    # on the specified instance.
    #
    # **start** - power on
    #
    # **stop** - power off
    #
    # **softreset** - ACPI shutdown and power on
    #
    # **reset** - power off and power on
    #
    # Note that the **stop** state has no effect on the resources you consume.
    # Billing continues for instances that you stop, and related resources continue
    # to apply against any relevant quotas. You must terminate an instance
    # ({#terminate_instance terminate_instance})
    # to remove its resources from billing and quotas.
    #
    # @param [String] instance_id The OCID of the instance.
    # @param [String] action The action to perform on the instance.
    #   Allowed values are: STOP, START, SOFTRESET, RESET
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
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
    # @return [Response] A Response object with data of type {OCI::Core::Models::Instance Instance}
    def instance_action(instance_id, action, opts = {})
      logger.debug 'Calling operation ComputeClient#instance_action.' if logger

      raise "Missing the required parameter 'instance_id' when calling instance_action." if instance_id.nil?
      raise "Missing the required parameter 'action' when calling instance_action." if action.nil?
      unless %w[STOP START SOFTRESET RESET].include?(action)
        raise "Invalid value for 'action', must be one of STOP, START, SOFTRESET, RESET."
      end
      raise "Parameter value for 'instance_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_id)

      path = '/instances/{instanceId}'.sub('{instanceId}', instance_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:action] = action

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#instance_action') do
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


    # Creates a new instance in the specified compartment and the specified Availability Domain.
    # For general information about instances, see
    # [Overview of the Compute Service](https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Concepts/computeoverview.htm).
    #
    # For information about access control and compartments, see
    # [Overview of the IAM Service](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/overview.htm).
    #
    # For information about Availability Domains, see
    # [Regions and Availability Domains](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/regions.htm).
    # To get a list of Availability Domains, use the `ListAvailabilityDomains` operation
    # in the Identity and Access Management Service API.
    #
    # All Oracle Cloud Infrastructure resources, including instances, get an Oracle-assigned,
    # unique ID called an Oracle Cloud Identifier (OCID).
    # When you create a resource, you can find its OCID in the response. You can
    # also retrieve a resource's OCID by using a List API operation
    # on that resource type, or by viewing the resource in the Console.
    #
    # To launch an instance using an image or a boot volume use the `sourceDetails` parameter in {LaunchInstanceDetails}.
    #
    # When you launch an instance, it is automatically attached to a virtual
    # network interface card (VNIC), called the *primary VNIC*. The VNIC
    # has a private IP address from the subnet's CIDR. You can either assign a
    # private IP address of your choice or let Oracle automatically assign one.
    # You can choose whether the instance has a public IP address. To retrieve the
    # addresses, use the {#list_vnic_attachments list_vnic_attachments}
    # operation to get the VNIC ID for the instance, and then call
    # {#get_vnic get_vnic} with the VNIC ID.
    #
    # You can later add secondary VNICs to an instance. For more information, see
    # [Virtual Network Interface Cards (VNICs)](https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Tasks/managingVNICs.htm).
    #
    # @param [OCI::Core::Models::LaunchInstanceDetails] launch_instance_details Instance details
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Instance Instance}
    def launch_instance(launch_instance_details, opts = {})
      logger.debug 'Calling operation ComputeClient#launch_instance.' if logger

      raise "Missing the required parameter 'launch_instance_details' when calling launch_instance." if launch_instance_details.nil?

      path = '/instances/'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(launch_instance_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#launch_instance') do
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


    # Lists the boot volume attachments in the specified compartment. You can filter the
    # list by specifying an instance OCID, boot volume OCID, or both.
    #
    # @param [String] availability_domain The name of the Availability Domain.
    #
    #   Example: `Uocm:PHX-AD-1`
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    #   Example: `500`
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :instance_id The OCID of the instance.
    # @option opts [String] :boot_volume_id The OCID of the boot volume.
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::BootVolumeAttachment BootVolumeAttachment}>
    def list_boot_volume_attachments(availability_domain, compartment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#list_boot_volume_attachments.' if logger

      raise "Missing the required parameter 'availability_domain' when calling list_boot_volume_attachments." if availability_domain.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_boot_volume_attachments." if compartment_id.nil?

      path = '/bootVolumeAttachments/'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:availabilityDomain] = availability_domain
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:instanceId] = opts[:instance_id] if opts[:instance_id]
      query_params[:bootVolumeId] = opts[:boot_volume_id] if opts[:boot_volume_id]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#list_boot_volume_attachments') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::BootVolumeAttachment>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the console history metadata for the specified compartment or instance.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :availability_domain The name of the Availability Domain.
    #
    #   Example: `Uocm:PHX-AD-1`
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    #   Example: `500`
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :instance_id The OCID of the instance.
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for DISPLAYNAME is ascending. The DISPLAYNAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The DISPLAYNAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::ConsoleHistory ConsoleHistory}>
    def list_console_histories(compartment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#list_console_histories.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_console_histories." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::ConsoleHistory::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::ConsoleHistory::LIFECYCLE_STATE_ENUM.'
      end

      path = '/instanceConsoleHistories/'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:instanceId] = opts[:instance_id] if opts[:instance_id]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#list_console_histories') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::ConsoleHistory>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the available images in the specified compartment.
    # If you specify a value for the `sortBy` parameter, Oracle-provided images appear first in the list, followed by custom images.
    # For more
    # information about images, see
    # [Managing Custom Images](https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Tasks/managingcustomimages.htm).
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    #
    # @option opts [String] :operating_system The image's operating system.
    #
    #   Example: `Oracle Linux`
    #
    # @option opts [String] :operating_system_version The image's operating system version.
    #
    #   Example: `7.2`
    #
    # @option opts [String] :shape Shape name.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    #   Example: `500`
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for DISPLAYNAME is ascending. The DISPLAYNAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The DISPLAYNAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::Image Image}>
    def list_images(compartment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#list_images.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_images." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::Image::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::Image::LIFECYCLE_STATE_ENUM.'
      end

      path = '/images'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:operatingSystem] = opts[:operating_system] if opts[:operating_system]
      query_params[:operatingSystemVersion] = opts[:operating_system_version] if opts[:operating_system_version]
      query_params[:shape] = opts[:shape] if opts[:shape]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#list_images') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::Image>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the console connections for the specified compartment or instance.
    #
    # For more information about console access, see [Accessing the Console](https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/References/serialconsole.htm).
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :instance_id The OCID of the instance.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    #   Example: `500`
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::InstanceConsoleConnection InstanceConsoleConnection}>
    def list_instance_console_connections(compartment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#list_instance_console_connections.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_instance_console_connections." if compartment_id.nil?

      path = '/instanceConsoleConnections'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:instanceId] = opts[:instance_id] if opts[:instance_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#list_instance_console_connections') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::InstanceConsoleConnection>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the instances in the specified compartment and the specified Availability Domain.
    # You can filter the results by specifying an instance name (the list will include all the identically-named
    # instances in the compartment).
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :availability_domain The name of the Availability Domain.
    #
    #   Example: `Uocm:PHX-AD-1`
    #
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    #   Example: `500`
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide one sort order (`sortOrder`). Default order for
    #   TIMECREATED is descending. Default order for DISPLAYNAME is ascending. The DISPLAYNAME
    #   sort order is case sensitive.
    #
    #   **Note:** In general, some \"List\" operations (for example, `ListInstances`) let you
    #   optionally filter by Availability Domain if the scope of the resource type is within a
    #   single Availability Domain. If you call one of these \"List\" operations without specifying
    #   an Availability Domain, the resources are grouped by Availability Domain, then sorted.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either ascending (`ASC`) or descending (`DESC`). The DISPLAYNAME sort order
    #   is case sensitive.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :lifecycle_state A filter to only return resources that match the given lifecycle state.  The state value is case-insensitive.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::Instance Instance}>
    def list_instances(compartment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#list_instances.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_instances." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::Instance::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::Instance::LIFECYCLE_STATE_ENUM.'
      end

      path = '/instances/'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#list_instances') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::Instance>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the shapes that can be used to launch an instance within the specified compartment. You can
    # filter the list by compatibility with a specific image.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :availability_domain The name of the Availability Domain.
    #
    #   Example: `Uocm:PHX-AD-1`
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    #   Example: `500`
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :image_id The OCID of an image.
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::Shape Shape}>
    def list_shapes(compartment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#list_shapes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_shapes." if compartment_id.nil?

      path = '/shapes'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:imageId] = opts[:image_id] if opts[:image_id]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#list_shapes') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::Shape>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the VNIC attachments in the specified compartment. A VNIC attachment
    # resides in the same compartment as the attached instance. The list can be
    # filtered by instance, VNIC, or Availability Domain.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :availability_domain The name of the Availability Domain.
    #
    #   Example: `Uocm:PHX-AD-1`
    #
    # @option opts [String] :instance_id The OCID of the instance.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    #   Example: `500`
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :vnic_id The OCID of the VNIC.
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::VnicAttachment VnicAttachment}>
    def list_vnic_attachments(compartment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#list_vnic_attachments.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_vnic_attachments." if compartment_id.nil?

      path = '/vnicAttachments/'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]
      query_params[:instanceId] = opts[:instance_id] if opts[:instance_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:vnicId] = opts[:vnic_id] if opts[:vnic_id]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#list_vnic_attachments') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::VnicAttachment>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the volume attachments in the specified compartment. You can filter the
    # list by specifying an instance OCID, volume OCID, or both.
    #
    # Currently, the only supported volume attachment type are {IScsiVolumeAttachment} and
    # {ParavirtualizedVolumeAttachment}.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :availability_domain The name of the Availability Domain.
    #
    #   Example: `Uocm:PHX-AD-1`
    #
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    #   Example: `500`
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :instance_id The OCID of the instance.
    # @option opts [String] :volume_id The OCID of the volume.
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::VolumeAttachment VolumeAttachment}>
    def list_volume_attachments(compartment_id, opts = {})
      logger.debug 'Calling operation ComputeClient#list_volume_attachments.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_volume_attachments." if compartment_id.nil?

      path = '/volumeAttachments/'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:instanceId] = opts[:instance_id] if opts[:instance_id]
      query_params[:volumeId] = opts[:volume_id] if opts[:volume_id]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#list_volume_attachments') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::Core::Models::VolumeAttachment>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Terminates the specified instance. Any attached VNICs and volumes are automatically detached
    # when the instance terminates.
    #
    # To preserve the boot volume associated with the instance, specify `true` for `PreserveBootVolumeQueryParam`.
    # To delete the boot volume when the instance is deleted, specify `false` or do not specify a value for `PreserveBootVolumeQueryParam`.
    #
    # This is an asynchronous operation. The instance's `lifecycleState` will change to TERMINATING temporarily
    # until the instance is completely removed.
    #
    # @param [String] instance_id The OCID of the instance.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @option opts [BOOLEAN] :preserve_boot_volume Specifies whether to delete or preserve the boot volume when terminating an instance.
    #   The default value is false.
    #
    # @return [Response] A Response object with data of type nil
    def terminate_instance(instance_id, opts = {})
      logger.debug 'Calling operation ComputeClient#terminate_instance.' if logger

      raise "Missing the required parameter 'instance_id' when calling terminate_instance." if instance_id.nil?
      raise "Parameter value for 'instance_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_id)

      path = '/instances/{instanceId}'.sub('{instanceId}', instance_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:preserveBootVolume] = opts[:preserve_boot_volume] if opts[:preserve_boot_volume]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#terminate_instance') do
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


    # Updates the specified console history metadata.
    # @param [String] instance_console_history_id The OCID of the console history.
    # @param [OCI::Core::Models::UpdateConsoleHistoryDetails] update_console_history_details Update instance fields
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::ConsoleHistory ConsoleHistory}
    def update_console_history(instance_console_history_id, update_console_history_details, opts = {})
      logger.debug 'Calling operation ComputeClient#update_console_history.' if logger

      raise "Missing the required parameter 'instance_console_history_id' when calling update_console_history." if instance_console_history_id.nil?
      raise "Missing the required parameter 'update_console_history_details' when calling update_console_history." if update_console_history_details.nil?
      raise "Parameter value for 'instance_console_history_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_console_history_id)

      path = '/instanceConsoleHistories/{instanceConsoleHistoryId}'.sub('{instanceConsoleHistoryId}', instance_console_history_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = @api_client.object_to_http_body(update_console_history_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#update_console_history') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::ConsoleHistory'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the display name of the image. Avoid entering confidential information.
    # @param [String] image_id The OCID of the image.
    # @param [OCI::Core::Models::UpdateImageDetails] update_image_details Updates the image display name field. Avoid entering confidential information.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
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
    # @return [Response] A Response object with data of type {OCI::Core::Models::Image Image}
    def update_image(image_id, update_image_details, opts = {})
      logger.debug 'Calling operation ComputeClient#update_image.' if logger

      raise "Missing the required parameter 'image_id' when calling update_image." if image_id.nil?
      raise "Missing the required parameter 'update_image_details' when calling update_image." if update_image_details.nil?
      raise "Parameter value for 'image_id' must not be blank" if OCI::Internal::Util.blank_string?(image_id)

      path = '/images/{imageId}'.sub('{imageId}', image_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(update_image_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#update_image') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::Core::Models::Image'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the display name of the specified instance. Avoid entering confidential information.
    # The OCID of the instance remains the same.
    #
    # @param [String] instance_id The OCID of the instance.
    # @param [OCI::Core::Models::UpdateInstanceDetails] update_instance_details Update instance fields
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then then operation will not retry
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
    # @return [Response] A Response object with data of type {OCI::Core::Models::Instance Instance}
    def update_instance(instance_id, update_instance_details, opts = {})
      logger.debug 'Calling operation ComputeClient#update_instance.' if logger

      raise "Missing the required parameter 'instance_id' when calling update_instance." if instance_id.nil?
      raise "Missing the required parameter 'update_instance_details' when calling update_instance." if update_instance_details.nil?
      raise "Parameter value for 'instance_id' must not be blank" if OCI::Internal::Util.blank_string?(instance_id)

      path = '/instances/{instanceId}'.sub('{instanceId}', instance_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(update_instance_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'ComputeClient#update_instance') do
        @api_client.call_api(
          :PUT,
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

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)
      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
