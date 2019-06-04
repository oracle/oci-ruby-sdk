# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The API for the File Storage Service.
  class FileStorage::FileStorageClient
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


    # Creates a new FileStorageClient.
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
        @endpoint = endpoint + '/20171215'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "FileStorageClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://filestorage.{region}.{secondLevelDomain}') + '/20171215'
      logger.info "FileStorageClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves a file system and its associated snapshots into a different compartment within the same tenancy. For information about moving resources between compartments, see [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes)
    #
    # @param [String] file_system_id The OCID of the file system.
    # @param [OCI::FileStorage::Models::ChangeFileSystemCompartmentDetails] change_file_system_compartment_details Details for changing the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    def change_file_system_compartment(file_system_id, change_file_system_compartment_details, opts = {})
      logger.debug 'Calling operation FileStorageClient#change_file_system_compartment.' if logger

      raise "Missing the required parameter 'file_system_id' when calling change_file_system_compartment." if file_system_id.nil?
      raise "Missing the required parameter 'change_file_system_compartment_details' when calling change_file_system_compartment." if change_file_system_compartment_details.nil?
      raise "Parameter value for 'file_system_id' must not be blank" if OCI::Internal::Util.blank_string?(file_system_id)

      path = '/fileSystems/{fileSystemId}/actions/changeCompartment'.sub('{fileSystemId}', file_system_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_file_system_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#change_file_system_compartment') do
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


    # Moves a mount target and its associated export set into a different compartment within the same tenancy. For information about moving resources between compartments, see [Moving Resources to a Different Compartment](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#moveRes)
    #
    # @param [String] mount_target_id The OCID of the mount target.
    # @param [OCI::FileStorage::Models::ChangeMountTargetCompartmentDetails] change_mount_target_compartment_details Details for changing the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    def change_mount_target_compartment(mount_target_id, change_mount_target_compartment_details, opts = {})
      logger.debug 'Calling operation FileStorageClient#change_mount_target_compartment.' if logger

      raise "Missing the required parameter 'mount_target_id' when calling change_mount_target_compartment." if mount_target_id.nil?
      raise "Missing the required parameter 'change_mount_target_compartment_details' when calling change_mount_target_compartment." if change_mount_target_compartment_details.nil?
      raise "Parameter value for 'mount_target_id' must not be blank" if OCI::Internal::Util.blank_string?(mount_target_id)

      path = '/mountTargets/{mountTargetId}/actions/changeCompartment'.sub('{mountTargetId}', mount_target_id.to_s)
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

      post_body = @api_client.object_to_http_body(change_mount_target_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#change_mount_target_compartment') do
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


    # Creates a new export in the specified export set, path, and
    # file system.
    #
    # @param [OCI::FileStorage::Models::CreateExportDetails] create_export_details Details for creating a new export.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::Export Export}
    def create_export(create_export_details, opts = {})
      logger.debug 'Calling operation FileStorageClient#create_export.' if logger

      raise "Missing the required parameter 'create_export_details' when calling create_export." if create_export_details.nil?

      path = '/exports'
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

      post_body = @api_client.object_to_http_body(create_export_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#create_export') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::Export'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new file system in the specified compartment and
    # availability domain. Instances can mount file systems in
    # another availability domain, but doing so might increase
    # latency when compared to mounting instances in the same
    # availability domain.
    #
    # After you create a file system, you can associate it with a mount
    # target. Instances can then mount the file system by connecting to the
    # mount target's IP address. You can associate a file system with
    # more than one mount target at a time.
    #
    # For information about access control and compartments, see
    # [Overview of the IAM Service](https://docs.cloud.oracle.com/Content/Identity/Concepts/overview.htm).
    #
    # For information about availability domains, see [Regions and
    # Availability Domains](https://docs.cloud.oracle.com/Content/General/Concepts/regions.htm).
    # To get a list of availability domains, use the
    # `ListAvailabilityDomains` operation in the Identity and Access
    # Management Service API.
    #
    # All Oracle Cloud Infrastructure resources, including
    # file systems, get an Oracle-assigned, unique ID called an Oracle
    # Cloud Identifier (OCID).  When you create a resource, you can
    # find its OCID in the response. You can also retrieve a
    # resource's OCID by using a List API operation on that resource
    # type or by viewing the resource in the Console.
    #
    # @param [OCI::FileStorage::Models::CreateFileSystemDetails] create_file_system_details Details for creating a new file system.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::FileSystem FileSystem}
    def create_file_system(create_file_system_details, opts = {})
      logger.debug 'Calling operation FileStorageClient#create_file_system.' if logger

      raise "Missing the required parameter 'create_file_system_details' when calling create_file_system." if create_file_system_details.nil?

      path = '/fileSystems'
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

      post_body = @api_client.object_to_http_body(create_file_system_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#create_file_system') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::FileSystem'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new mount target in the specified compartment and
    # subnet. You can associate a file system with a mount
    # target only when they exist in the same availability domain. Instances
    # can connect to mount targets in another availablity domain, but
    # you might see higher latency than with instances in the same
    # availability domain as the mount target.
    #
    # Mount targets have one or more private IP addresses that you can
    # provide as the host portion of remote target parameters in
    # client mount commands. These private IP addresses are listed
    # in the privateIpIds property of the mount target and are highly available. Mount
    # targets also consume additional IP addresses in their subnet.
    # Do not use /30 or smaller subnets for mount target creation because they
    # do not have sufficient available IP addresses.
    # Allow at least three IP addresses for each mount target.
    #
    # For information about access control and compartments, see
    # [Overview of the IAM
    # Service](https://docs.cloud.oracle.com/Content/Identity/Concepts/overview.htm).
    #
    # For information about availability domains, see [Regions and
    # Availability Domains](https://docs.cloud.oracle.com/Content/General/Concepts/regions.htm).
    # To get a list of availability domains, use the
    # `ListAvailabilityDomains` operation in the Identity and Access
    # Management Service API.
    #
    # All Oracle Cloud Infrastructure Services resources, including
    # mount targets, get an Oracle-assigned, unique ID called an
    # Oracle Cloud Identifier (OCID).  When you create a resource,
    # you can find its OCID in the response. You can also retrieve a
    # resource's OCID by using a List API operation on that resource
    # type, or by viewing the resource in the Console.
    #
    # @param [OCI::FileStorage::Models::CreateMountTargetDetails] create_mount_target_details Details for creating a new mount target.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::MountTarget MountTarget}
    def create_mount_target(create_mount_target_details, opts = {})
      logger.debug 'Calling operation FileStorageClient#create_mount_target.' if logger

      raise "Missing the required parameter 'create_mount_target_details' when calling create_mount_target." if create_mount_target_details.nil?

      path = '/mountTargets'
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

      post_body = @api_client.object_to_http_body(create_mount_target_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#create_mount_target') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::MountTarget'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new snapshot of the specified file system. You
    # can access the snapshot at `.snapshot/<name>`.
    #
    # @param [OCI::FileStorage::Models::CreateSnapshotDetails] create_snapshot_details Details for creating a new snapshot.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::Snapshot Snapshot}
    def create_snapshot(create_snapshot_details, opts = {})
      logger.debug 'Calling operation FileStorageClient#create_snapshot.' if logger

      raise "Missing the required parameter 'create_snapshot_details' when calling create_snapshot." if create_snapshot_details.nil?

      path = '/snapshots'
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

      post_body = @api_client.object_to_http_body(create_snapshot_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#create_snapshot') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::Snapshot'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the specified export.
    #
    # @param [String] export_id The OCID of the export.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    def delete_export(export_id, opts = {})
      logger.debug 'Calling operation FileStorageClient#delete_export.' if logger

      raise "Missing the required parameter 'export_id' when calling delete_export." if export_id.nil?
      raise "Parameter value for 'export_id' must not be blank" if OCI::Internal::Util.blank_string?(export_id)

      path = '/exports/{exportId}'.sub('{exportId}', export_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#delete_export') do
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


    # Deletes the specified file system. Before you delete the file system,
    # verify that no remaining export resources still reference it. Deleting a
    # file system also deletes all of its snapshots.
    #
    # @param [String] file_system_id The OCID of the file system.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    def delete_file_system(file_system_id, opts = {})
      logger.debug 'Calling operation FileStorageClient#delete_file_system.' if logger

      raise "Missing the required parameter 'file_system_id' when calling delete_file_system." if file_system_id.nil?
      raise "Parameter value for 'file_system_id' must not be blank" if OCI::Internal::Util.blank_string?(file_system_id)

      path = '/fileSystems/{fileSystemId}'.sub('{fileSystemId}', file_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#delete_file_system') do
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


    # Deletes the specified mount target. This operation also deletes the
    # mount target's VNICs.
    #
    # @param [String] mount_target_id The OCID of the mount target.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    def delete_mount_target(mount_target_id, opts = {})
      logger.debug 'Calling operation FileStorageClient#delete_mount_target.' if logger

      raise "Missing the required parameter 'mount_target_id' when calling delete_mount_target." if mount_target_id.nil?
      raise "Parameter value for 'mount_target_id' must not be blank" if OCI::Internal::Util.blank_string?(mount_target_id)

      path = '/mountTargets/{mountTargetId}'.sub('{mountTargetId}', mount_target_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#delete_mount_target') do
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


    # Deletes the specified snapshot.
    #
    # @param [String] snapshot_id The OCID of the snapshot.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type nil
    def delete_snapshot(snapshot_id, opts = {})
      logger.debug 'Calling operation FileStorageClient#delete_snapshot.' if logger

      raise "Missing the required parameter 'snapshot_id' when calling delete_snapshot." if snapshot_id.nil?
      raise "Parameter value for 'snapshot_id' must not be blank" if OCI::Internal::Util.blank_string?(snapshot_id)

      path = '/snapshots/{snapshotId}'.sub('{snapshotId}', snapshot_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#delete_snapshot') do
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


    # Gets the specified export's information.
    # @param [String] export_id The OCID of the export.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::Export Export}
    def get_export(export_id, opts = {})
      logger.debug 'Calling operation FileStorageClient#get_export.' if logger

      raise "Missing the required parameter 'export_id' when calling get_export." if export_id.nil?
      raise "Parameter value for 'export_id' must not be blank" if OCI::Internal::Util.blank_string?(export_id)

      path = '/exports/{exportId}'.sub('{exportId}', export_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#get_export') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::Export'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the specified export set's information.
    # @param [String] export_set_id The OCID of the export set.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::ExportSet ExportSet}
    def get_export_set(export_set_id, opts = {})
      logger.debug 'Calling operation FileStorageClient#get_export_set.' if logger

      raise "Missing the required parameter 'export_set_id' when calling get_export_set." if export_set_id.nil?
      raise "Parameter value for 'export_set_id' must not be blank" if OCI::Internal::Util.blank_string?(export_set_id)

      path = '/exportSets/{exportSetId}'.sub('{exportSetId}', export_set_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#get_export_set') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::ExportSet'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the specified file system's information.
    # @param [String] file_system_id The OCID of the file system.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::FileSystem FileSystem}
    def get_file_system(file_system_id, opts = {})
      logger.debug 'Calling operation FileStorageClient#get_file_system.' if logger

      raise "Missing the required parameter 'file_system_id' when calling get_file_system." if file_system_id.nil?
      raise "Parameter value for 'file_system_id' must not be blank" if OCI::Internal::Util.blank_string?(file_system_id)

      path = '/fileSystems/{fileSystemId}'.sub('{fileSystemId}', file_system_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#get_file_system') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::FileSystem'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the specified mount target's information.
    # @param [String] mount_target_id The OCID of the mount target.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::MountTarget MountTarget}
    def get_mount_target(mount_target_id, opts = {})
      logger.debug 'Calling operation FileStorageClient#get_mount_target.' if logger

      raise "Missing the required parameter 'mount_target_id' when calling get_mount_target." if mount_target_id.nil?
      raise "Parameter value for 'mount_target_id' must not be blank" if OCI::Internal::Util.blank_string?(mount_target_id)

      path = '/mountTargets/{mountTargetId}'.sub('{mountTargetId}', mount_target_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#get_mount_target') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::MountTarget'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the specified snapshot's information.
    # @param [String] snapshot_id The OCID of the snapshot.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::Snapshot Snapshot}
    def get_snapshot(snapshot_id, opts = {})
      logger.debug 'Calling operation FileStorageClient#get_snapshot.' if logger

      raise "Missing the required parameter 'snapshot_id' when calling get_snapshot." if snapshot_id.nil?
      raise "Parameter value for 'snapshot_id' must not be blank" if OCI::Internal::Util.blank_string?(snapshot_id)

      path = '/snapshots/{snapshotId}'.sub('{snapshotId}', snapshot_id.to_s)
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#get_snapshot') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::Snapshot'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the export set resources in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [String] availability_domain The name of the availability domain.
    #
    #   Example: `Uocm:PHX-AD-1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page,
    #   or items to return in a paginated \"List\" call.
    #   1 is the minimum, 1000 is the maximum.
    #
    #   For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `500`
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response
    #   header from the previous \"List\" call.
    #
    #   For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :display_name A user-friendly name. It does not have to be unique, and it is changeable.
    #
    #   Example: `My resource`
    #
    # @option opts [String] :lifecycle_state Filter results by the specified lifecycle state. Must be a valid
    #   state for the resource type.
    #
    #   Allowed values are: CREATING, ACTIVE, DELETING, DELETED, FAILED
    # @option opts [String] :id Filter results by OCID. Must be an OCID of the correct type for
    #   the resouce type.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide either value, but not both.
    #   By default, when you sort by time created, results are shown
    #   in descending order. When you sort by display name, results are
    #   shown in ascending order.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc', where 'asc' is
    #   ascending and 'desc' is descending.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::FileStorage::Models::ExportSetSummary ExportSetSummary}>
    def list_export_sets(compartment_id, availability_domain, opts = {})
      logger.debug 'Calling operation FileStorageClient#list_export_sets.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_export_sets." if compartment_id.nil?
      raise "Missing the required parameter 'availability_domain' when calling list_export_sets." if availability_domain.nil?

      if opts[:lifecycle_state] && !%w[CREATING ACTIVE DELETING DELETED FAILED].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of CREATING, ACTIVE, DELETING, DELETED, FAILED.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/exportSets'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:availabilityDomain] = availability_domain
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:id] = opts[:id] if opts[:id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#list_export_sets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::FileStorage::Models::ExportSetSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists export resources by compartment, file system, or export
    # set. You must specify an export set ID, a file system ID, and
    # / or a compartment ID.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :compartment_id The OCID of the compartment.
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page,
    #   or items to return in a paginated \"List\" call.
    #   1 is the minimum, 1000 is the maximum.
    #
    #   For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `500`
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response
    #   header from the previous \"List\" call.
    #
    #   For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :export_set_id The OCID of the export set.
    # @option opts [String] :file_system_id The OCID of the file system.
    # @option opts [String] :lifecycle_state Filter results by the specified lifecycle state. Must be a valid
    #   state for the resource type.
    #
    #   Allowed values are: CREATING, ACTIVE, DELETING, DELETED, FAILED
    # @option opts [String] :id Filter results by OCID. Must be an OCID of the correct type for
    #   the resouce type.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide either value, but not both.
    #   By default, when you sort by time created, results are shown
    #   in descending order. When you sort by path, results are
    #   shown in ascending alphanumeric order.
    #
    #   Allowed values are: TIMECREATED, PATH
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc', where 'asc' is
    #   ascending and 'desc' is descending.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::FileStorage::Models::ExportSummary ExportSummary}>
    def list_exports(opts = {})
      logger.debug 'Calling operation FileStorageClient#list_exports.' if logger


      if opts[:lifecycle_state] && !%w[CREATING ACTIVE DELETING DELETED FAILED].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of CREATING, ACTIVE, DELETING, DELETED, FAILED.'
      end

      if opts[:sort_by] && !%w[TIMECREATED PATH].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, PATH.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/exports'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = opts[:compartment_id] if opts[:compartment_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:exportSetId] = opts[:export_set_id] if opts[:export_set_id]
      query_params[:fileSystemId] = opts[:file_system_id] if opts[:file_system_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:id] = opts[:id] if opts[:id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#list_exports') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::FileStorage::Models::ExportSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the file system resources in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [String] availability_domain The name of the availability domain.
    #
    #   Example: `Uocm:PHX-AD-1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page,
    #   or items to return in a paginated \"List\" call.
    #   1 is the minimum, 1000 is the maximum.
    #
    #   For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `500`
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response
    #   header from the previous \"List\" call.
    #
    #   For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :display_name A user-friendly name. It does not have to be unique, and it is changeable.
    #
    #   Example: `My resource`
    #
    # @option opts [String] :lifecycle_state Filter results by the specified lifecycle state. Must be a valid
    #   state for the resource type.
    #
    #   Allowed values are: CREATING, ACTIVE, DELETING, DELETED, FAILED
    # @option opts [String] :id Filter results by OCID. Must be an OCID of the correct type for
    #   the resouce type.
    #
    # @option opts [String] :sort_by The field to sort by. You can provide either value, but not both.
    #   By default, when you sort by time created, results are shown
    #   in descending order. When you sort by display name, results are
    #   shown in ascending order.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc', where 'asc' is
    #   ascending and 'desc' is descending.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::FileStorage::Models::FileSystemSummary FileSystemSummary}>
    def list_file_systems(compartment_id, availability_domain, opts = {})
      logger.debug 'Calling operation FileStorageClient#list_file_systems.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_file_systems." if compartment_id.nil?
      raise "Missing the required parameter 'availability_domain' when calling list_file_systems." if availability_domain.nil?

      if opts[:lifecycle_state] && !%w[CREATING ACTIVE DELETING DELETED FAILED].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of CREATING, ACTIVE, DELETING, DELETED, FAILED.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/fileSystems'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:availabilityDomain] = availability_domain
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:id] = opts[:id] if opts[:id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#list_file_systems') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::FileStorage::Models::FileSystemSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the mount target resources in the specified compartment.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [String] availability_domain The name of the availability domain.
    #
    #   Example: `Uocm:PHX-AD-1`
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page,
    #   or items to return in a paginated \"List\" call.
    #   1 is the minimum, 1000 is the maximum.
    #
    #   For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `500`
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response
    #   header from the previous \"List\" call.
    #
    #   For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :display_name A user-friendly name. It does not have to be unique, and it is changeable.
    #
    #   Example: `My resource`
    #
    # @option opts [String] :export_set_id The OCID of the export set.
    # @option opts [String] :lifecycle_state Filter results by the specified lifecycle state. Must be a valid
    #   state for the resource type.
    #
    #   Allowed values are: CREATING, ACTIVE, DELETING, DELETED, FAILED
    # @option opts [String] :id Filter results by OCID. Must be an OCID of the correct type for
    #   the resouce type.
    #
    # @option opts [String] :sort_by The field to sort by. You can choose either value, but not both.
    #   By default, when you sort by time created, results are shown
    #   in descending order. When you sort by display name, results are
    #   shown in ascending order.
    #
    #   Allowed values are: TIMECREATED, DISPLAYNAME
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc', where 'asc' is
    #   ascending and 'desc' is descending.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::FileStorage::Models::MountTargetSummary MountTargetSummary}>
    def list_mount_targets(compartment_id, availability_domain, opts = {})
      logger.debug 'Calling operation FileStorageClient#list_mount_targets.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_mount_targets." if compartment_id.nil?
      raise "Missing the required parameter 'availability_domain' when calling list_mount_targets." if availability_domain.nil?

      if opts[:lifecycle_state] && !%w[CREATING ACTIVE DELETING DELETED FAILED].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of CREATING, ACTIVE, DELETING, DELETED, FAILED.'
      end

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/mountTargets'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:availabilityDomain] = availability_domain
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:exportSetId] = opts[:export_set_id] if opts[:export_set_id]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:id] = opts[:id] if opts[:id]
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
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#list_mount_targets') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::FileStorage::Models::MountTargetSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists snapshots of the specified file system.
    #
    # @param [String] file_system_id The OCID of the file system.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [Integer] :limit For list pagination. The maximum number of results per page,
    #   or items to return in a paginated \"List\" call.
    #   1 is the minimum, 1000 is the maximum.
    #
    #   For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    #   Example: `500`
    #
    # @option opts [String] :page For list pagination. The value of the `opc-next-page` response
    #   header from the previous \"List\" call.
    #
    #   For important details about how pagination works,
    #   see [List Pagination](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm#nine).
    #
    # @option opts [String] :lifecycle_state Filter results by the specified lifecycle state. Must be a valid
    #   state for the resource type.
    #
    #   Allowed values are: CREATING, ACTIVE, DELETING, DELETED, FAILED
    # @option opts [String] :id Filter results by OCID. Must be an OCID of the correct type for
    #   the resouce type.
    #
    # @option opts [String] :sort_order The sort order to use, either 'asc' or 'desc', where 'asc' is
    #   ascending and 'desc' is descending.
    #
    #   Allowed values are: ASC, DESC
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type Array<{OCI::FileStorage::Models::SnapshotSummary SnapshotSummary}>
    def list_snapshots(file_system_id, opts = {})
      logger.debug 'Calling operation FileStorageClient#list_snapshots.' if logger

      raise "Missing the required parameter 'file_system_id' when calling list_snapshots." if file_system_id.nil?

      if opts[:lifecycle_state] && !%w[CREATING ACTIVE DELETING DELETED FAILED].include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of CREATING, ACTIVE, DELETING, DELETED, FAILED.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      path = '/snapshots'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:fileSystemId] = file_system_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#list_snapshots') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'Array<OCI::FileStorage::Models::SnapshotSummary>'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified export's information.
    # @param [String] export_id The OCID of the export.
    # @param [OCI::FileStorage::Models::UpdateExportDetails] update_export_details Details object for updating an export.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::Export Export}
    def update_export(export_id, update_export_details, opts = {})
      logger.debug 'Calling operation FileStorageClient#update_export.' if logger

      raise "Missing the required parameter 'export_id' when calling update_export." if export_id.nil?
      raise "Missing the required parameter 'update_export_details' when calling update_export." if update_export_details.nil?
      raise "Parameter value for 'export_id' must not be blank" if OCI::Internal::Util.blank_string?(export_id)

      path = '/exports/{exportId}'.sub('{exportId}', export_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_export_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#update_export') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::Export'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified export set's information.
    # @param [String] export_set_id The OCID of the export set.
    # @param [OCI::FileStorage::Models::UpdateExportSetDetails] update_export_set_details Details object for updating an export set.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::ExportSet ExportSet}
    def update_export_set(export_set_id, update_export_set_details, opts = {})
      logger.debug 'Calling operation FileStorageClient#update_export_set.' if logger

      raise "Missing the required parameter 'export_set_id' when calling update_export_set." if export_set_id.nil?
      raise "Missing the required parameter 'update_export_set_details' when calling update_export_set." if update_export_set_details.nil?
      raise "Parameter value for 'export_set_id' must not be blank" if OCI::Internal::Util.blank_string?(export_set_id)

      path = '/exportSets/{exportSetId}'.sub('{exportSetId}', export_set_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_export_set_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#update_export_set') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::ExportSet'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified file system's information.
    # You can use this operation to rename a file system.
    #
    # @param [String] file_system_id The OCID of the file system.
    # @param [OCI::FileStorage::Models::UpdateFileSystemDetails] update_file_system_details Details object for updating a file system.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::FileSystem FileSystem}
    def update_file_system(file_system_id, update_file_system_details, opts = {})
      logger.debug 'Calling operation FileStorageClient#update_file_system.' if logger

      raise "Missing the required parameter 'file_system_id' when calling update_file_system." if file_system_id.nil?
      raise "Missing the required parameter 'update_file_system_details' when calling update_file_system." if update_file_system_details.nil?
      raise "Parameter value for 'file_system_id' must not be blank" if OCI::Internal::Util.blank_string?(file_system_id)

      path = '/fileSystems/{fileSystemId}'.sub('{fileSystemId}', file_system_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_file_system_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#update_file_system') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::FileSystem'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified mount target's information.
    # @param [String] mount_target_id The OCID of the mount target.
    # @param [OCI::FileStorage::Models::UpdateMountTargetDetails] update_mount_target_details Details object for updating a mount target.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::MountTarget MountTarget}
    def update_mount_target(mount_target_id, update_mount_target_details, opts = {})
      logger.debug 'Calling operation FileStorageClient#update_mount_target.' if logger

      raise "Missing the required parameter 'mount_target_id' when calling update_mount_target." if mount_target_id.nil?
      raise "Missing the required parameter 'update_mount_target_details' when calling update_mount_target." if update_mount_target_details.nil?
      raise "Parameter value for 'mount_target_id' must not be blank" if OCI::Internal::Util.blank_string?(mount_target_id)

      path = '/mountTargets/{mountTargetId}'.sub('{mountTargetId}', mount_target_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_mount_target_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#update_mount_target') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::MountTarget'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified snapshot's information.
    # @param [String] snapshot_id The OCID of the snapshot.
    # @param [OCI::FileStorage::Models::UpdateSnapshotDetails] update_snapshot_details Details object for updating a snapshot.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call
    #   for a resource, set the `if-match` parameter to the value of the
    #   etag from a previous GET or POST response for that resource.
    #   The resource will be updated or deleted only if the etag you
    #   provide matches the resource's current etag value.
    #
    # @option opts [String] :opc_request_id Unique identifier for the request.
    #   If you need to contact Oracle about a particular request, please provide the request ID.
    #
    # @return [Response] A Response object with data of type {OCI::FileStorage::Models::Snapshot Snapshot}
    def update_snapshot(snapshot_id, update_snapshot_details, opts = {})
      logger.debug 'Calling operation FileStorageClient#update_snapshot.' if logger

      raise "Missing the required parameter 'snapshot_id' when calling update_snapshot." if snapshot_id.nil?
      raise "Missing the required parameter 'update_snapshot_details' when calling update_snapshot." if update_snapshot_details.nil?
      raise "Parameter value for 'snapshot_id' must not be blank" if OCI::Internal::Util.blank_string?(snapshot_id)

      path = '/snapshots/{snapshotId}'.sub('{snapshotId}', snapshot_id.to_s)
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

      post_body = @api_client.object_to_http_body(update_snapshot_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'FileStorageClient#update_snapshot') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::FileStorage::Models::Snapshot'
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
