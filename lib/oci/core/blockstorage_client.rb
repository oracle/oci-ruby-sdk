# Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # APIs for Networking Service, Compute Service, and Block Volume Service.
  class Core::BlockstorageClient
    # Client used to make HTTP requests.
    # @return [OCI::ApiClient]
    attr_reader :api_client

    # Fully qualified endpoint URL
    # @return [String]
    attr_reader :endpoint

    # The region, which will usually correspond to a value in {OCI::Regions::REGION_ENUM}.
    # @return [String]
    attr_reader :region

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines


    # Creates a new BlockstorageClient.
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
    def initialize(config: nil, region: nil, signer: nil, proxy_settings: nil)
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

      @endpoint = OCI::Regions.get_service_endpoint(@region, :BlockstorageClient) + '/20160918'
      logger.info "BlockstorageClient endpoint set to '#{endpoint}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new volume in the specified compartment. Volumes can be created in sizes ranging from
    # 50 GB (51200 MB) to 16 TB (16777216 MB), in 1 GB (1024 MB) increments. By default, volumes are 1 TB (1048576 MB).
    # For general information about block volumes, see
    # [Overview of Block Volume Service](https://docs.us-phoenix-1.oraclecloud.com/Content/Block/Concepts/overview.htm).
    #
    # A volume and instance can be in separate compartments but must be in the same Availability Domain.
    # For information about access control and compartments, see
    # [Overview of the IAM Service](https://docs.us-phoenix-1.oraclecloud.com/Content/Identity/Concepts/overview.htm). For information about
    # Availability Domains, see [Regions and Availability Domains](https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/regions.htm).
    # To get a list of Availability Domains, use the `ListAvailabilityDomains` operation
    # in the Identity and Access Management Service API.
    #
    # You may optionally specify a *display name* for the volume, which is simply a friendly name or
    # description. It does not have to be unique, and you can change it. Avoid entering confidential information.
    #
    # @param [OCI::Core::Models::CreateVolumeDetails] create_volume_details Request to create a new volume.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Volume Volume}
    def create_volume(create_volume_details, opts = {})
      logger.debug 'Calling operation BlockstorageClient#create_volume.' if logger

      raise "Missing the required parameter 'create_volume_details' when calling create_volume." if create_volume_details.nil?

      path = '/volumes'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]

      post_body = @api_client.object_to_http_body(create_volume_details)

      @api_client.call_api(
        :POST,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'OCI::Core::Models::Volume'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new backup of the specified volume. For general information about volume backups,
    # see [Overview of Block Volume Service Backups](https://docs.us-phoenix-1.oraclecloud.com/Content/Block/Concepts/blockvolumebackups.htm)
    #
    # When the request is received, the backup object is in a REQUEST_RECEIVED state.
    # When the data is imaged, it goes into a CREATING state.
    # After the backup is fully uploaded to the cloud, it goes into an AVAILABLE state.
    #
    # @param [OCI::Core::Models::CreateVolumeBackupDetails] create_volume_backup_details Request to create a new backup of given volume.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations (for example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   may be rejected).
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::VolumeBackup VolumeBackup}
    def create_volume_backup(create_volume_backup_details, opts = {})
      logger.debug 'Calling operation BlockstorageClient#create_volume_backup.' if logger

      raise "Missing the required parameter 'create_volume_backup_details' when calling create_volume_backup." if create_volume_backup_details.nil?

      path = '/volumeBackups'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]

      post_body = @api_client.object_to_http_body(create_volume_backup_details)

      @api_client.call_api(
        :POST,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'OCI::Core::Models::VolumeBackup'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Assigns a policy to the specified asset, such as a volume. Note that a given asset can
    # only have one policy assigned to it; if this method is called for an asset that previously
    # has a different policy assigned, the prior assignment will be silently deleted.
    #
    # @param [OCI::Core::Models::CreateVolumeBackupPolicyAssignmentDetails] create_volume_backup_policy_assignment_details Request to assign a specified policy to a particular asset.
    # @param [Hash] opts the optional parameters
    # @return [Response] A Response object with data of type {OCI::Core::Models::VolumeBackupPolicyAssignment VolumeBackupPolicyAssignment}
    def create_volume_backup_policy_assignment(create_volume_backup_policy_assignment_details, opts = {})
      logger.debug 'Calling operation BlockstorageClient#create_volume_backup_policy_assignment.' if logger

      raise "Missing the required parameter 'create_volume_backup_policy_assignment_details' when calling create_volume_backup_policy_assignment." if create_volume_backup_policy_assignment_details.nil?

      path = '/volumeBackupPolicyAssignments'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = @api_client.object_to_http_body(create_volume_backup_policy_assignment_details)

      @api_client.call_api(
        :POST,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'OCI::Core::Models::VolumeBackupPolicyAssignment'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the specified boot volume. The volume cannot have an active connection to an instance.
    # To disconnect the boot volume from a connected instance, see
    # [Disconnecting From a Boot Volume](https://docs.us-phoenix-1.oraclecloud.com/Content/Block/Tasks/deletingbootvolume.htm).
    # **Warning:** All data on the boot volume will be permanently lost when the boot volume is deleted.
    #
    # @param [String] boot_volume_id The OCID of the boot volume.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_boot_volume(boot_volume_id, opts = {})
      logger.debug 'Calling operation BlockstorageClient#delete_boot_volume.' if logger

      raise "Missing the required parameter 'boot_volume_id' when calling delete_boot_volume." if boot_volume_id.nil?
      raise "Parameter value for 'boot_volume_id' must not be blank" if OCI::Internal::Util.blank_string?(boot_volume_id)

      path = '/bootVolumes/{bootVolumeId}'.sub('{bootVolumeId}', boot_volume_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = nil

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
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the specified volume. The volume cannot have an active connection to an instance.
    # To disconnect the volume from a connected instance, see
    # [Disconnecting From a Volume](https://docs.us-phoenix-1.oraclecloud.com/Content/Block/Tasks/disconnectingfromavolume.htm).
    # **Warning:** All data on the volume will be permanently lost when the volume is deleted.
    #
    # @param [String] volume_id The OCID of the volume.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_volume(volume_id, opts = {})
      logger.debug 'Calling operation BlockstorageClient#delete_volume.' if logger

      raise "Missing the required parameter 'volume_id' when calling delete_volume." if volume_id.nil?
      raise "Parameter value for 'volume_id' must not be blank" if OCI::Internal::Util.blank_string?(volume_id)

      path = '/volumes/{volumeId}'.sub('{volumeId}', volume_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = nil

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
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes a volume backup.
    # @param [String] volume_backup_id The OCID of the volume backup.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_volume_backup(volume_backup_id, opts = {})
      logger.debug 'Calling operation BlockstorageClient#delete_volume_backup.' if logger

      raise "Missing the required parameter 'volume_backup_id' when calling delete_volume_backup." if volume_backup_id.nil?
      raise "Parameter value for 'volume_backup_id' must not be blank" if OCI::Internal::Util.blank_string?(volume_backup_id)

      path = '/volumeBackups/{volumeBackupId}'.sub('{volumeBackupId}', volume_backup_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = nil

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
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes a volume backup policy assignment (i.e. unassigns the policy from an asset).
    # @param [String] policy_assignment_id The OCID of the volume backup policy assignment.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type nil
    def delete_volume_backup_policy_assignment(policy_assignment_id, opts = {})
      logger.debug 'Calling operation BlockstorageClient#delete_volume_backup_policy_assignment.' if logger

      raise "Missing the required parameter 'policy_assignment_id' when calling delete_volume_backup_policy_assignment." if policy_assignment_id.nil?
      raise "Parameter value for 'policy_assignment_id' must not be blank" if OCI::Internal::Util.blank_string?(policy_assignment_id)

      path = '/volumeBackupPolicyAssignments/{policyAssignmentId}'.sub('{policyAssignmentId}', policy_assignment_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = nil

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
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information for the specified boot volume.
    # @param [String] boot_volume_id The OCID of the boot volume.
    # @param [Hash] opts the optional parameters
    # @return [Response] A Response object with data of type {OCI::Core::Models::BootVolume BootVolume}
    def get_boot_volume(boot_volume_id, opts = {})
      logger.debug 'Calling operation BlockstorageClient#get_boot_volume.' if logger

      raise "Missing the required parameter 'boot_volume_id' when calling get_boot_volume." if boot_volume_id.nil?
      raise "Parameter value for 'boot_volume_id' must not be blank" if OCI::Internal::Util.blank_string?(boot_volume_id)

      path = '/bootVolumes/{bootVolumeId}'.sub('{bootVolumeId}', boot_volume_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      @api_client.call_api(
        :GET,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'OCI::Core::Models::BootVolume'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information for the specified volume.
    # @param [String] volume_id The OCID of the volume.
    # @param [Hash] opts the optional parameters
    # @return [Response] A Response object with data of type {OCI::Core::Models::Volume Volume}
    def get_volume(volume_id, opts = {})
      logger.debug 'Calling operation BlockstorageClient#get_volume.' if logger

      raise "Missing the required parameter 'volume_id' when calling get_volume." if volume_id.nil?
      raise "Parameter value for 'volume_id' must not be blank" if OCI::Internal::Util.blank_string?(volume_id)

      path = '/volumes/{volumeId}'.sub('{volumeId}', volume_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      @api_client.call_api(
        :GET,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'OCI::Core::Models::Volume'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information for the specified volume backup.
    # @param [String] volume_backup_id The OCID of the volume backup.
    # @param [Hash] opts the optional parameters
    # @return [Response] A Response object with data of type {OCI::Core::Models::VolumeBackup VolumeBackup}
    def get_volume_backup(volume_backup_id, opts = {})
      logger.debug 'Calling operation BlockstorageClient#get_volume_backup.' if logger

      raise "Missing the required parameter 'volume_backup_id' when calling get_volume_backup." if volume_backup_id.nil?
      raise "Parameter value for 'volume_backup_id' must not be blank" if OCI::Internal::Util.blank_string?(volume_backup_id)

      path = '/volumeBackups/{volumeBackupId}'.sub('{volumeBackupId}', volume_backup_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      @api_client.call_api(
        :GET,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'OCI::Core::Models::VolumeBackup'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information for the specified volume backup policy.
    # @param [String] policy_id The OCID of the volume backup policy.
    # @param [Hash] opts the optional parameters
    # @return [Response] A Response object with data of type {OCI::Core::Models::VolumeBackupPolicy VolumeBackupPolicy}
    def get_volume_backup_policy(policy_id, opts = {})
      logger.debug 'Calling operation BlockstorageClient#get_volume_backup_policy.' if logger

      raise "Missing the required parameter 'policy_id' when calling get_volume_backup_policy." if policy_id.nil?
      raise "Parameter value for 'policy_id' must not be blank" if OCI::Internal::Util.blank_string?(policy_id)

      path = '/volumeBackupPolicies/{policyId}'.sub('{policyId}', policy_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      @api_client.call_api(
        :GET,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'OCI::Core::Models::VolumeBackupPolicy'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the volume backup policy assignment for the specified asset. Note that the
    # assetId query parameter is required, and that the returned list will contain at most
    # one item (since any given asset can only have one policy assigned to it).
    #
    # @param [String] asset_id The OCID of an asset (e.g. a volume).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    #   Example: `500`
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::VolumeBackupPolicyAssignment VolumeBackupPolicyAssignment}>
    def get_volume_backup_policy_asset_assignment(asset_id, opts = {})
      logger.debug 'Calling operation BlockstorageClient#get_volume_backup_policy_asset_assignment.' if logger

      raise "Missing the required parameter 'asset_id' when calling get_volume_backup_policy_asset_assignment." if asset_id.nil?

      path = '/volumeBackupPolicyAssignments'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:assetId] = asset_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      @api_client.call_api(
        :GET,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'Array<OCI::Core::Models::VolumeBackupPolicyAssignment>'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:disable Lint/UnusedMethodArgument


    # Gets information for the specified volume backup policy assignment.
    # @param [String] policy_assignment_id The OCID of the volume backup policy assignment.
    # @param [Hash] opts the optional parameters
    # @return [Response] A Response object with data of type {OCI::Core::Models::VolumeBackupPolicyAssignment VolumeBackupPolicyAssignment}
    def get_volume_backup_policy_assignment(policy_assignment_id, opts = {})
      logger.debug 'Calling operation BlockstorageClient#get_volume_backup_policy_assignment.' if logger

      raise "Missing the required parameter 'policy_assignment_id' when calling get_volume_backup_policy_assignment." if policy_assignment_id.nil?
      raise "Parameter value for 'policy_assignment_id' must not be blank" if OCI::Internal::Util.blank_string?(policy_assignment_id)

      path = '/volumeBackupPolicyAssignments/{policyAssignmentId}'.sub('{policyAssignmentId}', policy_assignment_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      @api_client.call_api(
        :GET,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'OCI::Core::Models::VolumeBackupPolicyAssignment'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
    # rubocop:enable Lint/UnusedMethodArgument

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the boot volumes in the specified compartment and Availability Domain.
    #
    # @param [String] availability_domain The name of the Availability Domain.
    #
    #   Example: `Uocm:PHX-AD-1`
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    #   Example: `500`
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::BootVolume BootVolume}>
    def list_boot_volumes(availability_domain, compartment_id, opts = {})
      logger.debug 'Calling operation BlockstorageClient#list_boot_volumes.' if logger

      raise "Missing the required parameter 'availability_domain' when calling list_boot_volumes." if availability_domain.nil?
      raise "Missing the required parameter 'compartment_id' when calling list_boot_volumes." if compartment_id.nil?

      path = '/bootVolumes'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:availabilityDomain] = availability_domain
      query_params[:compartmentId] = compartment_id
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      @api_client.call_api(
        :GET,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'Array<OCI::Core::Models::BootVolume>'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists all volume backup policies available to the caller.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    #   Example: `500`
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::VolumeBackupPolicy VolumeBackupPolicy}>
    def list_volume_backup_policies(opts = {})
      logger.debug 'Calling operation BlockstorageClient#list_volume_backup_policies.' if logger


      path = '/volumeBackupPolicies'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      @api_client.call_api(
        :GET,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'Array<OCI::Core::Models::VolumeBackupPolicy>'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the volume backups in the specified compartment. You can filter the results by volume.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :volume_id The OCID of the volume.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    #
    #   Example: `500`
    #
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    #
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::VolumeBackup VolumeBackup}>
    def list_volume_backups(compartment_id, opts = {})
      logger.debug 'Calling operation BlockstorageClient#list_volume_backups.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_volume_backups." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::VolumeBackup::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::VolumeBackup::LIFECYCLE_STATE_ENUM.'
      end

      path = '/volumeBackups'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:volumeId] = opts[:volume_id] if opts[:volume_id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      @api_client.call_api(
        :GET,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'Array<OCI::Core::Models::VolumeBackup>'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Lists the volumes in the specified compartment and Availability Domain.
    #
    # @param [String] compartment_id The OCID of the compartment.
    # @param [Hash] opts the optional parameters
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
    # @option opts [String] :display_name A filter to return only resources that match the given display name exactly.
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
    # @return [Response] A Response object with data of type Array<{OCI::Core::Models::Volume Volume}>
    def list_volumes(compartment_id, opts = {})
      logger.debug 'Calling operation BlockstorageClient#list_volumes.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_volumes." if compartment_id.nil?

      if opts[:sort_by] && !%w[TIMECREATED DISPLAYNAME].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of TIMECREATED, DISPLAYNAME.'
      end

      if opts[:sort_order] && !%w[ASC DESC].include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of ASC, DESC.'
      end

      if opts[:lifecycle_state] && !OCI::Core::Models::Volume::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::Core::Models::Volume::LIFECYCLE_STATE_ENUM.'
      end

      path = '/volumes'
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:availabilityDomain] = opts[:availability_domain] if opts[:availability_domain]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'

      post_body = nil

      @api_client.call_api(
        :GET,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'Array<OCI::Core::Models::Volume>'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified boot volume's display name.
    # @param [String] boot_volume_id The OCID of the boot volume.
    # @param [OCI::Core::Models::UpdateBootVolumeDetails] update_boot_volume_details Update boot volume's display name.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::BootVolume BootVolume}
    def update_boot_volume(boot_volume_id, update_boot_volume_details, opts = {})
      logger.debug 'Calling operation BlockstorageClient#update_boot_volume.' if logger

      raise "Missing the required parameter 'boot_volume_id' when calling update_boot_volume." if boot_volume_id.nil?
      raise "Missing the required parameter 'update_boot_volume_details' when calling update_boot_volume." if update_boot_volume_details.nil?
      raise "Parameter value for 'boot_volume_id' must not be blank" if OCI::Internal::Util.blank_string?(boot_volume_id)

      path = '/bootVolumes/{bootVolumeId}'.sub('{bootVolumeId}', boot_volume_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = @api_client.object_to_http_body(update_boot_volume_details)

      @api_client.call_api(
        :PUT,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'OCI::Core::Models::BootVolume'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified volume's display name.
    # Avoid entering confidential information.
    #
    # @param [String] volume_id The OCID of the volume.
    # @param [OCI::Core::Models::UpdateVolumeDetails] update_volume_details Update volume's display name. Avoid entering confidential information.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::Volume Volume}
    def update_volume(volume_id, update_volume_details, opts = {})
      logger.debug 'Calling operation BlockstorageClient#update_volume.' if logger

      raise "Missing the required parameter 'volume_id' when calling update_volume." if volume_id.nil?
      raise "Missing the required parameter 'update_volume_details' when calling update_volume." if update_volume_details.nil?
      raise "Parameter value for 'volume_id' must not be blank" if OCI::Internal::Util.blank_string?(volume_id)

      path = '/volumes/{volumeId}'.sub('{volumeId}', volume_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = @api_client.object_to_http_body(update_volume_details)

      @api_client.call_api(
        :PUT,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'OCI::Core::Models::Volume'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the display name for the specified volume backup.
    # Avoid entering confidential information.
    #
    # @param [String] volume_backup_id The OCID of the volume backup.
    # @param [OCI::Core::Models::UpdateVolumeBackupDetails] update_volume_backup_details Update volume backup fields
    # @param [Hash] opts the optional parameters
    # @option opts [String] :if_match For optimistic concurrency control. In the PUT or DELETE call for a resource, set the `if-match`
    #   parameter to the value of the etag from a previous GET or POST response for that resource.  The resource
    #   will be updated or deleted only if the etag you provide matches the resource's current etag value.
    #
    # @return [Response] A Response object with data of type {OCI::Core::Models::VolumeBackup VolumeBackup}
    def update_volume_backup(volume_backup_id, update_volume_backup_details, opts = {})
      logger.debug 'Calling operation BlockstorageClient#update_volume_backup.' if logger

      raise "Missing the required parameter 'volume_backup_id' when calling update_volume_backup." if volume_backup_id.nil?
      raise "Missing the required parameter 'update_volume_backup_details' when calling update_volume_backup." if update_volume_backup_details.nil?
      raise "Parameter value for 'volume_backup_id' must not be blank" if OCI::Internal::Util.blank_string?(volume_backup_id)

      path = '/volumeBackups/{volumeBackupId}'.sub('{volumeBackupId}', volume_backup_id.to_s)
      operation_signing_strategy = :standard

      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params['accept'] = 'application/json'
      header_params['content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]

      post_body = @api_client.object_to_http_body(update_volume_backup_details)

      @api_client.call_api(
        :PUT,
        path,
        endpoint,
        header_params: header_params,
        query_params: query_params,
        operation_signing_strategy: operation_signing_strategy,
        body: post_body,
        return_type: 'OCI::Core::Models::VolumeBackup'
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
